-- Priest Companion - Options > Announcer > Mana
-- Dedicated scroll child; no reparenting after SetScrollChild.
-- Vanilla 1.12 / Lua 5.0 style event/callback handlers.

local PC = PriestCompanion
local mana = PC.Modules.ManaAnnouncer
local parent = PC.UI.AnnouncerPanel
local scroll = PC.UI.ManaAnnouncerScroll
local child = PC.UI.ManaAnnouncerContent
if not mana or not parent or not scroll or not child then return end

local function Label(text, x, y, width, font)
    local f = child:CreateFontString(
        nil, "OVERLAY", font or "GameFontHighlightSmall"
    )
    f:SetPoint("TOPLEFT", child, "TOPLEFT", x, -y)
    f:SetWidth(width or 355)
    f:SetJustifyH("LEFT")
    f:SetText(text)
    return f
end

local function ShowTooltip(owner, heading, help)
    if not GameTooltip then return end
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:SetText(heading, 1, 0.82, 0.20)
    GameTooltip:AddLine(help, 1, 1, 1, true)
    GameTooltip:Show()
end
local function HideTooltip()
    if GameTooltip then GameTooltip:Hide() end
end

local boxes = {}
local function Checkbox(name, title, x, y, getter, setter, tooltip, width)
    local button = CreateFrame(
        "CheckButton", name, child, "UICheckButtonTemplate"
    )
    button:SetWidth(24)
    button:SetHeight(24)
    button:SetPoint("TOPLEFT", child, "TOPLEFT", x, -y)
    local caption = child:CreateFontString(
        nil, "OVERLAY", "GameFontHighlightSmall"
    )
    caption:SetPoint("LEFT", button, "RIGHT", 4, 0)
    caption:SetWidth(width or 138)
    caption:SetJustifyH("LEFT")
    caption:SetText(title)
    button:SetScript("OnClick", function()
        local value = this:GetChecked()
        setter(value == 1 or value == true)
        scroll.Refresh()
    end)
    if tooltip then
        button:SetScript("OnEnter", function()
            ShowTooltip(this, title, tooltip)
        end)
        button:SetScript("OnLeave", HideTooltip)
        local hitbox = CreateFrame("Button", nil, child)
        hitbox:SetPoint("LEFT", button, "RIGHT", 4, 0)
        hitbox:SetWidth(width or 138)
        hitbox:SetHeight(24)
        hitbox:RegisterForClicks("LeftButtonUp")
        hitbox:SetScript("OnEnter", function()
            ShowTooltip(this, title, tooltip)
        end)
        hitbox:SetScript("OnLeave", HideTooltip)
        hitbox:SetScript("OnClick", function()
            local checked = button:GetChecked()
            local value = not (checked == 1 or checked == true)
            setter(value)
            scroll.Refresh()
        end)
    end
    table.insert(boxes, { button = button, getter = getter })
    return button
end

Label("Mana Announcer", 14, 12, 355, "GameFontNormal")
Label("Tracks your own mana. Disabled until you enable it.",
    14, 35, 355)

Checkbox("PriestCompanionManaEnabled", "Enable", 14, 63,
    function() return mana.GetOption("enabled") end,
    function(v) mana.SetOption("enabled", v) end,
    "Enable mana alerts. No messages are sent until you opt in.")

Checkbox("PriestCompanionManaCombatOnly", "Only in combat", 204, 63,
    function() return mana.GetOption("combatOnly") end,
    function(v) mana.SetOption("combatOnly", v) end,
    "Suppress mana announcements while outside combat.", 155)

Checkbox("PriestCompanionManaLowEnabled", "Low Mana", 14, 97,
    function() return mana.GetOption("lowEnabled") end,
    function(v) mana.SetOption("lowEnabled", v) end,
    "Send a Low Mana warning on crossing the percentage threshold.")

Checkbox("PriestCompanionManaOOMEnabled", "Out of Mana", 204, 97,
    function() return mana.GetOption("oomEnabled") end,
    function(v) mana.SetOption("oomEnabled", v) end,
    "Send an OOM warning when mana reaches zero.", 155)

Label("Low Mana threshold", 14, 144, 265, "GameFontNormalSmall")
local thresholdSlider = CreateFrame(
    "Slider", "PriestCompanionManaThreshold", child,
    "OptionsSliderTemplate"
)
thresholdSlider:SetWidth(194)
thresholdSlider:SetHeight(17)
thresholdSlider:SetPoint("TOPLEFT", child, "TOPLEFT", 25, -172)
thresholdSlider:SetMinMaxValues(1, 99)
if type(thresholdSlider.SetValueStep) == "function" then
    thresholdSlider:SetValueStep(1)
end
local thresholdValue = Label("", 232, 170, 115)

Label("Cooldown between announcements", 14, 215, 340,
    "GameFontNormalSmall")
local cooldownSlider = CreateFrame(
    "Slider", "PriestCompanionManaCooldown", child,
    "OptionsSliderTemplate"
)
cooldownSlider:SetWidth(194)
cooldownSlider:SetHeight(17)
cooldownSlider:SetPoint("TOPLEFT", child, "TOPLEFT", 25, -243)
cooldownSlider:SetMinMaxValues(5, 120)
if type(cooldownSlider.SetValueStep) == "function" then
    cooldownSlider:SetValueStep(1)
end
local cooldownValue = Label("", 232, 240, 115)
local syncing = false

thresholdSlider:SetScript("OnValueChanged", function()
    if syncing then return end
    local value = math.floor(this:GetValue() + 0.5)
    if value ~= mana.GetOption("threshold") then
        mana.SetOption("threshold", value)
    end
    thresholdValue:SetText(value .. "%")
end)
cooldownSlider:SetScript("OnValueChanged", function()
    if syncing then return end
    local value = math.floor(this:GetValue() + 0.5)
    if value ~= mana.GetOption("cooldown") then
        mana.SetOption("cooldown", value)
    end
    cooldownValue:SetText(value .. " sec")
end)
thresholdSlider:SetScript("OnEnter", function()
    ShowTooltip(this, "Low Mana threshold",
        "Announce when your mana drops to or below this percentage. " ..
        "A 5-point recovery margin prevents repeat warnings.")
end)
thresholdSlider:SetScript("OnLeave", HideTooltip)
cooldownSlider:SetScript("OnEnter", function()
    ShowTooltip(this, "Announcement cooldown",
        "Minimum time between warnings. OOM may still announce " ..
        "immediately after Low Mana when mana reaches zero. " ..
        "Each warning triggers once per mana drop.")
end)
cooldownSlider:SetScript("OnLeave", HideTooltip)

Label("Announcement channels (multiple selections allowed)",
    14, 284, 355, "GameFontNormalSmall")
local channels = {
    { "SAY", "Say", 14, 309 },
    { "PARTY", "Party", 204, 309 },
    { "RAID", "Raid", 14, 339 },
    { "SELF", "Self (local chat)", 204, 339 },
    { "YELL", "Yell", 14, 369 }
}
local i
for i = 1, table.getn(channels) do
    local row = channels[i]
    local channel = row[1]
    Checkbox("PriestCompanionManaChannel" .. channel, row[2],
        row[3], row[4],
        function() return mana.GetChannel(channel) end,
        function(v) mana.SetChannel(channel, v) end,
        "Unavailable Party/Raid channels are skipped. " ..
        "Self displays a local message and does not send chat.")
end

Label("Low Mana message (tokens: {percent}, {mana}, {maxmana}, {name})",
    14, 407, 355, "GameFontNormalSmall")

local editors = {}
local function CreateMessageEditor(kind, name, startY)
    local edit = CreateFrame(
        "EditBox", name, child, "InputBoxTemplate"
    )
    edit:SetPoint("TOPLEFT", child, "TOPLEFT", 21, -startY)
    edit:SetWidth(339)
    edit:SetHeight(24)
    edit:SetAutoFocus(false)
    edit:SetMaxLetters(140)

    local defaultButton = CreateFrame(
        "Button", name .. "Default", child, "UIPanelButtonTemplate"
    )
    defaultButton:SetWidth(92)
    defaultButton:SetHeight(23)
    defaultButton:SetPoint(
        "TOPLEFT", child, "TOPLEFT", 21, -(startY + 34)
    )
    defaultButton:SetText("Default")

    local saveButton = CreateFrame(
        "Button", name .. "Save", child, "UIPanelButtonTemplate"
    )
    saveButton:SetWidth(92)
    saveButton:SetHeight(23)
    saveButton:SetPoint(
        "TOPLEFT", child, "TOPLEFT", 126, -(startY + 34)
    )
    saveButton:SetText("Save")
    local preview = Label("", 15, startY + 66, 350)
    local syncingText = false
    local dirty = false

    local function UpdatePreview()
        preview:SetText(
            mana.PreviewMessage(kind, edit:GetText()) or ""
        )
    end
    local function SetDraft(value)
        syncingText = true
        edit:SetText(value or "")
        syncingText = false
        dirty = edit:GetText() ~= mana.GetMessage(kind)
        UpdatePreview()
    end
    local function Save()
        local saved = mana.SetMessage(kind, edit:GetText())
        SetDraft(saved)
        edit:ClearFocus()
    end

    edit:SetScript("OnTextChanged", function()
        if not syncingText then
            dirty = this:GetText() ~= mana.GetMessage(kind)
        end
        UpdatePreview()
    end)
    edit:SetScript("OnEnterPressed", Save)
    edit:SetScript("OnEscapePressed", function()
        SetDraft(mana.GetMessage(kind))
        this:ClearFocus()
    end)
    edit:SetScript("OnEditFocusGained", function()
        this:HighlightText()
    end)
    defaultButton:SetScript("OnClick", function()
        SetDraft(mana.GetDefaultMessage(kind))
    end)
    saveButton:SetScript("OnClick", Save)

    editors[kind] = {
        edit = edit,
        refresh = function()
            if not dirty and not edit:HasFocus() then
                SetDraft(mana.GetMessage(kind))
            else
                UpdatePreview()
            end
        end,
        restore = function()
            edit:ClearFocus()
            SetDraft(mana.GetMessage(kind))
        end
    }
    SetDraft(mana.GetMessage(kind))
end

CreateMessageEditor("low", "PriestCompanionManaLowMessage", 430)
Label("Out of Mana message (same tokens)", 14, 531,
    350, "GameFontNormalSmall")
CreateMessageEditor("oom", "PriestCompanionManaOOMMessage", 554)

Label("Default restores a draft; Save persists it. Preview is not sent.",
    14, 660, 355)

function scroll.Refresh()
    local j
    for j = 1, table.getn(boxes) do
        local entry = boxes[j]
        entry.button:SetChecked(entry.getter() and 1 or nil)
    end
    syncing = true
    local threshold = mana.GetOption("threshold")
    local cooldown = mana.GetOption("cooldown")
    thresholdSlider:SetValue(threshold)
    cooldownSlider:SetValue(cooldown)
    thresholdValue:SetText(threshold .. "%")
    cooldownValue:SetText(cooldown .. " sec")
    syncing = false
    editors.low.refresh()
    editors.oom.refresh()
end

scroll:SetScript("OnHide", function()
    editors.low.restore()
    editors.oom.restore()
end)
scroll:SetScript("OnShow", function()
    scroll.Refresh()
end)
PC.UI.ManaAnnouncerPanel = scroll
