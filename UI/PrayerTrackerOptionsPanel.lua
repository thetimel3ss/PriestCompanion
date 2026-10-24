-- Priest Companion - Tools > Book of Prayer Tracker options.
-- This scroll page is created directly in UI/ToolsPanel.lua, using the
-- same hierarchy and clipping behavior as Options > Announcer.

local PC = PriestCompanion
local advanced = PC.UI.PrayerTrackerOptionsPanel
local advancedChild = PC.UI.ToolsTrackerContent
local prayer = PC.Modules.PrayerTracker
if not advanced or not advancedChild then return end

local function CreateLabel(parent, text, x, y, width, font)
    local label = parent:CreateFontString(
        nil, "OVERLAY", font or "GameFontHighlightSmall"
    )
    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    label:SetWidth(width)
    label:SetJustifyH("LEFT")
    label:SetText(text)
    return label
end

CreateLabel(
    advancedChild,
    "Book of Prayer Tracker",
    14, -12, 360,
    "GameFontNormal"
)

local talentStatus = CreateLabel(
    advancedChild, "", 14, -40, 350
)

local requiredNote = CreateLabel(
    advancedChild, "", 183, -72, 195
)
requiredNote:SetTextColor(1, 0.32, 0.32)

local checkboxes = {}
local checkboxNames = {}
local checkboxIndex = 0

local function ShowPrayerTooltip(owner, heading, description)
    if not GameTooltip then
        return
    end

    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:SetText(heading, 1, 0.82, 0.20)
    GameTooltip:AddLine(description, 1, 1, 1, true)
    GameTooltip:Show()
end

local function HidePrayerTooltip()
    if GameTooltip then
        GameTooltip:Hide()
    end
end

local function AddPrayerCheckbox(key, text, y, helpText, labelWidth)
    checkboxIndex = checkboxIndex + 1

    local button = CreateFrame(
        "CheckButton",
        "PriestCompanionPrayerOption" ..
            tostring(checkboxIndex),
        advancedChild,
        "UICheckButtonTemplate"
    )

    button:SetWidth(24)
    button:SetHeight(24)
    button:SetPoint(
        "TOPLEFT", advancedChild, "TOPLEFT", 16, -y
    )

    local caption = advancedChild:CreateFontString(
        nil, "OVERLAY", "GameFontHighlightSmall"
    )
    caption:SetPoint(
        "LEFT", button, "RIGHT", 4, 0
    )
    caption:SetWidth(labelWidth or 328)
    caption:SetJustifyH("LEFT")
    caption:SetText(text)

    button:SetScript(
        "OnClick",
        function()
            if prayer then
                prayer.SetOption(
                    key,
                    this:GetChecked() == 1
                        or this:GetChecked() == true
                )
            end
            advanced.Refresh()
        end
    )

    if helpText then
        -- The checkbox itself and the text area both show the tooltip.
        -- The text hitbox also lets the user toggle by clicking the label.
        button:SetScript(
            "OnEnter",
            function()
                ShowPrayerTooltip(this, text, helpText)
            end
        )
        button:SetScript("OnLeave", HidePrayerTooltip)

        local labelHitBox = CreateFrame(
            "Button", nil, advancedChild
        )
        labelHitBox:SetPoint(
            "LEFT", button, "RIGHT", 4, 0
        )
        labelHitBox:SetWidth(labelWidth or 328)
        labelHitBox:SetHeight(24)
        labelHitBox:RegisterForClicks("LeftButtonUp")
        labelHitBox:SetScript(
            "OnEnter",
            function()
                ShowPrayerTooltip(this, text, helpText)
            end
        )
        labelHitBox:SetScript(
            "OnLeave", HidePrayerTooltip
        )
        labelHitBox:SetScript(
            "OnClick",
            function()
                if not button:IsEnabled() then
                    return
                end

                if prayer then
                    prayer.SetOption(
                        key,
                        not prayer.GetOption(key)
                    )
                end

                advanced.Refresh()
            end
        )
    end

    checkboxes[key] = button
    checkboxNames[key] = caption
    return button
end

AddPrayerCheckbox("enabled", "Enable Tracker", 66)
AddPrayerCheckbox("expanded", "Expanded mode (previous heal)", 96)
AddPrayerCheckbox("showSpellName", "Show spell name", 126)
AddPrayerCheckbox(
    "showRefund",
    "Show refund status (border color)",
    156,
    "The border turns green after a different healing spell " ..
        "and red if the same healing family is repeated. " ..
        "It stays neutral until two qualifying casts are known."
)
AddPrayerCheckbox(
    "showManaRefund",
    "Show mana refund",
    186,
    "Shows exact Book of Prayer mana from Nampower when available " ..
        "(+N mana). Falls back to the ClassicAPI cost-based " ..
        "estimate (~N mana). No number is shown without data."
)
AddPrayerCheckbox("outsideCombat", "Show outside combat", 216)
AddPrayerCheckbox(
    "autoHide",
    "Auto-hide after inactivity",
    246,
    "Hide the tracker when no compatible healing spell has " ..
        "been successfully cast for the configured number " ..
        "of seconds. The next heal shows it again.",
    210
)

-- A numeric-only Vanilla input field sits beside Auto-hide.
local autoHideSecondsBox = CreateFrame(
    "EditBox",
    "PriestCompanionPrayerAutoHideSeconds",
    advancedChild,
    "InputBoxTemplate"
)
autoHideSecondsBox:SetPoint(
    "TOPLEFT", advancedChild, "TOPLEFT", 280, -247
)
autoHideSecondsBox:SetWidth(52)
autoHideSecondsBox:SetHeight(20)
autoHideSecondsBox:SetAutoFocus(false)
autoHideSecondsBox:SetNumeric(true)
autoHideSecondsBox:SetMaxLetters(3)
autoHideSecondsBox:SetJustifyH("CENTER")
autoHideSecondsBox:SetTextInsets(4, 4, 0, 0)

-- Correct the stock InputBoxTemplate's shifted left texture,
-- using the same adjustment as Puppeteer's edit box.
local inputLeft = getfenv(0)[autoHideSecondsBox:GetName() .. "Left"]
if inputLeft then
    local point, relative, relativePoint, x, y = inputLeft:GetPoint(1)
    if point then
        inputLeft:ClearAllPoints()
        inputLeft:SetPoint(point, relative, relativePoint, 0, y)
    end
end

local secondsLabel = CreateLabel(
    advancedChild, "sec", 340, -249, 36
)

local function SaveAutoHideSeconds()
    if prayer then
        prayer.SetAutoHideSeconds(autoHideSecondsBox:GetText())
        autoHideSecondsBox:SetText(
            tostring(prayer.GetOption("autoHideSeconds"))
        )
    end
end

autoHideSecondsBox:SetScript(
    "OnEnterPressed",
    function()
        this:ClearFocus()
    end
)
autoHideSecondsBox:SetScript(
    "OnEscapePressed",
    function()
        if prayer then
            this:SetText(
                tostring(prayer.GetOption("autoHideSeconds"))
            )
        end
        this:ClearFocus()
    end
)
autoHideSecondsBox:SetScript(
    "OnEditFocusGained",
    function()
        this:HighlightText()
    end
)
autoHideSecondsBox:SetScript(
    "OnEditFocusLost",
    SaveAutoHideSeconds
)
autoHideSecondsBox:SetScript(
    "OnEnter",
    function()
        ShowPrayerTooltip(
            this,
            "Auto-hide delay (seconds)",
            "Enter a whole number from 1 to 600. The timer " ..
                "resets after each confirmed compatible heal."
        )
    end
)
autoHideSecondsBox:SetScript("OnLeave", HidePrayerTooltip)

AddPrayerCheckbox(
    "locked",
    "Lock position",
    276,
    "When unlocked, drag the tracker to move it and drag " ..
        "an edge or corner to resize. Locking prevents both " ..
        "moving and resizing the tracker."
)

--------------------------------------------------
-- Tracker Layout Controls
--------------------------------------------------

-- Native Vanilla confirmation. Cancel/Escape leaves both saved dimensions
-- and position untouched; only OK calls the existing geometry reset.
local RESET_TRACKER_POPUP = "PRIEST_COMPANION_RESET_TRACKER_GEOMETRY"

StaticPopupDialogs[RESET_TRACKER_POPUP] = {
    text = "Reset Book of Prayer Tracker position and window sizes?" ..
        "\n\nThis restores the default position and both compact " ..
        "and expanded sizes. Lock and all other settings are kept.",
    button1 = OKAY or "OK",
    button2 = CANCEL or "Cancel",
    OnAccept = function()
        if prayer then
            prayer.ResetGeometry()
        end
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
}

local resetButton = CreateFrame(
    "Button",
    "PriestCompanionPrayerResetPosition",
    advancedChild,
    "UIPanelButtonTemplate"
)
resetButton:SetWidth(152)
resetButton:SetHeight(24)
resetButton:SetPoint(
    "TOPLEFT", advancedChild, "TOPLEFT", 16, -318
)
resetButton:SetText("Reset Position")
resetButton:SetScript(
    "OnClick",
    function()
        StaticPopup_Show(RESET_TRACKER_POPUP)
    end
)
resetButton:SetScript(
    "OnEnter",
    function()
        ShowPrayerTooltip(
            this,
            "Reset Position",
            "Reset the tracker position and both compact/expanded " ..
                "window sizes. Other settings are kept."
        )
    end
)
resetButton:SetScript("OnLeave", HidePrayerTooltip)

local previewButton = CreateFrame(
    "Button",
    "PriestCompanionPrayerPreview",
    advancedChild,
    "UIPanelButtonTemplate"
)
previewButton:SetWidth(152)
previewButton:SetHeight(24)
previewButton:SetPoint(
    "TOPLEFT", advancedChild, "TOPLEFT", 190, -318
)
previewButton:SetText("Preview Tracker")
previewButton:SetScript(
    "OnClick",
    function()
        local hud = PC.UI.PrayerTracker

        if hud and type(hud.SetPreview) == "function"
        and type(hud.IsPreviewActive) == "function" then
            hud.SetPreview(not hud.IsPreviewActive())
        end

        advanced.Refresh()
    end
)
previewButton:SetScript(
    "OnEnter",
    function()
        ShowPrayerTooltip(
            this,
            "Preview Tracker",
            "Show example heals and a sample mana refund without " ..
                "casting or changing your real healing history. " ..
                "Preview ignores combat and auto-hide restrictions."
        )
    end
)
previewButton:SetScript("OnLeave", HidePrayerTooltip)

--------------------------------------------------
-- Window size: independent Compact and Expanded scales
--------------------------------------------------

CreateLabel(
    advancedChild, "Window size (per mode)",
    16, -371, 340, "GameFontNormalSmall"
)

local windowScaleSlider = CreateFrame(
    "Slider", "PriestCompanionPrayerWindowScale",
    advancedChild, "OptionsSliderTemplate"
)
windowScaleSlider:SetWidth(194)
windowScaleSlider:SetHeight(17)
windowScaleSlider:SetPoint(
    "TOPLEFT", advancedChild, "TOPLEFT", 26, -405
)
windowScaleSlider:SetMinMaxValues(0.40, 1.20)
if type(windowScaleSlider.SetValueStep) == "function" then
    windowScaleSlider:SetValueStep(0.05)
end

local windowScaleLabel = CreateLabel(
    advancedChild, "100%", 236, -401, 105,
    "GameFontHighlightSmall"
)
local syncingWindowScale = false
local function RefreshWindowScale()
    if not prayer then return end
    syncingWindowScale = true
    local value = prayer.GetWindowScale()
    windowScaleSlider:SetValue(value)
    windowScaleLabel:SetText(
        tostring(math.floor(value * 100 + 0.5)) .. "%"
    )
    syncingWindowScale = false
end

windowScaleSlider:SetScript(
    "OnValueChanged",
    function()
        if syncingWindowScale or not prayer then return end
        local value = math.floor(this:GetValue() * 20 + 0.5) / 20
        prayer.SetWindowScale(value)
    end
)
windowScaleSlider:SetScript(
    "OnEnter",
    function()
        ShowPrayerTooltip(
            this, "Window size",
            "Scale the entire Book of Prayer HUD from 40% to 120%, " ..
            "including icons, spell names and mana text. Compact and " ..
            "Expanded remember separate sizes. When unlocked, resize " ..
            "by dragging any window edge or corner, like Resurrection."
        )
    end
)
windowScaleSlider:SetScript("OnLeave", HidePrayerTooltip)

local resetWindowScaleButton = CreateFrame(
    "Button", "PriestCompanionPrayerResetWindowScale",
    advancedChild, "UIPanelButtonTemplate"
)
resetWindowScaleButton:SetWidth(154)
resetWindowScaleButton:SetHeight(24)
resetWindowScaleButton:SetPoint(
    "TOPLEFT", advancedChild, "TOPLEFT", 16, -443
)
resetWindowScaleButton:SetText("Reset current size")
resetWindowScaleButton:SetScript(
    "OnClick",
    function()
        if prayer then prayer.SetWindowScale(1) end
    end
)
resetWindowScaleButton:SetScript(
    "OnEnter",
    function()
        ShowPrayerTooltip(
            this, "Reset current size",
            "Set the currently selected Compact or Expanded window " ..
            "back to 100%. The other mode keeps its saved size. " ..
            "Reset Position above still resets both modes."
        )
    end
)
resetWindowScaleButton:SetScript("OnLeave", HidePrayerTooltip)

-- Do not leave the simulated HUD visible after closing Options
-- or navigating away from the Tracker section.
advanced:SetScript(
    "OnHide",
    function()
        local hud = PC.UI.PrayerTracker

        if hud and type(hud.SetPreview) == "function"
        and type(hud.IsPreviewActive) == "function"
        and hud.IsPreviewActive() then
            hud.SetPreview(false)
        end
    end
)

function advanced.Refresh()
    if prayer then
        local points = prayer.GetTalentPoints()
        local found = prayer.IsTalentFound()
        local provider = prayer.GetProvider()
        local label

        if found then
            label = "Book of Prayer: " ..
                tostring(points) .. "/2"
        else
            label = "Book of Prayer: unavailable"
        end

        if provider == "unavailable" then
            label = label .. "  |  Cast event unavailable"
        else
            label = label .. "  |  " .. provider
        end

        talentStatus:SetText(label)
        RefreshWindowScale()

        local hud = PC.UI.PrayerTracker
        if hud and type(hud.IsPreviewActive) == "function"
        and hud.IsPreviewActive() then
            previewButton:SetText("Close Preview")
        else
            previewButton:SetText("Preview Tracker")
        end

        local key
        local button
        for key, button in pairs(checkboxes) do
            local checked = prayer.GetOption(key)
            if key == "enabled" and points < 1 then
                checked = false
            end
            button:SetChecked(checked and 1 or nil)
        end

        -- The timeout can only be edited when Auto-hide is selected.
        local hideEnabled = prayer.GetOption("autoHide")

        if hideEnabled then
            autoHideSecondsBox:EnableMouse(true)
            autoHideSecondsBox:SetAlpha(1)
            secondsLabel:SetTextColor(1, 0.82, 0.20)
        else
            if autoHideSecondsBox:HasFocus() then
                autoHideSecondsBox:ClearFocus()
            end
            autoHideSecondsBox:EnableMouse(false)
            autoHideSecondsBox:SetAlpha(0.5)
            secondsLabel:SetTextColor(0.60, 0.60, 0.60)
        end

        if not autoHideSecondsBox:HasFocus() then
            autoHideSecondsBox:SetText(
                tostring(prayer.GetOption("autoHideSeconds"))
            )
        end

        if points < 1 then
            checkboxes.enabled:Disable()
            checkboxNames.enabled:SetTextColor(1, 0.32, 0.32)

            if found then
                requiredNote:SetText(
                    "* Talent point required"
                )
            else
                requiredNote:SetText(
                    "* Talent not found"
                )
            end
        else
            checkboxes.enabled:Enable()
            checkboxNames.enabled:SetTextColor(1, 0.82, 0.20)
            requiredNote:SetText("")
        end
    end

end

if prayer then
    prayer.AddListener(
        function()
            if advanced:IsShown() then
                advanced.Refresh()
            end
        end
    )
end

