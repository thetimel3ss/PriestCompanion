-- Priest Companion - Tools > Resurrection Assistant options.
-- Separate from the Resurrection Announcer; reuses the same saved keys.

local PC = PriestCompanion
local parent = PC.UI.OptionsContent
local assistant = PC.Modules.ResurrectionAssistant
if not parent or not assistant then return end

local panel = CreateFrame("Frame", nil, parent)
panel:SetAllPoints(parent)
panel:Hide()
PC.UI.ResurrectionAssistantOptionsPanel = panel

local scroll = CreateFrame(
    "ScrollFrame", "PriestCompanionAssistantOptionsScroll",
    panel, "UIPanelScrollFrameTemplate"
)
scroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 8, -6)
scroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -29, 9)

local child = CreateFrame("Frame", nil, scroll)
child:SetWidth(388)
child:SetHeight(400)
scroll:SetScrollChild(child)

local function Label(text, x, y, width, font)
    local fontString = child:CreateFontString(
        nil, "OVERLAY", font or "GameFontHighlightSmall"
    )
    fontString:SetPoint("TOPLEFT", child, "TOPLEFT", x, -y)
    fontString:SetWidth(width)
    fontString:SetJustifyH("LEFT")
    fontString:SetText(text)
    return fontString
end

local function ShowTooltip(owner, heading, details)
    if not GameTooltip then
        return
    end

    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:SetText(heading, 1, 0.82, 0.20)
    GameTooltip:AddLine(details, 1, 1, 1, true)
    GameTooltip:Show()
end

local function HideTooltip()
    if GameTooltip then
        GameTooltip:Hide()
    end
end

local function Checkbox(name, title, x, y, onToggle, helpText, captionWidth)
    local container = child
    local check = CreateFrame(
        "CheckButton", name, container, "UICheckButtonTemplate"
    )
    check:SetWidth(24)
    check:SetHeight(24)
    check:SetPoint("TOPLEFT", container, "TOPLEFT", x, -y)

    local label = container:CreateFontString(
        nil, "OVERLAY", "GameFontHighlightSmall"
    )
    label:SetPoint("LEFT", check, "RIGHT", 4, 0)
    label:SetWidth(captionWidth or 135)
    label:SetJustifyH("LEFT")
    label:SetText(title)

    check:SetScript("OnClick", function()
        local enabled = this:GetChecked()
        onToggle(enabled == 1 or enabled == true)
        panel.Refresh()
    end)

    if helpText then
        check:SetScript("OnEnter", function()
            ShowTooltip(this, title, helpText)
        end)
        check:SetScript("OnLeave", HideTooltip)

        -- FontStrings do not receive hover events by themselves in Vanilla.
        -- An adjacent button makes the caption hoverable and clickable.
        local captionHitBox = CreateFrame("Button", nil, container)
        captionHitBox:SetPoint("LEFT", check, "RIGHT", 4, 0)
        captionHitBox:SetWidth(captionWidth or 135)
        captionHitBox:SetHeight(24)
        captionHitBox:RegisterForClicks("LeftButtonUp")
        captionHitBox:SetScript("OnEnter", function()
            ShowTooltip(this, title, helpText)
        end)
        captionHitBox:SetScript("OnLeave", HideTooltip)
        captionHitBox:SetScript("OnClick", function()
            if not check:IsEnabled() then
                return
            end
            local checked = check:GetChecked()
            local nextValue = not (checked == 1 or checked == true)
            check:SetChecked(nextValue and 1 or nil)
            onToggle(nextValue)
            panel.Refresh()
        end)
    end

    return check, label
end

-- Resurrection Assistant (compact / expanded HUD)
--------------------------------------------------

Label("Resurrection Assistant", 14, 12, 355, "GameFontNormal")

local assistantButtonBox = Checkbox(
    "PriestCompanionResurrectionAssistantShowButton",
    "Show Resurrection button", 14, 47,
    function(value)
        if assistant then assistant.SetButtonEnabled(value) end
    end,
    "Show the Resurrection HUD when an eligible party/raid member " ..
    "is dead outside combat. The whole HUD is clickable: each click " ..
    "attempts one Resurrection. A released corpse requires a manual " ..
    "world click. This option does not disable /pc res.",
    161
)

local assistantExpandedBox = Checkbox(
    "PriestCompanionResurrectionAssistantExpanded",
    "Expanded mode", 204, 47,
    function(value)
        if assistant then assistant.SetDisplayOption("expanded", value) end
    end,
    "Expanded mode keeps the original wide HUD with a heading, " ..
    "spell icon and action text. Compact mode uses the Tracker-like " ..
    "vertical icon with optional name and class labels."
)

local assistantNameBox = Checkbox(
    "PriestCompanionResurrectionAssistantShowName",
    "Show player name", 14, 85,
    function(value)
        if assistant then assistant.SetDisplayOption("showName", value) end
    end,
    "Show the recipient nickname below the icon in compact mode, " ..
    "or beside it in expanded mode. The nickname adopts the " ..
    "recipient's class color. Hiding it leaves more space for " ..
    "the Resurrection icon."
)

local assistantClassBox = Checkbox(
    "PriestCompanionResurrectionAssistantShowClass",
    "Show player class", 204, 85,
    function(value)
        if assistant then assistant.SetDisplayOption("showClass", value) end
    end,
    "Show the recipient's class using the same class color as the " ..
    "nickname. In compact mode the icon automatically grows when " ..
    "the name or class is hidden."
)

local assistantLockedBox = Checkbox(
    "PriestCompanionResurrectionAssistantLocked",
    "Lock position", 14, 123,
    function(value)
        if assistant then assistant.SetDisplayOption("locked", value) end
    end,
    "Prevent moving or resizing the Resurrection HUD, but keep " ..
    "its center clickable to cast. Uncheck to drag the window " ..
    "or resize it from any edge or corner (Tracker-style)."
)

local assistantResetButton = CreateFrame(
    "Button", "PriestCompanionResurrectionAssistantReset",
    child, "UIPanelButtonTemplate"
)
assistantResetButton:SetWidth(151)
assistantResetButton:SetHeight(24)
assistantResetButton:SetPoint(
    "TOPLEFT", child, "TOPLEFT", 215, -123
)
assistantResetButton:SetText("Reset position")
assistantResetButton:SetScript("OnClick", function()
    if assistant then assistant.ResetButtonPosition() end
end)
assistantResetButton:SetScript("OnEnter", function()
    ShowTooltip(this, "Reset position",
        "Move the Resurrection HUD to its default location. " ..
        "Works even if Lock position is checked.")
end)
assistantResetButton:SetScript("OnLeave", HideTooltip)

Label("Window size (per mode)", 14, 167, 355, "GameFontNormalSmall")

local scaleSlider = CreateFrame(
    "Slider", "PriestCompanionResurrectionAssistantScale",
    child, "OptionsSliderTemplate"
)
scaleSlider:SetWidth(194)
scaleSlider:SetHeight(17)
scaleSlider:SetPoint("TOPLEFT", child, "TOPLEFT", 25, -200)
scaleSlider:SetMinMaxValues(0.40, 1.20)
if type(scaleSlider.SetValueStep) == "function" then
    scaleSlider:SetValueStep(0.05)
end

local scaleLabel = Label("100%", 232, 196, 110, "GameFontHighlightSmall")
local syncingScale = false
local function SyncAssistantScale()
    if not assistant then return end
    syncingScale = true
    local value = assistant.GetButtonScale()
    scaleSlider:SetValue(value)
    scaleLabel:SetText(
        tostring(math.floor(value * 100 + 0.5)) .. "%"
    )
    syncingScale = false
end
-- Keep the slider in sync if the player resizes the HUD directly via
-- its edge/corner handles while Options is open.
if assistant and type(assistant.AddListener) == "function" then
    assistant.AddListener(SyncAssistantScale)
end
scaleSlider:SetScript("OnValueChanged", function()
    if syncingScale or not assistant then return end
    local value = math.floor(this:GetValue() * 20 + 0.5) / 20
    scaleLabel:SetText(tostring(math.floor(value * 100 + 0.5)) .. "%")
    assistant.SetButtonScale(value)
end)
scaleSlider:SetScript("OnEnter", function()
    ShowTooltip(this, "Window size",
        "Scale the entire HUD from 40% to 120%, including the icon " ..
        "and text. Compact and Expanded retain independent sizes. " ..
        "When unlocked, drag any edge or corner to resize. " ..
        "The center remains clickable for Resurrection.")
end)
scaleSlider:SetScript("OnLeave", HideTooltip)

local previewActive = false
local assistantPreviewButton = CreateFrame(
    "Button", "PriestCompanionResurrectionAssistantPreview",
    child, "UIPanelButtonTemplate"
)
assistantPreviewButton:SetWidth(145)
assistantPreviewButton:SetHeight(25)
assistantPreviewButton:SetPoint(
    "TOPLEFT", child, "TOPLEFT", 21, -247
)

local assistantScaleResetButton = CreateFrame(
    "Button", "PriestCompanionResurrectionAssistantScaleReset",
    child, "UIPanelButtonTemplate"
)
assistantScaleResetButton:SetWidth(145)
assistantScaleResetButton:SetHeight(25)
assistantScaleResetButton:SetPoint(
    "TOPLEFT", child, "TOPLEFT", 215, -247
)
assistantScaleResetButton:SetText("Reset current size")
assistantScaleResetButton:SetScript("OnClick", function()
    if assistant then assistant.ResetButtonScale() end
    panel.Refresh()
end)
assistantScaleResetButton:SetScript("OnEnter", function()
    ShowTooltip(this, "Reset current size",
        "Restore 100% scale for the selected Compact or Expanded mode. " ..
        "The other mode keeps its own saved scale.")
end)
assistantScaleResetButton:SetScript("OnLeave", HideTooltip)

local function StopAssistantPreview()
    previewActive = false
    local hud = PC.UI and PC.UI.ResurrectionAssistantButton
    if hud and hud.SetPreview then hud.SetPreview(false) end
end

local function UpdatePreviewLabel()
    if previewActive then
        assistantPreviewButton:SetText("Stop preview")
    else
        assistantPreviewButton:SetText("Preview HUD")
    end
end

assistantPreviewButton:SetScript("OnClick", function()
    previewActive = not previewActive
    local hud = PC.UI and PC.UI.ResurrectionAssistantButton
    if hud and hud.SetPreview then hud.SetPreview(previewActive) end
    UpdatePreviewLabel()
end)
assistantPreviewButton:SetScript("OnEnter", function()
    ShowTooltip(this, "Preview HUD",
        "Display the HUD without a dead group member. Preview is blue " ..
        "and NEVER casts Resurrection. Unlock to drag or resize " ..
        "using the window's edges/corners; changes update live. " ..
        "Switching tabs or closing Options stops preview.")
end)
assistantPreviewButton:SetScript("OnLeave", HideTooltip)
UpdatePreviewLabel()

Label("Green = available. Yellow = click corpse manually.",
    14, 301, 355)
Label("Preview is blue and never casts. Combat hides the HUD.",
    14, 323, 355)

function panel.Refresh()
    assistantButtonBox:SetChecked(
        assistant.GetButtonEnabled() and 1 or nil
    )
    assistantExpandedBox:SetChecked(
        assistant.GetDisplayOption("expanded") and 1 or nil
    )
    assistantNameBox:SetChecked(
        assistant.GetDisplayOption("showName") and 1 or nil
    )
    assistantClassBox:SetChecked(
        assistant.GetDisplayOption("showClass") and 1 or nil
    )
    assistantLockedBox:SetChecked(
        assistant.GetDisplayOption("locked") and 1 or nil
    )
    SyncAssistantScale()
    UpdatePreviewLabel()
end

panel:SetScript("OnHide", function()
    StopAssistantPreview()
    UpdatePreviewLabel()
end)
panel:SetScript("OnShow", function()
    panel.Refresh()
end)
