local PC = PriestCompanion
local M = PC.Modules.AutoMana
local scroll, child = PC.UI.AutoManaOptionsPanel, PC.UI.ToolsAutoManaContent
if not M or not scroll or not child then return end
local function Label(text, y, font)
    local label = child:CreateFontString(nil, "OVERLAY", font or "GameFontHighlightSmall")
    label:SetPoint("TOPLEFT", child, "TOPLEFT", 14, -y)
    label:SetWidth(355)
    label:SetJustifyH("LEFT")
    label:SetText(text)
    return label
end
local controls = {}
local function Check(key, text, y, value)
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
    table.insert(controls, { check = check, key = key, value = value })
    return check
end
local function Number(key, text, y)
    Label(text, y)
    local box = CreateFrame("EditBox", nil, child, "InputBoxTemplate")
    box:SetWidth(70); box:SetHeight(22)
    box:SetPoint("TOPLEFT", child, "TOPLEFT", 285, -y + 5)
    box:SetAutoFocus(false); box:SetNumeric(true); box:SetMaxLetters(6)
    local function Save()
        M.SetOption(key, box:GetText())
        box:SetText(tostring(M.GetOption(key)))
        box:ClearFocus()
    end
    box:SetScript("OnEnterPressed", Save)
    box:SetScript("OnEditFocusLost", function()
        M.SetOption(key, box:GetText())
        box:SetText(tostring(M.GetOption(key)))
    end)
    box:SetScript("OnEscapePressed", function()
        box:SetText(tostring(M.GetOption(key))); box:ClearFocus()
    end)
    return box
end
Label("Auto Mana (prototype)", 12, "GameFontNormal")
Label("Manual and optional automatic use of selected mana consumables.", 38)
local enable = Check("enabled", "Enable", 65)
Check("automatic", "Use automatically when requesting a spell", 97)
Label("Automatic trigger (choose one)", 137, "GameFontNormal")
local missing = Check("trigger", "Based on missing mana", 158, "missing")
local threshold = Number("missingMana", "Minimum missing mana (Enter to save)", 195)
local insufficient = Check("trigger", "Only if mana is insufficient for the spell", 225, "insufficient")
Label("Uses the requested rank and current mana availability. Unknown spell costs are skipped; this does not wait until mana reaches zero.", 258)
Check("combatOnly", "Only in combat (manual and automatic)", 307)
local group = Number("minGroup", "Minimum group size (1 = solo)", 345)
Label("Allowed consumables, in priority order", 385, "GameFontNormal")
Check("tea", "Tea (IDs 61675 / 15723)", 407)
Check("rejuvenation", "Major Rejuvenation Potion", 439)
Check("potion", "Major Mana Potion", 471)
Check("flask", "Flask of Distilled Wisdom (below 2,000 mana)", 503)
Label("Each item requires explicit permission. Server-specific Tea and Flask effects must be verified on OctoWoW. Rejuvenation uses its shared potion cooldown.", 538)
local continuation = Check("continueSpell", "Continue requested spell via Nampower (experimental)", 592)
Label("After an item attempt, waits up to 3 seconds for enough mana. A new action, target change, stop cast or disable cancels it. Without this option, press the spell again.", 627)
Check("locked", "Lock manual button position", 684)
Label("The floating Mana button works with automatic use on or off. Manual use ignores the automatic trigger and missing-mana limit, but respects combat/group rules and item permissions.", 721)
local use = CreateFrame("Button", nil, child, "UIPanelButtonTemplate")
use:SetWidth(140); use:SetHeight(24)
use:SetPoint("TOPLEFT", child, "TOPLEFT", 14, -782)
use:SetText("Use consumable now")
use:SetScript("OnClick", M.UseManual)

local button = CreateFrame("Button", "PriestCompanionAutoManaButton", UIParent, "UIPanelButtonTemplate")
PC.UI.AutoManaButton = button
button:SetWidth(100); button:SetHeight(28)
button:SetText("Mana")
button:SetMovable(true); button:EnableMouse(true)
button:SetClampedToScreen(true); button:RegisterForDrag("LeftButton")
button:RegisterForClicks("LeftButtonUp")
local moving, suppressClick = false, false
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
button:SetScript("OnHide", StopMoving)
local function Gate(control, allowed)
    if allowed then control:Enable() else control:Disable() end
    if control.optionHitBox then
        if allowed then control.optionHitBox:Enable() else control.optionHitBox:Disable() end
    end
    control:SetAlpha(allowed and 1 or 0.5)
    if control.optionCaption then control.optionCaption:SetAlpha(allowed and 1 or 0.5) end
end
local function Refresh()
    local enabled = M.GetOption("enabled")
    for _, control in ipairs(controls) do
        local selected = control.value and M.GetOption(control.key) == control.value
            or (not control.value and M.GetOption(control.key))
        control.check:SetChecked(selected and 1 or nil)
    end
    if not threshold:HasFocus() then threshold:SetText(tostring(M.GetOption("missingMana"))) end
    if not group:HasFocus() then group:SetText(tostring(M.GetOption("minGroup"))) end
    PC.UI.SetModuleOptionsEnabled(child, enable, enabled)
    local automatic = enabled and M.GetOption("automatic")
    Gate(missing, automatic); Gate(insufficient, automatic)
    local edit = automatic and M.GetOption("trigger") == "missing"
    if not edit and threshold:HasFocus() then threshold:ClearFocus() end
    threshold:EnableMouse(edit); threshold:EnableKeyboard(edit)
    threshold:SetAlpha(edit and 1 or 0.5)
    Gate(continuation, automatic and M.CanContinue())
    if M.GetOption("locked") and moving then StopMoving() end
    if not moving then
        button:ClearAllPoints()
        button:SetPoint("CENTER", UIParent, "CENTER", M.GetOption("x"), M.GetOption("y"))
    end
    if enabled then button:Show() else button:Hide() end
end
scroll.Refresh = Refresh
scroll:SetScript("OnShow", Refresh)
M.AddListener(Refresh)
Refresh()
