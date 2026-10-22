-- Priest Companion
-- Fear Ward and Resurrection announcers (Vanilla Lua 5.0 compatible).
-- Reports casts only; never starts a spell.

local PC = PriestCompanion

PC.Modules.Announcer = PC.Modules.Announcer or {}
local Announcer = PC.Modules.Announcer

local FEAR_WARD_ID = 6346
local FEAR_WARD_NAME = "Fear Ward"
local DEFAULT_MESSAGE = "Fear Ward cast on {target}."
local RESURRECTION_NAME = "Resurrection"
local DEFAULT_RES_MESSAGE = "Casting {spell} on {target}."
local DEFAULT_RES_WHISPER_MESSAGE =
    "Casting {spell} on you. Please don't release!"
local DEFAULT_RES_CANCEL_MESSAGE = "{spell} on {target} was interrupted."
local DEFAULT_RES_CANCEL_WHISPER_MESSAGE =
    "Resurrection on you was interrupted."
local UNKNOWN_RES_TARGET = "a released player's corpse"
local RES_TARGET_GRACE = 0.65
-- Vanilla priest ranks 1-5 plus a later rank if exposed on a custom realm.
local RESURRECTION_IDS = {
    [2006] = true,
    [2010] = true,
    [10880] = true,
    [10881] = true,
    [20770] = true,
    [25435] = true
}
local RES_PENDING_SECONDS = 30
local PENDING_SECONDS = 15
local MAX_MESSAGE_BYTES = 140

local DEFAULTS = {
    enabled = false,
    announceSelf = false,
    preventOverwrite = false,
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
-- Whisper belongs to Resurrection only; Fear Ward settings are unchanged.
local RES_CHANNELS = {
    "SAY", "YELL", "PARTY", "RAID", "SELF", "WHISPER"
}
local resSettings = {
    enabled = false,
    announceInterrupted = false,
    message = DEFAULT_RES_MESSAGE,
    whisperMessage = DEFAULT_RES_WHISPER_MESSAGE,
    cancelMessage = DEFAULT_RES_CANCEL_MESSAGE,
    channels = {
        SAY = true,
        YELL = false,
        PARTY = false,
        RAID = false,
        SELF = false,
        WHISPER = false
    }
}
local settings = {
    enabled = DEFAULTS.enabled,
    announceSelf = DEFAULTS.announceSelf,
    preventOverwrite = DEFAULTS.preventOverwrite,
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
local resProvider = "unavailable"
local pending = {}
local completed = {}
local resPending = {}
local resAnnounced = {}
local lastMissingTargetWarning = nil
local lastUnknownResNotice = nil

--------------------------------------------------
-- Settings
--------------------------------------------------

local function NormalizeMessage(value, defaultText, requireTarget)
    defaultText = defaultText or DEFAULT_MESSAGE
    if type(value) ~= "string" then
        return defaultText
    end

    -- Prevent embedded newlines/control codes from reaching group chat.
    value = string.gsub(value, "[%c]", " ")
    value = string.gsub(value, "^%s+", "")
    value = string.gsub(value, "%s+$", "")
    value = string.sub(value, 1, MAX_MESSAGE_BYTES)
    value = string.gsub(value, "%s+$", "")

    if value == "" then
        return defaultText
    end

    -- Public messages identify the recipient. Whisper is directly
    -- addressed to that player, so it may use "you" without {target}.
    if requireTarget ~= false
    and not string.find(value, "{target}", 1, true) then
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
        preventOverwrite = settings.preventOverwrite,
        message = settings.message,
        channels = {
            SAY = settings.channels.SAY,
            YELL = settings.channels.YELL,
            PARTY = settings.channels.PARTY,
            RAID = settings.channels.RAID,
            SELF = settings.channels.SELF
        },
        resurrection = {
            enabled = resSettings.enabled,
            announceInterrupted = resSettings.announceInterrupted,
            message = resSettings.message,
            whisperMessage = resSettings.whisperMessage,
            cancelMessage = resSettings.cancelMessage,
            channels = {
                SAY = resSettings.channels.SAY,
                YELL = resSettings.channels.YELL,
                PARTY = resSettings.channels.PARTY,
                RAID = resSettings.channels.RAID,
                SELF = resSettings.channels.SELF,
                WHISPER = resSettings.channels.WHISPER
            }
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
    if type(saved.preventOverwrite) == "boolean" then
        settings.preventOverwrite = saved.preventOverwrite
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

    local resurrection = saved.resurrection
    if type(resurrection) == "table" then
        if type(resurrection.enabled) == "boolean" then
            resSettings.enabled = resurrection.enabled
        end
        if type(resurrection.announceInterrupted) == "boolean" then
            resSettings.announceInterrupted = resurrection.announceInterrupted
        end
        resSettings.message = NormalizeMessage(
            resurrection.message, DEFAULT_RES_MESSAGE
        )
        resSettings.whisperMessage = NormalizeMessage(
            resurrection.whisperMessage, DEFAULT_RES_WHISPER_MESSAGE, false
        )
        resSettings.cancelMessage = NormalizeMessage(
            resurrection.cancelMessage, DEFAULT_RES_CANCEL_MESSAGE
        )
        if type(resurrection.channels) == "table" then
            local i
            for i = 1, table.getn(RES_CHANNELS) do
                local channel = RES_CHANNELS[i]
                if type(resurrection.channels[channel]) == "boolean" then
                    resSettings.channels[channel] = resurrection.channels[channel]
                end
            end
        end
    end
end

function Announcer.GetOption(key)
    return settings[key]
end

function Announcer.SetOption(key, value)
    if key ~= "enabled" and key ~= "announceSelf"
    and key ~= "preventOverwrite" then
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

function Announcer.GetDefaultMessage()
    return DEFAULT_MESSAGE
end

function Announcer.SetMessage(message)
    settings.message = NormalizeMessage(message)
    SaveSettings()
    return settings.message
end

function Announcer.FormatMessage(target, draft)
    if type(target) ~= "string" or target == "" then
        return nil
    end

    -- A draft is used for the UI preview only; announcement delivery
    -- always passes no draft and reads the explicitly saved setting.
    local message = settings.message
    if type(draft) == "string" then
        message = NormalizeMessage(draft)
    end

    -- Replacement functions avoid interpreting percent signs in unit names.
    local text = string.gsub(message, "{target}", function()
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

-- Resurrection has its own opt-in, channels, and editable message.
function Announcer.GetResurrectionProvider()
    return resProvider
end

function Announcer.GetResOption(key)
    if key == "enabled" or key == "announceInterrupted" then
        return resSettings[key]
    end
    return nil
end

function Announcer.SetResOption(key, value)
    if key ~= "enabled" and key ~= "announceInterrupted" then
        return false
    end
    resSettings[key] = value and true or false
    SaveSettings()
    return true
end

function Announcer.GetResChannel(channel)
    return resSettings.channels[channel] == true
end

function Announcer.SetResChannel(channel, value)
    if resSettings.channels[channel] == nil then
        return false
    end
    resSettings.channels[channel] = value and true or false
    SaveSettings()
    return true
end

function Announcer.GetResMessage()
    return resSettings.message
end

function Announcer.GetDefaultResMessage()
    return DEFAULT_RES_MESSAGE
end

function Announcer.SetResMessage(value)
    resSettings.message = NormalizeMessage(value, DEFAULT_RES_MESSAGE)
    SaveSettings()
    return resSettings.message
end

local function FormatResText(message, target)
    if type(target) ~= "string" or target == "" then
        return nil
    end
    message = string.gsub(message, "{target}", function()
        return target
    end)
    message = string.gsub(message, "{spell}", function()
        return RESURRECTION_NAME
    end)
    return message
end

function Announcer.FormatResurrectionMessage(target, draft)
    local text = resSettings.message
    if type(draft) == "string" then
        text = NormalizeMessage(draft, DEFAULT_RES_MESSAGE)
    end
    return FormatResText(text, target)
end

function Announcer.GetResWhisperMessage()
    return resSettings.whisperMessage
end

function Announcer.GetDefaultResWhisperMessage()
    return DEFAULT_RES_WHISPER_MESSAGE
end

function Announcer.SetResWhisperMessage(value)
    resSettings.whisperMessage = NormalizeMessage(
        value, DEFAULT_RES_WHISPER_MESSAGE, false
    )
    SaveSettings()
    return resSettings.whisperMessage
end

function Announcer.FormatResWhisperMessage(draft)
    local text = resSettings.whisperMessage
    if type(draft) == "string" then
        text = NormalizeMessage(draft, DEFAULT_RES_WHISPER_MESSAGE, false)
    end
    return FormatResText(text, "you")
end

function Announcer.GetResCancelMessage()
    return resSettings.cancelMessage
end

function Announcer.GetDefaultResCancelMessage()
    return DEFAULT_RES_CANCEL_MESSAGE
end

function Announcer.SetResCancelMessage(value)
    resSettings.cancelMessage = NormalizeMessage(
        value, DEFAULT_RES_CANCEL_MESSAGE
    )
    SaveSettings()
    return resSettings.cancelMessage
end

function Announcer.FormatResCancelMessage(target, draft)
    local text = resSettings.cancelMessage
    if type(draft) == "string" then
        text = NormalizeMessage(draft, DEFAULT_RES_CANCEL_MESSAGE)
    end
    return FormatResText(text, target)
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

--------------------------------------------------
-- Resurrection: confirm START, not merely a cast request
--------------------------------------------------

local function IsResurrection(spellID, spellName)
    local id = tonumber(spellID)
    if id and RESURRECTION_IDS[id] then
        return true
    end

    if spellName == RESURRECTION_NAME then
        return true
    end

    if type(GetSpellInfo) == "function" then
        local ok, name = pcall(GetSpellInfo, 2006)
        if ok and name and name == spellName then
            return true
        end
    end

    return false
end

-- ClassicAPI SENT may carry an empty target for released corpses:
-- its packet decoder translates a target GUID only into known unit tokens.
-- Never use the selected living player as a fallback for corpse targeting.
local function ResSpellTargetName()
    -- ClassicAPI exposes UnitSpellTargetName as a GLOBAL API.
    if type(UnitSpellTargetName) == "function" then
        local ok, name = pcall(UnitSpellTargetName, "player")
        if ok and type(name) == "string" and name ~= ""
        and name ~= "unknown" then
            return name
        end
    end
    return nil
end

local function AnnounceResurrection(target, canWhisper, cancelled)
    if not resSettings.enabled then
        return
    end

    -- A generic public message is preferable to silently losing a
    -- confirmed corpse-click cast; never whisper an unknown player.
    target = target or UNKNOWN_RES_TARGET
    local publicMessage
    if cancelled then
        publicMessage = Announcer.FormatResCancelMessage(target)
    else
        publicMessage = Announcer.FormatResurrectionMessage(target)
    end

    local whisperMessage
    if cancelled then
        whisperMessage = DEFAULT_RES_CANCEL_WHISPER_MESSAGE
    else
        whisperMessage = Announcer.FormatResWhisperMessage()
    end

    local i
    for i = 1, table.getn(RES_CHANNELS) do
        local channel = RES_CHANNELS[i]
        if resSettings.channels[channel] then
            if channel == "WHISPER" then
                if canWhisper and type(SendChatMessage) == "function" then
                    pcall(SendChatMessage, whisperMessage, "WHISPER", nil,
                        target)
                end
            elseif channel == "SELF" then
                if DEFAULT_CHAT_FRAME then
                    DEFAULT_CHAT_FRAME:AddMessage(
                        "|cff66ccffPriest Companion:|r " .. publicMessage
                    )
                end
            elseif ChatAvailable(channel)
            and type(SendChatMessage) == "function" then
                pcall(SendChatMessage, publicMessage, channel)
            end
        end
    end

    if not canWhisper and resSettings.channels.WHISPER then
        local now = GetTime()
        if not lastUnknownResNotice
        or now - lastUnknownResNotice > 15 then
            lastUnknownResNotice = now
            if DEFAULT_CHAT_FRAME then
                DEFAULT_CHAT_FRAME:AddMessage(
                    "|cffff9900Priest Companion:|r " ..
                    "Resurrection recipient not identified; whisper skipped."
                )
            end
        end
    end
end

local function ExpireResurrection(now)
    local guid
    local record
    for guid, record in pairs(resPending) do
        if now - record.at > RES_PENDING_SECONDS then
            resPending[guid] = nil
        end
    end
    for guid, record in pairs(resAnnounced) do
        if now - record.at > RES_PENDING_SECONDS then
            resAnnounced[guid] = nil
        end
    end
end

local function CaptureResurrectionSent(target, guid, spellID, spellName)
    if not resSettings.enabled
    or not IsResurrection(spellID, spellName)
    or not guid or guid == "" then
        return
    end
    local now = GetTime()
    ExpireResurrection(now)
    local name = ResolveTarget(target)
    resPending[guid] = {
        target = name,
        at = now
    }
end

local function DeliverStartedResurrection(record)
    if record.delivered then
        return
    end
    record.delivered = true
    AnnounceResurrection(record.target, record.target ~= nil, false)
end

local function ConfirmResurrectionStart(guid, spellID, spellName)
    if not resSettings.enabled
    or resProvider ~= "ClassicAPI"
    or not IsResurrection(spellID, spellName)
    or not guid or guid == "" then
        return
    end

    local now = GetTime()
    ExpireResurrection(now)
    if resAnnounced[guid] then
        return
    end

    local record = resPending[guid]
    if not record then
        -- No SENT/START pair: never claim a confirmed recipient.
        return
    end
    resPending[guid] = nil
    record.at = now
    record.finished = false
    record.delivered = false
    resAnnounced[guid] = record

    if not record.target then
        record.target = ResSpellTargetName()
    end

    if record.target then
        DeliverStartedResurrection(record)
    else
        -- START can precede the server packet that supplies a target
        -- name. Give the cast a brief window to resolve before sending
        -- the generic corpse announcement.
        record.resolveUntil = now + RES_TARGET_GRACE
    end
end

local function UpdateResurrectionRecipients()
    local now = GetTime()
    local guid
    local record
    for guid, record in pairs(resAnnounced) do
        if not record.delivered and not record.finished then
            if not record.target then
                record.target = ResSpellTargetName()
            end
            if record.target or now >= record.resolveUntil then
                DeliverStartedResurrection(record)
            end
        end
    end
end

local function FinishResurrection(guid, cancelled)
    if not guid or guid == "" then
        return
    end

    resPending[guid] = nil
    local record = resAnnounced[guid]
    if not record or record.finished then
        return
    end

    -- The cast did reach START. Deliver that notice before reporting
    -- a very early cancellation, but never announce a pre-START failure.
    if not record.delivered then
        if not record.target then
            record.target = ResSpellTargetName()
        end
        DeliverStartedResurrection(record)
    end
    record.finished = true

    if cancelled and resSettings.enabled
    and resSettings.announceInterrupted then
        AnnounceResurrection(record.target, record.target ~= nil, true)
    end
end

--------------------------------------------------
-- Confirmed casts and recipients
--------------------------------------------------

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
        resPending[guid] = nil
    end
end

--------------------------------------------------
-- Fear Ward overwrite protection (pre-cast)
--------------------------------------------------

-- In 1.12 a completed instant cast cannot reliably be cancelled.
-- Guard the supported Lua cast entrypoints BEFORE calling the original.
-- Other DLLs/addons can issue casts outside these Lua entrypoints.
local lastGuardNotice = nil
local lastGuardUnit = nil

local function IsFearWardName(value)
    -- ClassicAPI CastAtUnit accepts both numeric spell IDs and names.
    if type(value) == "number" then
        return value == FEAR_WARD_ID
    end
    if type(value) ~= "string" then
        return false
    end
    local spell = string.gsub(value, "%s*%([^%)]+%)$", "")
    spell = string.gsub(spell, "^%s+", "")
    spell = string.gsub(spell, "%s+$", "")

    if spell == FEAR_WARD_NAME
    or tonumber(spell) == FEAR_WARD_ID then
        return true
    end

    if type(GetSpellInfo) == "function" then
        local ok, name = pcall(GetSpellInfo, FEAR_WARD_ID)
        if ok and name and spell == name then
            return true
        end
    end

    return false
end

local function HasFearWard(unit)
    if type(UnitExists) ~= "function" or not UnitExists(unit) then
        return false
    end

    -- ClassicAPI's aura lookup compares spell ID, not reused icon paths.
    -- A name fallback covers nonstandard server aura spell IDs.
    if type(C_UnitAuras) == "table" then
        if type(C_UnitAuras.GetUnitAuraBySpellID) == "function" then
            local ok, aura = pcall(
                C_UnitAuras.GetUnitAuraBySpellID,
                unit, FEAR_WARD_ID, "HELPFUL"
            )
            if ok and aura then
                return true
            end
        end

        if type(C_UnitAuras.GetAuraDataBySpellName) == "function" then
            local name = FEAR_WARD_NAME
            if type(GetSpellInfo) == "function" then
                local ok, localName = pcall(GetSpellInfo, FEAR_WARD_ID)
                if ok and type(localName) == "string" then
                    name = localName
                end
            end
            local ok, aura = pcall(
                C_UnitAuras.GetAuraDataBySpellName,
                unit, name, "HELPFUL"
            )
            if ok and aura then
                return true
            end
        end
    end

    -- Vanilla 1.12 UnitBuff returns an icon path, not a spell name.
    -- Use only the known Fear Ward texture as a conservative fallback
    -- when ClassicAPI's aura readers are unavailable.
    if type(C_UnitAuras) ~= "table"
    and type(UnitBuff) == "function" then
        local i
        for i = 1, 32 do
            local texture = UnitBuff(unit, i)
            if not texture then
                break
            end
            if type(texture) == "string"
            and string.find(
                string.lower(texture), "spell_holy_excorcism", 1, true
            ) then
                return true
            end
        end
    end

    return false
end

local function ProtectionUnit(onSelf)
    -- SuperWoW extends CastSpellByName's second argument with a unit
    -- token. Never replace an explicit recipient with the selected target.
    if type(onSelf) == "string" then
        if type(UnitExists) == "function" and UnitExists(onSelf) then
            return onSelf
        end
        return nil
    end

    if onSelf == true or onSelf == 1 then
        return "player"
    end

    if type(UnitExists) == "function" and UnitExists("target") then
        -- Keep the existing selected-target behavior. An explicit
        -- SpellTargetUnit or @mouseover target is handled separately.
        return "target"
    end

    -- OctoWoW self-casts this helpful spell when there is no target.
    -- A missing target must not silently bypass self-buff protection.
    return "player"
end

local function ShouldBlockFearWard(unit)
    if not settings.preventOverwrite or not unit then
        return false
    end

    if type(UnitCanAssist) == "function"
    and not UnitCanAssist("player", unit) then
        return false
    end

    if not HasFearWard(unit) then
        return false
    end

    local now = type(GetTime) == "function" and GetTime() or 0
    local targetName = type(UnitName) == "function"
        and UnitName(unit) or "target"

    -- Suppress repeated warnings from nested cast wrappers / button spam.
    if targetName ~= lastGuardUnit
    or not lastGuardNotice or now - lastGuardNotice >= 1 then
        lastGuardNotice = now
        lastGuardUnit = targetName
        if DEFAULT_CHAT_FRAME then
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cffffbb33Priest Companion:|r Fear Ward already " ..
                "active on " .. targetName .. "; cast prevented."
            )
        end
    end

    return true
end

function Announcer.HasFearWard(unit)
    return HasFearWard(unit)
end

function Announcer.ShouldBlockFearWard(unit)
    return ShouldBlockFearWard(unit)
end

-- In Vanilla, a script may start Fear Ward and then specify the unit
-- through SpellTargetUnit("raid1") or SpellTargetUnit(mouseoverUnit).
-- Remember ONLY a pending Fear Ward target cursor; do not cancel other
-- spell targeting. The cursor check and short expiry prevent stale state.
local pendingFearWardTargetAt = nil
local TARGET_WINDOW = 2

local function CaptureTargetCursor()
    pendingFearWardTargetAt = nil
    if not settings.preventOverwrite
    or type(SpellIsTargeting) ~= "function" then
        return
    end

    local ok, targeting = pcall(SpellIsTargeting)
    if ok and targeting then
        pendingFearWardTargetAt = GetTime()
    end
end

if type(SpellTargetUnit) == "function" then
    local previousTargetUnit = SpellTargetUnit
    SpellTargetUnit = function(unit)
        local started = pendingFearWardTargetAt
        pendingFearWardTargetAt = nil

        if started
        and type(GetTime) == "function"
        and GetTime() - started <= TARGET_WINDOW then
            local validCursor = true
            if type(SpellIsTargeting) == "function" then
                local ok, targeting = pcall(SpellIsTargeting)
                validCursor = ok and targeting and true or false
            end

            if validCursor and ShouldBlockFearWard(unit) then
                if type(SpellStopTargeting) == "function" then
                    pcall(SpellStopTargeting)
                end
                return
            end
        end

        return previousTargetUnit(unit)
    end
end

-- ClassicAPI implements /cast [@unit] via C_Spell.CastAtUnit, NOT
-- the Lua CastSpellByName path. Guard the exact resolved unit here.
-- This is what protects @mouseover without accidentally testing the
-- current selected target. Keep the original function for other spells.
if type(C_Spell) == "table"
and type(C_Spell.CastAtUnit) == "function" then
    local previousCastAtUnit = C_Spell.CastAtUnit
    C_Spell.CastAtUnit = function(spellIDOrName, unit, placeGroundSpell)
        if IsFearWardName(spellIDOrName)
        and ShouldBlockFearWard(unit) then
            return false
        end
        return previousCastAtUnit(spellIDOrName, unit, placeGroundSpell)
    end
end

-- Keep the existing function as a delegate so independently hooking
-- addons can still work. No hooksecurefunc: a post-hook cannot block.
if type(CastSpellByName) == "function" then
    local previousCastByName = CastSpellByName
    CastSpellByName = function(spellName, onSelf)
        local fearWard = IsFearWardName(spellName)
        pendingFearWardTargetAt = nil

        if fearWard
        and ShouldBlockFearWard(ProtectionUnit(onSelf)) then
            return
        end

        local result = previousCastByName(spellName, onSelf)
        if fearWard then
            CaptureTargetCursor()
        end
        return result
    end
end

if type(CastSpell) == "function" then
    local previousCast = CastSpell
    CastSpell = function(spellbookSlot, bookType)
        local fearWard = false
        if bookType ~= "pet" and type(GetSpellName) == "function" then
            local name = GetSpellName(spellbookSlot, bookType or "spell")
            fearWard = IsFearWardName(name)
        end
        pendingFearWardTargetAt = nil

        if fearWard
        and ShouldBlockFearWard(ProtectionUnit(false)) then
            return
        end

        local result = previousCast(spellbookSlot, bookType)
        if fearWard then
            CaptureTargetCursor()
        end
        return result
    end
end

if type(UseAction) == "function" then
    local previousUseAction = UseAction
    UseAction = function(slot, checkCursor, onSelf)
        -- ClassicAPI exposes the exact spell ID of direct action buttons.
        -- Do NOT inspect icon textures or block macros based on their
        -- first spell: their actual target may differ (e.g. @mouseover).
        local fearWard = false
        if type(GetActionInfo) == "function" then
            local kind, spellID = GetActionInfo(slot)
            fearWard = kind == "spell"
                and tonumber(spellID) == FEAR_WARD_ID
        end

        pendingFearWardTargetAt = nil

        if fearWard
        and ShouldBlockFearWard(ProtectionUnit(onSelf)) then
            return
        end

        local result = previousUseAction(slot, checkCursor, onSelf)
        if fearWard then
            CaptureTargetCursor()
        end
        return result
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

            -- Resurrection is a cast-time spell. Its announcement must
            -- wait for START, after the server acknowledges the cast.
            local started = pcall(eventFrame.RegisterEvent, eventFrame,
                "UNIT_SPELLCAST_START")
            if started then
                resProvider = "ClassicAPI"
            end

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
        resPending = {}
        resAnnounced = {}
        return
    end

    if provider ~= "ClassicAPI" or arg1 ~= "player" then
        return
    end

    if event == "UNIT_SPELLCAST_SENT" then
        CaptureSent(arg2, arg3, arg4, arg5)
        CaptureResurrectionSent(arg2, arg3, arg4, arg5)
    elseif event == "UNIT_SPELLCAST_START" then
        ConfirmResurrectionStart(arg2, arg3, arg4)
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        ConfirmSuccess(arg2, arg3, arg4)
        if IsResurrection(arg3, arg4) then
            FinishResurrection(arg2, false)
        end
    elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
        if IsResurrection(arg3, arg4) then
            FinishResurrection(arg2, true)
        end
        RemoveFailed(arg2)
    elseif event == "UNIT_SPELLCAST_FAILED"
    or event == "UNIT_SPELLCAST_FAILED_QUIET" then
        if IsResurrection(arg3, arg4) then
            FinishResurrection(arg2, true)
        end
        RemoveFailed(arg2)
    end
end)

-- Recipient names from ClassicAPI's server cast data can arrive after
-- START. Only unresolved, already-started Resurrection casts are polled.
eventFrame:SetScript("OnUpdate", function()
    if resProvider == "ClassicAPI" and resSettings.enabled then
        UpdateResurrectionRecipients()
    end
end)
