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

panel:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4
    }
})

panel:SetBackdropColor(0.03, 0.03, 0.03, 0.96)
panel:SetBackdropBorderColor(0.30, 0.30, 0.30, 1)
panel:Hide()

PC.UI.OptionsPanel = panel
panel.ActiveSection = "general"

local header = panel:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontNormal"
)

header:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -14)
header:SetText("Options")

--------------------------------------------------
-- Secondary Tabs
--------------------------------------------------

local sectionButtons = {}

local function CreateSectionTab(id, label, x, width, index)
    local button = CreateFrame(
        "Button",
        "PriestCompanionOptionsPanelTab" .. tostring(index),
        panel,
        "TabButtonTemplate"
    )

    button:SetWidth(width)
    button:SetHeight(22)
    button:SetPoint(
        "TOPLEFT",
        panel,
        "TOPLEFT",
        x,
        -40
    )

    button:SetText(label)

    button:SetScript(
        "OnClick",
        function()
            panel.SelectSection(id)
        end
    )

    sectionButtons[id] = button
end

CreateSectionTab("general", "General", 17, 98, 1)
CreateSectionTab("advanced", "Advanced", 120, 110, 2)
CreateSectionTab("mods", "Mods", 235, 85, 3)

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
    -72
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
    "The Wands tab contains item progression and acquisition details.",
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
    "Advanced contains diagnostic status for quest history.",
    18,
    -213,
    385
)

function general.Refresh()
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
-- Advanced Content
--------------------------------------------------

local advanced = CreateFrame("Frame", nil, content)
advanced:SetAllPoints(content)

CreateLabel(
    advanced,
    "Advanced Diagnostics",
    15,
    -18,
    390,
    "GameFontNormal"
)

CreateLabel(
    advanced,
    "Quest history and experimental integration status (read-only).",
    18,
    -51,
    380
)

local turnInLabel = CreateLabel(
    advanced,
    "",
    18,
    -100,
    400
)

local serverLabel = CreateLabel(
    advanced,
    "",
    18,
    -127,
    400
)

CreateLabel(
    advanced,
    "Registering an event does not prove that the client has delivered it.",
    18,
    -174,
    385
)

CreateLabel(
    advanced,
    "Unknown quest completion is never treated as proof of non-completion.",
    18,
    -212,
    385
)

function advanced.Refresh()
    local caps = PC.Capabilities or {}
    local history = PC.QuestHistory

    local eventStatus = "Unavailable"

    if caps.questTurnInEvent then
        eventStatus = "Not registered"

        if history
        and history.LiveTurnInRegistered == true then
            eventStatus = "Registered (delivery unverified)"
        end
    end

    turnInLabel:SetText(
        "QUEST_TURNED_IN: " .. eventStatus
    )

    local serverStatus = "Not queried"

    if history
    and type(history.GetServerQueryState) == "function" then
        local state = history.GetServerQueryState()

        if state then
            if state.unavailableReason then
                serverStatus =
                    "Unavailable (" ..
                    tostring(state.unavailableReason) ..
                    ")"
            elseif state.active then
                serverStatus = "Waiting for response"
            elseif state.responded then
                serverStatus =
                    "Responded (" ..
                    tostring(state.received or 0) ..
                    " IDs processed)"
            elseif state.attempted then
                serverStatus = "No response"
            end
        end
    end

    serverLabel:SetText(
        "Server Query: " .. serverStatus
    )
end

--------------------------------------------------
-- Page Switching
--------------------------------------------------

function panel.SelectSection(id)
    if id ~= "advanced"
    and id ~= "mods" then
        id = "general"
    end

    panel.ActiveSection = id

    general:Hide()
    advanced:Hide()

    local mods = PC.UI.EnvironmentPanel

    if mods then
        mods:Hide()
    end

    local selected = nil

    if id == "general" then
        selected = general
    elseif id == "advanced" then
        selected = advanced
    else
        selected = mods
    end

    if selected then
        selected:Show()

        if type(selected.Refresh) == "function" then
            selected.Refresh()
        end
    end

    local sectionID
    local button

    for sectionID, button in pairs(sectionButtons) do
        button:SetEnabled(sectionID ~= id)
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

-- The Mods content is added by UI/EnvironmentPanel.lua later in the TOC.
general:Hide()
advanced:Hide()
