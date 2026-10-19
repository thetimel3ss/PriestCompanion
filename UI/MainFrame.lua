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
-- Decorated Title (Vanilla dialog header)
--------------------------------------------------

-- Match the compact title plaque used in Puppeteer's settings frame.
-- The full 256x64 atlas has large transparent sides; crop the plaque.
local titleFrame = CreateFrame("Frame", nil, frame)
titleFrame:SetWidth(190)
titleFrame:SetHeight(38)
titleFrame:SetPoint("TOP", frame, "TOP", 0, 12)

local titleTexture = titleFrame:CreateTexture(nil, "ARTWORK")
titleTexture:SetTexture(
    "Interface\\DialogFrame\\UI-DialogBox-Header"
)
titleTexture:SetTexCoord(
    58 / 256,
    197 / 256,
    0,
    40 / 64
)
titleTexture:SetAllPoints(titleFrame)

local title = titleFrame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontNormal"
)
title:SetPoint("CENTER", titleFrame, "CENTER", 0, 0)
title:SetText("Priest Companion")

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
-- Initial window state after login; later tab choices persist until reload.
PC.UI.ActiveTab = "options"

local tabButtons = {}

local function CreateMainTab(id, label, index, previous)
    local tab = CreateFrame(
        "Button",
        "PriestCompanionMainFrameTab" .. tostring(index),
        frame,
        "CharacterFrameTabButtonTemplate"
    )

    tab:SetText(label)
    tab:RegisterForClicks("LeftButtonUp")

    -- Let FrameXML calculate the proper border and text width.
    PanelTemplates_TabResize(0, tab)

    tab:ClearAllPoints()

    if previous then
        tab:SetPoint(
            "LEFT",
            previous,
            "RIGHT",
            0,
            0
        )
    else
        -- Same bottom-tab anchor used by Puppeteer's TabFrame.
        tab:SetPoint(
            "TOPLEFT",
            frame,
            "BOTTOMLEFT",
            0,
            6
        )
    end

    tab:SetScript(
        "OnClick",
        function()
            PC.UI.SelectTab(id)
            PlaySound("igMainMenuOptionCheckBoxOn")
        end
    )

    tabButtons[id] = tab
    return tab
end

local wandsTab = CreateMainTab("wands", "Wands", 1)
CreateMainTab("options", "Options", 2, wandsTab)

-- The Blizzard tab controller manages active/pressed visuals,
-- including left/middle/right textures and disabled states.
PanelTemplates_SetNumTabs(frame, 2)

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

    -- Do not merely Enable/Disable; FrameXML updates the pressed
    -- textures and border join for both main tabs.
    if id == "options" then
        PanelTemplates_SetTab(frame, 2)
    else
        PanelTemplates_SetTab(frame, 1)
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
