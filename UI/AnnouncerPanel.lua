-- Priest Companion
-- Options > Announcer: independent per-channel Fear Ward notifications.
-- Vanilla 1.12 native frames; no automated spell casting.

local PC = PriestCompanion
local parent = PC.UI.OptionsContent
local announcer = PC.Modules.Announcer

if not parent or not announcer then
    return
end

local panel = CreateFrame("Frame", nil, parent)
panel:SetAllPoints(parent)
panel:Hide()
PC.UI.AnnouncerPanel = panel

local scroll = CreateFrame(
    "ScrollFrame", "PriestCompanionAnnouncerScroll",
    panel, "UIPanelScrollFrameTemplate"
)
scroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 8, -9)
scroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -29, 9)

local child = CreateFrame("Frame", nil, scroll)
child:SetWidth(388)
child:SetHeight(478)
scroll:SetScrollChild(child)

local function Label(text, x, y, width, font)
    local stringFrame = child:CreateFontString(
        nil, "OVERLAY", font or "GameFontHighlightSmall"
    )
    stringFrame:SetPoint("TOPLEFT", child, "TOPLEFT", x, -y)
    stringFrame:SetWidth(width)
    stringFrame:SetJustifyH("LEFT")
    stringFrame:SetText(text)
    return stringFrame
end

Label("Fear Ward Announcer", 14, 12, 350, "GameFontNormal")
local statusLabel = Label("", 14, 38, 356)
-- The explanations live in tooltips instead of taking panel space.
local ENABLE_TOOLTIP =
    "Send a message only after a successful Fear Ward cast. " ..
    "Choose any combination of channels below."
local CHANNEL_TOOLTIP =
    "Say and Yell work without a party or raid. Party and Raid " ..
    "are skipped when the corresponding group is unavailable. " ..
    "Self only shows a local chat message. No announcement is " ..
    "made when the Fear Ward recipient cannot be confirmed."
local SELF_TARGET_TOOLTIP =
    "Also announce Fear Ward when cast on your own character. " ..
    "This does not change which chat channels are selected."

local function ShowTooltip(owner, heading, details)
    if not GameTooltip then
        return
    end

    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:SetText(heading, 1, 0.82, 0.20)
    GameTooltip:AddLine(details, 1, 1, 1, true)
    GameTooltip:Show()
end

local function HideTooltip()
    if GameTooltip then
        GameTooltip:Hide()
    end
end

local function Checkbox(name, title, x, y, onToggle, helpText)
    local check = CreateFrame(
        "CheckButton", name, child, "UICheckButtonTemplate"
    )
    check:SetWidth(24)
    check:SetHeight(24)
    check:SetPoint("TOPLEFT", child, "TOPLEFT", x, -y)

    local label = child:CreateFontString(
        nil, "OVERLAY", "GameFontHighlightSmall"
    )
    label:SetPoint("LEFT", check, "RIGHT", 4, 0)
    label:SetWidth(135)
    label:SetJustifyH("LEFT")
    label:SetText(title)

    check:SetScript("OnClick", function()
        local enabled = this:GetChecked()
        onToggle(enabled == 1 or enabled == true)
        panel.Refresh()
    end)

    if helpText then
        check:SetScript("OnEnter", function()
            ShowTooltip(this, title, helpText)
        end)
        check:SetScript("OnLeave", HideTooltip)

        -- FontStrings do not receive hover events by themselves in Vanilla.
        -- An adjacent button makes the caption hoverable and clickable.
        local captionHitBox = CreateFrame("Button", nil, child)
        captionHitBox:SetPoint("LEFT", check, "RIGHT", 4, 0)
        captionHitBox:SetWidth(135)
        captionHitBox:SetHeight(24)
        captionHitBox:RegisterForClicks("LeftButtonUp")
        captionHitBox:SetScript("OnEnter", function()
            ShowTooltip(this, title, helpText)
        end)
        captionHitBox:SetScript("OnLeave", HideTooltip)
        captionHitBox:SetScript("OnClick", function()
            if not check:IsEnabled() then
                return
            end
            local checked = check:GetChecked()
            local nextValue = not (checked == 1 or checked == true)
            check:SetChecked(nextValue and 1 or nil)
            onToggle(nextValue)
            panel.Refresh()
        end)
    end

    return check, label
end

local enabledBox, enabledLabel = Checkbox(
    "PriestCompanionAnnouncerEnabled",
    "Enable Fear Ward", 14, 77,
    function(value)
        announcer.SetOption("enabled", value)
    end,
    ENABLE_TOOLTIP
)

-- 30px from Enable Fear Ward to this heading, then 30px to
-- the first row of channel checkboxes.
Label("Announcement channels (multiple selections allowed)",
    14, 107, 355, "GameFontNormalSmall")

local channelBoxes = {}
-- Every row is separated by exactly 30 px; the existing right
-- column stays at x = 204, alongside the left column at x = 14.
local channelDefinitions = {
    { "SAY", "Say", 14, 137 },
    { "PARTY", "Party", 204, 137 },
    { "RAID", "Raid", 14, 167 },
    { "SELF", "Self (local chat)", 204, 167 },
    { "YELL", "Yell", 14, 197 }
}

local i
for i = 1, table.getn(channelDefinitions) do
    local entry = channelDefinitions[i]
    local channel = entry[1]
    local check = Checkbox(
        "PriestCompanionAnnouncer" .. channel,
        entry[2], entry[3], entry[4],
        function(value)
            announcer.SetChannel(channel, value)
        end,
        CHANNEL_TOOLTIP
    )
    channelBoxes[channel] = check
end

local selfBox = Checkbox(
    "PriestCompanionAnnouncerSelfTarget",
    "Include casts on myself", 204, 197,
    function(value)
        announcer.SetOption("announceSelf", value)
    end,
    SELF_TARGET_TOOLTIP
)

Label("Custom message (use {target} and optional {spell})",
    14, 241, 360, "GameFontNormalSmall")

local messageBox = CreateFrame(
    "EditBox", "PriestCompanionAnnouncerMessage",
    child, "InputBoxTemplate"
)
messageBox:SetPoint("TOPLEFT", child, "TOPLEFT", 21, -266)
messageBox:SetWidth(335)
messageBox:SetHeight(20)
messageBox:SetAutoFocus(false)
messageBox:SetMaxLetters(140)
messageBox:SetTextInsets(4, 4, 0, 0)

-- Align the Vanilla InputBoxTemplate decorative left edge.
local leftTexture = getfenv(0)[messageBox:GetName() .. "Left"]
if leftTexture then
    local point, relative, relativePoint, x, y =
        leftTexture:GetPoint(1)
    if point then
        leftTexture:ClearAllPoints()
        leftTexture:SetPoint(point, relative, relativePoint, 0, y)
    end
end

-- Text changes stay in the edit box until the user presses Save.
-- Default loads a draft of the original text; Save is the commit action.
local messageDraftDirty = false
local settingDraft = false

local defaultButton = CreateFrame(
    "Button", "PriestCompanionAnnouncerMessageDefault",
    child, "UIPanelButtonTemplate"
)
defaultButton:SetWidth(92)
defaultButton:SetHeight(24)
defaultButton:SetPoint("TOPLEFT", child, "TOPLEFT", 21, -300)
defaultButton:SetText("Default")

local saveButton = CreateFrame(
    "Button", "PriestCompanionAnnouncerMessageSave",
    child, "UIPanelButtonTemplate"
)
saveButton:SetWidth(92)
saveButton:SetHeight(24)
saveButton:SetPoint("TOPLEFT", child, "TOPLEFT", 126, -300)
saveButton:SetText("Save")

Label("Preview (not sent)", 14, 348, 350, "GameFontNormalSmall")
local previewLabel = Label("", 15, 370, 350)

Label("Fear Ward Protection", 14, 410, 350, "GameFontNormal")
local protectionBox = Checkbox(
    "PriestCompanionFearWardPreventOverwrite",
    "Prevent overwriting Fear Ward", 14, 440,
    function(value)
        announcer.SetOption("preventOverwrite", value)
    end,
    "Prevent Fear Ward when the recipient already has the buff. " ..
    "Includes self-casts without a target, spellbook, actionbar " ..
    "and ClassicAPI /cast [@mouseover] macros using CastAtUnit. " ..
    "Protection checks the actual cast recipient; other DLL " ..
    "macro paths may need separate validation."
)

local function UpdateMessagePreview()
    previewLabel:SetText(
        announcer.FormatMessage("Tankname", messageBox:GetText()) or ""
    )
end

local function SetMessageDraft(text)
    settingDraft = true
    messageBox:SetText(text or "")
    settingDraft = false
    messageDraftDirty = messageBox:GetText() ~= announcer.GetMessage()
    UpdateMessagePreview()
end

local function SaveMessage()
    local saved = announcer.SetMessage(messageBox:GetText())
    SetMessageDraft(saved)
    messageBox:ClearFocus()
end

-- Clicking either button takes focus away from the edit box.
-- Do not save in OnEditFocusLost: Default should not first save
-- the unsaved text, and a tab switch must not accidentally save it.
messageBox:SetScript("OnTextChanged", function()
    if not settingDraft then
        messageDraftDirty = this:GetText() ~= announcer.GetMessage()
    end
    UpdateMessagePreview()
end)
messageBox:SetScript("OnEnterPressed", SaveMessage)
messageBox:SetScript("OnEscapePressed", function()
    SetMessageDraft(announcer.GetMessage())
    this:ClearFocus()
end)
messageBox:SetScript("OnEditFocusGained", function()
    this:HighlightText()
end)

defaultButton:SetScript("OnClick", function()
    SetMessageDraft(announcer.GetDefaultMessage())
end)
saveButton:SetScript("OnClick", SaveMessage)

-- Unsaved edits are kept while changing checkboxes, but discarded
-- if the player leaves the Announcer page.
panel:SetScript("OnHide", function()
    messageBox:ClearFocus()
    SetMessageDraft(announcer.GetMessage())
end)

function panel.Refresh()
    local available = announcer.GetProvider() == "ClassicAPI"

    if available then
        statusLabel:SetText(
            "Cast detection: ClassicAPI (confirmed target + cast)"
        )
        statusLabel:SetTextColor(0.35, 0.95, 0.40)
        enabledBox:Enable()
        enabledLabel:SetTextColor(1, 0.82, 0.20)
    else
        statusLabel:SetText(
            "Cast detection unavailable: ClassicAPI required."
        )
        statusLabel:SetTextColor(1, 0.34, 0.34)
        enabledBox:Disable()
        enabledLabel:SetTextColor(0.6, 0.6, 0.6)
    end

    enabledBox:SetChecked(
        announcer.GetOption("enabled") and 1 or nil
    )
    selfBox:SetChecked(
        announcer.GetOption("announceSelf") and 1 or nil
    )
    protectionBox:SetChecked(
        announcer.GetOption("preventOverwrite") and 1 or nil
    )

    local key
    for key, button in pairs(channelBoxes) do
        button:SetChecked(announcer.GetChannel(key) and 1 or nil)
    end

    if not messageDraftDirty and not messageBox:HasFocus() then
        SetMessageDraft(announcer.GetMessage())
    else
        UpdateMessagePreview()
    end
end
