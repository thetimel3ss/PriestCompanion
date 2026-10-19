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
child:SetHeight(465)
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
local helpLabel = Label(
    "Send a message only after a successful Fear Ward cast. " ..
    "Choose any combination of channels below.",
    14, 111, 353
)

local function Checkbox(name, title, x, y, onToggle)
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

    return check, label
end

local enabledBox, enabledLabel = Checkbox(
    "PriestCompanionAnnouncerEnabled",
    "Enable Fear Ward", 14, 77,
    function(value)
        announcer.SetOption("enabled", value)
    end
)

Label("Announcement channels (multiple selections allowed)",
    14, 143, 355, "GameFontNormalSmall")

local channelBoxes = {}
local channelDefinitions = {
    { "SAY", "Say", 14, 164 },
    { "PARTY", "Party", 204, 164 },
    { "RAID", "Raid", 14, 195 },
    { "SELF", "Self (local chat)", 204, 195 }
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
        end
    )
    channelBoxes[channel] = check
end

local selfBox = Checkbox(
    "PriestCompanionAnnouncerSelfTarget",
    "Include casts on myself", 14, 237,
    function(value)
        announcer.SetOption("announceSelf", value)
    end
)

Label("Custom message (use {target} and optional {spell})",
    14, 276, 360, "GameFontNormalSmall")

local messageBox = CreateFrame(
    "EditBox", "PriestCompanionAnnouncerMessage",
    child, "InputBoxTemplate"
)
messageBox:SetPoint("TOPLEFT", child, "TOPLEFT", 21, -303)
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

Label("Preview (not sent)", 14, 344, 350, "GameFontNormalSmall")
local previewLabel = Label("", 15, 367, 350)
Label(
    "Say is always available. Party and Raid are skipped if you " ..
    "are not in that group. Self shows a local message only. " ..
    "No announcement is made when the target is unknown.",
    14, 407, 354
)

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
