-- Priest Companion - Resurrection Assistant pop-up button
-- Vanilla 1.12: shown by event notifications, never by OnUpdate scans.

local PC = PriestCompanion
local Assistant = PC.Modules and PC.Modules.ResurrectionAssistant
if not Assistant then return end

local frame = CreateFrame(
    "Frame", "PriestCompanionResurrectionAssistantButton", UIParent
)
PC.UI.ResurrectionAssistantButton = frame

frame:SetWidth(238)
frame:SetHeight(96)
frame:SetFrameStrata("MEDIUM")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
if type(frame.SetClampedToScreen) == "function" then
    frame:SetClampedToScreen(true)
end
frame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 13,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
frame:SetBackdropColor(0.04, 0.06, 0.10, 0.94)
frame:SetBackdropBorderColor(0.56, 0.69, 0.86, 1)
frame:Hide()

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOPLEFT", frame, "TOPLEFT", 13, -11)
title:SetText("Resurrection Assistant")

local detail = frame:CreateFontString(
    nil, "OVERLAY", "GameFontHighlightSmall"
)
detail:SetPoint("TOPLEFT", frame, "TOPLEFT", 13, -32)
detail:SetWidth(215)
detail:SetJustifyH("LEFT")

local button = CreateFrame(
    "Button", "PriestCompanionResurrectionAssistantCast",
    frame, "UIPanelButtonTemplate"
)
button:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
button:SetWidth(210)
button:SetHeight(30)
button:RegisterForClicks("LeftButtonUp")
button:SetText("Resurrect")

local icon = button:CreateTexture(nil, "ARTWORK")
icon:SetTexture("Interface\\Icons\\Spell_Holy_Resurrection")
icon:SetWidth(19)
icon:SetHeight(19)
icon:SetPoint("LEFT", button, "LEFT", 9, 0)

local appliedX, appliedY

local function SetSavedPosition()
    local x, y = Assistant.GetButtonPosition()
    if x ~= appliedX or y ~= appliedY then
        frame:ClearAllPoints()
        frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
        appliedX, appliedY = x, y
    end
end

frame:SetScript("OnDragStart", function()
    if not Assistant.IsPaused() then
        frame:StartMoving()
    end
end)

frame:SetScript("OnDragStop", function()
    frame:StopMovingOrSizing()
    local cx, cy = frame:GetCenter()
    local px, py = UIParent:GetCenter()
    if cx and cy and px and py then
        local x, y = cx - px, cy - py
        appliedX, appliedY = x, y
        Assistant.SetButtonPosition(x, y)
    end
end)

frame:SetScript("OnHide", function()
    frame:StopMovingOrSizing()
end)

local function Refresh()
    -- During combat the core refuses to examine raid/party units.
    if Assistant.IsPaused() then
        frame:Hide()
        return
    end

    SetSavedPosition()
    local state = Assistant.GetButtonState()
    if not state then
        frame:Hide()
        return
    end

    if state.mode == "target" then
        detail:SetText("Next: " .. state.name .. " (" .. state.class .. ")")
        button:SetText("Resurrect " .. state.name)
    else
        detail:SetText("Released player - choose the corpse")
        button:SetText("Target corpse manually")
    end
    frame:Show()
end

button:SetScript("OnClick", function()
    local ok, message = Assistant.TryResurrect()
    if not ok then
        if DEFAULT_CHAT_FRAME then
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cffff9900Priest Companion:|r " ..
                (message or "Resurrection was not started.")
            )
        end
    elseif message and string.find(message, "Click the released", 1, true)
    and DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage(
            "|cff66ccffPriest Companion:|r " .. message
        )
    end
end)

button:SetScript("OnEnter", function()
    if not GameTooltip then return end
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:SetText("Resurrection Assistant", 1, 0.82, 0.20)
    GameTooltip:AddLine(
        "One cast per click. An eligible selected dead group member " ..
        "takes priority; otherwise use the class priority list. " ..
        "Released bodies need a manual world click.", 1, 1, 1, true
    )
    GameTooltip:AddLine(
        "Drag the title area to move. Disable in Options > Tools > " ..
        "Resurrection.", 0.75, 0.75, 0.75, true
    )
    GameTooltip:Show()
end)
button:SetScript("OnLeave", function()
    if GameTooltip then GameTooltip:Hide() end
end)

Assistant.AddListener(Refresh)
Refresh()
