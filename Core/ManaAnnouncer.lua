-- Priest Companion
-- Mana Announcer: Vanilla 1.12/Lua 5.0, self-mana announcements only.
-- Works without ClassicAPI, Nampower or any optional extension.

local PC = PriestCompanion
PC.Modules.ManaAnnouncer = PC.Modules.ManaAnnouncer or {}
local Mana = PC.Modules.ManaAnnouncer

local LOW_DEFAULT = "Low mana: {percent}% ({mana}/{maxmana})."
local OOM_DEFAULT = "Out of mana!"
local CHANNELS = { "SAY", "PARTY", "RAID", "YELL", "SELF" }

local DEFAULTS = {
    enabled = false,
    lowEnabled = true,
    oomEnabled = true,
    combatOnly = false,
    threshold = 30,
    oomThreshold = 5,
    cooldown = 15
}
-- The same defaults initialize new characters and confirmed full resets.
local function NewSettings()
    local result = {}
    local key, value
    for key, value in pairs(DEFAULTS) do
        result[key] = value
    end
    result.channels = {
        SAY = true, PARTY = false, RAID = false,
        YELL = false, SELF = false
    }
    result.lowMessage = LOW_DEFAULT
    result.oomMessage = OOM_DEFAULT
    return result
end

local settings = NewSettings()
local eventFrame
local UpdateActivityEvents

local lastAnnouncement = nil
local lastKind = nil
local lowArmed = true
local oomArmed = true
local lastMana = 0
local lastMaxMana = 0
local sampled = false
local inCombat = false
local loaded = false

local function Clamp(value, low, high)
    value = tonumber(value) or low
    value = math.floor(value + 0.5)
    if value < low then value = low end
    if value > high then value = high end
    return value
end

local function NormalizeMessage(value, defaultText)
    if type(value) ~= "string" then return defaultText end
    value = string.gsub(value, "[%c]", " ")
    value = string.gsub(value, "^%s+", "")
    value = string.gsub(value, "%s+$", "")
    value = string.sub(value, 1, 140)
    value = string.gsub(value, "%s+$", "")
    if value == "" then return defaultText end
    return value
end

local function Format(kind, mana, maximum, draft)
    local text = draft
    if type(text) ~= "string" then
        if kind == "oom" then
            text = settings.oomMessage
        else
            text = settings.lowMessage
        end
    end
    text = NormalizeMessage(text,
        kind == "oom" and OOM_DEFAULT or LOW_DEFAULT)
    local percent = 0
    if maximum > 0 then
        percent = math.floor(100 * mana / maximum + 0.5)
    end
    local name = type(UnitName) == "function" and
        (UnitName("player") or "Priest") or "Priest"
    text = string.gsub(text, "{name}", function() return name end)
    text = string.gsub(text, "{percent}", function()
        return tostring(percent)
    end)
    text = string.gsub(text, "{mana}", function()
        return tostring(mana)
    end)
    text = string.gsub(text, "{maxmana}", function()
        return tostring(maximum)
    end)
    return text
end

local function CanUse(channel)
    if channel == "SELF" or channel == "SAY"
    or channel == "YELL" then
        return true
    end
    if channel == "RAID" and type(GetNumRaidMembers) == "function" then
        return (GetNumRaidMembers() or 0) > 0
    end
    if channel == "PARTY" and type(GetNumPartyMembers) == "function" then
        return (GetNumPartyMembers() or 0) > 0
    end
    return false
end

local function Emit(kind, mana, maximum)
    local message = Format(kind, mana, maximum)
    local i
    for i = 1, table.getn(CHANNELS) do
        local channel = CHANNELS[i]
        if settings.channels[channel] and CanUse(channel) then
            if channel == "SELF" then
                if DEFAULT_CHAT_FRAME then
                    DEFAULT_CHAT_FRAME:AddMessage(
                        "|cff66ccffPriest Companion:|r " .. message
                    )
                end
            elseif type(SendChatMessage) == "function" then
                pcall(SendChatMessage, message, channel)
            end
        end
    end
end

local function IsUsablePlayer()
    if type(UnitExists) == "function"
    and not UnitExists("player") then return false end
    if type(UnitIsDeadOrGhost) == "function"
    and UnitIsDeadOrGhost("player") then return false end
    if type(UnitPowerType) == "function" then
        local powerType = UnitPowerType("player")
        if powerType ~= nil and powerType ~= 0 then return false end
    elseif type(UnitManaType) == "function" then
        local manaType = UnitManaType("player")
        if manaType ~= nil and manaType ~= 0 then return false end
    end
    return type(UnitMana) == "function"
        and type(UnitManaMax) == "function"
end

local function ReadMana()
    if not IsUsablePlayer() then return nil, nil end
    local maximum = tonumber(UnitManaMax("player"))
    local mana = tonumber(UnitMana("player"))
    if not maximum or maximum <= 0 or not mana then
        return nil, nil
    end
    if mana < 0 then mana = 0 end
    if mana > maximum then mana = maximum end
    return mana, maximum
end

local function Baseline()
    local mana, maximum = ReadMana()
    if not mana then
        sampled = false
        return
    end
    sampled = true
    lastMana = mana
    lastMaxMana = maximum
    local percent = 100 * mana / maximum
    lowArmed = percent > settings.threshold
    oomArmed = percent > settings.oomThreshold
end

local function Rebaseline()
    lastAnnouncement = nil
    lastKind = nil
    Baseline()
end

-- Each threshold re-arms after recovering 5 percentage points above
-- its configured value (never on every regeneration tick).
local function Inspect(allowAnnouncement)
    local mana, maximum = ReadMana()
    if not mana then
        sampled = false
        return
    end
    local percent = 100 * mana / maximum
    if not sampled then
        Baseline()
        return
    end

    lastMana = mana
    lastMaxMana = maximum
    if percent >= math.min(100, settings.threshold + 5) then
        lowArmed = true
    end
    if percent >= math.min(100, settings.oomThreshold + 5) then
        oomArmed = true
    end

    if not settings.enabled or
    (settings.combatOnly and not inCombat) then
        -- Suppress ineligible transitions rather than replay after
        -- returning to combat/turning the option back on.
        if percent <= settings.threshold then lowArmed = false end
        if percent <= settings.oomThreshold then oomArmed = false end
        return
    end

    if not allowAnnouncement then return end

    local kind = nil
    if percent <= settings.oomThreshold
    and settings.oomEnabled and oomArmed then
        kind = "oom"
    elseif percent <= settings.threshold
    and settings.lowEnabled and lowArmed then
        kind = "low"
    end

    if percent <= settings.oomThreshold then oomArmed = false end
    if percent <= settings.threshold then lowArmed = false end
    if not kind then return end

    local now = type(GetTime) == "function" and GetTime() or 0
    -- OOM takes precedence: do not suppress a critical OOM warning
    -- merely because Low Mana was announced seconds beforehand.
    local escalating = kind == "oom" and lastKind == "low"
    if lastAnnouncement == nil or escalating
    or now - lastAnnouncement >= settings.cooldown then
        Emit(kind, mana, maximum)
        lastAnnouncement = now
        lastKind = kind
    end
end

local function SaveSettings()
    PriestCompanionCharDB = PriestCompanionCharDB or {}
    PriestCompanionCharDB.manaAnnouncer = {
        enabled = settings.enabled,
        lowEnabled = settings.lowEnabled,
        oomEnabled = settings.oomEnabled,
        combatOnly = settings.combatOnly,
        threshold = settings.threshold,
        oomThreshold = settings.oomThreshold,
        cooldown = settings.cooldown,
        lowMessage = settings.lowMessage,
        oomMessage = settings.oomMessage,
        channels = {
            SAY = settings.channels.SAY,
            PARTY = settings.channels.PARTY,
            RAID = settings.channels.RAID,
            YELL = settings.channels.YELL,
            SELF = settings.channels.SELF
        }
    }
end

local function LoadSettings()
    PriestCompanionCharDB = PriestCompanionCharDB or {}
    local saved = PriestCompanionCharDB.manaAnnouncer
    if type(saved) == "table" then
        local key
        for key in pairs(DEFAULTS) do
            if type(DEFAULTS[key]) == "boolean"
            and type(saved[key]) == "boolean" then
                settings[key] = saved[key]
            end
        end
        settings.threshold = Clamp(
            saved.threshold or DEFAULTS.threshold, 1, 99)
        local oomValue = saved.oomThreshold
        if oomValue == nil then oomValue = DEFAULTS.oomThreshold end
        settings.oomThreshold = Clamp(oomValue, 0, settings.threshold - 1)
        settings.cooldown = Clamp(
            saved.cooldown or DEFAULTS.cooldown, 5, 120)
        settings.lowMessage = NormalizeMessage(saved.lowMessage, LOW_DEFAULT)
        settings.oomMessage = NormalizeMessage(saved.oomMessage, OOM_DEFAULT)
        if type(saved.channels) == "table" then
            for key in pairs(settings.channels) do
                if type(saved.channels[key]) == "boolean" then
                    settings.channels[key] = saved.channels[key]
                end
            end
        end
    end
    loaded = true
    Baseline()
    UpdateActivityEvents()
end

function Mana.GetOption(key)
    if DEFAULTS[key] ~= nil then return settings[key] end
    return nil
end

function Mana.SetOption(key, value)
    if DEFAULTS[key] == nil then return false end
    if key == "threshold" then
        settings.threshold = Clamp(value, 1, 99)
        -- Keep OOM strictly below Low Mana, including slider changes.
        settings.oomThreshold = math.min(
            settings.oomThreshold, settings.threshold - 1)
    elseif key == "oomThreshold" then
        settings.oomThreshold = Clamp(value, 0, settings.threshold - 1)
    elseif key == "cooldown" then
        settings.cooldown = Clamp(value, 5, 120)
    else
        settings[key] = value and true or false
    end
    SaveSettings()
    -- Recover current combat state when enabling after disabled periods.
    if type(UnitAffectingCombat) == "function" then
        inCombat = UnitAffectingCombat("player") and true or false
    end
    Rebaseline()
    UpdateActivityEvents()
    return true
end

function Mana.GetChannel(channel)
    return settings.channels[channel] == true
end

function Mana.SetChannel(channel, value)
    if settings.channels[channel] == nil then return false end
    settings.channels[channel] = value and true or false
    SaveSettings()
    return true
end

function Mana.GetMessage(kind)
    if kind == "low" then return settings.lowMessage end
    if kind == "oom" then return settings.oomMessage end
    return nil
end

function Mana.GetDefaultMessage(kind)
    if kind == "low" then return LOW_DEFAULT end
    if kind == "oom" then return OOM_DEFAULT end
    return nil
end

function Mana.SetMessage(kind, value)
    if kind == "low" then
        settings.lowMessage = NormalizeMessage(value, LOW_DEFAULT)
    elseif kind == "oom" then
        settings.oomMessage = NormalizeMessage(value, OOM_DEFAULT)
    else
        return nil
    end
    SaveSettings()
    return Mana.GetMessage(kind)
end

function Mana.PreviewMessage(kind, draft)
    if kind ~= "low" and kind ~= "oom" then return nil end
    local mana, maximum = ReadMana()
    if not mana then mana, maximum = 200, 1000 end
    return Format(kind, mana, maximum, draft)
end

-- Restore only the Mana Announcer preferences. Save once and discard the
-- old threshold state so a reset cannot immediately trigger a warning.
function Mana.ResetDefaults()
    settings = NewSettings()
    SaveSettings()
    Rebaseline()
    UpdateActivityEvents()
end

function Mana.GetStatus()
    return lastMana, lastMaxMana
end

eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("VARIABLES_LOADED")
local monitoredEvents = {
    "PLAYER_ENTERING_WORLD", "UNIT_MANA", "UNIT_MAXMANA",
    "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED",
    "PLAYER_DEAD", "PLAYER_ALIVE", "PLAYER_UNGHOST"
}
UpdateActivityEvents = function()
    -- The initial settings load is the only event needed while disabled.
    local enabled = loaded and settings.enabled
        and (settings.lowEnabled or settings.oomEnabled)
    local i
    for i = 1, table.getn(monitoredEvents) do
        if enabled then
            eventFrame:RegisterEvent(monitoredEvents[i])
        else
            eventFrame:UnregisterEvent(monitoredEvents[i])
        end
    end
end
eventFrame:SetScript("OnEvent", function()
    if event == "VARIABLES_LOADED" then
        LoadSettings()
    elseif event == "PLAYER_ENTERING_WORLD" then
        inCombat = type(UnitAffectingCombat) == "function"
            and UnitAffectingCombat("player") or false
        Baseline()
    elseif not loaded then
        return
    elseif event == "PLAYER_REGEN_DISABLED" then
        inCombat = true
        Baseline()
    elseif event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
        Baseline()
    elseif event == "UNIT_MANA" or event == "UNIT_MAXMANA" then
        if arg1 == "player" then Inspect(true) end
    elseif event == "PLAYER_DEAD" or event == "PLAYER_ALIVE"
    or event == "PLAYER_UNGHOST" then
        Baseline()
    end
end)
