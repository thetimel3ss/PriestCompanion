-- Priest Companion - Options > Tools
-- Class utilities: Resurrection Assistant and Book of Prayer Tracker.
-- Options > Announcer owns notifications and chat messages separately.

local PC = PriestCompanion
local parent = PC.UI.OptionsContent
local assistantPanel = PC.UI.ResurrectionAssistantOptionsPanel
local trackerPanel = PC.UI.PrayerTrackerOptionsPanel
if not parent or not assistantPanel or not trackerPanel then return end

local panel = CreateFrame("Frame", nil, parent)
panel:SetAllPoints(parent)
panel:Hide()
PC.UI.ToolsPanel = panel
panel.ActiveSubTab = "resurrection"

-- Reserve the first 32 pixels for the sub-tabs and constrain both
-- page viewports to the remaining Options content area. Previously
-- the pages were stretched across the whole Tools frame; their
-- scroll views could overlap the header and appear outside the
-- intended content area on some client scales.
local viewport = CreateFrame("Frame", nil, panel)
viewport:SetPoint("TOPLEFT", panel, "TOPLEFT", 0, -32)
viewport:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", 0, 0)

-- Reuse the existing options controls and their saved-variable keys.
assistantPanel:SetParent(viewport)
assistantPanel:ClearAllPoints()
assistantPanel:SetAllPoints(viewport)
trackerPanel:SetParent(viewport)
trackerPanel:ClearAllPoints()
trackerPanel:SetAllPoints(viewport)
assistantPanel:Hide()
trackerPanel:Hide()

local subTabs = CreateFrame(
    "Frame", "PriestCompanionUtilitySubTabs", panel
)
subTabs:SetPoint("TOPLEFT", panel, "TOPLEFT", 17, -7)
subTabs:SetWidth(370)
subTabs:SetHeight(22)
subTabs:SetFrameLevel(viewport:GetFrameLevel() + 4)

local function MakeTab(index, text, previous, id)
    local button = CreateFrame(
        "Button", "PriestCompanionUtilitySubTabsTab" .. index,
        subTabs, "TabButtonTemplate"
    )
    button:SetText(text)
    button:SetHeight(22)
    button:RegisterForClicks("LeftButtonUp")
    PanelTemplates_TabResize(0, button)
    -- Fixed, equal widths keep both lengthy names within Options.
    -- The native template otherwise expands each tab independently.
    button:SetWidth(174)
    button:ClearAllPoints()
    if previous then
        button:SetPoint("LEFT", previous, "RIGHT", 0, 0)
    else
        button:SetPoint("TOPLEFT", subTabs, "TOPLEFT", 0, 0)
    end
    button:SetScript("OnClick", function()
        panel.SelectSubTab(id)
        PlaySound("igMainMenuOptionCheckBoxOn")
    end)
    return button
end

local assistantTab = MakeTab(
    1, "Resurrection Assistant", nil, "resurrection"
)
MakeTab(2, "Book of Prayer Tracker", assistantTab, "tracker")
PanelTemplates_SetNumTabs(subTabs, 2)
PanelTemplates_SetTab(subTabs, 1)

function panel.SelectSubTab(id)
    if id ~= "tracker" then id = "resurrection" end
    panel.ActiveSubTab = id
    assistantPanel:Hide()
    trackerPanel:Hide()

    local selected
    if id == "tracker" then
        selected = trackerPanel
        PanelTemplates_SetTab(subTabs, 2)
    else
        selected = assistantPanel
        PanelTemplates_SetTab(subTabs, 1)
    end
    selected:Show()
    if type(selected.Refresh) == "function" then
        selected.Refresh()
    end
end

function panel.Refresh()
    panel.SelectSubTab(panel.ActiveSubTab)
end

panel:SetScript("OnShow", function()
    panel.Refresh()
end)
panel:SetScript("OnHide", function()
    -- Explicitly hide active pages, triggering both preview cleanup
    -- handlers even when the user changes a parent Options tab.
    assistantPanel:Hide()
    trackerPanel:Hide()
end)
