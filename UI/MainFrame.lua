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
-- Native Main Tabs
--------------------------------------------------

-- CharacterFrameTabButtonTemplate matches the main tabs used by
-- Puppeteer and the Blizzard character frame on Vanilla 1.12.
PC.UI.ActiveTab = "wands"

local tabButtons = {}

local function CreateMainTab(id, label, x, width)
    local tab = CreateFrame(
        "Button",
        nil,
        frame,
        "CharacterFrameTabButtonTemplate"
    )

    tab:SetWidth(width)
    tab:SetHeight(30)
    tab:SetPoint(
        "TOPLEFT",
        frame,
        "BOTTOMLEFT",
        x,
        11
    )
    tab:SetText(label)

    tab:SetScript(
        "OnClick",
        function()
            PC.UI.SelectTab(id)
        end
    )

    tabButtons[id] = tab
end

CreateMainTab("wands", "Wands", 24, 105)
CreateMainTab("options", "Options", 135, 110)

--------------------------------------------------
-- Top-Level Navigation
--------------------------------------------------

function PC.UI.SelectTab(id, resetScroll, section)
    if id ~= "options" then
        id = "wands"
    end

    PC.UI.ActiveTab = id

    -- Source Details is a sub-view of Wands; never leave it
    -- covering Options when navigating between main tabs.
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
    local optionsPanel = PC.UI.OptionsPanel

    if id == "options" then
        if wandPanel then
            wandPanel:Hide()
        end

        if optionsPanel then
            optionsPanel:Show()

            if section
            and type(optionsPanel.SelectSection) == "function" then
                optionsPanel.SelectSection(section)
            elseif type(optionsPanel.Refresh) == "function" then
                optionsPanel.Refresh()
            end
        end
    else
        if optionsPanel then
            optionsPanel:Hide()
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
        -- Native tab templates render their disabled state as selected.
        button:SetEnabled(tabID ~= id)
    end
end

function PC.UI.OpenTab(id, section)
    if id ~= "options" then
        id = "wands"
    end

    if id == "options"
    and section
    and PC.UI.OptionsPanel then
        PC.UI.OptionsPanel.ActiveSection = section
    end

    if frame:IsShown() then
        PC.UI.SelectTab(id, nil, section)
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
