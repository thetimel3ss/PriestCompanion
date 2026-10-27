-- Opt-in consumable selection, shared by the manual button and spell hooks.
local PC = PriestCompanion
local M = {}
PC.Modules.AutoMana = M
local settings = { enabled = false, automatic = false, trigger = "missing",
    combatOnly = true, minGroup = 1,
    tea = false, potion = false, rejuvenation = false, flask = false,
    continueSpell = false, locked = false, x = 0, y = -180 }
local frame = CreateFrame("Frame")
local loaded, installed, busy = false, false, false
local lastAttempt = -100
local listeners, pending, serial = {}, nil, 0
local tooltip
local function UpdateSubscriptions()
    frame:UnregisterAllEvents()
    if not loaded then frame:RegisterEvent("VARIABLES_LOADED"); return end
    if not settings.enabled then return end
    local events = { "BAG_UPDATE", "UNIT_MANA", "UNIT_MAXMANA", "UNIT_INVENTORY_CHANGED",
        "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED", "PARTY_MEMBERS_CHANGED",
        "RAID_ROSTER_UPDATE", "PLAYER_DEAD", "PLAYER_ALIVE", "PLAYER_UNGHOST",
        "PLAYER_TARGET_CHANGED", "PLAYER_LEAVING_WORLD", "PLAYER_ENTERING_WORLD" }
    for _, name in ipairs(events) do frame:RegisterEvent(name) end
end
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
-- Priority is shared by the HUD, manual click and automatic use. Prefer live
-- item tooltip ranges; these base ranges are estimates if unavailable.
local items = {
    { id = 61675, option = "tea", name = "Nordanaar Herbal Tea", low = 810, high = 1351 },
    { id = 15723, option = "tea", name = "Tea with Sugar", low = 1050, high = 1751 },
    { id = 18253, option = "rejuvenation", name = "Major Rejuvenation Potion", low = 1440, high = 1760 },
    { id = 13444, option = "potion", name = "Major Mana Potion", low = 1350, high = 2250 },
    -- Flask refill behavior is server-specific, not its maximum-mana buff.
    { id = 13511, option = "flask", name = "Flask of Distilled Wisdom", flask = true }
}
local itemByID = {}
for _, item in ipairs(items) do itemByID[item.id] = item end
local inventory, inventoryDirty, itemTooltip = {}, true, nil
local function ItemID(link)
    local _, _, raw = string.find(link or "", "item:(%d+)")
    return tonumber(raw)
end
local function Recovery(bag, slot, spec)
    if spec.flask then
        local gain = math.max(0, 2000 - UnitMana("player"))
        return gain, gain, false
    end
    if not itemTooltip then
        itemTooltip = CreateFrame("GameTooltip", "PriestCompanionAutoManaItemTooltip", UIParent, "GameTooltipTemplate")
        itemTooltip:SetOwner(UIParent, "ANCHOR_NONE")
    end
    itemTooltip:ClearLines()
    itemTooltip:SetBagItem(bag, slot)
    local low, high
    for i = 1, itemTooltip:NumLines() do
        local line = getglobal("PriestCompanionAutoManaItemTooltipTextLeft" .. i)
        local text = line and line:GetText()
        if text then
            text = string.lower(text)
            local manaAt = string.find(text, string.lower(MANA or "Mana"), 1, true)
            -- Do not confuse max-mana buffs or food's regeneration with an
            -- instant refill. Unsupported/localized wording uses marked estimates.
            if manaAt and string.find(text, "restor", 1, true)
                and not string.find(text, "over ", 1, true) then
                local before = string.sub(text, 1, manaAt - 1)
                local cursor = 1
                while true do
                    local first, last, a, b = string.find(before, "(%d[%d,]*)%s+to%s+(%d[%d,]*)", cursor)
                    if not first then break end
                    low = tonumber((string.gsub(a, ",", "")))
                    high = tonumber((string.gsub(b, ",", "")))
                    cursor = last + 1
                end
                -- A fixed mana amount may follow a separate health range.
                if low and string.find(string.sub(before, cursor), "%d") then low, high = nil, nil end
                if not low then
                    local _, _, amount = string.find(before, "(%d[%d,]*)%s*$")
                    low = amount and tonumber((string.gsub(amount, ",", "")))
                    high = low
                end
                if low and high then break end
            end
        end
    end
    itemTooltip:Hide()
    if low and high and low > 0 and high >= low then return low, high, true end
    return spec.low, spec.high, false
end
local function ScanInventory()
    inventory = {}
    inventoryDirty = false
    if not GetContainerNumSlots or not GetContainerItemLink then return end
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local id = ItemID(GetContainerItemLink(bag, slot))
            local spec = itemByID[id]
            if spec then
                local ok, low, high, live = pcall(Recovery, bag, slot, spec)
                if not ok then low, high, live = spec.low, spec.high, false end
                local entry = { id = id, bag = bag, slot = slot, low = low, high = high, live = live }
                inventory[id] = inventory[id] or {}
                table.insert(inventory[id], entry)
            end
        end
    end
end
local function Allowed()
    if not loaded or not settings.enabled or busy then return false, "Disabled" end
    if UnitIsDeadOrGhost("player") or UnitOnTaxi("player") then return false, "Unavailable" end
    if UnitPowerType("player") ~= 0 then return false, "No mana bar" end
    if settings.combatOnly and not UnitAffectingCombat("player") then return false, "Out of combat" end
    local raid = GetNumRaidMembers()
    local size = raid > 0 and raid or (GetNumPartyMembers() + 1)
    if size < settings.minGroup then return false, "Group too small" end
    return true
end
function M.GetNextConsumable(context, manual)
    local allowed, reason = Allowed()
    if not allowed then return nil, reason end
    local now = GetTime()
    if now - lastAttempt < 1.5 then return nil, "Waiting" end
    if not manual then
        if not settings.automatic or not context then return nil, "Manual only" end
        if settings.trigger == "insufficient" and M.NeedsMana(context) ~= true then
            return nil, "Spell has enough mana or unknown cost"
        end
    end
    if not GetContainerItemInfo or not GetContainerItemCooldown then return nil, "Inventory unavailable" end
    local mana, maximum = UnitMana("player"), UnitManaMax("player")
    local missing = maximum - mana
    if missing <= 0 then return nil, "Full mana" end
    -- A moved/deleted item invalidates the cache even if its BAG_UPDATE has
    -- not reached us yet. Rebuild once before making a selection.
    if not inventoryDirty then
        for _, entries in pairs(inventory) do
            for _, entry in ipairs(entries) do
                if ItemID(GetContainerItemLink(entry.bag, entry.slot)) ~= entry.id then inventoryDirty = true end
            end
        end
    end
    if inventoryDirty then ScanInventory() end
    for _, spec in ipairs(items) do
        if settings[spec.option] then
            for _, entry in ipairs(inventory[spec.id] or {}) do
                local low, high = entry.low, entry.high
                if spec.flask then low = math.max(0, 2000 - mana); high = low end
                local fits = manual or settings.trigger == "insufficient"
                    or (high and missing >= math.min(high, maximum))
                if (not spec.flask or mana < 2000) and fits and low and high then
                    local icon, count, locked = GetContainerItemInfo(entry.bag, entry.slot)
                    local start, duration, usable = GetContainerItemCooldown(entry.bag, entry.slot)
                    if count and count > 0 and not Truth(locked) and usable == 1
                        and start and duration and (start == 0 or now >= start + duration) then
                        local link = GetContainerItemLink(entry.bag, entry.slot)
                        local _, _, name = string.find(link or "", "%[(.-)%]")
                        return { id = entry.id, bag = entry.bag, slot = entry.slot,
                            icon = icon, name = name or spec.name, low = low, high = high,
                            gainLow = math.min(low, missing), gainHigh = math.min(high, missing),
                            live = entry.live, flask = spec.flask }
                    end
                end
            end
        end
    end
    return nil, "No ready item"
end
function M.TryConsume(context, manual)
    local item = M.GetNextConsumable(context, manual)
    if not item or not UseContainerItem then return false end
    -- Vanilla returns no success acknowledgement; throttle attempts, not
    -- claimed successful uses. Selection is re-evaluated at every click/cast.
    lastAttempt = GetTime()
    inventoryDirty = true
    busy = true
    local ok = pcall(UseContainerItem, item.bag, item.slot)
    busy = false
    Notify()
    return ok
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
    elseif key == "minGroup" then
        value = tonumber(value)
        if value ~= 1 and value ~= 5 and value ~= 10 and value ~= 20 then return end
    elseif key == "x" or key == "y" then
        value = tonumber(value)
        if not value or value ~= value or math.abs(value) > 10000 then return end
    else value = value and true or false end
    settings[key] = value
    if key == "enabled" then inventoryDirty = true end
    Save()
    UpdateSubscriptions()
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
        -- Migrate legacy arbitrary sizes to the next offered threshold.
        local size = settings.minGroup
        settings.minGroup = size <= 1 and 1 or (size <= 5 and 5 or (size <= 10 and 10 or 20))
        loaded = true
        CancelPending(); Save(); UpdateSubscriptions()
        if settings.enabled and settings.automatic then InstallHooks() end
        Notify()
    elseif event == "UNIT_MANA" or event == "UNIT_MAXMANA" then
        if arg1 == "player" then CheckPending(); Notify() end
    elseif event == "BAG_UPDATE" or event == "UNIT_INVENTORY_CHANGED" then
        if event == "BAG_UPDATE" or arg1 == "player" then inventoryDirty = true; Notify() end
    else
        if event == "PLAYER_DEAD" or event == "PLAYER_TARGET_CHANGED"
            or event == "PLAYER_LEAVING_WORLD" then CancelPending() end
        if event == "PLAYER_ENTERING_WORLD" then inventoryDirty = true end
        Notify()
    end
end)
