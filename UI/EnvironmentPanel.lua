-- Priest Companion
-- Options > Mods
-- Vanilla 1.12 scrollable client modification information.
-- Layout follows Puppeteer's Mods presentation without importing PTGuiLib.

local PC = PriestCompanion
local parent = PC.UI.OptionsContent

if not parent then
    return
end

--------------------------------------------------
-- Mods Subpage
--------------------------------------------------

local panel = CreateFrame("Frame", nil, parent)
panel:SetAllPoints(parent)
panel:Hide()

-- Preserve the public name for callers of the previous UI.
PC.UI.EnvironmentPanel = panel

--------------------------------------------------
-- Display-only Refresh Button
--------------------------------------------------

local refreshButton = CreateFrame(
    "Button",
    nil,
    panel,
    "UIPanelButtonTemplate"
)

refreshButton:SetWidth(72)
refreshButton:SetHeight(20)
refreshButton:SetPoint(
    "TOPRIGHT",
    panel,
    "TOPRIGHT",
    -13,
    -9
)
refreshButton:SetText("Refresh")

--------------------------------------------------
-- Scrollable Text Sections
--------------------------------------------------

local scrollFrame = CreateFrame(
    "ScrollFrame",
    "PriestCompanionModsScrollFrame",
    panel,
    "UIPanelScrollFrameTemplate"
)

scrollFrame:SetPoint(
    "TOPLEFT",
    panel,
    "TOPLEFT",
    13,
    -39
)
scrollFrame:SetPoint(
    "BOTTOMRIGHT",
    panel,
    "BOTTOMRIGHT",
    -32,
    12
)

local scrollChild = CreateFrame(
    "Frame",
    nil,
    scrollFrame
)
scrollChild:SetWidth(395)
scrollChild:SetHeight(1)
scrollFrame:SetScrollChild(scrollChild)

local introduction = scrollChild:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontNormal"
)
introduction:SetWidth(375)
introduction:SetJustifyH("CENTER")
introduction:SetPoint(
    "TOP",
    scrollChild,
    "TOP",
    0,
    -4
)
introduction:SetText(
    "Client mods add optional APIs. Detected does not mean " ..
    "that every related feature is used by Priest Companion."
)

--------------------------------------------------
-- Reusable Mod Sections
--------------------------------------------------

local sections = {}
local nextY = 52

local function CreateStaticText(
    parentFrame,
    text,
    x,
    y,
    width,
    height,
    font
)
    local label = parentFrame:CreateFontString(
        nil,
        "OVERLAY",
        font or "GameFontHighlightSmall"
    )
    label:SetPoint(
        "TOPLEFT",
        parentFrame,
        "TOPLEFT",
        x,
        -y
    )
    label:SetWidth(width)
    label:SetHeight(height)
    label:SetJustifyH("LEFT")
    label:SetJustifyV("TOP")
    label:SetText(text)
    return label
end

local function CreateReadOnlyLink(url, y)
    local label = CreateStaticText(
        scrollChild,
        "Link:",
        16,
        y + 3,
        35,
        20,
        "GameFontNormalSmall"
    )

    local editBox = CreateFrame(
        "EditBox",
        nil,
        scrollChild,
        "InputBoxTemplate"
    )

    editBox:SetWidth(310)
    editBox:SetHeight(20)
    editBox:SetAutoFocus(false)
    editBox:SetPoint(
        "TOPLEFT",
        scrollChild,
        "TOPLEFT",
        54,
        -y
    )
    editBox:SetText(url)
    editBox:SetScript(
        "OnEscapePressed",
        function()
            this:ClearFocus()
        end
    )
    editBox:SetScript(
        "OnEnterPressed",
        function()
            this:ClearFocus()
        end
    )
    editBox:SetScript(
        "OnEditFocusGained",
        function()
            this:HighlightText()
        end
    )
    editBox:SetScript(
        "OnTextChanged",
        function()
            if this:GetText() ~= url then
                this:SetText(url)
            end
        end
    )
end

local function AddModSection(
    key,
    name,
    red,
    green,
    blue,
    features,
    note,
    url
)
    local topY = nextY

    local heading = scrollChild:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalLarge"
    )
    heading:SetPoint(
        "TOP",
        scrollChild,
        "TOP",
        0,
        -topY
    )
    heading:SetWidth(360)
    heading:SetJustifyH("CENTER")
    heading:SetText(name)
    heading:SetTextColor(red, green, blue)

    local status = scrollChild:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )
    status:SetPoint(
        "TOP",
        scrollChild,
        "TOP",
        0,
        -(topY + 23)
    )
    status:SetWidth(365)
    status:SetJustifyH("CENTER")

    sections[key] = {
        status = status
    }

    local explanation = CreateStaticText(
        scrollChild,
        features,
        16,
        topY + 47,
        365,
        75
    )
    explanation:SetTextColor(1.00, 0.82, 0.17)

    local noteLabel = CreateStaticText(
        scrollChild,
        note,
        16,
        topY + 122,
        365,
        34,
        "GameFontDisableSmall"
    )

    CreateReadOnlyLink(url, topY + 159)

    nextY = topY + 193
end

AddModSection(
    "classic",
    "ClassicAPI",
    1.00, 0.77, 0.30,
    "ClassicAPI offers the following enhancements:\n" ..
    "- Item name, icon, count and tooltip helpers\n" ..
    "- Automatic selection of a ClassicAPI-specific addon TOC\n" ..
    "- QUEST_TURNED_IN for tracking new quest completions",
    "Priest Companion can use its item adapters and live quest " ..
    "event. Historical quests still require other providers.",
    "https://github.com/brues-code/ClassicAPI"
)

AddModSection(
    "super",
    "SuperWoW",
    1.00, 0.40, 0.40,
    "SuperWoW offers the following enhancements:\n" ..
    "- Enhanced unit information and targeting\n" ..
    "- Accurate distance to many friendly units\n" ..
    "- Improved mouseover and direct-target capabilities",
    "Priest Companion currently detects SuperWoW; these " ..
    "enhancements are not automatically enabled by detection.",
    "https://github.com/balakethelock/SuperWoW"
)

AddModSection(
    "nampower",
    "Nampower",
    0.40, 1.00, 0.40,
    "Nampower offers the following enhancements:\n" ..
    "- Improved spell casting and input handling\n" ..
    "- Spell queue functionality\n" ..
    "- Additional combat APIs in supported versions",
    "Priest Companion currently detects Nampower; future " ..
    "features must individually check the required APIs.",
    "https://gitea.com/avitasia/nampower"
)

AddModSection(
    "unitxp",
    "UnitXP SP3",
    0.48, 0.62, 1.00,
    "UnitXP SP3 offers the following enhancements:\n" ..
    "- More accurate distance information\n" ..
    "- Unit line-of-sight queries\n" ..
    "- Additional unit position capabilities",
    "Priest Companion currently detects its dispatcher. " ..
    "Individual features still need their own capability checks.",
    "https://codeberg.org/konaka/UnitXP_SP3/wiki"
)

scrollChild:SetHeight(nextY + 8)

if scrollFrame.UpdateScrollChildRect then
    scrollFrame:UpdateScrollChildRect()
end

--------------------------------------------------
-- Status Rendering
--------------------------------------------------

local function FormatClassicAPIVersion(version)
    local value = tonumber(version)

    if not value or value <= 0 then
        return "Unknown"
    end

    value = math.floor(value)

    return string.format(
        "%d.%d.%d",
        math.floor(value / 10000),
        math.floor((value % 10000) / 100),
        value % 100
    )
end

local function SetModStatus(key, label, state)
    local record = sections[key]

    if not record then
        return
    end

    record.status:SetText(label)

    if state == "detected" then
        record.status:SetTextColor(0.20, 1.00, 0.20)
    elseif state == "outdated" then
        record.status:SetTextColor(1.00, 0.80, 0.22)
    else
        record.status:SetTextColor(1.00, 0.30, 0.30)
    end
end

--------------------------------------------------
-- Display Refresh (No Server Queries)
--------------------------------------------------

function panel.Refresh()
    local caps = PC.Capabilities or {}

    local classicVersion = FormatClassicAPIVersion(
        caps.classicAPIVersion
    )

    if caps.classicAPI then
        if caps.classicAPISupported then
            local adapter = "Adapter not loaded"

            if caps.classicAPIAdapter then
                adapter = "Adapter loaded"
            end

            SetModStatus(
                "classic",
                "Mod Detected - Version " ..
                    classicVersion .. " - " .. adapter,
                "detected"
            )
        else
            SetModStatus(
                "classic",
                "Mod Detected (Unsupported) - Version " ..
                    classicVersion,
                "outdated"
            )
        end
    else
        SetModStatus(
            "classic",
            "Mod Not Detected",
            "missing"
        )
    end

    if caps.superWoW then
        local version = "Version unknown"

        if caps.superWoWVersion then
            version = "Version " .. tostring(
                caps.superWoWVersion
            )
        elseif caps.superWoWDetection == "legacy" then
            version = "Legacy version"
        end

        SetModStatus(
            "super",
            "Mod Detected - " .. version,
            "detected"
        )
    else
        SetModStatus(
            "super",
            "Mod Not Detected",
            "missing"
        )
    end

    if caps.nampower then
        local version = "Version unknown"

        if caps.nampowerVersion then
            version = "Version " .. tostring(
                caps.nampowerVersion
            )
        end

        SetModStatus(
            "nampower",
            "Mod Detected - " .. version,
            "detected"
        )
    else
        SetModStatus(
            "nampower",
            "Mod Not Detected",
            "missing"
        )
    end

    if caps.unitXP then
        local suffix = "Detected by capability check"

        if caps.unitXPDetection == "loader" then
            suffix = "Detected by loader"
        elseif caps.unitXPDetection == "dispatcher" then
            suffix = "Detected by dispatcher"
        end

        SetModStatus(
            "unitxp",
            "Mod Detected - " .. suffix,
            "detected"
        )
    else
        SetModStatus(
            "unitxp",
            "Mod Not Detected",
            "missing"
        )
    end
end

refreshButton:SetScript(
    "OnClick",
    function()
        panel.Refresh()
    end
)
