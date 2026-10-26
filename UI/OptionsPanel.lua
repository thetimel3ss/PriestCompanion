-- Priest Companion
-- Options Panel
-- Native Vanilla tabs inspired by Puppeteer's settings navigation.

local PC = PriestCompanion
local mainFrame = PC.UI.MainFrame

if not mainFrame then
    return
end

--------------------------------------------------
-- Options Container
--------------------------------------------------

local panel = CreateFrame(
    "Frame",
    "PriestCompanionOptionsPanel",
    mainFrame
)

panel:SetPoint(
    "TOPLEFT",
    mainFrame,
    "TOPLEFT",
    25,
    -55
)

panel:SetPoint(
    "BOTTOMRIGHT",
    mainFrame,
    "BOTTOMRIGHT",
    -25,
    25
)

-- The parent is transparent: the tabbed inner frame owns the
-- single border, just like Puppeteer's Options panel.
panel:Hide()

PC.UI.OptionsPanel = panel
panel.ActiveSection = "general"

--------------------------------------------------
-- Secondary Tabs
--------------------------------------------------

local sectionButtons = {}

local function CreateSectionTab(id, label, index, previous)
    local button = CreateFrame(
        "Button",
        "PriestCompanionOptionsPanelTab" .. tostring(index),
        panel,
        "TabButtonTemplate"
    )

    button:SetText(label)
    button:SetHeight(22)
    button:RegisterForClicks("LeftButtonUp")
    PanelTemplates_TabResize(0, button)
    button:ClearAllPoints()

    if previous then
        button:SetPoint("LEFT", previous, "RIGHT", 0, 0)
    else
        -- The buttons sit directly on the inner content border.
        -- Inner content top is 28px from panel top.
        button:SetPoint(
            "TOPLEFT",
            panel,
            "TOPLEFT",
            15,
            -6
        )
    end

    button:SetScript(
        "OnClick",
        function()
            panel.SelectSection(id)
            PlaySound("igMainMenuOptionCheckBoxOn")
        end
    )

    sectionButtons[id] = button
    return button
end

local generalTab = CreateSectionTab("general", "General", 1)
local announcerTab = CreateSectionTab(
    "announcer", "Announcer", 2, generalTab
)
local toolsTab = CreateSectionTab(
    "tools", "Tools", 3, announcerTab
)
CreateSectionTab("mods", "Mods", 4, toolsTab)

PanelTemplates_SetNumTabs(panel, 4)

--------------------------------------------------
-- Shared Content Background
--------------------------------------------------

local content = CreateFrame(
    "Frame",
    nil,
    panel
)

content:SetPoint(
    "TOPLEFT",
    panel,
    "TOPLEFT",
    10,
    -28
)

content:SetPoint(
    "BOTTOMRIGHT",
    panel,
    "BOTTOMRIGHT",
    -10,
    12
)

content:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 11,
    edgeSize = 11,
    insets = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4
    }
})

content:SetBackdropColor(0.09, 0.09, 0.19, 0.94)
content:SetBackdropBorderColor(0.58, 0.58, 0.65, 1)

PC.UI.OptionsContent = content

-- Keep the tab textures above the content frame border.
local sectionID
local tabButton
for sectionID, tabButton in pairs(sectionButtons) do
    tabButton:SetFrameLevel(content:GetFrameLevel() + 2)
end

--------------------------------------------------
-- General Content
--------------------------------------------------

local general = CreateFrame("Frame", nil, content)
general:SetAllPoints(content)

local function CreateLabel(parent, text, x, y, width, font)
    local label = parent:CreateFontString(
        nil,
        "OVERLAY",
        font or "GameFontHighlightSmall"
    )

    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    label:SetWidth(width)
    label:SetJustifyH("LEFT")
    label:SetText(text)

    return label
end

CreateLabel(
    general,
    "Priest Companion",
    15,
    -18,
    380,
    "GameFontNormal"
)

local versionLabel = CreateLabel(
    general,
    "Addon Version",
    18,
    -61,
    390
)

local flavorLabel = CreateLabel(
    general,
    "Client Flavor",
    18,
    -86,
    390
)

CreateLabel(
    general,
    "Guides currently contains Wand Progression and acquisition details.",
    18,
    -137,
    385
)

CreateLabel(
    general,
    "Use Mods to inspect optional client extensions and compatibility.",
    18,
    -175,
    385
)

CreateLabel(
    general,
    "Tools contains Resurrection Assistant and Book of Prayer Tracker.",
    18,
    -213,
    385
)

CreateLabel(
    general,
    "Announcer contains Fear Ward and Resurrection announcements.",
    18,
    -250,
    385
)

-- Account-wide launcher visibility; independent from module Enable settings.
local minimapBox = CreateFrame("CheckButton", "PriestCompanionMinimapVisible",
    general, "UICheckButtonTemplate")
minimapBox:SetWidth(24)
minimapBox:SetHeight(24)
minimapBox:SetPoint("TOPLEFT", general, "TOPLEFT", 14, -290)
local minimapLabel = CreateLabel(general, "Show minimap button", 44, -295, 220)
minimapBox:SetScript("OnClick", function()
    local launcher = PC.UI.MinimapButton
    if launcher then
        launcher.SetShownOption(this:GetChecked() == 1 or this:GetChecked() == true)
    end
end)
local minimapReset = CreateFrame("Button", "PriestCompanionMinimapReset",
    general, "UIPanelButtonTemplate")
minimapReset:SetWidth(170)
minimapReset:SetHeight(23)
minimapReset:SetPoint("TOPLEFT", general, "TOPLEFT", 18, -326)
minimapReset:SetText("Reset minimap position")
minimapReset:SetScript("OnClick", function()
    local launcher = PC.UI.MinimapButton
    if launcher then launcher.ResetPosition() end
end)

function general.Refresh()
    local launcher = PC.UI.MinimapButton
    minimapBox:SetChecked((not launcher or launcher.GetShownOption()) and 1 or nil)
    versionLabel:SetText(
        "Addon Version: " ..
        tostring(PC.version or "unknown")
    )

    flavorLabel:SetText(
        "Client Flavor: " ..
        tostring(
            (PC.Environment and PC.Environment.flavor)
            or "unknown"
        )
    )
end

--------------------------------------------------
-- Page Switching
--------------------------------------------------

function panel.SelectSection(id)
    -- Compatibility for old callers that opened Options > Tracker.
    -- The Tracker page is now nested below Options > Tools.
    if id == "advanced" or id == "tracker" then
        id = "tools"
        local toolPanel = PC.UI.ToolsPanel
        if toolPanel then toolPanel.ActiveSubTab = "tracker" end
    end

    if id ~= "announcer" and id ~= "tools"
    and id ~= "mods" then
        id = "general"
    end
    panel.ActiveSection = id

    general:Hide()

    local mods = PC.UI.EnvironmentPanel
    local announcer = PC.UI.AnnouncerPanel
    local tools = PC.UI.ToolsPanel
    if mods then mods:Hide() end
    if announcer then announcer:Hide() end
    if tools then tools:Hide() end

    local selected
    if id == "general" then
        selected = general
    elseif id == "announcer" then
        selected = announcer
    elseif id == "tools" then
        selected = tools
    else
        selected = mods
    end
    if selected then
        selected:Show()
        if type(selected.Refresh) == "function" then
            selected.Refresh()
        end
    end

    if id == "announcer" then
        PanelTemplates_SetTab(panel, 2)
    elseif id == "tools" then
        PanelTemplates_SetTab(panel, 3)
    elseif id == "mods" then
        PanelTemplates_SetTab(panel, 4)
    else
        PanelTemplates_SetTab(panel, 1)
    end
end

function panel.Refresh()
    panel.SelectSection(panel.ActiveSection)
end

panel:SetScript(
    "OnShow",
    function()
        panel.Refresh()
    end
)

-- Mods and Tools content are attached by their UI files later in the TOC.
general:Hide()
