-- Priest Companion
-- Main Frame

local PC = PriestCompanion

--------------------------------------------------
-- Layout
--------------------------------------------------

local FRAME_WIDTH = 520
local FRAME_HEIGHT = 480

--------------------------------------------------
-- Main Frame
--------------------------------------------------

local frame =
    CreateFrame(
        "Frame",
        "PriestCompanionMainFrame",
        UIParent
    )

frame:SetWidth(
    FRAME_WIDTH
)

frame:SetHeight(
    FRAME_HEIGHT
)

frame:SetPoint(
    "CENTER",
    UIParent,
    "CENTER",
    0,
    0
)

frame:SetFrameStrata(
    "DIALOG"
)

frame:SetBackdrop({
    bgFile =
        "Interface\\DialogFrame\\UI-DialogBox-Background",

    edgeFile =
        "Interface\\DialogFrame\\UI-DialogBox-Border",

    tile = true,
    tileSize = 32,
    edgeSize = 32,

    insets = {
        left = 11,
        right = 12,
        top = 12,
        bottom = 11
    }
})

frame:SetMovable(true)
frame:EnableMouse(true)

frame:RegisterForDrag(
    "LeftButton"
)

frame:SetScript(
    "OnDragStart",
    function()
        this:StartMoving()
    end
)

frame:SetScript(
    "OnDragStop",
    function()
        this:StopMovingOrSizing()
    end
)

frame:Hide()

PC.UI.MainFrame = frame

--------------------------------------------------
-- Title
--------------------------------------------------

local title =
    frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

title:SetPoint(
    "TOP",
    frame,
    "TOP",
    0,
    -18
)

title:SetText(
    "Priest Companion"
)

--------------------------------------------------
-- Close Button
--------------------------------------------------

local closeButton =
    CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelCloseButton"
    )

closeButton:SetPoint(
    "TOPRIGHT",
    frame,
    "TOPRIGHT",
    -5,
    -5
)

closeButton:SetScript(
    "OnClick",
    function()
        this:GetParent():Hide()
    end
)

--------------------------------------------------
-- ESC closes the window
--------------------------------------------------

table.insert(
    UISpecialFrames,
    "PriestCompanionMainFrame"
)
