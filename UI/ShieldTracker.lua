-- Read-only shield HUD and opt-in prototype controls.
local PC = PriestCompanion
local tracker = PC.Modules.ShieldTracker
local scroll = PC.UI.ShieldTrackerOptionsPanel
local child = PC.UI.ToolsShieldContent
if not tracker or not scroll or not child then return end
local hud = CreateFrame("Frame", "PriestCompanionShieldTracker", UIParent)
PC.UI.ShieldTracker = hud
hud:SetWidth(250)
hud:SetHeight(86)
hud:SetFrameStrata("MEDIUM")
hud:SetMovable(true)
hud:EnableMouse(true)
hud:RegisterForDrag("LeftButton")
hud:SetClampedToScreen(true)
hud:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true,
    tileSize = 16, edgeSize = 12, insets = { left = 4, right = 4, top = 4, bottom = 4 } })
hud:SetBackdropColor(0.04, 0.04, 0.09, 0.95)
hud:Hide()
local icon = hud:CreateTexture(nil, "ARTWORK")
icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
icon:SetWidth(28)
icon:SetHeight(28)
icon:SetPoint("TOPLEFT", hud, "TOPLEFT", 9, -9)
local heading = hud:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
heading:SetPoint("TOPLEFT", hud, "TOPLEFT", 44, -10)
heading:SetText("Power Word: Shield")
local timeText = hud:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
timeText:SetPoint("TOPRIGHT", hud, "TOPRIGHT", -10, -10)
local bar = CreateFrame("StatusBar", nil, hud)
bar:SetWidth(194)
bar:SetHeight(15)
bar:SetPoint("TOPLEFT", hud, "TOPLEFT", 44, -28)
bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
bar:SetMinMaxValues(0, 1)
local amount = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
amount:SetPoint("CENTER", bar, "CENTER", 0, 0)
local note = hud:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
note:SetPoint("BOTTOMLEFT", hud, "BOTTOMLEFT", 10, 10)
note:SetWidth(230)
note:SetHeight(24)
note:SetJustifyH("LEFT")
local preview = false
local moving = false
local Render, RefreshOptions
local function StopMoving()
    if not moving then return end
    moving = false
    hud:StopMovingOrSizing()
    local x, y = hud:GetCenter()
    local cx, cy = UIParent:GetCenter()
    if x and y and cx and cy then tracker.SetPosition(x - cx, y - cy) end
end
hud:SetScript("OnDragStart", function()
    if not tracker.GetOption("locked") then moving = true; hud:StartMoving() end
end)
hud:SetScript("OnDragStop", StopMoving)
hud:SetScript("OnHide", StopMoving)
function hud.SetPreview(value)
    preview = value and tracker.GetOption("enabled") and true or false
    Render()
    if RefreshOptions then RefreshOptions() end
end
Render = function()
    local enabled = tracker.GetOption("enabled")
    if not enabled then preview = false end
    if tracker.GetOption("locked") and moving then StopMoving() end
    if not moving then
        hud:ClearAllPoints()
        hud:SetPoint("CENTER", UIParent, "CENTER", tracker.GetOption("x"), tracker.GetOption("y"))
    end
    local data = tracker.GetState()
    if not enabled or (not preview and not data.active) then hud:Hide(); return end
    hud:SetBackdropBorderColor(preview and 0.3 or 0.7, 0.65, 1, 1)
    if preview then
        data = { remaining = 600, maximum = 942, timeLeft = 18, reason = "Preview - base estimate" }
    end
    if data.remaining and data.maximum then
        bar:SetMinMaxValues(0, data.maximum)
        bar:SetValue(data.remaining)
        bar:SetStatusBarColor(0.35, 0.65, 1)
        amount:SetText("~" .. math.floor(data.remaining) .. " / ~" .. math.floor(data.maximum))
        note:SetText(preview and "PREVIEW - no real shield" or "Base estimate (excludes modifiers)")
    else
        bar:SetMinMaxValues(0, 1)
        bar:SetValue(1)
        bar:SetStatusBarColor(0.4, 0.4, 0.5)
        amount:SetText("Absorb unknown")
        note:SetText(data.reason or "Shield active")
    end
    if data.timeLeft then timeText:SetText(math.ceil(data.timeLeft) .. "s")
    else timeText:SetText("?s") end
    hud:Show()
end
local function Label(text, x, y, width, font)
    local label = child:CreateFontString(nil, "OVERLAY", font or "GameFontHighlightSmall")
    label:SetPoint("TOPLEFT", child, "TOPLEFT", x, -y)
    label:SetWidth(width or 355)
    label:SetJustifyH("LEFT")
    label:SetText(text)
    return label
end
Label("Shield Tracker (prototype)", 14, 12, 355, "GameFontNormal")
Label("Tracks Power Word: Shield received by your own character.", 14, 38)
local function Checkbox(name, text, y, key)
    local check = CreateFrame("CheckButton", name, child, "UICheckButtonTemplate")
    check:SetWidth(24)
    check:SetHeight(24)
    check:SetPoint("TOPLEFT", child, "TOPLEFT", 14, -y)
    local caption = child:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    caption:SetPoint("LEFT", check, "RIGHT", 4, 0)
    caption:SetText(text)
    check.optionCaption = caption
    local hit = CreateFrame("Button", nil, child)
    hit:SetPoint("LEFT", check, "RIGHT", 4, 0)
    hit:SetWidth(180)
    hit:SetHeight(24)
    check.optionHitBox = hit
    check:SetScript("OnClick", function()
        tracker.SetOption(key, this:GetChecked() == 1 or this:GetChecked() == true)
    end)
    hit:SetScript("OnClick", function() tracker.SetOption(key, not tracker.GetOption(key)) end)
    return check
end
local enable = Checkbox("PriestCompanionShieldEnable", "Enable", 67, "enabled")
local locked = Checkbox("PriestCompanionShieldLocked", "Lock position", 99, "locked")
local providerLabel = Label("", 14, 141)
Label("A gray bar means the shield is present, but its remaining absorption is unknown.",
    14, 179)
Label("~ values are Vanilla base-rank estimates for observed self-casts. Talents, gear and OctoWoW modifiers are not included.",
    14, 225)
Label("External shields, casts missed during reload, and other possible absorption effects use unknown amounts. This prototype does not track shields on other players.",
    14, 283)
local previewButton = CreateFrame("Button", nil, child, "UIPanelButtonTemplate")
previewButton:SetWidth(145)
previewButton:SetHeight(24)
previewButton:SetPoint("TOPLEFT", child, "TOPLEFT", 14, -357)
previewButton:SetText("Preview Shield")
previewButton:SetScript("OnClick", function() hud.SetPreview(not preview) end)
local reset = CreateFrame("Button", nil, child, "UIPanelButtonTemplate")
reset:SetWidth(145)
reset:SetHeight(24)
reset:SetPoint("LEFT", previewButton, "RIGHT", 18, 0)
reset:SetText("Reset position")
reset:SetScript("OnClick", function() StopMoving(); tracker.ResetPosition() end)
RefreshOptions = function()
    enable:SetChecked(tracker.GetOption("enabled") and 1 or nil)
    locked:SetChecked(tracker.GetOption("locked") and 1 or nil)
    providerLabel:SetText("Events: " .. tracker.GetProvider())
    PC.UI.SetModuleOptionsEnabled(child, enable, tracker.GetOption("enabled"))
    previewButton:SetText(preview and "Close Preview" or "Preview Shield")
end
scroll.Refresh = function() RefreshOptions(); Render() end
scroll:SetScript("OnShow", scroll.Refresh)
scroll:SetScript("OnHide", function() hud.SetPreview(false) end)
tracker.AddListener(function() Render(); if scroll:IsShown() then RefreshOptions() end end)
Render()
