-- Priest Companion - Options > Tools.
-- Match Announcer: native sub-tabs, two ScrollFrames born under this panel.

local PC = PriestCompanion
local parent = PC.UI.OptionsContent
if not parent then return end

local panel = CreateFrame("Frame", nil, parent)
panel:SetAllPoints(parent)
panel:Hide()
PC.UI.ToolsPanel = panel
panel.ActiveSubTab = "resurrection"

--------------------------------------------------
-- Native sub-tabs
--------------------------------------------------

local subTabs = CreateFrame(
    "Frame", "PriestCompanionUtilitySubTabs", panel
)
subTabs:SetPoint("TOPLEFT", panel, "TOPLEFT", 17, -7)
subTabs:SetWidth(410)
subTabs:SetHeight(22)

local function CreateToolTab(index, label, previous, id)
    local button = CreateFrame(
        "Button", "PriestCompanionUtilitySubTabsTab" .. tostring(index),
        subTabs, "TabButtonTemplate"
    )
    button:SetText(label)
    button:SetHeight(22)
    button:RegisterForClicks("LeftButtonUp")
    -- Native sizing updates the text width and matching border art.
    PanelTemplates_TabResize(0, button)
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

local assistantTab = CreateToolTab(
    1, "Resurrection Assistant", nil, "resurrection"
)
local trackerTab = CreateToolTab(
    2, "Book of Prayer Tracker", assistantTab, "tracker"
)
-- A client/font with unusually wide native tabs gets shorter titles;
-- never force SetWidth after PanelTemplates_TabResize.
if assistantTab:GetWidth() + trackerTab:GetWidth() > 410 then
    trackerTab:SetText("Book of Prayer")
    PanelTemplates_TabResize(0, trackerTab)
end
if assistantTab:GetWidth() + trackerTab:GetWidth() > 410 then
    assistantTab:SetText("Resurrection")
    PanelTemplates_TabResize(0, assistantTab)
end
PanelTemplates_SetNumTabs(subTabs, 2)
PanelTemplates_SetTab(subTabs, 1)

--------------------------------------------------
-- Independent scrollable pages (identical to Announcer)
--------------------------------------------------

local function CreateToolScroll(name, height)
    local frame = CreateFrame(
        "ScrollFrame", name, panel, "UIPanelScrollFrameTemplate"
    )
    frame:SetPoint("TOPLEFT", panel, "TOPLEFT", 8, -38)
    frame:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -29, 9)

    local content = CreateFrame("Frame", nil, frame)
    content:SetWidth(388)
    content:SetHeight(height)
    frame:SetScrollChild(content)
    return frame, content
end

local assistantScroll, assistantChild = CreateToolScroll(
    "PriestCompanionAssistantOptionsScroll", 445
)
local trackerScroll, trackerChild = CreateToolScroll(
    "PriestCompanionAdvancedScroll", 505
)
trackerScroll:Hide()

PC.UI.ResurrectionAssistantOptionsPanel = assistantScroll
PC.UI.PrayerTrackerOptionsPanel = trackerScroll
PC.UI.ToolsAssistantContent = assistantChild
PC.UI.ToolsTrackerContent = trackerChild

function panel.SelectSubTab(id)
    if id ~= "tracker" then id = "resurrection" end
    panel.ActiveSubTab = id

    if id == "tracker" then
        assistantScroll:Hide()
        trackerScroll:Show()
        PanelTemplates_SetTab(subTabs, 2)
        if type(trackerScroll.Refresh) == "function" then
            trackerScroll.Refresh()
        end
    else
        trackerScroll:Hide()
        assistantScroll:Show()
        PanelTemplates_SetTab(subTabs, 1)
        if type(assistantScroll.Refresh) == "function" then
            assistantScroll.Refresh()
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
    -- Inactive scroll pages run their own Preview cleanup handlers.
    assistantScroll:Hide()
    trackerScroll:Hide()
end)
