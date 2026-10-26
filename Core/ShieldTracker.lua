-- Self Power Word: Shield prototype. No cast automation or external libraries.
local PC = PriestCompanion
local Tracker = {}
PC.Modules.ShieldTracker = Tracker
local frame = CreateFrame("Frame")
local settings = { enabled = false, locked = false, x = 0, y = -220 }
local loaded = false
local listeners = {}
local provider = "Vanilla (presence only)"
local state = { active = false }
local pending
local lastCastTime, lastCastID
local elapsed = 0
local UpdateSubscriptions, RefreshAura, UpdateTicker
local shieldIcon = "spell_holy_powerwordshield"
-- Vanilla base absorbs, not a prediction of OctoWoW talent/gear modifiers.
local baseAbsorb = {
    [17] = 44, [592] = 88, [600] = 158, [3747] = 234,
    [6065] = 301, [6066] = 381, [10898] = 484,
    [10899] = 605, [10900] = 763, [10901] = 942
}
local competingIcons = {
    "spell_ice_lament", "spell_shadow_detectlesserinvisibility",
    "spell_fire_firearmor", "spell_frost_frostward",
    "spell_shadow_antishadow", "spell_shadow_sacrificialshield",
    "inv_potion_", "inv_misc_shell_"
}
local function Notify()
    local i
    for i = 1, table.getn(listeners) do listeners[i]() end
end
local function Save()
    if loaded then
        PriestCompanionCharDB.shieldTracker = settings
    end
end
local function NormalizeGUID(guid)
    if type(guid) ~= "string" then return nil end
    guid = string.lower(guid)
    guid = string.gsub(guid, "^0x", "")
    guid = string.gsub(guid, "^0+", "")
    if guid == "" then return nil end
    return guid
end
local function PlayerGUID()
    local ok, guid
    if type(UnitGUID) == "function" then ok, guid = pcall(UnitGUID, "player") end
    if (not ok or not guid) and type(GetUnitGUID) == "function" then
        ok, guid = pcall(GetUnitGUID, "player")
    end
    if (not ok or not guid) and PC.Capabilities.superWoW and type(UnitExists) == "function" then
        local exists
        ok, exists, guid = pcall(UnitExists, "player")
    end
    return ok and NormalizeGUID(guid) or nil
end
local function IsPlayer(guid)
    local player = PlayerGUID()
    return player ~= nil and player == NormalizeGUID(guid)
end
local function IsShield(id, icon)
    return baseAbsorb[tonumber(id)] ~= nil
        or (type(icon) == "string" and string.find(string.lower(icon), shieldIcon, 1, true) ~= nil)
end
local function Competing(icon)
    if type(icon) ~= "string" then return false end
    local lower = string.lower(icon)
    local i
    for i = 1, table.getn(competingIcons) do
        if string.find(lower, competingIcons[i], 1, true) then return true end
    end
    return false
end
local function ReadAuras()
    local present, expiry, conflict = false, nil, false
    local i
    -- Vanilla's player-buff duration is authoritative for this unit.
    if type(GetPlayerBuff) == "function" and type(GetPlayerBuffTexture) == "function" then
        for i = 0, 31 do
            local index = GetPlayerBuff(i, "HELPFUL")
            if not index or index < 0 then break end
            local icon = GetPlayerBuffTexture(index)
            if IsShield(nil, icon) then
                present = true
                if type(GetPlayerBuffTimeLeft) == "function" then
                    local seconds = GetPlayerBuffTimeLeft(index)
                    if type(seconds) == "number" and seconds > 0 then expiry = GetTime() + seconds end
                end
            elseif Competing(icon) then conflict = true end
        end
        return present, expiry, conflict
    end
    if type(C_UnitAuras) == "table" and type(C_UnitAuras.GetBuffDataByIndex) == "function" then
        for i = 1, 32 do
            local ok, aura = pcall(C_UnitAuras.GetBuffDataByIndex, "player", i)
            if not ok then return nil end
            if not aura then break end
            if IsShield(aura.spellId, aura.icon) then
                present = true
                if type(aura.expirationTime) == "number" and aura.expirationTime > GetTime() then
                    expiry = aura.expirationTime
                end
            elseif Competing(aura.icon) then conflict = true end
        end
        return present, expiry, conflict
    end
    if type(UnitBuff) == "function" then
        for i = 1, 32 do
            local icon = UnitBuff("player", i)
            if not icon then break end
            if IsShield(nil, icon) then present = true
            elseif Competing(icon) then conflict = true end
        end
        return present, nil, conflict
    end
    return nil
end
local function Unknown(reason)
    state.remaining, state.maximum = nil, nil
    state.reason = reason
end
RefreshAura = function()
    if not settings.enabled then return end
    if type(UnitIsDeadOrGhost) == "function" and UnitIsDeadOrGhost("player") then
        state, pending = { active = false }, nil
        UpdateTicker(); Notify(); return
    end
    local present, expiry, conflict = ReadAuras()
    if present == nil then
        state = { active = false, reason = "Aura data unavailable" }
    elseif not present then
        state = { active = false }
    else
        if not state.active then
            state = { active = true, reason = "Cast not observed / external shield" }
        end
        if state.expiresAt and expiry and expiry > state.expiresAt + 0.5 then
            Unknown("Shield refreshed without observed cast")
        end
        state.expiresAt = expiry
        if pending and pending.untilTime >= GetTime() then
            -- Only an observed own cast can seed the base-rank estimate.
            if pending.own and not pending.uncertain then
                state.maximum = baseAbsorb[pending.id]
                state.remaining = state.maximum
                state.reason = "Base-rank estimate; modifiers not included"
            else Unknown("External shield or damage before aura confirmation") end
            pending = nil
        end
        if conflict then Unknown("Other possible absorbs active") end
    end
    UpdateTicker()
    Notify()
end
local function ObserveCast(id, caster, target)
    id = tonumber(id)
    if not IsShield(id) or not IsPlayer(target) then return end
    -- Nampower may report several aura effects for a single application.
    local now = GetTime()
    if lastCastID == id and lastCastTime and now - lastCastTime < 0.15 then return end
    lastCastID, lastCastTime = id, now
    pending = { id = id, own = IsPlayer(caster), untilTime = now + 1 }
    -- Do not seed against a previous aura until the aura update arrives.
    UpdateTicker()
end
local function Absorb(amount)
    if pending then
        RefreshAura()
        if pending then pending.uncertain = true end
    end
    if not state.active then return end
    amount = tonumber(amount)
    if not amount or amount < 0 then
        Unknown("Absorbed amount unavailable")
    elseif amount > 0 and state.remaining then
        local present, expiry, conflict = ReadAuras()
        if conflict then Unknown("Other possible absorbs active")
        else
            state.remaining = math.max(0, state.remaining - amount)
            if amount > 0 and state.remaining == 0 then
                Unknown("Base estimate exhausted; aura determines shield presence")
            end
        end
    end
    Notify()
end
UpdateTicker = function()
    if settings.enabled and (pending or (state.active and state.expiresAt)) then
        frame:SetScript("OnUpdate", function()
            elapsed = elapsed + arg1
            if elapsed < 0.1 then return end
            elapsed = 0
            if pending then
                if pending.untilTime < GetTime() then pending = nil; UpdateTicker()
                else RefreshAura() end
            elseif state.expiresAt and state.expiresAt <= GetTime() then RefreshAura()
            else Notify() end
        end)
    else frame:SetScript("OnUpdate", nil) end
end
local commonEvents = { "PLAYER_AURAS_CHANGED", "UNIT_AURA", "PLAYER_ENTERING_WORLD", "PLAYER_DEAD" }
local classicEvents = { "COMBAT_LOG_EVENT_UNFILTERED" }
local nampowerEvents = { "AURA_CAST_ON_SELF", "AUTO_ATTACK_SELF", "AUTO_ATTACK_OTHER",
    "SPELL_DAMAGE_EVENT_SELF", "SPELL_DAMAGE_EVENT_OTHER" }
local textEvents = { "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE",
    "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS", "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
    "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CHAT_MSG_COMBAT_SELF_HITS", "CHAT_MSG_SPELL_SELF_DAMAGE" }
local function Register(list)
    local ok = true
    local i
    for i = 1, table.getn(list) do
        local success = pcall(frame.RegisterEvent, frame, list[i])
        if not success then ok = false end
    end
    return ok
end
local function Unregister(list)
    local i
    for i = 1, table.getn(list) do pcall(frame.UnregisterEvent, frame, list[i]) end
end
UpdateSubscriptions = function()
    Unregister(commonEvents); Unregister(classicEvents); Unregister(nampowerEvents)
    Unregister(textEvents); pcall(frame.UnregisterEvent, frame, "UNIT_CASTEVENT")
    provider = "Vanilla (presence only)"
    if not loaded or not settings.enabled then return end
    Register(commonEvents)
    if PC.Capabilities.classicAPISupported and type(CombatLogGetCurrentEventInfo) == "function"
    and type(UnitGUID) == "function" and Register(classicEvents) then
        provider = "ClassicAPI"
        return
    end
    Unregister(classicEvents)
    local version = tostring(PC.Capabilities.nampowerVersion or "")
    local _, _, major, minor = string.find(version, "(%d+)%.(%d+)")
    major, minor = tonumber(major) or 0, tonumber(minor) or 0
    if PC.Capabilities.nampower and (major > 4 or (major == 4 and minor >= 5))
    and type(GetUnitGUID) == "function" and Register(nampowerEvents) then
        provider = "Nampower >=4.5"
        return
    end
    Unregister(nampowerEvents)
    local locale = type(GetLocale) == "function" and GetLocale() or "enUS"
    if PC.Capabilities.superWoW and (locale == "enUS" or locale == "enGB")
    and type(UnitExists) == "function" and pcall(frame.RegisterEvent, frame, "UNIT_CASTEVENT") then
        provider = "SuperWoW (English log)"
        Register(textEvents)
    end
end
function Tracker.GetOption(key) return settings[key] end
function Tracker.GetProvider() return provider end
function Tracker.GetState()
    return { active = state.active, remaining = state.remaining, maximum = state.maximum,
        reason = state.reason, timeLeft = state.expiresAt and math.max(0, state.expiresAt - GetTime()),
        provider = provider }
end
function Tracker.AddListener(callback) table.insert(listeners, callback) end
function Tracker.SetOption(key, value)
    if key ~= "enabled" and key ~= "locked" then return end
    settings[key] = value and true or false
    Save()
    if key == "enabled" then
        state, pending, lastCastID, lastCastTime = { active = false }, nil, nil, nil
        UpdateSubscriptions()
        if settings.enabled then RefreshAura() end
        UpdateTicker()
    end
    Notify()
end
function Tracker.SetPosition(x, y)
    if type(x) == "number" and type(y) == "number" then
        settings.x, settings.y = x, y; Save()
    end
end
function Tracker.ResetPosition()
    settings.x, settings.y = 0, -220; Save(); Notify()
end
local function HandleClassic()
    local data = { CombatLogGetCurrentEventInfo() }
    if not IsPlayer(data[8]) then return end
    local sub = data[2]
    if (sub == "SPELL_AURA_APPLIED" or sub == "SPELL_CAST_SUCCESS") and IsShield(data[12]) then
        ObserveCast(data[12], data[4], data[8])
        return
    end
    if sub == "SPELL_AURA_REMOVED" and IsShield(data[12]) then
        state, pending = { active = false }, nil; UpdateTicker(); Notify(); return
    end
    if type(sub) ~= "string" then return end
    if string.find(sub, "_DAMAGE$", 1) or sub == "DAMAGE_SHIELD" or sub == "DAMAGE_SPLIT" then
        local offset = 14
        if sub == "SWING_DAMAGE" then offset = 11
        elseif sub == "ENVIRONMENTAL_DAMAGE" then offset = 12 end
        Absorb(data[offset + 6] or 0)
    elseif string.find(sub, "_MISSED$", 1) then
        local offset = sub == "SWING_MISSED" and 11 or 14
        if data[offset + 1] == "ABSORB" then Absorb(data[offset + 3]) end
    end
end
frame:RegisterEvent("VARIABLES_LOADED")
frame:SetScript("OnEvent", function()
    if event == "VARIABLES_LOADED" then
        PriestCompanionCharDB = PriestCompanionCharDB or {}
        local saved = PriestCompanionCharDB.shieldTracker
        if type(saved) == "table" then
            if type(saved.enabled) == "boolean" then settings.enabled = saved.enabled end
            if type(saved.locked) == "boolean" then settings.locked = saved.locked end
            if type(saved.x) == "number" then settings.x = saved.x end
            if type(saved.y) == "number" then settings.y = saved.y end
        end
        loaded = true; Save(); UpdateSubscriptions()
        if settings.enabled then RefreshAura() end
        return
    end
    if not settings.enabled then return end
    if event == "PLAYER_DEAD" then
        state, pending = { active = false }, nil; UpdateTicker(); Notify()
    elseif event == "PLAYER_ENTERING_WORLD" then
        state, pending = { active = false }, nil; RefreshAura()
    elseif event == "PLAYER_AURAS_CHANGED" or (event == "UNIT_AURA" and arg1 == "player") then RefreshAura()
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then HandleClassic()
    elseif event == "UNIT_CASTEVENT" and arg3 == "CAST" then ObserveCast(arg4, arg1, arg2)
    elseif event == "AURA_CAST_ON_SELF" then ObserveCast(arg1, arg2, arg3)
    elseif event == "AUTO_ATTACK_SELF" or event == "AUTO_ATTACK_OTHER" then
        if IsPlayer(arg2) then Absorb(arg8) end
    elseif event == "SPELL_DAMAGE_EVENT_SELF" or event == "SPELL_DAMAGE_EVENT_OTHER" then
        if IsPlayer(arg1) then
            local _, _, amount = string.find(tostring(arg5 or ""), "^(%d+),")
            Absorb(amount)
        end
    elseif type(arg1) == "string" and string.find(event, "CHAT_MSG_", 1, true) then
        -- Only known incoming English formats; never consume outgoing damage.
        local incoming = string.find(arg1, "hits you for", 1, true)
            or string.find(arg1, "crits you for", 1, true)
            or string.find(arg1, "You suffer", 1, true)
        if incoming then
            local _, _, amount = string.find(arg1, "%((%d+) absorbed%)")
            if amount then Absorb(amount)
            elseif string.find(string.lower(arg1), "absorb", 1, true) then Absorb(nil) end
        elseif string.find(string.lower(arg1), "absorb", 1, true) then
            Unknown("Unattributed absorb message"); Notify()
        end
    end
end)
