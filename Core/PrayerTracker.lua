-- Priest Companion
-- Book of Prayer tracker: talent, successful cast and session HUD state.
-- Vanilla Lua 5.0 compatible; no spell automation and no mana estimates.

local PC = PriestCompanion

PC.Modules.PrayerTracker = PC.Modules.PrayerTracker or {}
local Tracker = PC.Modules.PrayerTracker

local DEFAULTS = {
    enabled = true,
    expanded = false,
    showSpellName = true,
    showRefund = true,
    outsideCombat = true,
    autoHide = false,
    autoHideSeconds = 15,
    locked = false,
    x = 0,
    y = -150,
    compactWidth = 118,
    compactHeight = 112,
    expandedWidth = 212,
    expandedHeight = 130
}

local BOOL_OPTIONS = {
    enabled = true,
    expanded = true,
    showSpellName = true,
    showRefund = true,
    outsideCombat = true,
    autoHide = true,
    locked = true
}

local settings = {}
local listeners = {}
local talentPoints = 0
local talentFound = false
local lastFamily = nil
local previousFamily = nil
local lastIcon = nil
local previousIcon = nil
local lastEligible = false
local lastHealTime = nil
local provider = "unavailable"
local lastCastGUID = nil

for key, value in pairs(DEFAULTS) do
    settings[key] = value
end

--------------------------------------------------
-- Public State and Options
--------------------------------------------------

function Tracker.GetOption(key)
    return settings[key]
end

-- A valid setting is an integer from 1 to 600 seconds.
-- Keep this in the core, so UI input cannot store invalid values.
local function NormalizeAutoHideSeconds(value)
    local number = tonumber(value)

    if not number or number ~= number then
        return nil
    end

    number = math.floor(number)

    if number < 1 then
        return 1
    elseif number > 600 then
        return 600
    end

    return number
end

function Tracker.GetTalentPoints()
    return talentPoints
end

function Tracker.IsTalentFound()
    return talentFound
end

function Tracker.GetProvider()
    return provider
end

function Tracker.GetState()
    return {
        last = lastFamily,
        previous = previousFamily,
        lastIcon = lastIcon,
        previousIcon = previousIcon,
        eligible = lastEligible,
        talentPoints = talentPoints,
        provider = provider
    }
end

function Tracker.AddListener(callback)
    if type(callback) == "function" then
        table.insert(listeners, callback)
    end
end

local function Notify()
    local i
    for i = 1, table.getn(listeners) do
        -- These are Priest Companion-owned UI listeners. Surface an
        -- actual UI error during testing instead of silently hiding it.
        listeners[i]()
    end
end

local function SaveOption(key, value)
    settings[key] = value

    if type(PriestCompanionCharDB) == "table" then
        PriestCompanionCharDB.prayerTracker =
            PriestCompanionCharDB.prayerTracker or {}
        PriestCompanionCharDB.prayerTracker[key] = value
    end
end

function Tracker.SetAutoHideSeconds(value)
    local seconds = NormalizeAutoHideSeconds(value)

    if not seconds then
        return false
    end

    SaveOption("autoHideSeconds", seconds)
    Notify()
    return true
end

function Tracker.ShouldAutoHide()
    if not settings.autoHide then
        return false
    end

    -- Hide on login until a qualifying heal occurs in this session.
    if not lastHealTime then
        return true
    end

    if type(GetTime) ~= "function" then
        return false
    end

    return GetTime() - lastHealTime >= settings.autoHideSeconds
end

function Tracker.SetOption(key, value)
    if not BOOL_OPTIONS[key] then
        return false
    end

    if key == "enabled" and talentPoints < 1 then
        return false
    end

    SaveOption(key, value == true)
    Notify()
    return true
end

function Tracker.SaveGeometry(x, y, width, height)
    if settings.locked then
        return
    end

    if type(x) == "number" then
        SaveOption("x", x)
    end
    if type(y) == "number" then
        SaveOption("y", y)
    end
    if type(width) == "number"
    and type(height) == "number" then
        if settings.expanded then
            SaveOption("expandedWidth", width)
            SaveOption("expandedHeight", height)
        else
            SaveOption("compactWidth", width)
            SaveOption("compactHeight", height)
        end
    end
end

function Tracker.IsActive()
    return talentPoints > 0
        and settings.enabled == true
        and provider ~= "unavailable"
end

--------------------------------------------------
-- Talent Detection
--------------------------------------------------

local function ScanBookOfPrayer()
    local oldPoints = talentPoints
    local oldFound = talentFound
    local points = 0
    local found = false

    local _, class = UnitClass("player")

    if class == "PRIEST"
    and type(GetNumTalentTabs) == "function"
    and type(GetNumTalents) == "function"
    and type(GetTalentInfo) == "function" then
        local ok, tabs = pcall(GetNumTalentTabs)

        if ok and type(tabs) == "number" then
            local t
            local i
            for t = 1, tabs do
                local countOk, count =
                    pcall(GetNumTalents, t)

                if countOk and type(count) == "number" then
                    for i = 1, count do
                        local talentOk, name, icon, tier, column, rank =
                            pcall(GetTalentInfo, t, i)

                        if talentOk
                        and type(name) == "string"
                        and string.lower(name) == "book of prayer" then
                            points = tonumber(rank) or 0
                            found = true
                            break
                        end
                    end
                end

                if found then
                    break
                end
            end
        end
    end

    talentPoints = points
    talentFound = found

    if talentPoints == 0 then
        lastFamily = nil
        previousFamily = nil
        lastIcon = nil
        previousIcon = nil
        lastEligible = false
        lastHealTime = nil
        lastCastGUID = nil
    end

    if talentPoints ~= oldPoints or talentFound ~= oldFound then
        Notify()
    end
end

function Tracker.ScanTalents()
    ScanBookOfPrayer()
end

--------------------------------------------------
-- Spellbook Icons and Healing Families
--------------------------------------------------

local function GetSpellFamily(name)
    if type(name) ~= "string" then
        return nil
    end

    -- The cast event supplies the spell base name, regardless of rank.
    -- Handle optional trailing rank text only, never substring matches
    -- (Heal must not accidentally match Greater Heal).
    name = string.gsub(name, "%s*%([^%)]+%)$", "")

    if PC.Data.HealingSpells[name] then
        return name
    end

    return nil
end

local function ScanSpellbook()
    if type(GetNumSpellTabs) ~= "function"
    or type(GetSpellTabInfo) ~= "function"
    or type(GetSpellName) ~= "function"
    or type(GetSpellTexture) ~= "function" then
        return
    end

    local numTabs = GetNumSpellTabs()
    local tab

    for tab = 1, numTabs do
        local _, _, offset, numSpells = GetSpellTabInfo(tab)

        if type(offset) == "number"
        and type(numSpells) == "number" then
            local slot
            for slot = offset + 1, offset + numSpells do
                local name = GetSpellName(slot, "spell")
                local family = GetSpellFamily(name)

                if family then
                    local icon = GetSpellTexture(slot, "spell")
                    if icon then
                        PC.Data.HealingSpells[family].icon = icon
                    end
                end
            end
        end
    end
end

local function ResolveSpellName(spellID, providedName)
    if GetSpellFamily(providedName) then
        return providedName
    end

    if not spellID then
        return nil
    end

    if type(GetSpellInfo) == "function" then
        local ok, name = pcall(GetSpellInfo, spellID)
        if ok and GetSpellFamily(name) then
            return name
        end
    end

    if type(SpellInfo) == "function" then
        local ok, name = pcall(SpellInfo, spellID)
        if ok and GetSpellFamily(name) then
            return name
        end
    end

    return nil
end

--------------------------------------------------
-- A Successful Heal Changes the Cycle
--------------------------------------------------

function Tracker.RecordSuccessfulSpell(spellID, spellName, castGUID)
    if talentPoints < 1 then
        return false
    end

    local name = ResolveSpellName(spellID, spellName)
    local family = GetSpellFamily(name)

    if not family then
        return false
    end

    if castGUID and castGUID == lastCastGUID then
        return false
    end

    lastCastGUID = castGUID
    previousFamily = lastFamily
    previousIcon = lastIcon
    lastFamily = family
    lastIcon = PC.Data.HealingSpells[family].icon

    lastEligible =
        previousFamily ~= nil
        and previousFamily ~= family

    -- Reset inactivity only for a confirmed, qualifying healing cast.
    if type(GetTime) == "function" then
        lastHealTime = GetTime()
    end

    Notify()
    return true
end

--------------------------------------------------
-- Optional Spellcast Event Providers
--------------------------------------------------

local eventFrame = CreateFrame("Frame")
local pendingTalentRescan = nil

local function ScheduleTalentRescan()
    -- A short follow-up covers delayed server talent and spellbook data
    -- after login, talent purchase or respec without polling forever.
    pendingTalentRescan = 0.8
end

local function RegisterProvider(eventName, name)
    local success = pcall(
        eventFrame.RegisterEvent,
        eventFrame,
        eventName
    )

    if success then
        provider = name
        return true
    end

    return false
end

-- Prefer exactly one source. This avoids counting one cast twice when
-- ClassicAPI, Nampower and SuperWoW are installed simultaneously.
if PC.Capabilities.classicAPISupported then
    RegisterProvider("UNIT_SPELLCAST_SUCCEEDED", "ClassicAPI")
end

if provider == "unavailable"
and PC.Capabilities.nampower then
    RegisterProvider("SPELL_CAST_EVENT", "Nampower")
end

if provider == "unavailable"
and PC.Capabilities.superWoW then
    RegisterProvider("UNIT_CASTEVENT", "SuperWoW")
end

eventFrame:RegisterEvent("VARIABLES_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("CHARACTER_POINTS_CHANGED")
eventFrame:RegisterEvent("SPELLS_CHANGED")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")

local function LoadSettings()
    PriestCompanionCharDB =
        PriestCompanionCharDB or {}

    local saved = PriestCompanionCharDB.prayerTracker

    if type(saved) == "table" then
        local key
        for key in pairs(DEFAULTS) do
            if BOOL_OPTIONS[key] then
                if type(saved[key]) == "boolean" then
                    settings[key] = saved[key]
                end
            elseif key == "autoHideSeconds" then
                local seconds = NormalizeAutoHideSeconds(saved[key])
                if seconds then
                    settings[key] = seconds
                end
            elseif type(saved[key]) == "number" then
                settings[key] = saved[key]
            end
        end
    end

    Notify()
end

eventFrame:SetScript(
    "OnUpdate",
    function()
        if pendingTalentRescan then
            pendingTalentRescan =
                pendingTalentRescan - arg1

            if pendingTalentRescan <= 0 then
                pendingTalentRescan = nil
                ScanSpellbook()
                ScanBookOfPrayer()
            end
        end
    end
)

eventFrame:SetScript(
    "OnEvent",
    function()
        if event == "VARIABLES_LOADED" then
            LoadSettings()
            return
        end

        if event == "PLAYER_ENTERING_WORLD" then
            ScanSpellbook()
            ScanBookOfPrayer()
            ScheduleTalentRescan()
            Notify()
            return
        end

        if event == "CHARACTER_POINTS_CHANGED"
        or event == "PLAYER_LEVEL_UP" then
            ScanBookOfPrayer()
            ScheduleTalentRescan()
            return
        end

        if event == "SPELLS_CHANGED" then
            ScanSpellbook()
            ScanBookOfPrayer()
            ScheduleTalentRescan()
            return
        end

        if event == "PLAYER_REGEN_ENABLED"
        or event == "PLAYER_REGEN_DISABLED" then
            Notify()
            return
        end

        if event == "UNIT_SPELLCAST_SUCCEEDED"
        and provider == "ClassicAPI" then
            if arg1 == "player" then
                Tracker.RecordSuccessfulSpell(arg3, arg4, arg2)
            end
            return
        end

        if event == "SPELL_CAST_EVENT"
        and provider == "Nampower" then
            if arg1 == 1 and (arg5 == 0 or not arg5) then
                Tracker.RecordSuccessfulSpell(arg2, nil, nil)
            end
            return
        end

        if event == "UNIT_CASTEVENT"
        and provider == "SuperWoW" then
            if arg3 ~= "CAST" then
                return
            end

            local guid = nil

            if type(UnitGUID) == "function" then
                guid = UnitGUID("player")
            end

            if not guid then
                local exists
                exists, guid = UnitExists("player")
            end

            if guid and arg1 == guid then
                Tracker.RecordSuccessfulSpell(arg4, nil, nil)
            end
        end
    end
)
