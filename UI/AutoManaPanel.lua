local PC = PriestCompanion
local M = PC.Modules.AutoMana
local scroll, child = PC.UI.AutoManaOptionsPanel, PC.UI.ToolsAutoManaContent
if not M or not scroll or not child then return end
local function ShowTip(owner, title, details)
    if not GameTooltip then return end
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:SetText(title, 1, 0.82, 0.20)
    GameTooltip:AddLine(details, 1, 1, 1, true)
    GameTooltip:Show()
end
local function HideTip() if GameTooltip then GameTooltip:Hide() end end
local function Tip(control, title, details)
    control:SetScript("OnEnter", function() ShowTip(this, title, details) end)
    control:SetScript("OnLeave", HideTip)
end
local function Label(text, y, font)
    local label = child:CreateFontString(nil, "OVERLAY", font or "GameFontHighlightSmall")
    label:SetPoint("TOPLEFT", child, "TOPLEFT", 14, -y)
    label:SetWidth(355)
    label:SetJustifyH("LEFT")
    label:SetText(text)
    return label
end
local controls = {}
local function Check(key, text, y, details, value)
    local check = CreateFrame("CheckButton", "PriestCompanionAutoMana" .. key .. tostring(value or ""), child, "UICheckButtonTemplate")
    check:SetWidth(24); check:SetHeight(24)
    check:SetPoint("TOPLEFT", child, "TOPLEFT", 14, -y)
    local caption = child:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    caption:SetPoint("LEFT", check, "RIGHT", 4, 0)
    caption:SetText(text)
    check.optionCaption = caption
    local function Toggle()
        if value then M.SetOption(key, value)
        else M.SetOption(key, not M.GetOption(key)) end
    end
    check:SetScript("OnClick", Toggle)
    local hit = CreateFrame("Button", nil, child)
    hit:SetPoint("LEFT", check, "RIGHT", 4, 0)
    hit:SetWidth(310); hit:SetHeight(23)
    hit:SetScript("OnClick", Toggle)
    check.optionHitBox = hit
    Tip(check, text, details)
    Tip(hit, text, details)
    table.insert(controls, { check = check, key = key, value = value })
    return check
end
Label("Auto Mana", 12, "GameFontNormal")
Label("Hover an option for details. Click the floating item window for manual use.", 38)
local enable = Check("enabled", "Enable", 73,
    "Shows the movable consumable window and enables manual use. Automatic use is a separate option. Disable hides the window, stops inventory and mana monitoring, and cancels any pending spell continuation. Settings are saved per character.")
Check("automatic", "Use automatically when requesting a spell", 105,
    "Checks for a consumable when you press a spell. It does not consume merely because mana drops while you are idle. The floating window remains available for manual clicks. Select an automatic trigger below. An item attempt replaces that spell activation unless Nampower continuation is enabled.")
Label("Automatic trigger (choose one)", 146, "GameFontNormal")
local missing = Check("trigger", "Use when enough mana is missing", 168,
    "Calculates maximum mana minus current mana and compares it with each item's maximum estimated restoration. The first permitted, ready item that fits is chosen. For example, a 1,350-2,250 mana potion waits until at least 2,250 mana is missing. No manual threshold is needed. Tooltip values are preferred; unavailable values use marked base estimates. Gear and server effects may change the actual gain.", "missing")
local insufficient = Check("trigger", "Only if mana is insufficient for the spell", 200,
    "Checks the actual requested spell and rank with current usability or mana cost. A consumable can be used before mana reaches zero. This emergency mode ignores the full-restoration requirement: it tries the first permitted, ready mana item, even if some restoration will be wasted. Unknown spell costs are skipped.", "insufficient")
Check("combatOnly", "Only in combat (manual and automatic)", 244,
    "Restricts both automatic consumption and clicks on the floating window to combat. Turn off to allow out-of-combat use. This does not automatically consume anything on entering combat.")
local groupLabel = Label("Minimum group size: 1 (Solo)", 290)
local group = CreateFrame("Slider", "PriestCompanionAutoManaGroupSize", child, "OptionsSliderTemplate")
group:SetWidth(220); group:SetHeight(17)
group:SetPoint("TOPLEFT", child, "TOPLEFT", 25, -318)
group:SetMinMaxValues(1, 4)
group:SetValueStep(1)
local levels = {1, 5, 10, 20}
local syncingGroup = false
for _, suffix in ipairs({"Low", "High", "Text"}) do
    local label = getglobal("PriestCompanionAutoManaGroupSize" .. suffix)
    if label then label:SetText("") end
end
for i = 1, 4 do
    local label = child:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    label:SetPoint("TOP", group, "TOPLEFT", (i - 1) * 220 / 3, -20)
    label:SetText(tostring(levels[i]))
end
local groupHelp = "Choose 1, 5, 10 or 20 using the slider or mouse wheel. This is a minimum player count, including you: 1 allows solo play, 5 requires at least five players, and 10 or 20 requires that many raid members. Applies to manual and automatic use; it is not an instance-size filter."
Tip(group, "Minimum group size", groupHelp)
local groupHit = CreateFrame("Frame", nil, child)
groupHit:SetPoint("TOPLEFT", child, "TOPLEFT", 14, -281)
groupHit:SetWidth(355); groupHit:SetHeight(27); groupHit:EnableMouse(true)
Tip(groupHit, "Minimum group size", groupHelp)
group:SetScript("OnValueChanged", function()
    if syncingGroup then return end
    local index = math.max(1, math.min(4, math.floor(this:GetValue() + 0.5)))
    if M.GetOption("minGroup") ~= levels[index] then M.SetOption("minGroup", levels[index]) end
end)
group:EnableMouseWheel(true)
group:SetScript("OnMouseWheel", function()
    if not M.GetOption("enabled") then return end
    local index = math.max(1, math.min(4, math.floor(group:GetValue() + 0.5) + (arg1 > 0 and 1 or -1)))
    M.SetOption("minGroup", levels[index])
end)
Label("Consumables to use (priority order)", 374, "GameFontNormal")
Label("Tea > Rejuvenation > Mana Potion > Flask. Unavailable items are skipped.", 400)
Check("tea", "1. Tea", 438,
    "Permits Nordanaar Herbal Tea, then Tea with Sugar. Tea is tried before the other selected items. If absent, locked, cooling down or unsuitable for the automatic mana trigger, the next permitted item is considered. The client tooltip supplies the restoration estimate when readable.")
Check("rejuvenation", "2. Major Rejuvenation Potion", 470,
    "Permits this health-and-mana potion after Tea and before Major Mana Potion. In missing-mana mode its mana restoration determines eligibility; it does not require low health. Its potion cooldown can also prevent Major Mana Potion from being used. Only the mana gain is shown on the floating window.")
Check("potion", "3. Major Mana Potion", 502,
    "Permits Major Mana Potion after Tea and Rejuvenation. Selecting Tea and Major Mana allows fallback to the potion if Tea is unavailable, provided the potion itself is ready and satisfies the selected automatic trigger. In missing-mana mode, Tea's smaller restoration does not set the potion's threshold.")
Check("flask", "4. Flask of Distilled Wisdom", 534,
    "Explicitly permits this expensive last-resort item after the other choices. It is considered only below 2,000 current mana. Its emergency refill behavior is server-specific; the displayed gain estimates a refill to 2,000, not the maximum-mana buff. Verify this behavior on your server before enabling it.")
local continuation = Check("continueSpell", "Resume spell after mana returns (Nampower)", 584,
    "Experimental. After an automatic item attempt, watches for enough mana and submits the original spell request through Nampower's queue as soon as possible. Three seconds is a timeout, NOT a fixed delay. Execution still follows the queue and GCD. A new action, target change, stop cast, timeout or disable cancels the request. Requires QueueScript and a stable resolved target GUID. Without this option, press the spell again. Manual item clicks do not queue a spell.")
Label("Three seconds is the maximum wait for mana, not a delay before queuing.", 622)
Check("locked", "Lock consumable window position", 666,
    "Locks the floating item window in place while keeping it clickable. When unlocked, drag the window to move it. Dragging never uses a consumable. Its position is saved per character.")
Label("The window shows the next manual item and estimated mana gain. Manual clicks ignore the automatic trigger, but respect combat/group rules and item cooldowns.", 710)

-- Match the framed compact HUDs used by Resurrection and Book of Prayer.
local button = CreateFrame("Button", "PriestCompanionAutoManaButton", UIParent)
PC.UI.AutoManaButton = button
button:SetWidth(108); button:SetHeight(116)
button:SetFrameStrata("MEDIUM")
button:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true,
    tileSize = 16, edgeSize = 13, insets = {left = 4, right = 4, top = 4, bottom = 4} })
button:SetBackdropColor(0.04, 0.04, 0.09, 0.95)
button:SetMovable(true); button:EnableMouse(true)
button:SetClampedToScreen(true); button:RegisterForDrag("LeftButton")
button:RegisterForClicks("LeftButtonUp")
button:Hide()
local title = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
title:SetPoint("TOP", button, "TOP", 0, -10)
title:SetText("Auto Mana")
local icon = button:CreateTexture(nil, "ARTWORK")
icon:SetWidth(36); icon:SetHeight(36)
icon:SetPoint("TOP", button, "TOP", 0, -30)
icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
local amount = button:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
amount:SetPoint("TOP", icon, "BOTTOM", 0, -6)
amount:SetWidth(96)
local status = button:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
status:SetPoint("BOTTOM", button, "BOTTOM", 0, 11)
status:SetWidth(96)
local moving, suppressClick, shownItem = false, false, nil
local function GainText(item)
    if item.gainLow == item.gainHigh then return tostring(item.gainLow) end
    return item.gainLow .. "-" .. item.gainHigh
end
local function HUDTip()
    local details = "No eligible mana item. Check permitted items, cooldowns, current mana, combat and group size."
    if shownItem then
        details = "Left-click: use " .. shownItem.name .. ". Estimated gain: " ..
            GainText(shownItem) .. " mana, capped by missing mana. " ..
            (shownItem.live and "Based on the current item tooltip. " or "Based on a fallback/server-specific estimate. ") ..
            "Actual rolls, gear and server effects may differ. Manual clicks ignore the automatic trigger."
    end
    details = details .. " Drag to move when unlocked."
    ShowTip(button, "Auto Mana", details)
end
button:SetScript("OnEnter", HUDTip)
button:SetScript("OnLeave", HideTip)
button:SetScript("OnClick", function()
    if suppressClick then suppressClick = false; return end
    M.UseManual()
end)
button:SetScript("OnMouseDown", function() suppressClick = false end)
button:SetScript("OnDragStart", function()
    suppressClick = true
    if not M.GetOption("locked") then moving = true; button:StartMoving() end
end)
local function StopMoving()
    if not moving then return end
    moving = false; button:StopMovingOrSizing()
    local x,y = button:GetCenter()
    local cx,cy = UIParent:GetCenter()
    if x and y and cx and cy then M.SetOption("x", x-cx); M.SetOption("y", y-cy) end
end
button:SetScript("OnDragStop", StopMoving)
button:SetScript("OnHide", function()
    StopMoving()
    if GameTooltip and GameTooltip:IsOwned(button) then HideTip() end
end)
local function RenderHUD()
    if not M.GetOption("enabled") then return end
    local item, reason = M.GetNextConsumable(nil, true)
    shownItem = item
    icon:SetTexture(item and item.icon or "Interface\\Icons\\INV_Misc_QuestionMark")
    icon:SetAlpha(item and 1 or 0.35)
    amount:SetText(item and ("~" .. GainText(item) .. " mana") or "-- mana")
    amount:SetTextColor(item and 0.45 or 0.55, item and 0.75 or 0.55, item and 1 or 0.55)
    status:SetText(item and "Manual ready" or reason)
    button:SetBackdropBorderColor(item and 0.4 or 0.55, item and 0.65 or 0.55, item and 1 or 0.67, 1)
end
local elapsed = 0
local function Tick()
    elapsed = elapsed + (arg1 or 0)
    if elapsed >= 0.25 then elapsed = 0; RenderHUD() end
end
local function Gate(control, allowed)
    if allowed then control:Enable() else control:Disable() end
    if control.optionHitBox then
        if allowed then control.optionHitBox:Enable() else control.optionHitBox:Disable() end
    end
    control:SetAlpha(allowed and 1 or 0.5)
    if control.optionCaption then control.optionCaption:SetAlpha(allowed and 1 or 0.5) end
end
local function RefreshOptions()
    local enabled = M.GetOption("enabled")
    for _, control in ipairs(controls) do
        local selected = control.value and M.GetOption(control.key) == control.value
            or (not control.value and M.GetOption(control.key))
        control.check:SetChecked(selected and 1 or nil)
    end
    syncingGroup = true
    for i = 1, 4 do if levels[i] == M.GetOption("minGroup") then group:SetValue(i) end end
    syncingGroup = false
    groupLabel:SetText("Minimum group size: " .. M.GetOption("minGroup") .. (M.GetOption("minGroup") == 1 and " (Solo)" or ""))
    PC.UI.SetModuleOptionsEnabled(child, enable, enabled)
    local automatic = enabled and M.GetOption("automatic")
    Gate(missing, automatic); Gate(insufficient, automatic)
    Gate(continuation, automatic and M.CanContinue())
end
local function Refresh()
    RefreshOptions()
    local enabled = M.GetOption("enabled")
    if M.GetOption("locked") and moving then StopMoving() end
    if not moving then
        button:ClearAllPoints()
        button:SetPoint("CENTER", UIParent, "CENTER", M.GetOption("x"), M.GetOption("y"))
    end
    if enabled then
        button:Show()
        button:SetScript("OnUpdate", Tick)
        RenderHUD()
    else
        button:SetScript("OnUpdate", nil)
        button:Hide()
        shownItem = nil
    end
end
scroll.Refresh = RefreshOptions
scroll:SetScript("OnShow", RefreshOptions)
M.AddListener(Refresh)
Refresh()
