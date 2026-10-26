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
    button.optionCaption = caption

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
    button.optionHitBox = hitbox
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
    local entry = {
        button = button,
        caption = caption,
        hitbox = hitbox,
        getter = getter
    }
    table.insert(boxes, entry)
    return entry
end

Label("Aggro and Survival Announcer", 14, 12, 350, "GameFontNormal")
Label("Alerts about your own aggro, low health and death.", 14, 35, 355)
Checkbox("PriestCompanionAggroEnable", "Enable", 14, 63,
    function() return aggro.GetOption("enabled") end,
    function(v) aggro.SetOption("enabled", v) end,
    "Master switch for all three alerts: Aggro Warning, " ..
    "Near Death and Death Announcement. Disabled by default.")
Checkbox("PriestCompanionAggroWarning", "Aggro Warning", 14, 102,
    function() return aggro.GetOption("aggroEnabled") end,
    function(v) aggro.SetOption("aggroEnabled", v) end,
    "Announce aggro when a hostile unit targets you in combat. " ..
    "With Only after taking damage checked, alert only after a " ..
    "confirmed incoming hit reduces your health.", 145)
local damageOnlyControl = Checkbox("PriestCompanionAggroDamageOnly",
    "Only after taking damage", 192, 102,
    function() return aggro.GetOption("damageOnly") end,
    function(v)
        if aggro.GetOption("aggroEnabled") then
            aggro.SetOption("damageOnly", v)
        end
    end,
    "Unchecked: warn when a hostile target aims at you. " ..
    "Checked: warn only after hostile damage reduces your health. " ..
    "Fully absorbed or avoided attacks do not warn. " ..
    "Requires Enable and Aggro Warning. This checkbox " ..
    "cannot be changed while Aggro Warning is disabled.", 166)
Checkbox("PriestCompanionAggroNearDeath", "Near Death", 14, 139,
    function() return aggro.GetOption("nearEnabled") end,
    function(v) aggro.SetOption("nearEnabled", v) end,
    "Announce when your health falls to the configured threshold. " ..
    "Rearm only after recovering more than 15 percentage " ..
    "points above it. Aggro cooldown does not apply.", 145)
Checkbox("PriestCompanionAggroDeath", "Death Announcement", 192, 139,
    function() return aggro.GetOption("deathEnabled") end,
    function(v) aggro.SetOption("deathEnabled", v) end,
    "Announce once when you die, independently of Aggro " ..
    "Warning and Near Death.", 166)

Label("Announcement channels (multiple selections allowed)",
    14, 183, 355, "GameFontNormalSmall")
local channels = {
    { "SAY", "Say", 14, 209 },
    { "PARTY", "Party", 204, 209 },
    { "RAID", "Raid", 14, 239 },
    { "SELF", "Self (local chat)", 204, 239 },
    { "YELL", "Yell", 14, 269 }
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

Label("Near Death health threshold", 14, 314, 345, "GameFontNormalSmall")
local healthSlider = CreateFrame(
    "Slider", "PriestCompanionAggroHealthThreshold", child,
    "OptionsSliderTemplate")
healthSlider:SetWidth(194)
healthSlider:SetHeight(17)
healthSlider:SetPoint("TOPLEFT", child, "TOPLEFT", 25, -343)
healthSlider:SetMinMaxValues(1, 84)
if type(healthSlider.SetValueStep) == "function" then
    healthSlider:SetValueStep(1)
end
local healthValue = Label("", 232, 341, 115)
Label("Range: 1-84%. Rearms above threshold +15 points.",
    14, 372, 355)

Label("Aggro announcement cooldown", 14, 405, 340, "GameFontNormalSmall")
local cooldownSlider = CreateFrame(
    "Slider", "PriestCompanionAggroCooldown", child,
    "OptionsSliderTemplate")
cooldownSlider:SetWidth(194)
cooldownSlider:SetHeight(17)
cooldownSlider:SetPoint("TOPLEFT", child, "TOPLEFT", 25, -433)
cooldownSlider:SetMinMaxValues(5, 120)
if type(cooldownSlider.SetValueStep) == "function" then
    cooldownSlider:SetValueStep(1)
end
local cooldownValue = Label("", 232, 431, 115)
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
        "Set between 1% and 84%. Alert at or below the threshold. " ..
        "To rearm, recover more than 15 percentage points above " ..
        "the threshold. At 84%, full health (100%) is needed.")
end)
healthSlider:SetScript("OnLeave", HideTooltip)
cooldownSlider:SetScript("OnEnter", function()
    Tooltip(this, "Aggro cooldown",
        "Applies only to Aggro Warning; Near Death and Death are " ..
        "independent. In damage-only mode, continuous damage " ..
        "does not spam even when cooldown expires.")
end)
cooldownSlider:SetScript("OnLeave", HideTooltip)

local editors = {}
local function MessageEditor(kind, y, title)
    Label(title, 14, y, 360, "GameFontNormalSmall")
    local edit = CreateFrame(
        "EditBox", "PriestCompanionAggroMessage" .. kind,
        child, "InputBoxTemplate")
    edit:SetPoint("TOPLEFT", child, "TOPLEFT", 21, -(y + 25))
    edit:SetWidth(339)
    edit:SetHeight(24)
    edit:SetAutoFocus(false)
    edit:SetMaxLetters(140)
    edit:SetScript("OnEnter", function()
        Tooltip(this, title, "Available tokens: {name}, {percent}, " ..
            "{health}, {maxhealth} and {enemy}.")
    end)
    edit:SetScript("OnLeave", HideTooltip)
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
MessageEditor("aggro", 479, "Aggro message")
MessageEditor("near", 598, "Near Death message")
MessageEditor("death", 717, "Death message")
Label("Default changes drafts; Save persists. Previews are not sent.",
    14, 841, 355)

local POPUP = "PRIEST_COMPANION_RESET_AGGRO_ANNOUNCER"
StaticPopupDialogs[POPUP] = {
    text = "Reset all Aggro Announcer settings for this character?" ..
        "\n\nThis restores the 30%% health threshold and 15-second " ..
        "aggro cooldown, checks all three alerts, uses target-based " ..
        "aggro warning, selects Say only, " ..
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
resetButton:SetPoint("TOPLEFT", child, "TOPLEFT", 200, -875)
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
    local enabled = aggro.GetOption("enabled")
    PC.UI.SetModuleOptionsEnabled(child,
        getglobal("PriestCompanionAggroEnable"), enabled)
    -- Disable both click surfaces, not only the checkbutton;
    -- preserve the user's stored damageOnly selection.
    if enabled and aggro.GetOption("aggroEnabled") then
        damageOnlyControl.button:Enable()
        damageOnlyControl.hitbox:Enable()
        damageOnlyControl.caption:SetTextColor(1, 1, 1)
    else
        damageOnlyControl.button:Disable()
        damageOnlyControl.hitbox:Disable()
        damageOnlyControl.caption:SetTextColor(1, 0.25, 0.25)
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
