-- Native Vanilla minimap launcher; no optional libraries required.
local PC = PriestCompanion
if not Minimap then return end

local button = CreateFrame("Button", "PriestCompanionMinimapButton", Minimap)
PC.UI.MinimapButton = button
button:SetWidth(32)
button:SetHeight(32)
button:SetFrameStrata("MEDIUM")
button:SetFrameLevel(Minimap:GetFrameLevel() + 8)
button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
button:RegisterForDrag("LeftButton")
button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
button:Hide()

local icon = button:CreateTexture(nil, "BACKGROUND")
icon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
-- Priest cell from the class atlas available in the Vanilla client.
icon:SetTexCoord(0.5, 0.75, 0.25, 0.5)
icon:SetWidth(20)
icon:SetHeight(20)
icon:SetPoint("CENTER", button, "CENTER", 0, 1)
local border = button:CreateTexture(nil, "OVERLAY")
border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
border:SetWidth(54)
border:SetHeight(54)
border:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)

local settings
local directionX, directionY = -0.70710678, -0.70710678
local dragging = false
local suppressClick = false

local function Position()
    button:ClearAllPoints()
    button:SetPoint("CENTER", Minimap, "CENTER",
        directionX * (Minimap:GetWidth() / 2 + 8),
        directionY * (Minimap:GetHeight() / 2 + 8))
end

local function StopDragging()
    if not dragging then return end
    dragging = false
    button:SetScript("OnUpdate", nil)
    if settings then
        settings.x, settings.y = directionX, directionY
    end
end

function button.GetShownOption()
    return not settings or not settings.hide
end

function button.SetShownOption(value)
    if not settings then return end
    settings.hide = not value
    if value then
        Position()
        button:Show()
    else
        StopDragging()
        button:Hide()
    end
end

function button.GetLockedOption()
    return settings and settings.locked == true or false
end

function button.SetLockedOption(value)
    if not settings then return end
    settings.locked = value and true or false
    if settings.locked then StopDragging() end
    local options = PC.UI.OptionsPanel
    if options and options:IsShown() and type(options.Refresh) == "function" then
        options.Refresh()
    end
end

function button.ResetPosition()
    StopDragging()
    directionX, directionY = -0.70710678, -0.70710678
    if settings then settings.x, settings.y = directionX, directionY end
    Position()
end

-- Own menu rows accept left and right clicks without modifying shared
-- Blizzard dropdown buttons used by other addons.
local menu = CreateFrame("Button", "PriestCompanionMinimapMenu", UIParent)
menu:SetAllPoints(UIParent)
menu:SetFrameStrata("FULLSCREEN_DIALOG")
menu:SetFrameLevel(100)
menu:RegisterForClicks("LeftButtonUp", "RightButtonUp")
menu:Hide()
table.insert(UISpecialFrames, "PriestCompanionMinimapMenu")
local function CloseMenu()
    menu:Hide()
end
menu:SetScript("OnClick", CloseMenu)

local function MenuPanel(parent, width, height, level)
    local panel = CreateFrame("Frame", nil, parent)
    panel:SetWidth(width)
    panel:SetHeight(height)
    panel:SetFrameLevel(level)
    panel:EnableMouse(true)
    panel:SetClampedToScreen(true)
    panel:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    panel:SetBackdropColor(0.07, 0.07, 0.12, 1)
    panel:SetBackdropBorderColor(0.6, 0.6, 0.65, 1)
    return panel
end
local root = MenuPanel(menu, 190, 166, 101)
local sub = MenuPanel(root, 240, 112, 103)
sub:Hide()
local title = root:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
title:SetPoint("TOPLEFT", root, "TOPLEFT", 14, -12)
title:SetText("Priest Companion")

local function OpenPage(section, page)
    CloseMenu()
    if section == "guides" then
        PC.UI.OpenTab("wands")
        return
    end
    local panel
    if section == "tools" then panel = PC.UI.ToolsPanel
    elseif section == "announcer" then panel = PC.UI.AnnouncerPanel end
    if page and panel then panel.ActiveSubTab = page end
    PC.UI.OpenTab("options", section)
end
local function RefreshOptions()
    local panel = PC.UI.OptionsPanel
    if PC.UI.MainFrame and PC.UI.MainFrame:IsShown()
    and panel and panel:IsShown() and type(panel.Refresh) == "function" then
        panel.Refresh()
    end
end
local modules = PC.Modules
local announcer = modules.Announcer
local entries = {
    announcer = {
        { text = "Fear Ward", page = "fearward",
          get = function() return announcer.GetOption("enabled") end,
          set = function(v) announcer.SetOption("enabled", v) end,
          available = function() return announcer.GetProvider() == "ClassicAPI" end },
        { text = "Resurrection", page = "resurrection",
          get = function() return announcer.GetResOption("enabled") end,
          set = function(v) announcer.SetResOption("enabled", v) end,
          available = function() return announcer.GetResurrectionProvider() == "ClassicAPI" end },
        { text = "Mana", page = "mana",
          get = function() return modules.ManaAnnouncer.GetOption("enabled") end,
          set = function(v) modules.ManaAnnouncer.SetOption("enabled", v) end },
        { text = "Aggro", page = "aggro",
          get = function() return modules.AggroAnnouncer.GetOption("enabled") end,
          set = function(v) modules.AggroAnnouncer.SetOption("enabled", v) end }
    },
    tools = {
        { text = "Resurrection Assistant", page = "resurrection",
          get = function() return modules.ResurrectionAssistant.GetEnabled() end,
          set = function(v) modules.ResurrectionAssistant.SetEnabled(v) end },
        { text = "Book of Prayer Tracker", page = "tracker",
          get = function() return modules.PrayerTracker.GetOption("enabled") end,
          checked = function()
              return modules.PrayerTracker.GetOption("enabled")
                  and modules.PrayerTracker.GetTalentPoints() > 0
          end,
          set = function(v) modules.PrayerTracker.SetOption("enabled", v) end }
    }
}
local function MenuRow(parent, text, y, width)
    local row = CreateFrame("Button", nil, parent)
    row:SetWidth(width - 16)
    row:SetHeight(25)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, -y)
    row:SetFrameLevel(parent:GetFrameLevel() + 1)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    row:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    row.label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    row.label:SetPoint("LEFT", row, "LEFT", 20, 0)
    row.label:SetText(text)
    return row
end
local subRows = {}
local function RefreshRow(row)
    local enabled
    if row.entry.checked then enabled = row.entry.checked()
    else enabled = row.entry.get() end
    if enabled then
        row.check:Show()
        row.label:SetTextColor(1, 0.82, 0.20)
    else
        row.check:Hide()
        row.label:SetTextColor(1, 0.25, 0.25)
    end
end
local function ShowSubmenu(section, owner)
    -- Disabled trackers do not scan talents in the background. Refresh only
    -- on deliberate Tools navigation, as the full Tools options page does.
    if section == "tools" then modules.PrayerTracker.ScanTalents() end
    local list = entries[section]
    local i
    for i = 1, table.getn(subRows) do subRows[i]:Hide() end
    sub:SetHeight(table.getn(list) * 25 + 16)
    sub:ClearAllPoints()
    -- Open toward the screen center, away from the minimap edge.
    local x = root:GetCenter()
    if x and x > UIParent:GetWidth() / 2 then
        sub:SetPoint("TOPRIGHT", owner, "TOPLEFT", 0, 8)
    else
        sub:SetPoint("TOPLEFT", owner, "TOPRIGHT", 0, 8)
    end
    for i = 1, table.getn(list) do
        local row = subRows[i]
        row.entry, row.section = list[i], section
        row.label:SetText(row.entry.text)
        RefreshRow(row)
        row:Show()
    end
    sub:Show()
end
local i
for i = 1, 4 do
    local row = MenuRow(sub, "", 8 + (i - 1) * 25, 240)
    row.check = row:CreateTexture(nil, "ARTWORK")
    row.check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
    row.check:SetWidth(18)
    row.check:SetHeight(18)
    row.check:SetPoint("LEFT", row, "LEFT", 0, 0)
    row:SetScript("OnClick", function()
        local row = this
        local entry = row.entry
        if arg1 == "RightButton" then
            OpenPage(row.section, entry.page)
        else
            local enabled = entry.get()
            -- Allow turning off a saved Enable even if its provider disappeared.
            if enabled or not entry.available or entry.available() then
                entry.set(not enabled)
                RefreshOptions()
            end
            RefreshRow(row)
        end
    end)
    row:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_LEFT")
        GameTooltip:SetText(this.entry.text, 1, 0.82, 0.20)
        GameTooltip:AddLine("Left-click: enable/disable", 1, 1, 1)
        GameTooltip:AddLine("Right-click: open settings", 1, 1, 1)
        if this.entry.available and not this.entry.available() then
            GameTooltip:AddLine("ClassicAPI required to enable", 1, 0.25, 0.25)
        elseif this.section == "tools" and this.entry.page == "tracker" then
            GameTooltip:AddLine("Book of Prayer talent required to enable", 1, 1, 1)
        end
        GameTooltip:Show()
    end)
    row:SetScript("OnLeave", function() GameTooltip:Hide() end)
    subRows[i] = row
end
local rows = {
    { "Guides", "guides" }, { "Announcer", "announcer", true },
    { "Tools", "tools", true }, { "General", "general" }, { "Close", "close" }
}
for i = 1, table.getn(rows) do
    local data = rows[i]
    local row = MenuRow(root, data[1], 30 + (i - 1) * 25, 190)
    row.section = data[2]
    if data[3] then
        local arrow = row:CreateTexture(nil, "ARTWORK")
        arrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
        arrow:SetWidth(14)
        arrow:SetHeight(14)
        arrow:SetPoint("RIGHT", row, "RIGHT", -2, 0)
        row:SetScript("OnEnter", function() ShowSubmenu(this.section, this) end)
        row:SetScript("OnClick", function() ShowSubmenu(this.section, this) end)
    else
        row:SetScript("OnEnter", function() sub:Hide() end)
        row:SetScript("OnClick", function()
            if this.section == "close" then CloseMenu()
            else OpenPage(this.section) end
        end)
    end
end
menu:SetScript("OnHide", function()
    sub:Hide()
    if GameTooltip then GameTooltip:Hide() end
end)
local function ToggleMenu()
    if menu:IsShown() then CloseMenu(); return end
    CloseDropDownMenus()
    root:ClearAllPoints()
    local x = button:GetCenter()
    if x and x > UIParent:GetWidth() / 2 then
        root:SetPoint("TOPRIGHT", button, "BOTTOMRIGHT", 0, 0)
    else
        root:SetPoint("TOPLEFT", button, "BOTTOMLEFT", 0, 0)
    end
    sub:Hide()
    menu:Show()
end

button:SetScript("OnClick", function()
    if suppressClick then
        suppressClick = false
        return
    end
    if arg1 == "RightButton" then
        if GameTooltip then GameTooltip:Hide() end
        ToggleMenu()
    else
        CloseMenu()
        CloseDropDownMenus()
        PC.ToggleMainFrame()
    end
end)
button:SetScript("OnDragStart", function()
    suppressClick = true
    if button.GetLockedOption() then return end
    CloseMenu()
    CloseDropDownMenus()
    dragging = true
    suppressClick = true
    if GameTooltip then GameTooltip:Hide() end
    button:SetScript("OnUpdate", function()
        local centerX, centerY = Minimap:GetCenter()
        if not centerX or not centerY then return end
        local cursorX, cursorY = GetCursorPosition()
        local scale = Minimap:GetEffectiveScale()
        local x = (cursorX / scale - centerX) / (Minimap:GetWidth() / 2 + 8)
        local y = (cursorY / scale - centerY) / (Minimap:GetHeight() / 2 + 8)
        local length = math.sqrt(x * x + y * y)
        if length > 0 then
            directionX, directionY = x / length, y / length
            Position()
        end
    end)
end)
button:SetScript("OnDragStop", StopDragging)
-- A fresh mouse press belongs to a new click, even if dragging emitted no OnClick.
button:SetScript("OnMouseDown", function() suppressClick = false end)
button:SetScript("OnHide", function()
    CloseMenu()
    StopDragging()
    if GameTooltip and GameTooltip:IsOwned(button) then GameTooltip:Hide() end
end)
button:SetScript("OnEnter", function()
    if dragging or not GameTooltip then return end
    GameTooltip:SetOwner(button, "ANCHOR_LEFT")
    GameTooltip:SetText("Priest Companion", 1, 0.82, 0.20)
    GameTooltip:AddLine("Left-click: open/close addon", 1, 1, 1)
    GameTooltip:AddLine("Right-click: quick access menu", 1, 1, 1)
    if button.GetLockedOption() then
        GameTooltip:AddLine("Position locked (unlock in General)", 1, 0.82, 0.20)
    else
        GameTooltip:AddLine("Drag: move around the minimap", 1, 1, 1)
    end
    GameTooltip:Show()
end)
button:SetScript("OnLeave", function()
    if GameTooltip then GameTooltip:Hide() end
end)

local events = CreateFrame("Frame")
events:RegisterEvent("VARIABLES_LOADED")
events:SetScript("OnEvent", function()
    PC.InitializeDatabase()
    if type(PriestCompanionDB.minimap) ~= "table" then
        PriestCompanionDB.minimap = {}
    end
    settings = PriestCompanionDB.minimap
    local x, y = tonumber(settings.x), tonumber(settings.y)
    if x and y and x == x and y == y then
        local length = math.sqrt(x * x + y * y)
        if length > 0 and length < 10000000000 then
            directionX, directionY = x / length, y / length
        end
    end
    Position()
    button.SetShownOption(not settings.hide)
    events:UnregisterEvent("VARIABLES_LOADED")
end)
