-- Priest Companion
-- Options > Mods
-- Read-only client extension information, inspired by Puppeteer's Mods tab.

local PC = PriestCompanion
local parent = PC.UI.OptionsContent

if not parent then
    return
end

--------------------------------------------------
-- Mods Subpage
--------------------------------------------------

local panel = CreateFrame(
    "Frame",
    nil,
    parent
)

panel:SetAllPoints(parent)
panel:Hide()

-- Retain the EnvironmentPanel name for compatibility with UI callers.
PC.UI.EnvironmentPanel = panel

local title = panel:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontNormal"
)

title:SetPoint(
    "TOPLEFT",
    panel,
    "TOPLEFT",
    15,
    -14
)

title:SetText("Client Mods")

local subtitle = panel:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontHighlightSmall"
)

subtitle:SetPoint(
    "TOPLEFT",
    title,
    "BOTTOMLEFT",
    0,
    -5
)

subtitle:SetWidth(360)
subtitle:SetJustifyH("LEFT")
subtitle:SetText(
    "Optional client extensions and their available capabilities."
)

--------------------------------------------------
-- Scrollable Mod Cards
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
    -67
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

scrollChild:SetWidth(396)
scrollChild:SetHeight(520)
scrollFrame:SetScrollChild(scrollChild)

local cardStatus = {}
local cardDetails = {}
local cursorY = 6

local function CreateModCard(
    key,
    name,
    description,
    height,
    hasDetails
)
    local card = CreateFrame(
        "Frame",
        nil,
        scrollChild
    )

    card:SetWidth(391)
    card:SetHeight(height)

    card:SetPoint(
        "TOPLEFT",
        scrollChild,
        "TOPLEFT",
        0,
        -cursorY
    )

    card:SetBackdrop({
        bgFile =
            "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile =
            "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 12,
        edgeSize = 12,
        insets = {
            left = 4,
            right = 4,
            top = 4,
            bottom = 4
        }
    })

    card:SetBackdropColor(0.05, 0.05, 0.11, 0.95)
    card:SetBackdropBorderColor(0.42, 0.42, 0.50, 1)

    local heading = card:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    heading:SetPoint(
        "TOPLEFT",
        card,
        "TOPLEFT",
        12,
        -12
    )

    heading:SetText(name)

    local status = card:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

    status:SetWidth(220)
    status:SetJustifyH("RIGHT")
    status:SetPoint(
        "TOPRIGHT",
        card,
        "TOPRIGHT",
        -13,
        -14
    )

    cardStatus[key] = status

    local summary = card:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

    summary:SetWidth(364)
    summary:SetJustifyH("LEFT")
    summary:SetPoint(
        "TOPLEFT",
        card,
        "TOPLEFT",
        13,
        -40
    )

    summary:SetText(description)

    if hasDetails then
        local detail = card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

        detail:SetWidth(364)
        detail:SetJustifyH("LEFT")
        detail:SetPoint(
            "TOPLEFT",
            card,
            "TOPLEFT",
            13,
            -93
        )

        cardDetails[key] = detail
    end

    cursorY = cursorY + height + 9
end

CreateModCard(
    "classic",
    "ClassicAPI",
    "Optional modern item helpers, addon loading and quest turn-in events. The Vanilla core works without it.",
    152,
    true
)

CreateModCard(
    "super",
    "SuperWoW",
    "Provides enhanced unit information and targeting APIs. Priest Companion can use supported features in future modules.",
    102,
    false
)

CreateModCard(
    "nampower",
    "Nampower",
    "Provides additional casting and combat APIs, including spell-queue capabilities where supported.",
    102,
    false
)

CreateModCard(
    "unitxp",
    "UnitXP SP3",
    "Offers accurate unit distance and line-of-sight queries for features that explicitly use those APIs.",
    102,
    false
)

scrollChild:SetHeight(cursorY + 8)

--------------------------------------------------
-- Display Helpers
--------------------------------------------------

local function FormatClassicAPIVersion(version)
    local value = tonumber(version)

    if not value
    or value <= 0 then
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

local function SetModStatus(key, message, available)
    local value = cardStatus[key]

    if not value then
        return
    end

    value:SetText(message)

    if available then
        value:SetTextColor(0.30, 1.00, 0.30)
    else
        value:SetTextColor(1.00, 0.47, 0.36)
    end
end

--------------------------------------------------
-- Refresh Values (No Server Requests)
--------------------------------------------------

function panel.Refresh()
    local caps = PC.Capabilities or {}

    local classicVersion =
        FormatClassicAPIVersion(
            caps.classicAPIVersion
        )

    if caps.classicAPI then
        if caps.classicAPISupported then
            SetModStatus(
                "classic",
                "Detected v" .. classicVersion,
                true
            )
        else
            SetModStatus(
                "classic",
                "Unsupported v" .. classicVersion,
                false
            )
        end
    else
        SetModStatus(
            "classic",
            "Not detected",
            false
        )
    end

    cardDetails.classic:SetText(
        "Minimum: v" ..
        FormatClassicAPIVersion(
            caps.classicAPIMinVersion
        ) ..
        "   |   Adapter loaded: " ..
        (caps.classicAPIAdapter and "Yes" or "No")
    )

    if caps.superWoW then
        local status = "Detected"

        if caps.superWoWVersion then
            status = status .. " v" ..
                tostring(caps.superWoWVersion)
        elseif caps.superWoWDetection == "legacy" then
            status = status .. " (legacy)"
        end

        SetModStatus("super", status, true)
    else
        SetModStatus("super", "Not detected", false)
    end

    if caps.nampower then
        local status = "Detected"

        if caps.nampowerVersion then
            status = status .. " v" ..
                tostring(caps.nampowerVersion)
        end

        SetModStatus("nampower", status, true)
    else
        SetModStatus("nampower", "Not detected", false)
    end

    if caps.unitXP then
        local status = "Detected"

        if caps.unitXPDetection == "loader" then
            status = status .. " (loader)"
        elseif caps.unitXPDetection == "dispatcher" then
            status = status .. " (dispatcher)"
        end

        SetModStatus("unitxp", status, true)
    else
        SetModStatus("unitxp", "Not detected", false)
    end
end

--------------------------------------------------
-- Manual UI Refresh
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
    -10,
    -9
)

refreshButton:SetText("Refresh")

refreshButton:SetScript(
    "OnClick",
    function()
        panel.Refresh()
    end
)
