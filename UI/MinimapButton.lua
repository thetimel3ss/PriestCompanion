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

function button.ResetPosition()
    directionX, directionY = -0.70710678, -0.70710678
    if settings then settings.x, settings.y = directionX, directionY end
    Position()
end

button:SetScript("OnClick", function()
    if suppressClick then
        suppressClick = false
        return
    end
    if arg1 == "RightButton" then PC.ShowOptions()
    else PC.ToggleMainFrame() end
end)
button:SetScript("OnDragStart", function()
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
    StopDragging()
    if GameTooltip and GameTooltip:IsOwned(button) then GameTooltip:Hide() end
end)
button:SetScript("OnEnter", function()
    if dragging or not GameTooltip then return end
    GameTooltip:SetOwner(button, "ANCHOR_LEFT")
    GameTooltip:SetText("Priest Companion", 1, 0.82, 0.20)
    GameTooltip:AddLine("Left-click: open/close addon", 1, 1, 1)
    GameTooltip:AddLine("Right-click: open options", 1, 1, 1)
    GameTooltip:AddLine("Drag: move around the minimap", 1, 1, 1)
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
