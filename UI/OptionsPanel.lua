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
local advancedTab = CreateSectionTab(
    "advanced", "Advanced", 2, generalTab
)
CreateSectionTab("mods", "Mods", 3, advancedTab)

PanelTemplates_SetNumTabs(panel, 3)

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

local prayer = PC.Modules.PrayerTracker

local advancedScroll = CreateFrame(
    "ScrollFrame",
    "PriestCompanionAdvancedScroll",
    advanced,
    "UIPanelScrollFrameTemplate"
)
advancedScroll:SetPoint(
    "TOPLEFT", advanced, "TOPLEFT", 8, -10
)
advancedScroll:SetPoint(
    "BOTTOMRIGHT", advanced, "BOTTOMRIGHT", -29, 9
)

local advancedChild = CreateFrame(
    "Frame", nil, advancedScroll
)
advancedChild:SetWidth(388)
advancedChild:SetHeight(500)
advancedScroll:SetScrollChild(advancedChild)

CreateLabel(
    advancedChild,
    "Book of Prayer Tracker",
    14, -12, 360,
    "GameFontNormal"
)

local talentStatus = CreateLabel(
    advancedChild, "", 14, -40, 350
)

local requiredNote = CreateLabel(
    advancedChild, "", 183, -72, 195
)
requiredNote:SetTextColor(1, 0.32, 0.32)

local checkboxes = {}
local checkboxNames = {}
local checkboxIndex = 0

local function AddPrayerCheckbox(key, text, y)
    checkboxIndex = checkboxIndex + 1

    local button = CreateFrame(
        "CheckButton",
        "PriestCompanionPrayerOption" ..
            tostring(checkboxIndex),
        advancedChild,
        "UICheckButtonTemplate"
    )

    button:SetWidth(24)
    button:SetHeight(24)
    button:SetPoint(
        "TOPLEFT", advancedChild, "TOPLEFT", 16, -y
    )

    local caption = advancedChild:CreateFontString(
        nil, "OVERLAY", "GameFontHighlightSmall"
    )
    caption:SetPoint(
        "LEFT", button, "RIGHT", 4, 0
    )
    caption:SetWidth(328)
    caption:SetJustifyH("LEFT")
    caption:SetText(text)

    button:SetScript(
        "OnClick",
        function()
            if prayer then
                prayer.SetOption(
                    key,
                    this:GetChecked() == 1
                        or this:GetChecked() == true
                )
            end
            advanced.Refresh()
        end
    )

    checkboxes[key] = button
    checkboxNames[key] = caption
    return button
end

AddPrayerCheckbox("enabled", "Enable Tracker", 66)
AddPrayerCheckbox("expanded", "Expanded mode (previous heal)", 96)
AddPrayerCheckbox("showSpellName", "Show spell name", 126)
AddPrayerCheckbox("showRefund", "Show refund status (border color)", 156)
AddPrayerCheckbox("outsideCombat", "Show outside combat", 186)
AddPrayerCheckbox("locked", "Lock position and size", 216)

CreateLabel(
    advancedChild,
    "Unlocked: drag the tracker to move it; drag any edge or " ..
        "corner to resize. Lock also prevents resizing.",
    15, -250, 345
)

CreateLabel(
    advancedChild,
    "Border: green when switching heals, red when repeating. " ..
        "Neutral until two qualifying casts are known.",
    15, -285, 345,
    "GameFontDisableSmall"
)

local lastHealLabel = CreateLabel(
    advancedChild,
    "Last confirmed heal: none yet",
    15, -312, 355,
    "GameFontDisableSmall"
)

CreateLabel(
    advancedChild,
    "Quest History Diagnostics",
    14, -338, 355,
    "GameFontNormal"
)

local turnInLabel = CreateLabel(
    advancedChild, "", 16, -367, 355
)
local serverLabel = CreateLabel(
    advancedChild, "", 16, -392, 355
)

CreateLabel(
    advancedChild,
    "Registering an event does not prove its delivery. " ..
        "Unknown quest completion remains unknown.",
    16, -430, 345,
    "GameFontDisableSmall"
)

function advanced.Refresh()
    if prayer then
        local points = prayer.GetTalentPoints()
        local found = prayer.IsTalentFound()
        local provider = prayer.GetProvider()
        local label

        if found then
            label = "Book of Prayer: " ..
                tostring(points) .. "/2"
        else
            label = "Book of Prayer: unavailable"
        end

        if provider == "unavailable" then
            label = label .. "  |  Cast event unavailable"
        else
            label = label .. "  |  " .. provider
        end

        talentStatus:SetText(label)

        local state = prayer.GetState()
        if state.last then
            lastHealLabel:SetText(
                "Last confirmed heal: " .. state.last
            )
        else
            lastHealLabel:SetText(
                "Last confirmed heal: none yet"
            )
        end

        local key
        local button
        for key, button in pairs(checkboxes) do
            local checked = prayer.GetOption(key)
            if key == "enabled" and points < 1 then
                checked = false
            end
            button:SetChecked(checked and 1 or nil)
        end

        if points < 1 then
            checkboxes.enabled:Disable()
            checkboxNames.enabled:SetTextColor(1, 0.32, 0.32)

            if found then
                requiredNote:SetText(
                    "* Talent point required"
                )
            else
                requiredNote:SetText(
                    "* Talent not found"
                )
            end
        else
            checkboxes.enabled:Enable()
            checkboxNames.enabled:SetTextColor(1, 0.82, 0.20)
            requiredNote:SetText("")
        end
    end

    local caps = PC.Capabilities or {}
    local history = PC.QuestHistory
    local eventStatus = "Unavailable"

    if caps.questTurnInEvent then
        eventStatus = "Not registered"
        if history and history.LiveTurnInRegistered == true then
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
                serverStatus = "Unavailable (" ..
                    tostring(state.unavailableReason) .. ")"
            elseif state.active then
                serverStatus = "Waiting for response"
            elseif state.responded then
                serverStatus = "Responded (" ..
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

if prayer then
    prayer.AddListener(
        function()
            if advanced:IsShown() then
                advanced.Refresh()
            end
        end
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

    -- Blizzard handles selected textures, widths and border joins.
    if id == "advanced" then
        PanelTemplates_SetTab(panel, 2)
    elseif id == "mods" then
        PanelTemplates_SetTab(panel, 3)
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

-- The Mods content is added by UI/EnvironmentPanel.lua later in the TOC.
general:Hide()
advanced:Hide()
