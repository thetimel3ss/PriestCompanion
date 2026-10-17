-- Priest Companion
-- Compact / expanded Book of Prayer HUD for Vanilla 1.12.
-- Movable and resizable from the edges while unlocked.

local PC = PriestCompanion
local Tracker = PC.Modules.PrayerTracker

if not Tracker then
    return
end

--------------------------------------------------
-- Window
--------------------------------------------------

local frame = CreateFrame(
    "Frame",
    "PriestCompanionPrayerTrackerFrame",
    UIParent
)

PC.UI.PrayerTracker = frame

frame:SetFrameStrata("MEDIUM")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")

if type(frame.SetResizable) == "function" then
    frame:SetResizable(true)
end

if type(frame.SetClampedToScreen) == "function" then
    frame:SetClampedToScreen(true)
end

frame:SetWidth(118)
frame:SetHeight(112)
frame:SetPoint("CENTER", UIParent, "CENTER", 0, -150)

frame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 13,
    insets = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4
    }
})
frame:SetBackdropColor(0.04, 0.04, 0.09, 0.95)
frame:SetBackdropBorderColor(0.55, 0.55, 0.67, 1)
frame:Hide()

local title = frame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontNormalSmall"
)
title:SetPoint("TOP", frame, "TOP", 0, -9)
title:SetText("Book of Prayer")

local currentIcon = frame:CreateTexture(
    nil,
    "ARTWORK"
)
currentIcon:SetWidth(36)
currentIcon:SetHeight(36)
currentIcon:SetPoint(
    "TOP",
    frame,
    "TOP",
    0,
    -25
)

local previousIcon = frame:CreateTexture(
    nil,
    "ARTWORK"
)
previousIcon:SetWidth(36)
previousIcon:SetHeight(36)
previousIcon:SetPoint(
    "TOP",
    frame,
    "TOP",
    -43,
    -30
)

local currentName = frame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontHighlightSmall"
)
currentName:SetWidth(170)
currentName:SetJustifyH("CENTER")
currentName:SetPoint(
    "TOP",
    currentIcon,
    "BOTTOM",
    0,
    -2
)

local previousName = frame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontDisableSmall"
)
previousName:SetWidth(88)
previousName:SetJustifyH("CENTER")
previousName:SetPoint(
    "TOP",
    previousIcon,
    "BOTTOM",
    0,
    -2
)

local arrow = frame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontNormal"
)
arrow:SetPoint(
    "CENTER",
    frame,
    "TOP",
    0,
    -48
)
arrow:SetText(">")

local refundText = frame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontHighlightSmall"
)
refundText:SetPoint(
    "BOTTOM",
    frame,
    "BOTTOM",
    0,
    13
)
refundText:SetWidth(280)
refundText:SetJustifyH("CENTER")

--------------------------------------------------
-- Movement and Resizing
--------------------------------------------------

local lastMode = nil
local appliedX = nil
local appliedY = nil
local edges = {}

local resizeHint = frame:CreateTexture(nil, "OVERLAY")
resizeHint:SetTexture(
    "Interface\\\\ChatFrame\\\\UI-ChatIM-SizeGrabber-Up"
)
resizeHint:SetWidth(12)
resizeHint:SetHeight(12)
resizeHint:SetPoint(
    "BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4
)

local function SaveGeometry()
    if Tracker.GetOption("locked") then
        return
    end

    local centerX, centerY = frame:GetCenter()
    local parentX, parentY = UIParent:GetCenter()

    if centerX and parentX and centerY and parentY then
        local x = centerX - parentX
        local y = centerY - parentY
        appliedX = x
        appliedY = y

        Tracker.SaveGeometry(
            x,
            y,
            frame:GetWidth(),
            frame:GetHeight()
        )
    end
end

frame:SetScript(
    "OnDragStart",
    function()
        if not Tracker.GetOption("locked") then
            frame:StartMoving()
        end
    end
)

frame:SetScript(
    "OnDragStop",
    function()
        frame:StopMovingOrSizing()
        SaveGeometry()
    end
)

-- Eight edge/corner hit regions allow resizing similar to desktop windows.
local function CreateResizeEdge(
    direction,
    width,
    height,
    point,
    relativePoint,
    x,
    y
)
    local handle = CreateFrame("Frame", nil, frame)

    if direction == "TOP" or direction == "BOTTOM" then
        local leftPoint = "TOPLEFT"
        local rightPoint = "TOPRIGHT"

        if direction == "BOTTOM" then
            leftPoint = "BOTTOMLEFT"
            rightPoint = "BOTTOMRIGHT"
        end

        handle:SetPoint(
            leftPoint, frame, leftPoint, 12, 0
        )
        handle:SetPoint(
            rightPoint, frame, rightPoint, -12, 0
        )
        handle:SetHeight(height)
    elseif direction == "LEFT" or direction == "RIGHT" then
        local topPoint = "TOPLEFT"
        local bottomPoint = "BOTTOMLEFT"

        if direction == "RIGHT" then
            topPoint = "TOPRIGHT"
            bottomPoint = "BOTTOMRIGHT"
        end

        handle:SetPoint(
            topPoint, frame, topPoint, 0, -12
        )
        handle:SetPoint(
            bottomPoint, frame, bottomPoint, 0, 12
        )
        handle:SetWidth(width)
    else
        handle:SetWidth(width)
        handle:SetHeight(height)
        handle:SetPoint(
            point, frame, relativePoint, x, y
        )
    end

    handle:EnableMouse(true)
    handle.edge = direction

    handle:SetScript(
        "OnMouseDown",
        function()
            if not Tracker.GetOption("locked")
            and type(frame.StartSizing) == "function" then
                frame:StartSizing(this.edge)
            end
        end
    )

    handle:SetScript(
        "OnMouseUp",
        function()
            frame:StopMovingOrSizing()
            SaveGeometry()
        end
    )

    table.insert(edges, handle)
end

CreateResizeEdge("TOP", 75, 8, "TOP", "TOP", 0, 0)
CreateResizeEdge("BOTTOM", 75, 8, "BOTTOM", "BOTTOM", 0, 0)
CreateResizeEdge("LEFT", 8, 48, "LEFT", "LEFT", 0, 0)
CreateResizeEdge("RIGHT", 8, 48, "RIGHT", "RIGHT", 0, 0)
CreateResizeEdge("TOPLEFT", 12, 12, "TOPLEFT", "TOPLEFT", 0, 0)
CreateResizeEdge("TOPRIGHT", 12, 12, "TOPRIGHT", "TOPRIGHT", 0, 0)
CreateResizeEdge("BOTTOMLEFT", 12, 12, "BOTTOMLEFT", "BOTTOMLEFT", 0, 0)
CreateResizeEdge("BOTTOMRIGHT", 12, 12, "BOTTOMRIGHT", "BOTTOMRIGHT", 0, 0)

frame:SetScript(
    "OnHide",
    function()
        frame:StopMovingOrSizing()
    end
)

--------------------------------------------------
-- Appearance
--------------------------------------------------

local function SetDimensions(expanded)
    local width
    local height
    local minWidth
    local minHeight

    if expanded then
        width = Tracker.GetOption("expandedWidth") or 212
        height = Tracker.GetOption("expandedHeight") or 130
        minWidth = 170
        minHeight = 118
    else
        width = Tracker.GetOption("compactWidth") or 118
        height = Tracker.GetOption("compactHeight") or 112
        minWidth = 104
        minHeight = 112
    end

    if width < minWidth then
        width = minWidth
    end

    if height < minHeight then
        height = minHeight
    end

    if width > 360 then
        width = 360
    end
    if height > 240 then
        height = 240
    end

    if type(frame.SetMinResize) == "function" then
        frame:SetMinResize(minWidth, minHeight)
    end
    if type(frame.SetMaxResize) == "function" then
        frame:SetMaxResize(360, 240)
    end

    frame:SetWidth(width)
    frame:SetHeight(height)

    currentName:SetWidth(
        expanded and 94 or width - 16
    )

    if expanded then
        currentIcon:ClearAllPoints()
        currentIcon:SetPoint(
            "TOP",
            frame,
            "TOP",
            43,
            -30
        )
        previousIcon:Show()
        previousName:Show()
        arrow:Show()
    else
        currentIcon:ClearAllPoints()
        currentIcon:SetPoint(
            "TOP",
            frame,
            "TOP",
            0,
            -25
        )
        previousIcon:Hide()
        previousName:Hide()
        arrow:Hide()
    end
end

local function UpdateDisplay()
    local expanded = Tracker.GetOption("expanded")
    local locked = Tracker.GetOption("locked")

    if expanded ~= lastMode then
        lastMode = expanded
        SetDimensions(expanded)
    end

    local x = Tracker.GetOption("x") or 0
    local y = Tracker.GetOption("y") or -150

    if appliedX ~= x or appliedY ~= y then
        frame:ClearAllPoints()
        frame:SetPoint(
            "CENTER",
            UIParent,
            "CENTER",
            x,
            y
        )
        appliedX = x
        appliedY = y
    end

    frame:EnableMouse(not locked)

    if locked then
        resizeHint:Hide()
    else
        resizeHint:Show()
    end

    local i
    for i = 1, table.getn(edges) do
        edges[i]:EnableMouse(not locked)
    end

    local state = Tracker.GetState()
    local spells = PC.Data.HealingSpells or {}
    local current = state.last
    local previous = state.previous
    local fallback =
        "Interface\\Icons\\INV_Misc_QuestionMark"

    currentIcon:SetTexture(
        state.lastIcon
        or (current and spells[current] and spells[current].icon)
        or fallback
    )

    previousIcon:SetTexture(
        state.previousIcon
        or (previous and spells[previous] and spells[previous].icon)
        or fallback
    )

    currentName:SetText(current or "Waiting for heal")
    previousName:SetText(previous or "No previous heal")

    if Tracker.GetOption("showSpellName") then
        currentName:Show()
        if expanded then
            previousName:Show()
        end
    else
        currentName:Hide()
        previousName:Hide()
    end

    if Tracker.GetOption("showRefund") then
        refundText:Show()

        if not current or not previous then
            refundText:SetText("No previous heal")
            refundText:SetTextColor(0.70, 0.70, 0.70)
        elseif state.eligible then
            local percent = state.talentPoints * 15
            refundText:SetText(
                "Eligible: " .. tostring(percent) ..
                "% mana cost"
            )
            refundText:SetTextColor(0.30, 1.00, 0.30)
        else
            refundText:SetText("Same spell: no refund")
            refundText:SetTextColor(1.00, 0.48, 0.40)
        end
    else
        refundText:Hide()
    end

    local inCombat = false
    if type(UnitAffectingCombat) == "function" then
        inCombat = UnitAffectingCombat("player") and true or false
    end

    if Tracker.IsActive()
    and (Tracker.GetOption("outsideCombat") or inCombat) then
        frame:Show()
    else
        frame:Hide()
    end
end

Tracker.AddListener(UpdateDisplay)
UpdateDisplay()
