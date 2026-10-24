-- Priest Companion - Options > Announcer > Aggro.
-- Own native scroll child; Vanilla 1.12 / Lua 5.0 callbacks.
local PC = PriestCompanion
local aggro = PC.Modules.AggroAnnouncer
local scroll = PC.UI.AggroAnnouncerScroll
local child = PC.UI.AggroAnnouncerContent
if not aggro or not scroll or not child then return end

local function Label(value, x, y, width, font)
    local line = child:CreateFontString(
        nil, "OVERLAY", font or "GameFontHighlightSmall")
    line:SetPoint("TOPLEFT", child, "TOPLEFT", x, -y)
    line:SetWidth(width or 355)
    line:SetJustifyH("LEFT")
    line:SetText(value)
    return line
end
local function Tooltip(owner, title, help)
    if not GameTooltip then return end
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:SetText(title, 1, 0.82, 0.20)
    GameTooltip:AddLine(help, 1, 1, 1, true)
    GameTooltip:Show()
end
local function HideTooltip()
    if GameTooltip then GameTooltip:Hide() end
end
local boxes = {}
local function Checkbox(name, title, x, y, getter, setter, help, width)
    local button = CreateFrame(
        "CheckButton", name, child, "UICheckButtonTemplate")
    button:SetWidth(24)
    button:SetHeight(24)
    button:SetPoint("TOPLEFT", child, "TOPLEFT", x, -y)
    local caption = child:CreateFontString(
        nil, "OVERLAY", "GameFontHighlightSmall")
    caption:SetPoint("LEFT", button, "RIGHT", 4, 0)
    caption:SetWidth(width or 140)
    caption:SetJustifyH("LEFT")
    caption:SetText(title)
    button:SetScript("OnClick", function()
        local checked = this:GetChecked()
        setter(checked == 1 or checked == true)
        scroll.Refresh()
    end)
    button:SetScript("OnEnter", function()
        Tooltip(this, title, help)
    end)
    button:SetScript("OnLeave", HideTooltip)
    local hitbox = CreateFrame("Button", nil, child)
    hitbox:SetPoint("LEFT", button, "RIGHT", 4, 0)
    hitbox:SetWidth(width or 140)
    hitbox:SetHeight(24)
    hitbox:RegisterForClicks("LeftButtonUp")
    hitbox:SetScript("OnEnter", function()
        Tooltip(this, title, help)
    end)
    hitbox:SetScript("OnLeave", HideTooltip)
    hitbox:SetScript("OnClick", function()
        local checked = button:GetChecked()
        setter(not (checked == 1 or checked == true))
        scroll.Refresh()
    end)
    table.insert(boxes, { button = button, getter = getter })
end

Label("Aggro and Survival Announcer", 14, 12, 350, "GameFontNormal")
Label("Alerts about your own aggro, low health and death.", 14, 35, 355)
Checkbox("PriestCompanionAggroEnable", "Enable", 14, 63,
    function() return aggro.GetOption("enabled") end,
    function(v) aggro.SetOption("enabled", v) end,
    "Enable these announcements. Disabled by default.")
Checkbox("PriestCompanionAggroWarning", "Aggro Warning", 14, 99,
    function() return aggro.GetOption("aggroEnabled") end,
    function(v) aggro.SetOption("aggroEnabled", v) end,
    "Announce when a hostile unit is confirmed targeting you in combat. " ..
    "Uses 0.75-second checks and requires two confirmations.")
Checkbox("PriestCompanionAggroNearDeath", "Near Death", 204, 99,
    function() return aggro.GetOption("nearEnabled") end,
    function(v) aggro.SetOption("nearEnabled", v) end,
    "Announce when your health drops below its configured percentage.", 150)
Checkbox("PriestCompanionAggroDeath", "Death Announcement", 14, 134,
    function() return aggro.GetOption("deathEnabled") end,
    function(v) aggro.SetOption("deathEnabled", v) end,
    "Announce once on PLAYER_DEAD. Independent of Near Death.", 180)

Label("Near Death health threshold", 14, 184, 345, "GameFontNormalSmall")
local healthSlider = CreateFrame(
    "Slider", "PriestCompanionAggroHealthThreshold", child,
    "OptionsSliderTemplate")
healthSlider:SetWidth(194)
healthSlider:SetHeight(17)
healthSlider:SetPoint("TOPLEFT", child, "TOPLEFT", 25, -212)
healthSlider:SetMinMaxValues(1, 99)
if type(healthSlider.SetValueStep) == "function" then
    healthSlider:SetValueStep(1)
end
local healthValue = Label("", 232, 210, 115)

Label("Aggro announcement cooldown", 14, 259, 340, "GameFontNormalSmall")
local cooldownSlider = CreateFrame(
    "Slider", "PriestCompanionAggroCooldown", child,
    "OptionsSliderTemplate")
cooldownSlider:SetWidth(194)
cooldownSlider:SetHeight(17)
cooldownSlider:SetPoint("TOPLEFT", child, "TOPLEFT", 25, -287)
cooldownSlider:SetMinMaxValues(5, 120)
if type(cooldownSlider.SetValueStep) == "function" then
    cooldownSlider:SetValueStep(1)
end
local cooldownValue = Label("", 232, 285, 115)
local syncing = false
healthSlider:SetScript("OnValueChanged", function()
    if syncing then return end
    local value = math.floor(this:GetValue() + 0.5)
    if value ~= aggro.GetOption("threshold") then
        aggro.SetOption("threshold", value)
    end
    healthValue:SetText(value .. "%")
end)
cooldownSlider:SetScript("OnValueChanged", function()
    if syncing then return end
    local value = math.floor(this:GetValue() + 0.5)
    if value ~= aggro.GetOption("cooldown") then
        aggro.SetOption("cooldown", value)
    end
    cooldownValue:SetText(value .. " sec")
end)
healthSlider:SetScript("OnEnter", function()
    Tooltip(this, "Near Death threshold",
        "Alert at or below this health percentage. Recover more " ..
        "than 15 percentage points above it to rearm.")
end)
healthSlider:SetScript("OnLeave", HideTooltip)
cooldownSlider:SetScript("OnEnter", function()
    Tooltip(this, "Aggro cooldown",
        "Wait between separate aggro warnings if enemies " ..
        "stop targeting you and later retarget you.")
end)
cooldownSlider:SetScript("OnLeave", HideTooltip)

Label("Announcement channels (multiple selections allowed)",
    14, 325, 355, "GameFontNormalSmall")
local channels = {
    { "SAY", "Say", 14, 348 },
    { "PARTY", "Party", 204, 348 },
    { "RAID", "Raid", 14, 378 },
    { "SELF", "Self (local chat)", 204, 378 },
    { "YELL", "Yell", 14, 408 }
}
local i
for i = 1, table.getn(channels) do
    local row = channels[i]
    local channel = row[1]
    Checkbox("PriestCompanionAggroChannel" .. channel, row[2],
        row[3], row[4],
        function() return aggro.GetChannel(channel) end,
        function(v) aggro.SetChannel(channel, v) end,
        "Unavailable Party/Raid channels are skipped. Self " ..
        "prints locally and does not send a chat message.")
end

local editors = {}
local function MessageEditor(kind, y, title)
    Label(title .. " (tokens: {name}, {percent}, {health}, " ..
        "{maxhealth}, {enemy})", 14, y, 360, "GameFontNormalSmall")
    local edit = CreateFrame(
        "EditBox", "PriestCompanionAggroMessage" .. kind,
        child, "InputBoxTemplate")
    edit:SetPoint("TOPLEFT", child, "TOPLEFT", 21, -(y + 25))
    edit:SetWidth(339)
    edit:SetHeight(24)
    edit:SetAutoFocus(false)
    edit:SetMaxLetters(140)
    local defaultButton = CreateFrame(
        "Button", "PriestCompanionAggroDefault" .. kind,
        child, "UIPanelButtonTemplate")
    defaultButton:SetWidth(92)
    defaultButton:SetHeight(23)
    defaultButton:SetPoint(
        "TOPLEFT", child, "TOPLEFT", 21, -(y + 59))
    defaultButton:SetText("Default")
    local saveButton = CreateFrame(
        "Button", "PriestCompanionAggroSave" .. kind,
        child, "UIPanelButtonTemplate")
    saveButton:SetWidth(92)
    saveButton:SetHeight(23)
    saveButton:SetPoint(
        "TOPLEFT", child, "TOPLEFT", 126, -(y + 59))
    saveButton:SetText("Save")
    local preview = Label("", 15, y + 91, 350)
    local dirty = false
    local editing = false
    local function Preview()
        preview:SetText(aggro.PreviewMessage(kind, edit:GetText()) or "")
    end
    local function SetDraft(value)
        editing = true
        edit:SetText(value or "")
        editing = false
        dirty = edit:GetText() ~= aggro.GetMessage(kind)
        Preview()
    end
    local function Restore()
        edit:ClearFocus()
        SetDraft(aggro.GetMessage(kind))
    end
    local function Save()
        SetDraft(aggro.SetMessage(kind, edit:GetText()))
        edit:ClearFocus()
    end
    edit:SetScript("OnTextChanged", function()
        if not editing then
            dirty = this:GetText() ~= aggro.GetMessage(kind)
        end
        Preview()
    end)
    edit:SetScript("OnEnterPressed", Save)
    edit:SetScript("OnEscapePressed", Restore)
    edit:SetScript("OnEditFocusGained", function()
        this:HighlightText()
    end)
    defaultButton:SetScript("OnClick", function()
        SetDraft(aggro.GetDefaultMessage(kind))
    end)
    saveButton:SetScript("OnClick", Save)
    editors[kind] = {
        restore = Restore,
        refresh = function()
            if not dirty and not edit:HasFocus() then
                Restore()
            else
                Preview()
            end
        end
    }
    Restore()
end
MessageEditor("aggro", 451, "Aggro message")
MessageEditor("near", 570, "Near Death message")
MessageEditor("death", 689, "Death message")
Label("Default changes drafts; Save persists. Previews are not sent.",
    14, 812, 355)

local POPUP = "PRIEST_COMPANION_RESET_AGGRO_ANNOUNCER"
StaticPopupDialogs[POPUP] = {
    text = "Reset all Aggro Announcer settings for this character?" ..
        "\n\nThis restores the 30%% health threshold and 15-second " ..
        "aggro cooldown, checks all three alerts, selects Say only, " ..
        "restores the messages and turns the main Enable off.",
    button1 = OKAY or "OK",
    button2 = CANCEL or "Cancel",
    OnAccept = function()
        aggro.ResetDefaults()
        editors.aggro.restore()
        editors.near.restore()
        editors.death.restore()
        scroll.Refresh()
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
}
local resetButton = CreateFrame(
    "Button", "PriestCompanionAggroResetDefaults",
    child, "UIPanelButtonTemplate")
resetButton:SetWidth(160)
resetButton:SetHeight(24)
resetButton:SetPoint("TOPLEFT", child, "TOPLEFT", 200, -846)
resetButton:SetText("Reset to Defaults")
resetButton:SetScript("OnClick", function()
    StaticPopup_Show(POPUP)
end)
resetButton:SetScript("OnEnter", function()
    Tooltip(this, "Reset to Defaults",
        "Restore all Aggro Announcer defaults for this character " ..
        "after confirming. Does not touch other modules.")
end)
resetButton:SetScript("OnLeave", HideTooltip)

function scroll.Refresh()
    local j
    for j = 1, table.getn(boxes) do
        local item = boxes[j]
        item.button:SetChecked(item.getter() and 1 or nil)
    end
    syncing = true
    local threshold = aggro.GetOption("threshold")
    local cooldown = aggro.GetOption("cooldown")
    healthSlider:SetValue(threshold)
    cooldownSlider:SetValue(cooldown)
    healthValue:SetText(threshold .. "%")
    cooldownValue:SetText(cooldown .. " sec")
    syncing = false
    editors.aggro.refresh()
    editors.near.refresh()
    editors.death.refresh()
end

scroll:SetScript("OnHide", function()
    editors.aggro.restore()
    editors.near.restore()
    editors.death.restore()
end)
scroll:SetScript("OnShow", function() scroll.Refresh() end)
PC.UI.AggroAnnouncerPanel = scroll
