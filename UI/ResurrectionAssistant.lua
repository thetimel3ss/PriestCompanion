-- Priest Companion - Resurrection Assistant HUD
-- Vanilla Lua 5.0. Event-driven, no OnUpdate or automatic spellcasts.
-- The complete HUD is clickable; dragging or resizing never casts.

local PC = PriestCompanion
local Assistant = PC.Modules and PC.Modules.ResurrectionAssistant
if not Assistant then return end

local COMPACT_W, COMPACT_H = 108, 116
local EXPANDED_W, EXPANDED_H = 238, 96
local SPELL_ICON = "Interface\\Icons\\Spell_Holy_Resurrection"

local fallbackColors = {
    PRIEST = {1, 1, 1},
    SHAMAN = {0, 0.44, 0.87},
    PALADIN = {0.96, 0.55, 0.73},
    DRUID = {1, 0.49, 0.04},
    MAGE = {0.41, 0.8, 0.94},
    HUNTER = {0.67, 0.83, 0.45},
    WARLOCK = {0.58, 0.51, 0.79},
    WARRIOR = {0.78, 0.61, 0.43},
    ROGUE = {1, 0.96, 0.41}
}

local frame = CreateFrame(
    "Button", "PriestCompanionResurrectionAssistantButton", UIParent
)
PC.UI.ResurrectionAssistantButton = frame
frame:SetFrameStrata("MEDIUM")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForClicks("LeftButtonUp")
frame:RegisterForDrag("LeftButton")
if type(frame.SetResizable) == "function" then
    frame:SetResizable(true)
end
if type(frame.SetClampedToScreen) == "function" then
    frame:SetClampedToScreen(true)
end
frame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 13,
    insets = {left = 4, right = 4, top = 4, bottom = 4}
})
frame:Hide()

-- All artwork is non-interactive. A single frame handles the cast click
-- regardless of where the player clicks (except the resize corner).
local visual = CreateFrame("Frame", nil, frame)
visual:EnableMouse(false)
visual:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)

local icon = visual:CreateTexture(nil, "ARTWORK")
icon:SetTexture(SPELL_ICON)

local title = visual:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetText("Resurrection Assistant")
local nickText = visual:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
nickText:SetJustifyH("CENTER")
local classText = visual:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
classText:SetJustifyH("CENTER")
local actionText = visual:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
actionText:SetJustifyH("CENTER")

local previewText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
previewText:SetPoint("BOTTOM", frame, "TOP", 0, 3)
previewText:SetText("PREVIEW - NO CAST")
previewText:SetTextColor(0.40, 0.75, 1.00)
previewText:Hide()

local grip = CreateFrame("Frame", nil, frame)
grip:SetWidth(17)
grip:SetHeight(17)
grip:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
grip:EnableMouse(true)
local gripTexture = grip:CreateTexture(nil, "OVERLAY")
gripTexture:SetAllPoints(grip)
gripTexture:SetTexture(
    "Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up"
)

local appliedX, appliedY
local appliedExpanded, appliedScale
local previewActive = false
local dragConsumedClick = false
local dragging = false
local sizing = false
local Refresh

local function ClassRGB(class)
    local default = fallbackColors[class] or {1, 1, 1}
    if type(RAID_CLASS_COLORS) == "table"
    and type(RAID_CLASS_COLORS[class]) == "table" then
        local color = RAID_CLASS_COLORS[class]
        return color.r or default[1],
            color.g or default[2], color.b or default[3]
    end
    return default[1], default[2], default[3]
end

local function ClassName(class)
    if type(LOCALIZED_CLASS_NAMES_MALE) == "table"
    and type(LOCALIZED_CLASS_NAMES_MALE[class]) == "string" then
        return LOCALIZED_CLASS_NAMES_MALE[class]
    end
    if type(class) ~= "string" then return "Unknown" end
    return string.upper(string.sub(class, 1, 1)) ..
        string.lower(string.sub(class, 2))
end

local function TrimName(name, max)
    if not name then return "" end
    if string.len(name) > max then
        return string.sub(name, 1, max - 2) .. ".."
    end
    return name
end

local function BaseDimensions()
    if Assistant.GetDisplayOption("expanded") then
        return EXPANDED_W, EXPANDED_H, true
    end
    return COMPACT_W, COMPACT_H, false
end

local function UpdatePosition()
    local x, y = Assistant.GetButtonPosition()
    if appliedX ~= x or appliedY ~= y then
        frame:ClearAllPoints()
        frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
        appliedX, appliedY = x, y
    end
end

local function SavePosition()
    local cx, cy = frame:GetCenter()
    local px, py = UIParent:GetCenter()
    if cx and cy and px and py then
        local x, y = cx - px, cy - py
        appliedX, appliedY = x, y
        Assistant.SetButtonPosition(x, y)
    end
end

local function UpdateSize()
    local width, height, expanded = BaseDimensions()
    local scale = Assistant.GetButtonScale(expanded)
    if expanded ~= appliedExpanded or scale ~= appliedScale then
        frame:SetWidth(width * scale)
        frame:SetHeight(height * scale)
        visual:SetWidth(width)
        visual:SetHeight(height)
        visual:SetScale(scale)
        appliedExpanded = expanded
        appliedScale = scale
    end
end

local function LayoutCompact()
    title:Hide()
    actionText:Hide()

    local showName = Assistant.GetDisplayOption("showName")
    local showClass = Assistant.GetDisplayOption("showClass")
    local nameSpace = showName and 18 or 0
    local classSpace = showClass and 17 or 0
    local artSize = math.min(92, COMPACT_H - 18 - nameSpace - classSpace)

    icon:ClearAllPoints()
    icon:SetWidth(artSize)
    icon:SetHeight(artSize)
    icon:SetPoint("TOP", visual, "TOP", 0, -9)

    nickText:ClearAllPoints()
    nickText:SetWidth(100)
    nickText:SetPoint("TOP", icon, "BOTTOM", 0, -3)
    classText:ClearAllPoints()
    classText:SetWidth(100)
    if showName then
        classText:SetPoint("TOP", nickText, "BOTTOM", 0, -1)
    else
        classText:SetPoint("TOP", icon, "BOTTOM", 0, -3)
    end

    if showName then nickText:Show() else nickText:Hide() end
    if showClass then classText:Show() else classText:Hide() end
end

local function LayoutExpanded()
    local showName = Assistant.GetDisplayOption("showName")
    local showClass = Assistant.GetDisplayOption("showClass")

    title:ClearAllPoints()
    title:SetPoint("TOPLEFT", visual, "TOPLEFT", 12, -9)
    title:Show()

    local artSize = 51
    if not showName and not showClass then artSize = 59 end
    icon:ClearAllPoints()
    icon:SetWidth(artSize)
    icon:SetHeight(artSize)
    icon:SetPoint("TOPLEFT", visual, "TOPLEFT", 13, -27)

    nickText:ClearAllPoints()
    nickText:SetWidth(162)
    nickText:SetJustifyH("LEFT")
    nickText:SetPoint("TOPLEFT", visual, "TOPLEFT", 78, -30)
    classText:ClearAllPoints()
    classText:SetWidth(155)
    classText:SetJustifyH("LEFT")
    if showName then
        classText:SetPoint("TOPLEFT", nickText, "BOTTOMLEFT", 0, -2)
    else
        classText:SetPoint("TOPLEFT", visual, "TOPLEFT", 78, -30)
    end

    actionText:ClearAllPoints()
    actionText:SetWidth(160)
    actionText:SetJustifyH("LEFT")
    actionText:SetPoint("BOTTOMLEFT", visual, "BOTTOMLEFT", 78, 12)
    actionText:Show()

    if showName then nickText:Show() else nickText:Hide() end
    if showClass then classText:Show() else classText:Hide() end
end

local function UpdateAppearance(state)
    local r, g, b
    if previewActive then
        frame:SetBackdropBorderColor(0.40, 0.75, 1.00, 1)
        frame:SetBackdropColor(0.04, 0.07, 0.14, 0.96)
        previewText:Show()
    elseif state.mode == "corpse" then
        frame:SetBackdropBorderColor(1.00, 0.76, 0.14, 1)
        frame:SetBackdropColor(0.14, 0.10, 0.03, 0.96)
        previewText:Hide()
    else
        frame:SetBackdropBorderColor(0.27, 0.94, 0.35, 1)
        frame:SetBackdropColor(0.04, 0.11, 0.06, 0.96)
        previewText:Hide()
    end

    if state.mode == "corpse" then
        nickText:SetText("Released corpse")
        classText:SetText("Manual targeting")
        nickText:SetTextColor(1, 0.85, 0.42)
        classText:SetTextColor(1, 0.85, 0.42)
        actionText:SetText("Click, then select corpse")
    else
        r, g, b = ClassRGB(state.class)
        nickText:SetText(TrimName(state.name, 15))
        classText:SetText(ClassName(state.class))
        nickText:SetTextColor(r, g, b)
        classText:SetTextColor(r, g, b)
        actionText:SetText("Click to resurrect")
    end
    actionText:SetTextColor(0.90, 0.92, 1.0)
end

Refresh = function()
    -- Never query candidates while the priest is in combat.
    if Assistant.IsPaused() then
        frame:Hide()
        return
    end

    UpdateSize()
    UpdatePosition()
    local state
    if previewActive then
        state = {mode = "target", name = "PreviewPriest", class = "PRIEST"}
    else
        state = Assistant.GetButtonState()
    end
    if not state then
        frame:Hide()
        return
    end

    if Assistant.GetDisplayOption("expanded") then
        LayoutExpanded()
    else
        nickText:SetJustifyH("CENTER")
        classText:SetJustifyH("CENTER")
        LayoutCompact()
    end
    UpdateAppearance(state)
    if Assistant.GetDisplayOption("locked") then
        grip:Hide()
    else
        grip:Show()
    end
    frame:Show()
end

local function DoCast()
    if previewActive or Assistant.IsPaused() then return end
    local ok, message = Assistant.TryResurrect()
    if not ok and DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage(
            "|cffff9900Priest Companion:|r " ..
            (message or "Resurrection was not started.")
        )
    elseif message
    and string.find(message, "Click the released", 1, true)
    and DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage(
            "|cff66ccffPriest Companion:|r " .. message
        )
    end
end

-- Vanilla casts work from a Button's OnClick, as in the previously
-- validated HUD. OnMouseUp of a plain Frame can conflict with the
-- client's mouse release / spell-target cursor handling.
-- Keep dragConsumedClick set through OnDragStop; reset it ONLY on
-- the next mouse down, so a drag can never become a cast on release.
frame:SetScript("OnMouseDown", function()
    dragConsumedClick = false
end)

frame:SetScript("OnClick", function()
    -- RegisterForClicks limits this handler to LeftButtonUp. Match the
    -- prior working widget, which cast from an unconditional OnClick.
    if not dragConsumedClick and not dragging and not sizing then
        DoCast()
    end
end)

frame:SetScript("OnDragStart", function()
    if Assistant.GetDisplayOption("locked") or Assistant.IsPaused() then
        return
    end
    dragConsumedClick = true
    dragging = true
    frame:StartMoving()
end)

frame:SetScript("OnDragStop", function()
    if dragging then
        frame:StopMovingOrSizing()
        dragging = false
        SavePosition()
    end
end)

grip:SetScript("OnMouseDown", function()
    if arg1 ~= "LeftButton"
    or Assistant.GetDisplayOption("locked") or Assistant.IsPaused()
    or type(frame.StartSizing) ~= "function" then return end
    dragConsumedClick = true
    sizing = true
    frame:StartSizing("BOTTOMRIGHT")
end)

grip:SetScript("OnMouseUp", function()
    if not sizing then return end
    frame:StopMovingOrSizing()
    sizing = false
    dragConsumedClick = true
    local width, height, expanded = BaseDimensions()
    local widthFactor = frame:GetWidth() / width
    local heightFactor = frame:GetHeight() / height
    local newScale = math.max(widthFactor, heightFactor)
    Assistant.SetButtonScale(newScale, expanded)
    SavePosition()
end)

frame:SetScript("OnHide", function()
    frame:StopMovingOrSizing()
    dragging, sizing = false, false
end)

-- Preview is visual-only and never touches the selected group target.
function frame.SetPreview(value)
    previewActive = value and true or false
    Refresh()
end

function frame.IsPreviewActive()
    return previewActive
end

Assistant.AddListener(Refresh)
Refresh()
