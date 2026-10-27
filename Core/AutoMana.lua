-- Opt-in consumable selection, shared by the manual button and spell hooks.
local PC = PriestCompanion
local M = {}
PC.Modules.AutoMana = M
local settings = { enabled = false, automatic = false, trigger = "missing",
    missingMana = 1350, combatOnly = true, minGroup = 1,
    tea = false, potion = false, rejuvenation = false, flask = false,
    continueSpell = false, locked = false, x = 0, y = -180 }
local frame = CreateFrame("Frame")
local loaded, installed, busy = false, false, false
local lastAttempt = -100
local listeners, pending, serial = {}, nil, 0
local tooltip
local function Notify()
    for _, fn in ipairs(listeners) do fn() end
end
function M.AddListener(fn) table.insert(listeners, fn) end
function M.GetOption(key) return settings[key] end
function M.CanContinue()
    return type(QueueScript) == "function"
        and (type(GetUnitGUID) == "function" or type(UnitGUID) == "function")
end
local function Save()
    if loaded then PriestCompanionCharDB.autoMana = settings end
end
local function CancelPending()
    pending = nil
    frame:UnregisterAllEvents()
    if not loaded then frame:RegisterEvent("VARIABLES_LOADED") end
    frame:SetScript("OnUpdate", nil)
end
local function Truth(value) return value == true or value == 1 end
local function FullName(slot)
    local name, rank = GetSpellName(slot, BOOKTYPE_SPELL or "spell")
    if not name then return end
    if rank and rank ~= "" then return name .. "(" .. rank .. ")" end
    return name
end
local function FindSpell(name)
    if type(name) ~= "string" or not GetSpellName then return end
    local found, index = nil, 1
    while true do
        local base = GetSpellName(index, BOOKTYPE_SPELL or "spell")
        if not base then return found end
        if FullName(index) == name then return index end
        if base == name then found = index end -- highest learned rank
        index = index + 1
    end
end
local function TooltipMana(context)
    -- Read the current tooltip, including runtime cost modifiers. Never cache
    -- costs from DBC: talents, auras and the selected rank can change them.
    if not tooltip then
        tooltip = CreateFrame("GameTooltip", "PriestCompanionAutoManaTooltip", UIParent, "GameTooltipTemplate")
        tooltip:SetOwner(UIParent, "ANCHOR_NONE")
    end
    tooltip:ClearLines()
    if context.action then tooltip:SetAction(context.action)
    elseif context.slot then tooltip:SetSpell(context.slot, BOOKTYPE_SPELL or "spell")
    else return end
    local cost
    local label = MANA or "Mana"
    for i = 1, tooltip:NumLines() do
        local line = getglobal("PriestCompanionAutoManaTooltipTextLeft" .. i)
        local text = line and line:GetText()
        if text then
            -- Match only the whole localized mana-cost line; unknown formats
            -- skip the automatic attempt instead of treating them as OOM.
            local _, _, digits, resource = string.find(text, "^([%d%., ]+) (.+)$")
            if resource == label and digits then
                cost = tonumber((string.gsub(digits, "[%., ]", "")))
                break
            end
        end
    end
    tooltip:Hide()
    return cost
end
function M.NeedsMana(context)
    if not context then return nil end
    if context.action and type(IsUsableAction) == "function" then
        local ok, _, noMana = pcall(IsUsableAction, context.action)
        if ok and noMana ~= nil then return Truth(noMana) end
        -- Native Vanilla uses nil for false, but some providers omit the flag.
        if ok and not IsSpellUsable and not IsUsableSpell then return false end
    end
    local query = context.name
    if query then
        local provider = IsSpellUsable or IsUsableSpell
        if type(provider) == "function" then
            local ok, usable, noMana = pcall(provider, query)
            if ok and (usable ~= nil or noMana ~= nil) then return Truth(noMana) end
        end
    end
    if context.slot or context.action then
        local ok, cost = pcall(TooltipMana, context)
        if ok and cost then return UnitMana("player") < cost end
    end
    return nil
end
local function Allowed()
    if not loaded or not settings.enabled or busy then return false end
    if UnitIsDeadOrGhost("player") or UnitOnTaxi("player") then return false end
    if UnitPowerType("player") ~= 0 then return false end
    if settings.combatOnly and not UnitAffectingCombat("player") then return false end
    local raid = GetNumRaidMembers()
    local size = raid > 0 and raid or (GetNumPartyMembers() + 1)
    return size >= settings.minGroup
end
function M.TryConsume(context, manual)
    if not Allowed() then return false end
    local now = GetTime()
    if now - lastAttempt < 1.5 then return false end
    if not manual then
        if not settings.automatic or not context then return false end
        if settings.trigger == "insufficient" then
            if M.NeedsMana(context) ~= true then return false end
        elseif UnitManaMax("player") - UnitMana("player") < settings.missingMana then
            return false
        end
    end
    if not GetContainerNumSlots or not GetContainerItemLink
        or not GetContainerItemInfo or not GetContainerItemCooldown
        or not UseContainerItem then return false end
    local missing = UnitManaMax("player") - UnitMana("player")
    if missing <= 0 then return false end
    -- Explicit whitelist. Healthstones are not a source of mana.
    local candidates = {
        { enabled = settings.tea, ids = {61675, 15723} },
        { enabled = settings.rejuvenation, ids = {18253} },
        { enabled = settings.potion, ids = {13444} },
        { enabled = settings.flask and UnitMana("player") < 2000, ids = {13511} }
    }
    for _, candidate in ipairs(candidates) do
        if candidate.enabled then
            for _, wanted in ipairs(candidate.ids) do
                for bag = 0, 4 do
                    for slot = 1, GetContainerNumSlots(bag) do
                        local link = GetContainerItemLink(bag, slot)
                        local _, _, raw = string.find(link or "", "item:(%d+)")
                        if tonumber(raw) == wanted then
                            local _, count, locked = GetContainerItemInfo(bag, slot)
                            local start, duration, usable = GetContainerItemCooldown(bag, slot)
                            if count and count > 0 and not Truth(locked) and usable == 1
                                and start and duration and (start == 0 or now >= start + duration) then
                                -- Vanilla returns no success acknowledgement; throttle attempts.
                                lastAttempt = now
                                busy = true
                                local ok = pcall(UseContainerItem, bag, slot)
                                busy = false
                                return ok
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end
function M.UseManual()
    CancelPending()
    local used = M.TryConsume(nil, true)
    if not used and DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage("Priest Companion: no eligible mana consumable (check Enable, combat/group rules, mana, selected items and cooldowns).")
    end
    return used
end
local function TargetKey(unit)
    local provider = GetUnitGUID or UnitGUID
    if type(provider) ~= "function" then return end
    local ok, guid = pcall(provider, unit)
    if ok and guid and guid ~= "0x0000000000000000" then return tostring(guid) end
end
local function TargetUnchanged(p)
    if p.target ~= TargetKey(p.unit) then return false end
    if p.context.action and p.context.actionID and type(GetActionInfo) == "function" then
        local kind, id = GetActionInfo(p.context.action)
        if kind ~= "spell" or id ~= p.context.actionID then return false end
    end
    if p.context.slot and FullName(p.context.slot) ~= p.context.name then return false end
    return true
end
function M.RunQueued(token)
    local p = pending
    if not p or p.token ~= token then return end
    local allowed = settings.enabled and settings.automatic and settings.continueSpell
        and GetTime() <= p.expires and TargetUnchanged(p)
        and not UnitIsDeadOrGhost("player") and M.NeedsMana(p.context) == false
    CancelPending()
    if allowed then
        busy = true
        local ok, err = pcall(p.cast)
        busy = false
        if not ok and geterrorhandler then geterrorhandler()(err) end
    end
end
local function CheckPending()
    local p = pending
    if not p then return end
    if GetTime() > p.expires or not TargetUnchanged(p) then CancelPending(); return end
    if not p.queued and M.NeedsMana(p.context) == false then
        p.queued = true
        local ok = pcall(QueueScript,
            "PriestCompanion.Modules.AutoMana.RunQueued(" .. p.token .. ")", 3)
        if not ok then CancelPending() end
    end
end
local function AwaitMana(context, cast, unit)
    if not settings.continueSpell or not M.CanContinue() then return end
    -- No blind replay on a new target; unstable mouseover/target changes cancel.
    unit = (unit == 1 or unit == true) and "player" or (type(unit) == "string" and unit or "target")
    local target = TargetKey(unit)
    if not target then return end
    serial = serial + 1
    pending = { token = serial, context = context, cast = cast,
        expires = GetTime() + 3, unit = unit, target = target }
    frame:RegisterEvent("UNIT_MANA")
    frame:RegisterEvent("PLAYER_DEAD")
    frame:RegisterEvent("PLAYER_TARGET_CHANGED")
    frame:RegisterEvent("PLAYER_LEAVING_WORLD")
    local elapsed = 0
    frame:SetScript("OnUpdate", function()
        elapsed = elapsed + (arg1 or 0)
        if elapsed >= 0.1 then elapsed = 0; CheckPending() end
    end)
    CheckPending()
end
local function Intercept(context, cast, unit)
    if busy then return false end
    CancelPending() -- a newer player action always replaces our pending request
    if M.TryConsume(context, false) then
        AwaitMana(context, cast, unit)
        return true
    end
    return false
end
local function ActionContext(slot)
    -- Exact identity only. Macros are handled at their actual spell invocation.
    if type(GetActionInfo) ~= "function" then
        -- Vanilla fallback: tooltip spell name plus native action usability.
        -- Never infer a spell from an icon, or replace macros/items/attacks.
        if (GetActionText and GetActionText(slot)) or (IsAttackAction and IsAttackAction(slot)) then return end
        pcall(TooltipMana, { action = slot })
        local line = getglobal("PriestCompanionAutoManaTooltipTextLeft1")
        local name = line and line:GetText()
        if name and FindSpell(name) then return { action = slot, name = name } end
        return
    end
    local kind, id = GetActionInfo(slot)
    if kind ~= "spell" then return end
    local name, rank
    if type(GetSpellNameAndRankForId) == "function" then
        name, rank = GetSpellNameAndRankForId(id)
    elseif type(GetSpellInfo) == "function" then name, rank = GetSpellInfo(id) end
    if name and rank and rank ~= "" then name = name .. "(" .. rank .. ")" end
    return { action = slot, name = name, actionID = id }
end
local function InstallHooks()
    if installed then return end
    installed = true
    -- Delegate to earlier hooks (including Fear Ward protection). Later addon
    -- hooks remain intact on disable: these wrappers become inert forwarding.
    local byName, bySlot, action, stop = CastSpellByName, CastSpell, UseAction, SpellStopCasting
    if type(byName) == "function" then
        CastSpellByName = function(a,b,c,d,e,f,g,h,i,j)
            if settings.enabled and settings.automatic and not busy then
                local slot = FindSpell(a)
                local context = slot and { name = FullName(slot), slot = slot }
                if Intercept(context, function() byName(a,b,c,d,e,f,g,h,i,j) end, b) then return end
            end
            return byName(a,b,c,d,e,f,g,h,i,j)
        end
    end
    if type(bySlot) == "function" then
        CastSpell = function(a,b,c,d,e,f,g,h,i,j)
            if settings.enabled and settings.automatic and not busy then
                local context
                if b ~= "pet" and type(a) == "number" and a > 0 then
                    local name = FullName(a)
                    if name then context = { name = name, slot = a } end
                end
                if Intercept(context, function() bySlot(a,b,c,d,e,f,g,h,i,j) end, c) then return end
            end
            return bySlot(a,b,c,d,e,f,g,h,i,j)
        end
    end
    if type(action) == "function" then
        UseAction = function(a,b,c,d,e,f,g,h,i,j)
            if settings.enabled and settings.automatic and not busy then
                if Intercept(ActionContext(a), function() action(a,b,c,d,e,f,g,h,i,j) end, c) then return end
            end
            return action(a,b,c,d,e,f,g,h,i,j)
        end
    end
    if type(stop) == "function" then
        SpellStopCasting = function(a,b,c)
            if pending then CancelPending() end
            return stop(a,b,c)
        end
    end
end
function M.SetOption(key, value)
    if settings[key] == nil then return end
    CancelPending()
    if key == "trigger" then
        if value ~= "missing" and value ~= "insufficient" then return end
    elseif key == "missingMana" or key == "minGroup" then
        value = tonumber(value)
        if not value or value ~= value then return end
        value = math.floor(math.max(1, math.min(key == "minGroup" and 40 or 100000, value)))
    elseif key == "x" or key == "y" then
        value = tonumber(value)
        if not value or value ~= value or math.abs(value) > 10000 then return end
    else value = value and true or false end
    settings[key] = value
    Save()
    if loaded and settings.enabled and settings.automatic then InstallHooks() end
    Notify()
end
frame:RegisterEvent("VARIABLES_LOADED")
frame:SetScript("OnEvent", function()
    if event == "VARIABLES_LOADED" then
        PriestCompanionCharDB = PriestCompanionCharDB or {}
        local saved = PriestCompanionCharDB.autoMana
        if type(saved) == "table" then
            for key, default in pairs(settings) do
                if type(saved[key]) == type(default) then
                    if type(default) ~= "number" or (saved[key] == saved[key] and math.abs(saved[key]) <= 100000) then
                        settings[key] = saved[key]
                    end
                end
            end
        end
        if settings.trigger ~= "insufficient" then settings.trigger = "missing" end
        settings.minGroup = math.max(1, math.min(40, math.floor(settings.minGroup)))
        settings.missingMana = math.max(1, math.floor(settings.missingMana))
        loaded = true
        CancelPending(); Save()
        if settings.enabled and settings.automatic then InstallHooks() end
        Notify()
    elseif event == "UNIT_MANA" and arg1 == "player" then CheckPending()
    elseif event ~= "UNIT_MANA" then CancelPending() end
end)
