-- Priest Companion
-- Book of Prayer tracker: talent, successful cast and session HUD state.
-- Vanilla Lua 5.0 compatible; no spell automation; mana predictions approximate.

local PC = PriestCompanion

PC.Modules.PrayerTracker = PC.Modules.PrayerTracker or {}
local Tracker = PC.Modules.PrayerTracker

local DEFAULTS = {
    enabled = true,
    expanded = false,
    showSpellName = true,
    showRefund = true,
    showManaRefund = false,
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
    showManaRefund = true,
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
local lastRefundEstimate = nil
local lastRefundActual = nil
local pendingActualRefund = nil
local lastHealTime = nil
local pendingCastCost = nil
local innerFocusReady = false
local innerFocusBlockNext = false
local provider = "unavailable"
local lastCastGUID = nil
local ConfigureManaProvider = nil

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
        refundEstimate = lastRefundEstimate,
        refundActual = lastRefundActual,
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

    if key == "showManaRefund" and ConfigureManaProvider then
        ConfigureManaProvider()
    end

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
        lastRefundEstimate = nil
        lastRefundActual = nil
        pendingActualRefund = nil
        lastHealTime = nil
        pendingCastCost = nil
        innerFocusReady = false
        innerFocusBlockNext = false
        lastCastGUID = nil
    end

    if talentPoints ~= oldPoints or talentFound ~= oldFound then
        -- A respec can acquire or remove Book of Prayer at runtime.
        if ConfigureManaProvider then
            ConfigureManaProvider()
        end
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
-- Pre-cast cost snapshot (ClassicAPI)
--------------------------------------------------

local function ReadEffectiveManaCost(spellID)
    if type(C_Spell) ~= "table"
    or type(C_Spell.GetSpellPowerCost) ~= "function"
    or type(spellID) ~= "number" then
        return nil
    end

    local ok, costs = pcall(C_Spell.GetSpellPowerCost, spellID)
    if not ok or type(costs) ~= "table" then
        return nil
    end

    local entry = costs[1]
    if type(entry) ~= "table" or entry.type ~= 0 then
        return nil
    end

    local amount = tonumber(entry.cost)
    if amount and amount >= 0 then
        return amount
    end
    return nil
end

local function CaptureSentSpell(castGUID, spellID, spellName)
    if not GetSpellFamily(ResolveSpellName(spellID, spellName)) then
        return
    end

    pendingCastCost = {
        guid = castGUID,
        spellID = spellID,
        cost = ReadEffectiveManaCost(spellID)
    }
end

local function IsInnerFocus(spellID, spellName)
    if spellName == "Inner Focus" then
        return true
    end

    if spellID and type(GetSpellInfo) == "function" then
        local ok, name = pcall(GetSpellInfo, spellID)
        if ok and name == "Inner Focus" then return true end
    end

    if spellID and type(SpellInfo) == "function" then
        local ok, name = pcall(SpellInfo, spellID)
        if ok and name == "Inner Focus" then return true end
    end
    return false
end

--------------------------------------------------
-- A Successful Heal Changes the Cycle
--------------------------------------------------

function Tracker.RecordSuccessfulSpell(spellID, spellName, castGUID)
    if talentPoints < 1 then return false end

    -- Inner Focus itself is not a healing spell. Its free spell and the
    -- next healing spell are both refund-ineligible on OctoWoW.
    if IsInnerFocus(spellID, spellName) then
        innerFocusReady = true
        return false
    end

    local family = GetSpellFamily(ResolveSpellName(spellID, spellName))

    if castGUID and castGUID == lastCastGUID then return false end

    local usedInnerFocus = innerFocusReady
    if usedInnerFocus then
        innerFocusReady = false
        innerFocusBlockNext = true
    end

    if not family then return false end

    local effectiveCost = nil
    if pendingCastCost
    and pendingCastCost.guid == castGUID
    and pendingCastCost.spellID == spellID then
        effectiveCost = pendingCastCost.cost
    end
    pendingCastCost = nil

    lastCastGUID = castGUID
    previousFamily = lastFamily
    previousIcon = lastIcon
    lastFamily = family
    lastIcon = PC.Data.HealingSpells[family].icon

    local blockRefund = usedInnerFocus
    if not usedInnerFocus and innerFocusBlockNext then
        blockRefund = true
        innerFocusBlockNext = false
    end

    if effectiveCost == 0 then
        blockRefund = true
        innerFocusBlockNext = true
    end

    lastEligible =
        previousFamily ~= nil
        and previousFamily ~= family
        and not blockRefund

    lastRefundEstimate = nil
    lastRefundActual = nil

    -- Nampower's SPELL_ENERGIZE_ON_SELF may precede the cast-success
    -- notification. Attach only a recent server refund to this heal.
    if pendingActualRefund and type(GetTime) == "function"
    and GetTime() - pendingActualRefund.at <= 0.75 then
        lastRefundActual = pendingActualRefund.amount
    end
    pendingActualRefund = nil

    if lastEligible and effectiveCost and effectiveCost > 0 then
        -- Approximate: the server may round fractional refunds either way.
        lastRefundEstimate =
            math.floor(effectiveCost * talentPoints * 0.15 + 0.5)
    end

    -- Reset inactivity only for a confirmed, qualifying healing cast.
    if type(GetTime) == "function" then
        lastHealTime = GetTime()
    end

    Notify()
    return true
end

--------------------------------------------------
-- Actual Book of Prayer Mana (optional Nampower)
--------------------------------------------------

local BOOK_OF_PRAYER_ENERGIZE_ID = 52942
local nampowerEnergizeRegistered = false
local legacyEnergizeCVarChanged = false
local legacyEnergizePriorCVar = nil

local function IsLegacyNampower()
    if type(GetNampowerVersion) ~= "function" then
        return true
    end

    local ok, major, minor = pcall(GetNampowerVersion)
    if not ok then
        return true
    end

    major = tonumber(major)
    minor = tonumber(minor) or 0

    if not major then
        return true
    end

    -- Nampower >= 4.5 enables this event via registration alone.
    return major < 4 or (major == 4 and minor < 5)
end

local function ReceiveBookOfPrayerMana(spellID, powerType, amount, periodic)
    if not settings.showManaRefund or talentPoints < 1 then
        return
    end

    if tonumber(spellID) ~= BOOK_OF_PRAYER_ENERGIZE_ID
    or tonumber(powerType) ~= 0 then
        return
    end

    -- Ignore unrelated periodic resource gains and zero-valued packets.
    if tonumber(periodic) == 1 then
        return
    end

    amount = tonumber(amount)
    if not amount or amount <= 0 then
        return
    end

    local now = nil
    if type(GetTime) == "function" then
        now = GetTime()
    end

    -- An energize may be delivered just before SUCCEEDED. If another
    -- compatible cast is in flight, defer until its success event.
    if pendingCastCost then
        if now then
            pendingActualRefund = { amount = amount, at = now }
        end
        return
    end

    -- The server refund belongs to the most recent healing cast.
    -- Do not put a stale energize value onto a later unrelated spell.
    if now and lastHealTime and now - lastHealTime <= 0.75 then
        lastRefundActual = amount
        Notify()
    elseif now then
        pendingActualRefund = { amount = amount, at = now }
    end
end

--------------------------------------------------
-- Optional Spellcast Event Providers
--------------------------------------------------

local eventFrame = CreateFrame("Frame")
local pendingTalentRescan = nil

ConfigureManaProvider = function()
    if not (PC.Capabilities and PC.Capabilities.nampower) then
        return
    end

    local requested = settings.showManaRefund and talentPoints > 0

    if requested then
        if not nampowerEnergizeRegistered then
            nampowerEnergizeRegistered = pcall(
                eventFrame.RegisterEvent,
                eventFrame,
                "SPELL_ENERGIZE_ON_SELF"
            )
        end

        if nampowerEnergizeRegistered
        and IsLegacyNampower()
        and type(SetCVar) == "function"
        and type(GetCVar) == "function" then
            local ok, value = pcall(GetCVar, "NP_EnableSpellEnergizeEvents")
            if ok and tostring(value) ~= "1" then
                local changed = pcall(
                    SetCVar, "NP_EnableSpellEnergizeEvents", "1"
                )
                if changed then
                    legacyEnergizeCVarChanged = true
                    legacyEnergizePriorCVar = value
                end
            end
        end
    else
        if nampowerEnergizeRegistered then
            pcall(
                eventFrame.UnregisterEvent,
                eventFrame,
                "SPELL_ENERGIZE_ON_SELF"
            )
            nampowerEnergizeRegistered = false
        end

        -- Only restore a legacy CVar when this addon itself changed it.
        -- A value enabled beforehand by the player or another addon
        -- must be left alone.
        if legacyEnergizeCVarChanged
        and legacyEnergizePriorCVar ~= nil
        and type(SetCVar) == "function" then
            pcall(
                SetCVar,
                "NP_EnableSpellEnergizeEvents",
                tostring(legacyEnergizePriorCVar)
            )
            legacyEnergizeCVarChanged = false
            legacyEnergizePriorCVar = nil
        end
    end
end

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
    if provider == "ClassicAPI" then
        pcall(eventFrame.RegisterEvent, eventFrame,
            "UNIT_SPELLCAST_SENT")
    end
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

    if ConfigureManaProvider then
        ConfigureManaProvider()
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
            ConfigureManaProvider()
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

        if event == "SPELL_ENERGIZE_ON_SELF" then
            ReceiveBookOfPrayerMana(arg3, arg4, arg5, arg6)
            return
        end

        if event == "UNIT_SPELLCAST_SENT"
        and provider == "ClassicAPI" then
            if arg1 == "player" then
                CaptureSentSpell(arg3, arg4, arg5)
            end
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
