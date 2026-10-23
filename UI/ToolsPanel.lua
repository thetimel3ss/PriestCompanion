-- Priest Companion - Options > Tools
-- Mirrors the proven Options > Announcer layout: native sub-tabs
-- and independent scroll frames anchored directly to the page.
-- Existing controls and saved variables remain owned by their
-- original options modules; only their scroll-frame parents change.

local PC = PriestCompanion
local parent = PC.UI.OptionsContent
local assistantPanel = PC.UI.ResurrectionAssistantOptionsPanel
local trackerPanel = PC.UI.PrayerTrackerOptionsPanel
local assistantScroll = getfenv(0)["PriestCompanionAssistantOptionsScroll"]
local trackerScroll = getfenv(0)["PriestCompanionAdvancedScroll"]
if not parent or not assistantPanel or not trackerPanel
or not assistantScroll or not trackerScroll then
    return
end

local panel = CreateFrame("Frame", nil, parent)
panel:SetAllPoints(parent)
panel:Hide()
PC.UI.ToolsPanel = panel
panel.ActiveSubTab = "resurrection"

--------------------------------------------------
-- Native sub-tabs (same structure as Announcer)
--------------------------------------------------

local subTabs = CreateFrame(
    "Frame", "PriestCompanionUtilitySubTabs", panel
)
subTabs:SetPoint("TOPLEFT", panel, "TOPLEFT", 17, -7)
subTabs:SetWidth(370)
subTabs:SetHeight(22)

local function CreateToolTab(index, label, preceding, id)
    local button = CreateFrame(
        "Button", "PriestCompanionUtilitySubTabsTab" .. tostring(index),
        subTabs, "TabButtonTemplate"
    )
    button:SetText(label)
    button:SetHeight(22)
    button:RegisterForClicks("LeftButtonUp")
    PanelTemplates_TabResize(0, button)
    -- These long labels otherwise exceed the available Options width.
    button:SetWidth(174)
    button:ClearAllPoints()
    if preceding then
        button:SetPoint("LEFT", preceding, "RIGHT", 0, 0)
    else
        button:SetPoint("TOPLEFT", subTabs, "TOPLEFT", 0, 0)
    end
    button:SetScript("OnClick", function()
        panel.SelectSubTab(id)
        PlaySound("igMainMenuOptionCheckBoxOn")
    end)
    return button
end

local assistantTab = CreateToolTab(
    1, "Resurrection Assistant", nil, "resurrection"
)
CreateToolTab(2, "Book of Prayer Tracker", assistantTab, "tracker")
PanelTemplates_SetNumTabs(subTabs, 2)
PanelTemplates_SetTab(subTabs, 1)

--------------------------------------------------
-- Independent scrollable pages (same as Announcer)
--------------------------------------------------

-- The old approach nested two full-size page frames inside an
-- additional viewport. Reparent only the scroll frames directly
-- under Tools. The owner page frames remain for Refresh/OnHide
-- callbacks, which preserve preview cleanup and option behavior.
assistantScroll:SetParent(panel)
assistantScroll:ClearAllPoints()
assistantScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 8, -38)
assistantScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -29, 9)

trackerScroll:SetParent(panel)
trackerScroll:ClearAllPoints()
trackerScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 8, -38)
trackerScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -29, 9)

-- Ensure both scroll pages render above the Options background but
-- below the native sub-tabs, independent of their former parent levels.
assistantScroll:SetFrameLevel(panel:GetFrameLevel() + 1)
trackerScroll:SetFrameLevel(panel:GetFrameLevel() + 1)

-- Move logical owner frames without moving the visible scroll content.
assistantPanel:SetParent(panel)
assistantPanel:ClearAllPoints()
assistantPanel:SetAllPoints(panel)
trackerPanel:SetParent(panel)
trackerPanel:ClearAllPoints()
trackerPanel:SetAllPoints(panel)

assistantPanel:Hide()
trackerPanel:Hide()
assistantScroll:Hide()
trackerScroll:Hide()

-- Keep native tabs above the scroll frame, as in Announcer.
subTabs:SetFrameLevel(panel:GetFrameLevel() + 3)

function panel.SelectSubTab(id)
    if id ~= "tracker" then
        id = "resurrection"
    end
    panel.ActiveSubTab = id

    assistantScroll:Hide()
    trackerScroll:Hide()
    assistantPanel:Hide()
    trackerPanel:Hide()

    if id == "tracker" then
        trackerPanel:Show()
        trackerScroll:Show()
        PanelTemplates_SetTab(subTabs, 2)
        if type(trackerPanel.Refresh) == "function" then
            trackerPanel.Refresh()
        end
    else
        assistantPanel:Show()
        assistantScroll:Show()
        PanelTemplates_SetTab(subTabs, 1)
        if type(assistantPanel.Refresh) == "function" then
            assistantPanel.Refresh()
        end
    end
end

function panel.Refresh()
    panel.SelectSubTab(panel.ActiveSubTab)
end

panel:SetScript("OnShow", function()
    panel.Refresh()
end)

panel:SetScript("OnHide", function()
    -- Hide the visible scrolls explicitly: they are no longer
    -- children of their original logical owner frames.
    assistantScroll:Hide()
    trackerScroll:Hide()
    assistantPanel:Hide()
    trackerPanel:Hide()
end)
