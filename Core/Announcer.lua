-- Priest Companion
-- Fear Ward announcer (Vanilla Lua 5.0 compatible).
-- This module only reports successful manual casts; it never casts spells.

local PC = PriestCompanion

PC.Modules.Announcer = PC.Modules.Announcer or {}
local Announcer = PC.Modules.Announcer

local FEAR_WARD_ID = 6346
local FEAR_WARD_NAME = "Fear Ward"
local DEFAULT_MESSAGE = "Fear Ward cast on {target}."
local PENDING_SECONDS = 15
local MAX_MESSAGE_BYTES = 140

local DEFAULTS = {
    enabled = false,
    announceSelf = false,
    message = DEFAULT_MESSAGE,
    channels = {
        SAY = true,
        YELL = false,
        PARTY = false,
        RAID = false,
        SELF = false
    }
}

local CHANNELS = { "SAY", "YELL", "PARTY", "RAID", "SELF" }
local settings = {
    enabled = DEFAULTS.enabled,
    announceSelf = DEFAULTS.announceSelf,
    message = DEFAULTS.message,
    channels = {
        SAY = DEFAULTS.channels.SAY,
        YELL = DEFAULTS.channels.YELL,
        PARTY = DEFAULTS.channels.PARTY,
        RAID = DEFAULTS.channels.RAID,
        SELF = DEFAULTS.channels.SELF
    }
}

local provider = "unavailable"
local pending = {}
local completed = {}
local lastMissingTargetWarning = nil

--------------------------------------------------
-- Settings
--------------------------------------------------

local function NormalizeMessage(value)
    if type(value) ~= "string" then
        return DEFAULT_MESSAGE
    end

    -- Prevent embedded newlines/control codes from reaching group chat.
    value = string.gsub(value, "[%c]", " ")
    value = string.gsub(value, "^%s+", "")
    value = string.gsub(value, "%s+$", "")
    value = string.sub(value, 1, MAX_MESSAGE_BYTES)
    value = string.gsub(value, "%s+$", "")

    if value == "" then
        return DEFAULT_MESSAGE
    end

    -- Always include the recipient, even after custom message editing.
    if not string.find(value, "{target}", 1, true) then
        local suffix = " on {target}"
        value = string.sub(
            value, 1, MAX_MESSAGE_BYTES - string.len(suffix)
        )
        value = string.gsub(value, "%s+$", "")
        value = value .. suffix
    end

    return value
end

local function SaveSettings()
    PriestCompanionCharDB = PriestCompanionCharDB or {}
    PriestCompanionCharDB.announcer = {
        enabled = settings.enabled,
        announceSelf = settings.announceSelf,
        message = settings.message,
        channels = {
            SAY = settings.channels.SAY,
            YELL = settings.channels.YELL,
            PARTY = settings.channels.PARTY,
            RAID = settings.channels.RAID,
            SELF = settings.channels.SELF
        }
    }
end

local function LoadSettings()
    PriestCompanionCharDB = PriestCompanionCharDB or {}
    local saved = PriestCompanionCharDB.announcer

    if type(saved) ~= "table" then
        return
    end

    if type(saved.enabled) == "boolean" then
        settings.enabled = saved.enabled
    end
    if type(saved.announceSelf) == "boolean" then
        settings.announceSelf = saved.announceSelf
    end
    settings.message = NormalizeMessage(saved.message)

    if type(saved.channels) == "table" then
        local i
        for i = 1, table.getn(CHANNELS) do
            local channel = CHANNELS[i]
            if type(saved.channels[channel]) == "boolean" then
                settings.channels[channel] = saved.channels[channel]
            end
        end
    end
end

function Announcer.GetOption(key)
    return settings[key]
end

function Announcer.SetOption(key, value)
    if key ~= "enabled" and key ~= "announceSelf" then
        return false
    end
    settings[key] = value and true or false
    SaveSettings()
    return true
end

function Announcer.GetChannel(channel)
    return settings.channels[channel] == true
end

function Announcer.SetChannel(channel, value)
    if DEFAULTS.channels[channel] == nil then
        return false
    end
    settings.channels[channel] = value and true or false
    SaveSettings()
    return true
end

function Announcer.GetMessage()
    return settings.message
end

function Announcer.SetMessage(message)
    settings.message = NormalizeMessage(message)
    SaveSettings()
    return settings.message
end

function Announcer.FormatMessage(target)
    if type(target) ~= "string" or target == "" then
        return nil
    end
    -- Replacement functions avoid interpreting percent signs in unit names.
    local text = string.gsub(settings.message, "{target}", function()
        return target
    end)
    text = string.gsub(text, "{spell}", function()
        return FEAR_WARD_NAME
    end)
    return text
end

function Announcer.GetProvider()
    return provider
end

--------------------------------------------------
-- Confirmed casts and recipients
--------------------------------------------------

local function IsFearWard(spellID, spellName)
    if tonumber(spellID) == FEAR_WARD_ID then
        return true
    end

    if spellID ~= nil then
        return false
    end

    if spellName == FEAR_WARD_NAME then
        return true
    end

    if type(GetSpellInfo) == "function" then
        local knownName = GetSpellInfo(FEAR_WARD_ID)
        return knownName and spellName == knownName or false
    end

    return false
end

local function ResolveTarget(raw)
    if type(raw) ~= "string" or raw == "" then
        return nil
    end

    local lower = string.lower(raw)
    if lower == "unknown" or lower == "none"
    or lower == "nil" then
        return nil
    end

    -- Resolve unit tokens immediately at SENT, before target switching.
    if lower == "target" or lower == "player"
    or lower == "mouseover" or lower == "focus"
    or string.find(lower, "^party%d+$")
    or string.find(lower, "^raid%d+$") then
        if type(UnitExists) == "function"
        and UnitExists(raw)
        and type(UnitName) == "function" then
            return UnitName(raw)
        end
        return nil
    end

    -- ClassicAPI SENT normally supplies the recipient's character name.
    return raw
end

local function IsSelfTarget(target)
    if type(UnitName) ~= "function" then
        return false
    end
    local ownName = UnitName("player")
    return ownName and target == ownName
end

local function ChatAvailable(channel)
    if channel == "SAY" or channel == "YELL"
    or channel == "SELF" then
        return true
    end

    if channel == "RAID" and type(GetNumRaidMembers) == "function" then
        return GetNumRaidMembers() > 0
    end

    if channel == "PARTY" and type(GetNumPartyMembers) == "function" then
        return GetNumPartyMembers() > 0
    end

    return false
end

local function Announce(target)
    if not settings.enabled or not target then
        return
    end

    if not settings.announceSelf and IsSelfTarget(target) then
        return
    end

    local message = Announcer.FormatMessage(target)
    if not message then
        return
    end

    local i
    for i = 1, table.getn(CHANNELS) do
        local channel = CHANNELS[i]

        if settings.channels[channel] and ChatAvailable(channel) then
            if channel == "SELF" then
                if DEFAULT_CHAT_FRAME then
                    DEFAULT_CHAT_FRAME:AddMessage(
                        "|cff66ccffPriest Companion:|r " .. message
                    )
                end
            elseif type(SendChatMessage) == "function" then
                -- A channel may become unavailable between checks.
                pcall(SendChatMessage, message, channel)
            end
        end
    end
end

local function ExpireCasts(now)
    local guid
    local record

    for guid, record in pairs(pending) do
        if now - record.at > PENDING_SECONDS then
            pending[guid] = nil
        end
    end
    for guid, record in pairs(completed) do
        if now - record > PENDING_SECONDS then
            completed[guid] = nil
        end
    end
end

local function CaptureSent(target, guid, spellID, spellName)
    if not settings.enabled or not IsFearWard(spellID, spellName) then
        return
    end
    if not guid or guid == "" then
        return
    end

    local now = GetTime()
    ExpireCasts(now)
    pending[guid] = {
        target = ResolveTarget(target),
        spellID = spellID,
        at = now
    }
end

local function ConfirmSuccess(guid, spellID, spellName)
    if not settings.enabled or not IsFearWard(spellID, spellName) then
        return
    end
    if not guid or guid == "" then
        return
    end

    local now = GetTime()
    ExpireCasts(now)

    if completed[guid] then
        return
    end

    local record = pending[guid]
    if not record then
        -- No matching SENT: do not guess the recipient from the new target.
        return
    end

    pending[guid] = nil
    completed[guid] = now

    if not record.target then
        if not lastMissingTargetWarning
        or now - lastMissingTargetWarning > 30 then
            lastMissingTargetWarning = now
            if DEFAULT_CHAT_FRAME then
                DEFAULT_CHAT_FRAME:AddMessage(
                    "|cffff9900Priest Companion:|r " ..
                    "Fear Ward target could not be confirmed; " ..
                    "announcement skipped."
                )
            end
        end
        return
    end

    Announce(record.target)
end

local function RemoveFailed(guid)
    if guid and guid ~= "" then
        pending[guid] = nil
    end
end

--------------------------------------------------
-- Vanilla 1.12 event dispatch
--------------------------------------------------

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("VARIABLES_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

-- Only ClassicAPI currently supplies BOTH a cast GUID and a recipient
-- in SENT, plus server-confirmed SUCCEEDED with that same GUID.
-- Nampower SPELL_CAST_EVENT is client-side and its target GUID may be 0;
-- never use it to claim that Fear Ward reached a particular unit.
if PC.Capabilities and PC.Capabilities.classicAPISupported then
    local success = pcall(eventFrame.RegisterEvent, eventFrame,
        "UNIT_SPELLCAST_SENT")
    if success then
        local confirmed = pcall(eventFrame.RegisterEvent, eventFrame,
            "UNIT_SPELLCAST_SUCCEEDED")
        if confirmed then
            provider = "ClassicAPI"
            pcall(eventFrame.RegisterEvent, eventFrame,
                "UNIT_SPELLCAST_FAILED")
            pcall(eventFrame.RegisterEvent, eventFrame,
                "UNIT_SPELLCAST_FAILED_QUIET")
            pcall(eventFrame.RegisterEvent, eventFrame,
                "UNIT_SPELLCAST_INTERRUPTED")
        end
    end
end

eventFrame:SetScript("OnEvent", function()
    if event == "VARIABLES_LOADED" then
        LoadSettings()
        return
    end

    if event == "PLAYER_ENTERING_WORLD" then
        pending = {}
        completed = {}
        return
    end

    if provider ~= "ClassicAPI" or arg1 ~= "player" then
        return
    end

    if event == "UNIT_SPELLCAST_SENT" then
        CaptureSent(arg2, arg3, arg4, arg5)
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        ConfirmSuccess(arg2, arg3, arg4)
    elseif event == "UNIT_SPELLCAST_FAILED"
    or event == "UNIT_SPELLCAST_FAILED_QUIET"
    or event == "UNIT_SPELLCAST_INTERRUPTED" then
        RemoveFailed(arg2)
    end
end)
