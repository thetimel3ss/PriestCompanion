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
child:SetHeight(417)
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

Label("Announcement channels (multiple selections allowed)",
    14, 143, 355, "GameFontNormalSmall")

local channelBoxes = {}
-- Every row is separated by exactly 30 px; the existing right
-- column stays at x = 204, alongside the left column at x = 14.
local channelDefinitions = {
    { "SAY", "Say", 14, 164 },
    { "PARTY", "Party", 204, 164 },
    { "RAID", "Raid", 14, 194 },
    { "SELF", "Self (local chat)", 204, 194 },
    { "YELL", "Yell", 14, 224 }
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
    "Include casts on myself", 14, 254,
    function(value)
        announcer.SetOption("announceSelf", value)
    end,
    SELF_TARGET_TOOLTIP
)

Label("Custom message (use {target} and optional {spell})",
    14, 294, 360, "GameFontNormalSmall")

local messageBox = CreateFrame(
    "EditBox", "PriestCompanionAnnouncerMessage",
    child, "InputBoxTemplate"
)
messageBox:SetPoint("TOPLEFT", child, "TOPLEFT", 21, -320)
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

local function SaveMessage()
    announcer.SetMessage(messageBox:GetText())
    if type(panel.Refresh) == "function" then
        panel.Refresh()
    end
end

messageBox:SetScript("OnEnterPressed", function()
    this:ClearFocus()
end)
messageBox:SetScript("OnEscapePressed", function()
    this:SetText(announcer.GetMessage())
    this:ClearFocus()
end)
messageBox:SetScript("OnEditFocusLost", SaveMessage)
messageBox:SetScript("OnEditFocusGained", function()
    this:HighlightText()
end)

Label("Preview (not sent)", 14, 359, 350, "GameFontNormalSmall")
local previewLabel = Label("", 15, 382, 350)

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

    local key
    for key, button in pairs(channelBoxes) do
        button:SetChecked(announcer.GetChannel(key) and 1 or nil)
    end

    if not messageBox:HasFocus() then
        messageBox:SetText(announcer.GetMessage())
    end

    previewLabel:SetText(
        announcer.FormatMessage("Tankname") or ""
    )
end
