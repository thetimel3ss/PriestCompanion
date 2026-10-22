-- Priest Companion - Resurrection Assistant
-- Vanilla Lua 5.0-compatible. Event-driven death detection outside combat.
-- Resurrection actions are only dispatched by an explicit button click.

local PC = PriestCompanion
PC.Modules.ResurrectionAssistant = PC.Modules.ResurrectionAssistant or {}
local Assistant = PC.Modules.ResurrectionAssistant

local RES_PRIORITY = {
    PRIEST = 1, SHAMAN = 2, PALADIN = 3, DRUID = 4,
    MAGE = 5, HUNTER = 6, WARLOCK = 7, WARRIOR = 8, ROGUE = 9
}
local OFFER_SECONDS = 70

local rosterByUnit = {}
local rosterByName = {}
local incoming = {}
local inCombat = false
local initialized = false
local revision = 0
local listeners = {}
local rebuildingRoster = false

local function Notify()
    revision = revision + 1
    if rebuildingRoster then return end
    local i
    for i = 1, table.getn(listeners) do
        pcall(listeners[i])
    end
end

function Assistant.AddListener(listener)
    if type(listener) == "function" then
        table.insert(listeners, listener)
    end
end

local function Options()
    if type(PriestCompanionCharDB) ~= "table" then return nil end
    if type(PriestCompanionCharDB.resurrectionAssistant) ~= "table" then
        PriestCompanionCharDB.resurrectionAssistant = {}
    end
    return PriestCompanionCharDB.resurrectionAssistant
end

function Assistant.GetButtonEnabled()
    local db = Options()
    return db == nil or db.showButton ~= false
end

function Assistant.SetButtonEnabled(value)
    local db = Options()
    if db then db.showButton = value and true or false end
    Notify()
end

function Assistant.GetButtonPosition()
    local db = Options()
    if db and type(db.x) == "number" and type(db.y) == "number" then
        return db.x, db.y
    end
    return 200, -90
end

function Assistant.SetButtonPosition(x, y)
    if type(x) ~= "number" or type(y) ~= "number" then return end
    local db = Options()
    if db then db.x, db.y = x, y end
end

function Assistant.ResetButtonPosition()
    Assistant.SetButtonPosition(200, -90)
    Notify()
end

local function Now()
    return GetTime()
end

local function CombatBlocked()
    if inCombat then
        return true
    end
    if type(UnitAffectingCombat) == "function"
    and UnitAffectingCombat("player") then
        return true
    end
    return false
end

local function CanConsiderPlayers()
    if CombatBlocked() then
        return false
    end
    if type(UnitIsDeadOrGhost) == "function"
    and UnitIsDeadOrGhost("player") then
        return false
    end
    return true
end

local function IsMember(unit)
    return type(unit) == "string"
        and UnitExists(unit)
        and (type(UnitIsPlayer) ~= "function" or UnitIsPlayer(unit))
end

local function StripRealm(name)
    if type(name) ~= "string" then
        return nil
    end
    local first = string.find(name, "-", 1, true)
    if first then
        return string.sub(name, 1, first - 1)
    end
    return name
end

local function CanonicalMemberName(rawName)
    local short = StripRealm(rawName)
    if not short or short == "" then
        return nil
    end
    -- Communication is trusted only from an actual party or raid member.
    if rosterByName[rawName] then
        return rawName
    end
    if rosterByName[short] then
        return short
    end
    return nil
end

local function MarkIncoming(sender, target)
    local targetName = CanonicalMemberName(target)
    if not targetName or not rosterByName[targetName] then
        return
    end
    if not incoming[targetName] then
        incoming[targetName] = {}
    end
    incoming[targetName][sender] = Now() + OFFER_SECONDS
    Notify()
end

local function StopIncoming(sender)
    local target, senders
    for target, senders in pairs(incoming) do
        if senders[sender] then
            senders[sender] = nil
            Notify()
        end
        if not next(senders) then
            incoming[target] = nil
        end
    end
end

local function HasIncomingFromMessages(name)
    local senders = incoming[name]
    if not senders then
        return false
    end
    local time = Now()
    local sender, expires
    for sender, expires in pairs(senders) do
        if expires <= time then
            senders[sender] = nil
        else
            return true, "addon-message"
        end
    end
    incoming[name] = nil
    return false
end

local function HasIncomingFromProviders(unit, name)
    -- pfUI is OPTIONAL. Its library can be provided by a different
    -- installed addon; no library is bundled in Priest Companion.
    local pf = pfUI
    if type(pf) == "table" and type(pf.api) == "table" then
        local lib = pf.api.libpredict
        if (type(lib) == "table" or type(lib) == "userdata")
        and type(lib.UnitHasIncomingResurrection) == "function" then
            local ok, result = pcall(
                lib.UnitHasIncomingResurrection, lib, unit
            )
            if ok and result then
                return true, "pfUI-LibPredict"
            end
        end
    end

    -- HealComm's original API accepts CHARACTER NAME, not a unit token.
    if type(AceLibrary) == "function" then
        local ok, lib = pcall(AceLibrary, "HealComm-1.0")
        if ok and (type(lib) == "table" or type(lib) == "userdata")
        and type(lib.UnitisResurrecting) == "function" then
            local success, expiry = pcall(
                lib.UnitisResurrecting, lib, name
            )
            if success and expiry then
                return true, "HealComm-1.0"
            end
        end
    end
    return false
end

local function IsIncoming(unit, name)
    local has, provider = HasIncomingFromMessages(name)
    if has then
        return true, provider
    end
    return HasIncomingFromProviders(unit, name)
end

local function UpdateUnit(unit)
    if CombatBlocked() then
        return
    end

    local old = rosterByUnit[unit]
    if not old or not IsMember(unit) then
        return
    end
    local name = UnitName(unit)
    if name ~= old.name then
        -- Roster changed before its roster event. Rebuild on next roster
        -- event; never associate an old unit slot with a new character.
        rosterByUnit[unit] = nil
        rosterByName[old.name] = nil
        Notify()
        return
    end

    local priorConnected, priorDead, priorGhost =
        old.connected, old.dead, old.ghost
    old.connected = type(UnitIsConnected) ~= "function"
        or UnitIsConnected(unit) and true or false
    old.dead = UnitIsDead(unit) and true or false
    old.ghost = type(UnitIsGhost) == "function"
        and UnitIsGhost(unit) and true or false

    if not old.dead and not old.ghost then
        incoming[name] = nil
    end

    -- Many UNIT_HEALTH events contain no eligibility changes.
    if old.connected ~= priorConnected or old.dead ~= priorDead
    or old.ghost ~= priorGhost then Notify() end
end

function Assistant.RefreshRoster()
    if CombatBlocked() then
        return false
    end
    local newUnits, newNames = {}, {}
    local count, prefix

    local raidSize = GetNumRaidMembers()
    if raidSize > 0 then
        count, prefix = raidSize, "raid"
    else
        count, prefix = GetNumPartyMembers(), "party"
    end

    local ownName = UnitName("player")
    local i
    for i = 1, count do
        local unit = prefix .. tostring(i)
        if IsMember(unit) then
            local name = UnitName(unit)
            if name and name ~= "" and name ~= ownName
            and not newNames[name] then
                local _, class = UnitClass(unit)
                local data = {
                    name = name,
                    unit = unit,
                    class = class or "UNKNOWN",
                    priority = RES_PRIORITY[class] or 100,
                    connected = true,
                    dead = false,
                    ghost = false
                }
                newUnits[unit] = data
                newNames[name] = data
            end
        end
    end

    rebuildingRoster = true
    rosterByUnit = newUnits
    rosterByName = newNames

    local name
    for name in pairs(incoming) do
        if not newNames[name] then
            incoming[name] = nil
        end
    end

    for unit in pairs(rosterByUnit) do
        UpdateUnit(unit)
    end

    initialized = true
    rebuildingRoster = false
    Notify()
    return true
end

local function CanResurrect(data)
    if not data or not data.dead or data.ghost
    or not data.connected then
        return false
    end
    -- A cached dead state is rechecked when a user explicitly requests
    -- selection, avoiding stale candidates between game events.
    if not IsMember(data.unit) or UnitName(data.unit) ~= data.name
    or not UnitIsDead(data.unit)
    or (type(UnitIsGhost) == "function" and UnitIsGhost(data.unit))
    or (type(UnitIsConnected) == "function"
        and not UnitIsConnected(data.unit)) then
        return false
    end
    if type(UnitIsVisible) == "function"
    and not UnitIsVisible(data.unit) then
        return false
    end
    -- Optional range/LoS checks. Unknown positions are not treated as
    -- definitively out of range: the actual spell remains authoritative.
    if type(UnitDistanceSquared) == "function" then
        local ok, squared, known = pcall(UnitDistanceSquared, data.unit)
        if ok and known and squared and squared > 900 then
            return false
        end
    end
    if type(UnitInLineOfSight) == "function" then
        local ok, los = pcall(UnitInLineOfSight, data.unit)
        if ok and los == false then
            return false
        end
    end
    if IsIncoming(data.unit, data.name) then
        return false
    end
    return true
end

local function CopyCandidate(data)
    return {
        name = data.name,
        unit = data.unit,
        class = data.class,
        priority = data.priority
    }
end

function Assistant.IsPaused()
    return CombatBlocked()
end

function Assistant.GetRevision()
    return revision
end

function Assistant.GetCandidates()
    if not initialized or not CanConsiderPlayers() then
        return {}
    end
    local candidates = {}
    local unit, data
    for unit, data in pairs(rosterByUnit) do
        if CanResurrect(data) then
            table.insert(candidates, CopyCandidate(data))
        end
    end
    table.sort(candidates, function(a, b)
        if a.priority ~= b.priority then
            return a.priority < b.priority
        end
        return string.lower(a.name) < string.lower(b.name)
    end)
    return candidates
end

function Assistant.GetNextCandidate()
    if not CanConsiderPlayers() then
        return nil
    end
    local candidates = Assistant.GetCandidates()
    if table.getn(candidates) == 0 then
        return nil
    end

    -- A manually chosen, eligible dead party/raid target takes precedence.
    if UnitExists("target") then
        local selected = UnitName("target")
        local i
        for i = 1, table.getn(candidates) do
            if selected and candidates[i].name == selected then
                return candidates[i]
            end
        end
    end
    return candidates[1]
end

-- The UI asks for this state ONLY after a change event. A released
-- corpse is deliberately never treated as a directly addressable unit.
local function GetActionState()
    if not initialized or not CanConsiderPlayers() then return nil end

    local candidate = Assistant.GetNextCandidate()
    if candidate then
        return {
            mode = "target",
            name = candidate.name,
            class = candidate.class,
            unit = candidate.unit
        }
    end
    local unit, data
    for unit, data in pairs(rosterByUnit) do
        if data.ghost and data.connected then
            return { mode = "corpse" }
        end
    end
    return nil
end

function Assistant.GetButtonState()
    if not Assistant.GetButtonEnabled() then return nil end
    return GetActionState()
end

local lastClickAt = nil
local function BusyCasting()
    if type(SpellIsTargeting) == "function" and SpellIsTargeting() then
        return true
    end
    if type(C_Spell) == "table"
    and type(C_Spell.UnitCastingInfo) == "function" then
        local ok, casting = pcall(C_Spell.UnitCastingInfo, "player")
        if ok and casting then return true end
    end
    -- On a Vanilla client without ClassicAPI, use available cast bars.
    if CastingBarFrame
    and (CastingBarFrame.casting or CastingBarFrame.channeling) then
        return true
    end
    if type(pfGetCastInfo) == "function" then
        local ok, casting = pcall(pfGetCastInfo, "player")
        if ok and casting then return true end
    end
    return false
end

function Assistant.TryResurrect()
    -- Called only from a player's UI click. Never from OnEvent/OnUpdate.
    if not CanConsiderPlayers() then
        return false, "Resurrection is unavailable during combat."
    end
    if BusyCasting() then
        return false, "Finish your current spell or target selection first."
    end
    local state = GetActionState()
    if not state then
        return false, "No eligible Resurrection target."
    end
    if type(CastSpellByName) ~= "function" then
        return false, "Casting API unavailable."
    end
    local now = Now()
    if lastClickAt and now - lastClickAt < 0.75 then
        return false, "Resurrection was just requested."
    end
    lastClickAt = now

    if state.mode == "target" then
        -- Revalidate at click time; saved unit tokens can be reassigned.
        local candidate = Assistant.GetNextCandidate()
        if not candidate or candidate.name ~= state.name
        or candidate.unit ~= state.unit then
            return false, "The Resurrection target changed."
        end

        -- ClassicAPI unit casting does not modify the player's selection.
        -- If it declines the cast, do not retry through another method.
        if type(C_Spell) == "table"
        and type(C_Spell.CastAtUnit) == "function" then
            local ok, started = pcall(
                C_Spell.CastAtUnit, "Resurrection", candidate.unit
            )
            if not ok or not started then
                return false, "Unable to cast Resurrection on " .. candidate.name .. "."
            end
            return true, candidate.name
        end

        -- Vanilla fallback. Clear another selected target first so the
        -- client provides a spell-target cursor; restore selection later.
        local previous = UnitExists("target")
        local same = previous and UnitName("target") == candidate.name
        if previous and not same and type(ClearTarget) == "function" then
            ClearTarget()
        end
        local castOK = pcall(CastSpellByName, "Resurrection")
        local targeting = type(SpellIsTargeting) == "function"
            and SpellIsTargeting()
        if castOK and targeting then
            if type(SpellCanTargetUnit) ~= "function"
            or SpellCanTargetUnit(candidate.unit) then
                local ok = pcall(SpellTargetUnit, candidate.unit)
                castOK = ok and not SpellIsTargeting()
            else
                castOK = false
            end
            if not castOK and type(SpellStopTargeting) == "function" then
                SpellStopTargeting()
            end
        elseif not same then
            -- No cursor and the intended target was not selected:
            -- never report an unverified or potentially wrong cast.
            castOK = false
        end
        if previous and not same
        and type(TargetLastTarget) == "function" then
            TargetLastTarget()
        end
        if not castOK then
            return false, "Unable to cast Resurrection on " .. candidate.name .. "."
        end
        return true, candidate.name
    end

    -- Released-player corpse: no resolvable unit token. The player must
    -- click the actual corpse after the spell cursor is activated.
    if UnitExists("target") and type(ClearTarget) == "function" then
        ClearTarget()
    end
    local ok = pcall(CastSpellByName, "Resurrection")
    if not ok or type(SpellIsTargeting) ~= "function"
    or not SpellIsTargeting() then
        return false, "Could not activate manual corpse targeting."
    end
    return true, "Click the released player's corpse in the world."
end

function Assistant.GetSummary()
    if CombatBlocked() then
        return { paused = true, reason = "combat" }
    end
    if not CanConsiderPlayers() then
        return { paused = true, reason = "dead-player" }
    end

    local totalDead, ghosts, incomingCount, eligible = 0, 0, 0, 0
    local unit, data
    for unit, data in pairs(rosterByUnit) do
        if data.dead or data.ghost then
            totalDead = totalDead + 1
            if data.ghost then
                ghosts = ghosts + 1
            elseif data.connected then
                if IsIncoming(unit, data.name) then
                    incomingCount = incomingCount + 1
                elseif CanResurrect(data) then
                    eligible = eligible + 1
                end
            end
        end
    end
    return {
        paused = false,
        dead = totalDead,
        ghosts = ghosts,
        incoming = incomingCount,
        eligible = eligible
    }
end

function Assistant.PrintStatus()
    if not DEFAULT_CHAT_FRAME then
        return
    end
    local head = "|cff66ccffPriest Companion Resurrection:|r "
    local summary = Assistant.GetSummary()
    if summary.paused then
        local reason = summary.reason == "combat"
            and "paused during combat"
            or "unavailable while your character is dead"
        DEFAULT_CHAT_FRAME:AddMessage(head .. reason .. ".")
        return
    end
    DEFAULT_CHAT_FRAME:AddMessage(
        head .. tostring(summary.eligible) .. " eligible, " ..
        tostring(summary.incoming) .. " with incoming resurrection, " ..
        tostring(summary.ghosts) .. " released (manual corpse targeting)."
    )
    local nextUnit = Assistant.GetNextCandidate()
    if nextUnit then
        DEFAULT_CHAT_FRAME:AddMessage(
            head .. "Next: " .. nextUnit.name .. " (" ..
            nextUnit.class .. ", " .. nextUnit.unit .. ")."
        )
    else
        DEFAULT_CHAT_FRAME:AddMessage(head .. "No eligible group target.")
    end
    DEFAULT_CHAT_FRAME:AddMessage(
        head .. "Use the Resurrection button to cast once per click."
    )
end

local function OnAddonMessage(prefix, message, sender)
    if CombatBlocked() or not initialized
    or type(message) ~= "string"
    or type(sender) ~= "string" then
        return
    end
    local caster = CanonicalMemberName(sender)
    if not caster then
        return
    end

    local target
    if prefix == "HealComm" then
        local _, _, captured = string.find(message, "^Resurrection/([^/]+)/start/$")
        target = captured
        if target then
            MarkIncoming(caster, target)
        elseif message == "Resurrection/stop/" then
            StopIncoming(caster)
        end
    elseif prefix == "CTRA" then
        local _, _, captured = string.find(message, "^RES%s+([^%s]+)%s*$")
        target = captured
        if target then
            MarkIncoming(caster, target)
        elseif string.find(message, "^RESNO") then
            StopIncoming(caster)
        end
    end
end

local function IsResurrectionSpell(spellID, spellName)
    local id = tonumber(spellID)
    return id == 2006 or id == 2010 or id == 10880
        or id == 10881 or id == 20770 or id == 25435
        or id == 7328 or id == 10322 or id == 10324
        or id == 20772 or id == 20773
        or id == 2008 or id == 20609 or id == 20610
        or id == 20776 or id == 20777
        or id == 20484 or id == 20739 or id == 20742
        or spellName == "Resurrection"
        or spellName == "Redemption"
        or spellName == "Ancestral Spirit"
        or spellName == "Rebirth"
end

local function OnRemoteResurrectionStart(unit, spellID, spellName)
    if CombatBlocked() or not initialized
    or type(unit) ~= "string" or not rosterByUnit[unit]
    or not IsResurrectionSpell(spellID, spellName) then
        return
    end

    -- Optional ClassicAPI: target names can arrive after START; when nil,
    -- do not guess. HealComm/CTRA remains the main cross-client channel.
    if type(UnitSpellTargetName) ~= "function" then
        return
    end
    local ok, target = pcall(UnitSpellTargetName, unit)
    if ok and target then
        MarkIncoming(rosterByUnit[unit].name, target)
    end
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("PLAYER_REGEN_DISABLED")
events:RegisterEvent("PLAYER_REGEN_ENABLED")
events:RegisterEvent("PARTY_MEMBERS_CHANGED")
events:RegisterEvent("RAID_ROSTER_UPDATE")
events:RegisterEvent("UNIT_HEALTH")
events:RegisterEvent("UNIT_FLAGS")
events:RegisterEvent("PARTY_MEMBER_ENABLE")
events:RegisterEvent("PARTY_MEMBER_DISABLE")
events:RegisterEvent("CHAT_MSG_ADDON")
events:RegisterEvent("PLAYER_ALIVE")
events:RegisterEvent("PLAYER_UNGHOST")

if PC.Capabilities and PC.Capabilities.classicAPISupported then
    pcall(events.RegisterEvent, events, "UNIT_SPELLCAST_START")
    pcall(events.RegisterEvent, events, "UNIT_SPELLCAST_INTERRUPTED")
end

events:SetScript("OnEvent", function()
    if event == "PLAYER_REGEN_DISABLED" then
        inCombat = true
        Notify()
        return
    end

    if event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
        Assistant.RefreshRoster()
        return
    end

    -- No roster reads, death checks, candidate selection or communication
    -- processing during combat. At exit the entire group is rechecked.
    if CombatBlocked() then
        return
    end

    if event == "PLAYER_ENTERING_WORLD"
    or event == "PARTY_MEMBERS_CHANGED"
    or event == "RAID_ROSTER_UPDATE"
    or event == "PLAYER_ALIVE"
    or event == "PLAYER_UNGHOST" then
        Assistant.RefreshRoster()
    elseif event == "PARTY_MEMBER_ENABLE"
    or event == "PARTY_MEMBER_DISABLE" then
        Assistant.RefreshRoster()
    elseif event == "UNIT_HEALTH" or event == "UNIT_FLAGS" then
        if arg1 and rosterByUnit[arg1] then
            UpdateUnit(arg1)
        end
    elseif event == "CHAT_MSG_ADDON" then
        OnAddonMessage(arg1, arg2, arg4)
    elseif event == "UNIT_SPELLCAST_START" then
        if arg1 ~= "player" then
            OnRemoteResurrectionStart(arg1, arg3, arg4)
        end
    elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
        if arg1 ~= "player"
        and rosterByUnit[arg1]
        and IsResurrectionSpell(arg3, arg4) then
            StopIncoming(rosterByUnit[arg1].name)
        end
    end
end)
