-- Priest Companion
-- Options > Tools > Fear Ward / Resurrection.
-- Two native Vanilla sub-tabs; announcement settings are unchanged.

local PC = PriestCompanion
local parent = PC.UI.OptionsContent
local announcer = PC.Modules.Announcer
local assistant = PC.Modules.ResurrectionAssistant

if not parent or not announcer then
    return
end

local panel = CreateFrame("Frame", nil, parent)
panel:SetAllPoints(parent)
panel:Hide()

-- Keep the previous public name for callers from earlier versions.
PC.UI.AnnouncerPanel = panel
PC.UI.ToolsPanel = panel
panel.ActiveSubTab = "fearward"

--------------------------------------------------
-- Native sub-tabs
--------------------------------------------------

local subTabs = CreateFrame(
    "Frame", "PriestCompanionToolsSubTabs", panel
)
subTabs:SetPoint("TOPLEFT", panel, "TOPLEFT", 17, -7)
subTabs:SetWidth(365)
subTabs:SetHeight(22)

local function CreateToolTab(index, label, preceding, id)
    local button = CreateFrame(
        "Button", "PriestCompanionToolsSubTabsTab" .. tostring(index),
        subTabs, "TabButtonTemplate"
    )
    button:SetText(label)
    button:SetHeight(22)
    button:RegisterForClicks("LeftButtonUp")
    PanelTemplates_TabResize(0, button)
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

local fearTab = CreateToolTab(1, "Fear Ward", nil, "fearward")
CreateToolTab(2, "Resurrection", fearTab, "resurrection")
PanelTemplates_SetNumTabs(subTabs, 2)
PanelTemplates_SetTab(subTabs, 1)

--------------------------------------------------
-- Independent scrollable pages
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

local scroll, child = CreateToolScroll(
    "PriestCompanionAnnouncerScroll", 409
)
local resScroll, resChild = CreateToolScroll(
    "PriestCompanionResurrectionScroll", 1100
)
resScroll:Hide()

-- Shared layout helpers place elements in whichever page is being built.
local activeChild = child

local function Label(text, x, y, width, font)
    local stringFrame = activeChild:CreateFontString(
        nil, "OVERLAY", font or "GameFontHighlightSmall"
    )
    stringFrame:SetPoint("TOPLEFT", activeChild, "TOPLEFT", x, -y)
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

local function Checkbox(name, title, x, y, onToggle, helpText, captionWidth)
    local container = activeChild
    local check = CreateFrame(
        "CheckButton", name, container, "UICheckButtonTemplate"
    )
    check:SetWidth(24)
    check:SetHeight(24)
    check:SetPoint("TOPLEFT", container, "TOPLEFT", x, -y)

    local label = container:CreateFontString(
        nil, "OVERLAY", "GameFontHighlightSmall"
    )
    label:SetPoint("LEFT", check, "RIGHT", 4, 0)
    label:SetWidth(captionWidth or 135)
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
        local captionHitBox = CreateFrame("Button", nil, container)
        captionHitBox:SetPoint("LEFT", check, "RIGHT", 4, 0)
        captionHitBox:SetWidth(captionWidth or 135)
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

-- Keep overwrite protection beside Enable Fear Ward, not at the end
-- of the page. A wider right caption keeps its two-line title contained.
local protectionBox = Checkbox(
    "PriestCompanionFearWardPreventOverwrite",
    "Prevent overwriting Fear Ward", 204, 77,
    function(value)
        announcer.SetOption("preventOverwrite", value)
    end,
    "Prevent Fear Ward when the recipient already has the buff. " ..
    "Includes self-casts without a target, spellbook, actionbar " ..
    "and ClassicAPI /cast [@mouseover] macros using CastAtUnit. " ..
    "Protection checks the actual cast recipient; other DLL " ..
    "macro paths may need separate validation.",
    155
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

--------------------------------------------------
-- Resurrection Announcer
--------------------------------------------------

-- From this point onward all shared labels/checkboxes belong to the
-- Resurrection page. Fear Ward controls stay on their own scroll child.
activeChild = resChild

Label("Resurrection Announcer", 14, 12, 350, "GameFontNormal")
local resStatus = Label("", 14, 40, 356)

local resEnabled, resEnabledLabel = Checkbox(
    "PriestCompanionResurrectionEnabled",
    "Enable Resurrection", 14, 74,
    function(value)
        announcer.SetResOption("enabled", value)
    end,
    "Announce only once the Resurrection cast has actually STARTED, " ..
    "not when the cast button is pressed. A later interruption or " ..
    "a declined resurrection is not treated as success."
)

local resInterruptedBox = Checkbox(
    "PriestCompanionResurrectionInterrupted",
    "Announce interrupted casts", 204, 74,
    function(value)
        announcer.SetResOption("announceInterrupted", value)
    end,
    "Optional. After Resurrection actually starts, report a cast " ..
    "that is interrupted or fails. Attempts rejected before START " ..
    "do not announce. Uses the currently selected channels; " ..
    "Whisper receives a short interruption notice.",
    155
)

Label("Announcement channels (multiple selections allowed)",
    14, 104, 355, "GameFontNormalSmall")

local RES_CHANNEL_TOOLTIP =
    "Resurrection has independent channel choices. Say and Yell " ..
    "are available without a group; unavailable Party or Raid " ..
    "channels are skipped. Self only shows local chat. Whisper " ..
    "uses its own editable wording for the recipient; no Whisper " ..
    "is sent if a released corpse's name cannot be confirmed."

local resChannels = {}
local resChannelDefinitions = {
    { "SAY", "Say", 14, 134 },
    { "PARTY", "Party", 204, 134 },
    { "RAID", "Raid", 14, 164 },
    { "SELF", "Self (local chat)", 204, 164 },
    { "YELL", "Yell", 14, 194 },
    { "WHISPER", "Whisper", 204, 194 }
}

local resIndex
for resIndex = 1, table.getn(resChannelDefinitions) do
    local item = resChannelDefinitions[resIndex]
    local channel = item[1]
    resChannels[channel] = Checkbox(
        "PriestCompanionResurrection" .. channel,
        item[2], item[3], item[4],
        function(value)
            announcer.SetResChannel(channel, value)
        end,
        RES_CHANNEL_TOOLTIP
    )
end

Label("Custom message (use {target} and optional {spell})",
    14, 242, 360, "GameFontNormalSmall")

local resMessageBox = CreateFrame(
    "EditBox", "PriestCompanionResurrectionMessage",
    resChild, "InputBoxTemplate"
)
resMessageBox:SetPoint("TOPLEFT", resChild, "TOPLEFT", 21, -268)
resMessageBox:SetWidth(335)
resMessageBox:SetHeight(20)
resMessageBox:SetAutoFocus(false)
resMessageBox:SetMaxLetters(140)
resMessageBox:SetTextInsets(4, 4, 0, 0)

local resLeftTexture = getfenv(0)[resMessageBox:GetName() .. "Left"]
if resLeftTexture then
    local point, relative, relativePoint, x, y =
        resLeftTexture:GetPoint(1)
    if point then
        resLeftTexture:ClearAllPoints()
        resLeftTexture:SetPoint(point, relative, relativePoint, 0, y)
    end
end

local resDefaultButton = CreateFrame(
    "Button", "PriestCompanionResurrectionMessageDefault",
    resChild, "UIPanelButtonTemplate"
)
resDefaultButton:SetWidth(92)
resDefaultButton:SetHeight(24)
resDefaultButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 21, -301
)
resDefaultButton:SetText("Default")

local resSaveButton = CreateFrame(
    "Button", "PriestCompanionResurrectionMessageSave",
    resChild, "UIPanelButtonTemplate"
)
resSaveButton:SetWidth(92)
resSaveButton:SetHeight(24)
resSaveButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 126, -301
)
resSaveButton:SetText("Save")

Label("Preview (not sent)", 14, 346, 350, "GameFontNormalSmall")
local resPreview = Label("", 15, 369, 350)

local resDraftDirty = false
local settingResDraft = false

local function UpdateResPreview()
    resPreview:SetText(
        announcer.FormatResurrectionMessage(
            "Tankname", resMessageBox:GetText()
        ) or ""
    )
end

local function SetResDraft(text)
    settingResDraft = true
    resMessageBox:SetText(text or "")
    settingResDraft = false
    resDraftDirty = resMessageBox:GetText() ~= announcer.GetResMessage()
    UpdateResPreview()
end

local function SaveResMessage()
    local saved = announcer.SetResMessage(resMessageBox:GetText())
    SetResDraft(saved)
    resMessageBox:ClearFocus()
end

resMessageBox:SetScript("OnTextChanged", function()
    if not settingResDraft then
        resDraftDirty = this:GetText() ~= announcer.GetResMessage()
    end
    UpdateResPreview()
end)
resMessageBox:SetScript("OnEnterPressed", SaveResMessage)
resMessageBox:SetScript("OnEscapePressed", function()
    SetResDraft(announcer.GetResMessage())
    this:ClearFocus()
end)
resMessageBox:SetScript("OnEditFocusGained", function()
    this:HighlightText()
end)

resDefaultButton:SetScript("OnClick", function()
    SetResDraft(announcer.GetDefaultResMessage())
end)
resSaveButton:SetScript("OnClick", SaveResMessage)

--------------------------------------------------
-- Independent Whisper and interruption message templates
--------------------------------------------------

-- Whisper is addressed directly to the recipient, so no {target}
-- placeholder is required. Default and Save only change that text.
Label("Whisper message (recipient only)",
    14, 403, 355, "GameFontNormalSmall")

local resWhisperBox = CreateFrame(
    "EditBox", "PriestCompanionResurrectionWhisperMessage",
    resChild, "InputBoxTemplate"
)
resWhisperBox:SetPoint("TOPLEFT", resChild, "TOPLEFT", 21, -428)
resWhisperBox:SetWidth(335)
resWhisperBox:SetHeight(20)
resWhisperBox:SetAutoFocus(false)
resWhisperBox:SetMaxLetters(140)
resWhisperBox:SetTextInsets(4, 4, 0, 0)

local whisperLeft = getfenv(0)[resWhisperBox:GetName() .. "Left"]
if whisperLeft then
    local point, relative, relativePoint, x, y = whisperLeft:GetPoint(1)
    if point then
        whisperLeft:ClearAllPoints()
        whisperLeft:SetPoint(point, relative, relativePoint, 0, y)
    end
end

local whisperDefaultButton = CreateFrame(
    "Button", "PriestCompanionResurrectionWhisperDefault",
    resChild, "UIPanelButtonTemplate"
)
whisperDefaultButton:SetWidth(92)
whisperDefaultButton:SetHeight(24)
whisperDefaultButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 21, -460
)
whisperDefaultButton:SetText("Default")

local whisperSaveButton = CreateFrame(
    "Button", "PriestCompanionResurrectionWhisperSave",
    resChild, "UIPanelButtonTemplate"
)
whisperSaveButton:SetWidth(92)
whisperSaveButton:SetHeight(24)
whisperSaveButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 126, -460
)
whisperSaveButton:SetText("Save")

Label("Whisper preview (not sent)", 14, 501, 350, "GameFontNormalSmall")
local whisperPreview = Label("", 15, 524, 350)
local whisperDraftDirty = false
local settingWhisperDraft = false

local function UpdateWhisperPreview()
    whisperPreview:SetText(
        announcer.FormatResWhisperMessage(resWhisperBox:GetText()) or ""
    )
end

local function SetWhisperDraft(value)
    settingWhisperDraft = true
    resWhisperBox:SetText(value or "")
    settingWhisperDraft = false
    whisperDraftDirty =
        resWhisperBox:GetText() ~= announcer.GetResWhisperMessage()
    UpdateWhisperPreview()
end

local function SaveWhisperMessage()
    local saved = announcer.SetResWhisperMessage(resWhisperBox:GetText())
    SetWhisperDraft(saved)
    resWhisperBox:ClearFocus()
end

resWhisperBox:SetScript("OnTextChanged", function()
    if not settingWhisperDraft then
        whisperDraftDirty =
            this:GetText() ~= announcer.GetResWhisperMessage()
    end
    UpdateWhisperPreview()
end)
resWhisperBox:SetScript("OnEnterPressed", SaveWhisperMessage)
resWhisperBox:SetScript("OnEscapePressed", function()
    SetWhisperDraft(announcer.GetResWhisperMessage())
    this:ClearFocus()
end)
resWhisperBox:SetScript("OnEditFocusGained", function()
    this:HighlightText()
end)
whisperDefaultButton:SetScript("OnClick", function()
    SetWhisperDraft(announcer.GetDefaultResWhisperMessage())
end)
whisperSaveButton:SetScript("OnClick", SaveWhisperMessage)

-- Interruption is opt-in. Its public template is distinct from
-- the usual cast-start message; Whisper uses a short direct alert.
Label("Interrupted cast message",
    14, 560, 350, "GameFontNormalSmall")

local resCancelBox = CreateFrame(
    "EditBox", "PriestCompanionResurrectionCancelMessage",
    resChild, "InputBoxTemplate"
)
resCancelBox:SetPoint("TOPLEFT", resChild, "TOPLEFT", 21, -586)
resCancelBox:SetWidth(335)
resCancelBox:SetHeight(20)
resCancelBox:SetAutoFocus(false)
resCancelBox:SetMaxLetters(140)
resCancelBox:SetTextInsets(4, 4, 0, 0)

local cancelLeft = getfenv(0)[resCancelBox:GetName() .. "Left"]
if cancelLeft then
    local point, relative, relativePoint, x, y = cancelLeft:GetPoint(1)
    if point then
        cancelLeft:ClearAllPoints()
        cancelLeft:SetPoint(point, relative, relativePoint, 0, y)
    end
end

local cancelDefaultButton = CreateFrame(
    "Button", "PriestCompanionResurrectionCancelDefault",
    resChild, "UIPanelButtonTemplate"
)
cancelDefaultButton:SetWidth(92)
cancelDefaultButton:SetHeight(24)
cancelDefaultButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 21, -618
)
cancelDefaultButton:SetText("Default")

local cancelSaveButton = CreateFrame(
    "Button", "PriestCompanionResurrectionCancelSave",
    resChild, "UIPanelButtonTemplate"
)
cancelSaveButton:SetWidth(92)
cancelSaveButton:SetHeight(24)
cancelSaveButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 126, -618
)
cancelSaveButton:SetText("Save")

Label("Interruption preview (not sent)",
    14, 662, 350, "GameFontNormalSmall")
local cancelPreview = Label("", 15, 685, 350)
local cancelDraftDirty = false
local settingCancelDraft = false

local function UpdateCancelPreview()
    cancelPreview:SetText(
        announcer.FormatResCancelMessage(
            "Tankname", resCancelBox:GetText()
        ) or ""
    )
end

local function SetCancelDraft(value)
    settingCancelDraft = true
    resCancelBox:SetText(value or "")
    settingCancelDraft = false
    cancelDraftDirty = resCancelBox:GetText() ~= announcer.GetResCancelMessage()
    UpdateCancelPreview()
end

local function SaveCancelMessage()
    local saved = announcer.SetResCancelMessage(resCancelBox:GetText())
    SetCancelDraft(saved)
    resCancelBox:ClearFocus()
end

resCancelBox:SetScript("OnTextChanged", function()
    if not settingCancelDraft then
        cancelDraftDirty = this:GetText() ~= announcer.GetResCancelMessage()
    end
    UpdateCancelPreview()
end)
resCancelBox:SetScript("OnEnterPressed", SaveCancelMessage)
resCancelBox:SetScript("OnEscapePressed", function()
    SetCancelDraft(announcer.GetResCancelMessage())
    this:ClearFocus()
end)
resCancelBox:SetScript("OnEditFocusGained", function()
    this:HighlightText()
end)
cancelDefaultButton:SetScript("OnClick", function()
    SetCancelDraft(announcer.GetDefaultResCancelMessage())
end)
cancelSaveButton:SetScript("OnClick", SaveCancelMessage)

--------------------------------------------------
-- Resurrection Assistant (compact / expanded HUD)
--------------------------------------------------

Label("Resurrection Assistant", 14, 729, 355, "GameFontNormal")

local assistantButtonBox = Checkbox(
    "PriestCompanionResurrectionAssistantShowButton",
    "Show Resurrection button", 14, 763,
    function(value)
        if assistant then assistant.SetButtonEnabled(value) end
    end,
    "Show the Resurrection HUD when an eligible party/raid member " ..
    "is dead outside combat. The whole HUD is clickable: each click " ..
    "attempts one Resurrection. A released corpse requires a manual " ..
    "world click. This option does not disable /pc res.",
    161
)

local assistantExpandedBox = Checkbox(
    "PriestCompanionResurrectionAssistantExpanded",
    "Expanded mode", 204, 763,
    function(value)
        if assistant then assistant.SetDisplayOption("expanded", value) end
    end,
    "Expanded mode keeps the original wide HUD with a heading, " ..
    "spell icon and action text. Compact mode uses the Tracker-like " ..
    "vertical icon with optional name and class labels."
)

local assistantNameBox = Checkbox(
    "PriestCompanionResurrectionAssistantShowName",
    "Show player name", 14, 801,
    function(value)
        if assistant then assistant.SetDisplayOption("showName", value) end
    end,
    "Show the recipient nickname below the icon in compact mode, " ..
    "or beside it in expanded mode. The nickname adopts the " ..
    "recipient's class color. Hiding it leaves more space for " ..
    "the Resurrection icon."
)

local assistantClassBox = Checkbox(
    "PriestCompanionResurrectionAssistantShowClass",
    "Show player class", 204, 801,
    function(value)
        if assistant then assistant.SetDisplayOption("showClass", value) end
    end,
    "Show the recipient's class using the same class color as the " ..
    "nickname. In compact mode the icon automatically grows when " ..
    "the name or class is hidden."
)

local assistantLockedBox = Checkbox(
    "PriestCompanionResurrectionAssistantLocked",
    "Lock position", 14, 839,
    function(value)
        if assistant then assistant.SetDisplayOption("locked", value) end
    end,
    "Prevent moving or resizing the Resurrection HUD, but keep " ..
    "its center clickable to cast. Uncheck to drag the window " ..
    "or resize it from any edge or corner (Tracker-style)."
)

local assistantResetButton = CreateFrame(
    "Button", "PriestCompanionResurrectionAssistantReset",
    resChild, "UIPanelButtonTemplate"
)
assistantResetButton:SetWidth(151)
assistantResetButton:SetHeight(24)
assistantResetButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 215, -839
)
assistantResetButton:SetText("Reset position")
assistantResetButton:SetScript("OnClick", function()
    if assistant then assistant.ResetButtonPosition() end
end)
assistantResetButton:SetScript("OnEnter", function()
    ShowTooltip(this, "Reset position",
        "Move the Resurrection HUD to its default location. " ..
        "Works even if Lock position is checked.")
end)
assistantResetButton:SetScript("OnLeave", HideTooltip)

Label("Window size (per mode)", 14, 883, 355, "GameFontNormalSmall")

local scaleSlider = CreateFrame(
    "Slider", "PriestCompanionResurrectionAssistantScale",
    resChild, "OptionsSliderTemplate"
)
scaleSlider:SetWidth(194)
scaleSlider:SetHeight(17)
scaleSlider:SetPoint("TOPLEFT", resChild, "TOPLEFT", 25, -916)
scaleSlider:SetMinMaxValues(0.40, 1.20)
if type(scaleSlider.SetValueStep) == "function" then
    scaleSlider:SetValueStep(0.05)
end

local scaleLabel = Label("100%", 232, 912, 110, "GameFontHighlightSmall")
local syncingScale = false
local function SyncAssistantScale()
    if not assistant then return end
    syncingScale = true
    local value = assistant.GetButtonScale()
    scaleSlider:SetValue(value)
    scaleLabel:SetText(
        tostring(math.floor(value * 100 + 0.5)) .. "%"
    )
    syncingScale = false
end
-- Keep the slider in sync if the player resizes the HUD directly via
-- its edge/corner handles while Options is open.
if assistant and type(assistant.AddListener) == "function" then
    assistant.AddListener(SyncAssistantScale)
end
scaleSlider:SetScript("OnValueChanged", function()
    if syncingScale or not assistant then return end
    local value = math.floor(this:GetValue() * 20 + 0.5) / 20
    scaleLabel:SetText(tostring(math.floor(value * 100 + 0.5)) .. "%")
    assistant.SetButtonScale(value)
end)
scaleSlider:SetScript("OnEnter", function()
    ShowTooltip(this, "Window size",
        "Scale the entire HUD from 40% to 120%, including the icon " ..
        "and text. Compact and Expanded retain independent sizes. " ..
        "When unlocked, drag any edge or corner to resize. " ..
        "The center remains clickable for Resurrection.")
end)
scaleSlider:SetScript("OnLeave", HideTooltip)

local previewActive = false
local assistantPreviewButton = CreateFrame(
    "Button", "PriestCompanionResurrectionAssistantPreview",
    resChild, "UIPanelButtonTemplate"
)
assistantPreviewButton:SetWidth(145)
assistantPreviewButton:SetHeight(25)
assistantPreviewButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 21, -963
)

local assistantScaleResetButton = CreateFrame(
    "Button", "PriestCompanionResurrectionAssistantScaleReset",
    resChild, "UIPanelButtonTemplate"
)
assistantScaleResetButton:SetWidth(145)
assistantScaleResetButton:SetHeight(25)
assistantScaleResetButton:SetPoint(
    "TOPLEFT", resChild, "TOPLEFT", 215, -963
)
assistantScaleResetButton:SetText("Reset current size")
assistantScaleResetButton:SetScript("OnClick", function()
    if assistant then assistant.ResetButtonScale() end
    panel.Refresh()
end)
assistantScaleResetButton:SetScript("OnEnter", function()
    ShowTooltip(this, "Reset current size",
        "Restore 100% scale for the selected Compact or Expanded mode. " ..
        "The other mode keeps its own saved scale.")
end)
assistantScaleResetButton:SetScript("OnLeave", HideTooltip)

local function StopAssistantPreview()
    previewActive = false
    local hud = PC.UI and PC.UI.ResurrectionAssistantButton
    if hud and hud.SetPreview then hud.SetPreview(false) end
end

local function UpdatePreviewLabel()
    if previewActive then
        assistantPreviewButton:SetText("Stop preview")
    else
        assistantPreviewButton:SetText("Preview HUD")
    end
end

assistantPreviewButton:SetScript("OnClick", function()
    previewActive = not previewActive
    local hud = PC.UI and PC.UI.ResurrectionAssistantButton
    if hud and hud.SetPreview then hud.SetPreview(previewActive) end
    UpdatePreviewLabel()
end)
assistantPreviewButton:SetScript("OnEnter", function()
    ShowTooltip(this, "Preview HUD",
        "Display the HUD without a dead group member. Preview is blue " ..
        "and NEVER casts Resurrection. Unlock to drag or resize " ..
        "using the window's edges/corners; changes update live. " ..
        "Switching tabs or closing Options stops preview.")
end)
assistantPreviewButton:SetScript("OnLeave", HideTooltip)
UpdatePreviewLabel()

Label("Green = available. Yellow = click corpse manually.",
    14, 1017, 355)
Label("Preview is blue and never casts. Combat hides the HUD.",
    14, 1039, 355)

-- Navigating between sub-tabs discards only the draft being left;
-- leaving Tools discards both. Already saved values are untouched.
local function RestoreFearDraft()
    messageBox:ClearFocus()
    SetMessageDraft(announcer.GetMessage())
end

local function RestoreResDraft()
    resMessageBox:ClearFocus()
    SetResDraft(announcer.GetResMessage())
    resWhisperBox:ClearFocus()
    SetWhisperDraft(announcer.GetResWhisperMessage())
    resCancelBox:ClearFocus()
    SetCancelDraft(announcer.GetResCancelMessage())
end

scroll:SetScript("OnHide", RestoreFearDraft)
resScroll:SetScript("OnHide", function()
    RestoreResDraft()
    StopAssistantPreview()
    UpdatePreviewLabel()
end)
panel:SetScript("OnHide", function()
    RestoreFearDraft()
    RestoreResDraft()
    StopAssistantPreview()
    UpdatePreviewLabel()
end)

function panel.SelectSubTab(id)
    if id ~= "resurrection" then
        id = "fearward"
    end
    panel.ActiveSubTab = id

    if id == "resurrection" then
        scroll:Hide()
        resScroll:Show()
        PanelTemplates_SetTab(subTabs, 2)
    else
        resScroll:Hide()
        scroll:Show()
        PanelTemplates_SetTab(subTabs, 1)
    end

    if type(panel.Refresh) == "function" then
        panel.Refresh()
    end
end

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

    local resAvailable = announcer.GetResurrectionProvider() == "ClassicAPI"
    if resAvailable then
        resStatus:SetText(
            "Cast detection: ClassicAPI (SENT + START)"
        )
        resStatus:SetTextColor(0.35, 0.95, 0.40)
        resEnabled:Enable()
        resEnabledLabel:SetTextColor(1, 0.82, 0.20)
    else
        resStatus:SetText(
            "Resurrection detection unavailable: ClassicAPI required."
        )
        resStatus:SetTextColor(1, 0.34, 0.34)
        resEnabled:Disable()
        resEnabledLabel:SetTextColor(0.6, 0.6, 0.6)
    end

    resEnabled:SetChecked(
        announcer.GetResOption("enabled") and 1 or nil
    )
    resInterruptedBox:SetChecked(
        announcer.GetResOption("announceInterrupted") and 1 or nil
    )
    if assistant then
        assistantButtonBox:SetChecked(
            assistant.GetButtonEnabled() and 1 or nil
        )
        assistantExpandedBox:SetChecked(
            assistant.GetDisplayOption("expanded") and 1 or nil
        )
        assistantNameBox:SetChecked(
            assistant.GetDisplayOption("showName") and 1 or nil
        )
        assistantClassBox:SetChecked(
            assistant.GetDisplayOption("showClass") and 1 or nil
        )
        assistantLockedBox:SetChecked(
            assistant.GetDisplayOption("locked") and 1 or nil
        )

        SyncAssistantScale()
    else
        assistantButtonBox:Disable()
        assistantExpandedBox:Disable()
        assistantNameBox:Disable()
        assistantClassBox:Disable()
        assistantLockedBox:Disable()
        assistantResetButton:Disable()
        assistantPreviewButton:Disable()
        assistantScaleResetButton:Disable()
        scaleSlider:Disable()
    end

    local resChannel
    local button
    for resChannel, button in pairs(resChannels) do
        button:SetChecked(
            announcer.GetResChannel(resChannel) and 1 or nil
        )
    end

    if not resDraftDirty and not resMessageBox:HasFocus() then
        SetResDraft(announcer.GetResMessage())
    else
        UpdateResPreview()
    end
    if not whisperDraftDirty and not resWhisperBox:HasFocus() then
        SetWhisperDraft(announcer.GetResWhisperMessage())
    else
        UpdateWhisperPreview()
    end
    if not cancelDraftDirty and not resCancelBox:HasFocus() then
        SetCancelDraft(announcer.GetResCancelMessage())
    else
        UpdateCancelPreview()
    end
end

-- Preserve the selected tool when returning from other Options pages.
panel:SetScript("OnShow", function()
    panel.SelectSubTab(panel.ActiveSubTab)
end)

