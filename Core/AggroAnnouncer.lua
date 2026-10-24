-- Priest Companion - Aggro / Near Death / Death Announcer.
-- Vanilla 1.12.1 / Lua 5.0; no mandatory optional DLL.
local PC = PriestCompanion
PC.Modules.AggroAnnouncer = PC.Modules.AggroAnnouncer or {}
local Aggro = PC.Modules.AggroAnnouncer

local CHANNELS = { "SAY", "PARTY", "RAID", "YELL", "SELF" }
local DEFAULT_MESSAGES = {
    aggro = "Aggro on me!",
    near = "Low health: {percent}% ({health}/{maxhealth}).",
    death = "Healer down!"
}
local DEFAULTS = {
    enabled = false,
    aggroEnabled = true,
    nearEnabled = true,
    deathEnabled = true,
    threshold = 30,
    cooldown = 15
}
local function NewSettings()
    local result, key, value = {}, nil, nil
    for key, value in pairs(DEFAULTS) do result[key] = value end
    result.channels = {
        SAY = true, PARTY = false, RAID = false,
        YELL = false, SELF = false
    }
    result.messages = {
        aggro = DEFAULT_MESSAGES.aggro,
        near = DEFAULT_MESSAGES.near,
        death = DEFAULT_MESSAGES.death
    }
    return result
end
local settings = NewSettings()
local loaded = false
local inCombat = false
local dead = false
local sampledHealth = false
local nearArmed = true
local aggroActive = false
local aggroHits = 0
local aggroMisses = 0
local lastAggroAlert = nil
local aggroElapsed = 0

local function Clamp(value, minValue, maxValue)
    value = math.floor((tonumber(value) or minValue) + 0.5)
    if value < minValue then return minValue end
    if value > maxValue then return maxValue end
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

local function GetHealth()
    if type(UnitHealth) ~= "function"
    or type(UnitHealthMax) ~= "function" then return nil, nil end
    local maximum = tonumber(UnitHealthMax("player"))
    local health = tonumber(UnitHealth("player"))
    if not maximum or maximum <= 0 or not health then
        return nil, nil
    end
    if health < 0 then health = 0 end
    if health > maximum then health = maximum end
    return health, maximum
end

local function FormatMessage(kind, draft, enemy)
    local text = NormalizeMessage(draft, DEFAULT_MESSAGES[kind])
    local health, maximum = GetHealth()
    if not health then health, maximum = 0, 0 end
    local percent = 0
    if maximum > 0 then
        percent = math.floor(100 * health / maximum + 0.5)
    end
    local name = type(UnitName) == "function"
        and (UnitName("player") or "Priest") or "Priest"
    text = string.gsub(text, "{name}", function() return name end)
    text = string.gsub(text, "{percent}", function()
        return tostring(percent)
    end)
    text = string.gsub(text, "{health}", function()
        return tostring(health)
    end)
    text = string.gsub(text, "{maxhealth}", function()
        return tostring(maximum)
    end)
    text = string.gsub(text, "{enemy}", function()
        return enemy or "an enemy"
    end)
    return text
end

local function CanUse(channel)
    if channel == "SELF" or channel == "SAY"
    or channel == "YELL" then return true end
    if channel == "RAID" and type(GetNumRaidMembers) == "function" then
        return (GetNumRaidMembers() or 0) > 0
    end
    if channel == "PARTY" and type(GetNumPartyMembers) == "function" then
        return (GetNumPartyMembers() or 0) > 0
    end
    return false
end

local function Announce(kind, enemy)
    local message = FormatMessage(kind, settings.messages[kind], enemy)
    local i
    for i = 1, table.getn(CHANNELS) do
        local channel = CHANNELS[i]
        if settings.channels[channel] and CanUse(channel) then
            if channel == "SELF" then
                if DEFAULT_CHAT_FRAME then
                    DEFAULT_CHAT_FRAME:AddMessage(
                        "|cff66ccffPriest Companion:|r " .. message)
                end
            elseif type(SendChatMessage) == "function" then
                pcall(SendChatMessage, message, channel)
            end
        end
    end
end

local function SaveSettings()
    PriestCompanionCharDB = PriestCompanionCharDB or {}
    local channels, messages = {}, {}
    local key
    for key in pairs(settings.channels) do
        channels[key] = settings.channels[key]
    end
    for key in pairs(DEFAULT_MESSAGES) do
        messages[key] = settings.messages[key]
    end
    PriestCompanionCharDB.aggroAnnouncer = {
        enabled = settings.enabled,
        aggroEnabled = settings.aggroEnabled,
        nearEnabled = settings.nearEnabled,
        deathEnabled = settings.deathEnabled,
        threshold = settings.threshold,
        cooldown = settings.cooldown,
        channels = channels,
        messages = messages
    }
end

local function ResetAggroState()
    aggroActive = false
    aggroHits = 0
    aggroMisses = 0
    aggroElapsed = 0
    lastAggroAlert = nil
end

local function BaselineHealth()
    local health, maximum = GetHealth()
    if not health then
        sampledHealth = false
        return
    end
    sampledHealth = true
    nearArmed = (100 * health / maximum) > settings.threshold
end

local function Rebaseline()
    ResetAggroState()
    dead = type(UnitIsDeadOrGhost) == "function"
        and UnitIsDeadOrGhost("player") or false
    BaselineHealth()
end

local function InspectHealth()
    if dead then return end
    local health, maximum = GetHealth()
    if not health then
        sampledHealth = false
        return
    end
    -- A zero-health update belongs to PLAYER_DEAD, not Near Death.
    if health <= 0 then return end
    local percent = 100 * health / maximum
    if not sampledHealth then
        BaselineHealth()
        return
    end
    if percent > settings.threshold + 15 then
        nearArmed = true
    end
    if percent <= settings.threshold then
        if nearArmed and settings.enabled and settings.nearEnabled then
            Announce("near")
        end
        nearArmed = false
    end
end

-- Seeing a hostile target-of-target proves a mob is targeting the player.
-- Vanilla cannot expose the server threat list; do not claim exact threat.
local function TargetIsOnPlayer(unit)
    if type(UnitExists) ~= "function"
    or not UnitExists(unit) then return false end
    if type(UnitCanAttack) == "function" then
        if not UnitCanAttack("player", unit) then return false end
    elseif type(UnitIsFriend) == "function"
    and UnitIsFriend("player", unit) then
        return false
    end
    return UnitExists(unit .. "target")
        and type(UnitIsUnit) == "function"
        and UnitIsUnit(unit .. "target", "player")
end

local function AggroEvidence()
    -- Some custom clients expose a native or server-specific threat API;
    -- >=2 means actively tanking rather than merely gaining threat.
    if type(UnitThreatSituation) == "function" then
        local ok, status = pcall(UnitThreatSituation, "player")
        if ok and type(status) == "number" and status >= 2 then
            return true, nil
        end
    end
    if TargetIsOnPlayer("target") then
        return true, UnitName("target")
    end
    local raid = type(GetNumRaidMembers) == "function"
        and (GetNumRaidMembers() or 0) or 0
    local count = raid
    local prefix = "raid"
    if raid == 0 then
        count = type(GetNumPartyMembers) == "function"
            and (GetNumPartyMembers() or 0) or 0
        prefix = "party"
    end
    local i, unit
    for i = 1, count do
        unit = prefix .. i .. "target"
        if TargetIsOnPlayer(unit) then
            return true, UnitName(unit)
        end
    end
    return false, nil
end

local function InspectAggro()
    if not settings.enabled or not settings.aggroEnabled
    or not inCombat or dead then
        ResetAggroState()
        return
    end
    local seen, enemy = AggroEvidence()
    if seen then
        aggroMisses = 0
        aggroHits = math.min(2, aggroHits + 1)
        if aggroHits >= 2 and not aggroActive then
            aggroActive = true
            local now = type(GetTime) == "function" and GetTime() or 0
            if lastAggroAlert == nil
            or now - lastAggroAlert >= settings.cooldown then
                Announce("aggro", enemy)
                lastAggroAlert = now
            end
        end
    else
        aggroHits = 0
        aggroMisses = math.min(2, aggroMisses + 1)
        if aggroMisses >= 2 then aggroActive = false end
    end
end

local tickFrame = CreateFrame("Frame")
local function UpdatePolling()
    if settings.enabled and settings.aggroEnabled then
        tickFrame:SetScript("OnUpdate", function()
            if not inCombat or dead then return end
            aggroElapsed = aggroElapsed + (arg1 or 0)
            if aggroElapsed >= 0.75 then
                aggroElapsed = 0
                InspectAggro()
            end
        end)
    else
        tickFrame:SetScript("OnUpdate", nil)
        ResetAggroState()
    end
end

local function LoadSettings()
    PriestCompanionCharDB = PriestCompanionCharDB or {}
    local saved = PriestCompanionCharDB.aggroAnnouncer
    if type(saved) == "table" then
        local key, value
        for key, value in pairs(DEFAULTS) do
            if type(value) == "boolean"
            and type(saved[key]) == "boolean" then
                settings[key] = saved[key]
            end
        end
        settings.threshold = Clamp(
            saved.threshold or DEFAULTS.threshold, 1, 99)
        settings.cooldown = Clamp(
            saved.cooldown or DEFAULTS.cooldown, 5, 120)
        if type(saved.channels) == "table" then
            for key in pairs(settings.channels) do
                if type(saved.channels[key]) == "boolean" then
                    settings.channels[key] = saved.channels[key]
                end
            end
        end
        if type(saved.messages) == "table" then
            for key, value in pairs(DEFAULT_MESSAGES) do
                settings.messages[key] = NormalizeMessage(
                    saved.messages[key], value)
            end
        end
    end
    loaded = true
    Rebaseline()
    UpdatePolling()
end

function Aggro.GetOption(key)
    if DEFAULTS[key] ~= nil then return settings[key] end
    return nil
end
function Aggro.SetOption(key, value)
    if DEFAULTS[key] == nil then return false end
    if key == "threshold" then
        settings.threshold = Clamp(value, 1, 99)
    elseif key == "cooldown" then
        settings.cooldown = Clamp(value, 5, 120)
    else
        settings[key] = value and true or false
    end
    SaveSettings()
    Rebaseline()
    UpdatePolling()
    return true
end
function Aggro.GetChannel(channel)
    return settings.channels[channel] == true
end
function Aggro.SetChannel(channel, value)
    if settings.channels[channel] == nil then return false end
    settings.channels[channel] = value and true or false
    SaveSettings()
    return true
end
function Aggro.GetMessage(kind)
    return settings.messages[kind]
end
function Aggro.GetDefaultMessage(kind)
    return DEFAULT_MESSAGES[kind]
end
function Aggro.SetMessage(kind, value)
    if DEFAULT_MESSAGES[kind] == nil then return nil end
    settings.messages[kind] = NormalizeMessage(
        value, DEFAULT_MESSAGES[kind])
    SaveSettings()
    return settings.messages[kind]
end
function Aggro.PreviewMessage(kind, draft)
    if DEFAULT_MESSAGES[kind] == nil then return nil end
    return FormatMessage(kind, draft, "Example Enemy")
end
function Aggro.ResetDefaults()
    settings = NewSettings()
    SaveSettings()
    Rebaseline()
    UpdatePolling()
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("VARIABLES_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:RegisterEvent("UNIT_HEALTH")
eventFrame:RegisterEvent("UNIT_MAXHEALTH")
eventFrame:RegisterEvent("PLAYER_DEAD")
eventFrame:RegisterEvent("PLAYER_ALIVE")
eventFrame:RegisterEvent("PLAYER_UNGHOST")
eventFrame:SetScript("OnEvent", function()
    if event == "VARIABLES_LOADED" then
        LoadSettings()
    elseif event == "PLAYER_ENTERING_WORLD" then
        inCombat = type(UnitAffectingCombat) == "function"
            and UnitAffectingCombat("player") or false
        Rebaseline()
    elseif not loaded then
        return
    elseif event == "PLAYER_REGEN_DISABLED" then
        inCombat = true
        ResetAggroState()
    elseif event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
        ResetAggroState()
    elseif event == "UNIT_HEALTH" or event == "UNIT_MAXHEALTH" then
        if arg1 == "player" then InspectHealth() end
    elseif event == "PLAYER_DEAD" then
        if not dead and settings.enabled and settings.deathEnabled then
            Announce("death")
        end
        dead = true
        sampledHealth = false
        ResetAggroState()
    elseif event == "PLAYER_ALIVE" or event == "PLAYER_UNGHOST" then
        dead = false
        Rebaseline()
    end
end)
