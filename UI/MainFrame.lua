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


--------------------------------------------------
-- Main Navigation
--------------------------------------------------

-- The tabs belong to the main frame; content panels are created by
-- their own files later in the TOC load order.
PC.UI.ActiveTab = "wands"

local tabButtons = {}

local function CreateTab(id, label, x, width)
    local button = CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelButtonTemplate"
    )

    button:SetWidth(width)
    button:SetHeight(22)
    button:SetPoint(
        "TOPLEFT",
        frame,
        "TOPLEFT",
        x,
        -31
    )
    button:SetText(label)

    button:SetScript(
        "OnClick",
        function()
            PC.UI.SelectTab(id)
        end
    )

    tabButtons[id] = button
end

CreateTab("wands", "Wands", 29, 104)
CreateTab("environment", "Environment", 138, 122)

--------------------------------------------------
-- Tab Selection
--------------------------------------------------

function PC.UI.SelectTab(id, resetScroll)
    if id ~= "environment" then
        id = "wands"
    end

    PC.UI.ActiveTab = id

    -- The item details are a sub-view of Wand Progression.
    -- Switching top-level tabs closes that sub-view first.
    if PC.UI.SourceDetails
    and type(PC.UI.SourceDetails.Hide) == "function" then
        PC.UI.SourceDetails.Hide()
    end

    if PC.UI.SourceTooltip
    and type(PC.UI.SourceTooltip.Hide) == "function" then
        PC.UI.SourceTooltip.Hide()
    end

    if GameTooltip then
        GameTooltip:Hide()
    end

    local wandPanel = PC.UI.WandPanel
    local environmentPanel = PC.UI.EnvironmentPanel

    if id == "environment" then
        if wandPanel then
            wandPanel:Hide()
        end

        if environmentPanel then
            environmentPanel:Show()

            if type(environmentPanel.Refresh) == "function" then
                environmentPanel.Refresh()
            end
        end
    else
        if environmentPanel then
            environmentPanel:Hide()
        end

        if wandPanel then
            wandPanel:Show()

            if type(wandPanel.Refresh) == "function" then
                wandPanel.Refresh(resetScroll)
            end
        end
    end

    local tabID
    local button

    for tabID, button in pairs(tabButtons) do
        if tabID == id then
            button:SetAlpha(1)

            if button.LockHighlight then
                button:LockHighlight()
            end
        else
            button:SetAlpha(0.70)

            if button.UnlockHighlight then
                button:UnlockHighlight()
            end
        end
    end
end

function PC.UI.OpenTab(id)
    if frame:IsShown() then
        PC.UI.SelectTab(id)
    else
        PC.UI.ActiveTab = id
        frame:Show()
    end
end

frame:SetScript(
    "OnShow",
    function()
        PC.UI.SelectTab(
            PC.UI.ActiveTab,
            true
        )
    end
)
