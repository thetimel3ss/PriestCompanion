-- Priest Companion
-- Environment Panel
-- Read-only client capability and quest-history diagnostics.

local PC = PriestCompanion
local mainFrame = PC.UI.MainFrame

if not mainFrame then
    return
end

--------------------------------------------------
-- Layout
--------------------------------------------------

local panel = CreateFrame(
    "Frame",
    nil,
    mainFrame
)

panel:SetPoint(
    "TOPLEFT",
    mainFrame,
    "TOPLEFT",
    25,
    -55
)

panel:SetPoint(
    "BOTTOMRIGHT",
    mainFrame,
    "BOTTOMRIGHT",
    -25,
    25
)

panel:SetBackdrop({
    bgFile =
        "Interface\\Tooltips\\UI-Tooltip-Background",

    edgeFile =
        "Interface\\Tooltips\\UI-Tooltip-Border",

    tile = true,
    tileSize = 16,
    edgeSize = 16,

    insets = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4
    }
})

panel:SetBackdropColor(
    0.03, 0.03, 0.03, 0.96
)

panel:SetBackdropBorderColor(
    0.30, 0.30, 0.30, 1
)

panel:Hide()

PC.UI.EnvironmentPanel = panel

--------------------------------------------------
-- Static Rows
--------------------------------------------------

local rows = {}
local nextY = 14

local function AddSection(title)
    local heading = panel:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    heading:SetPoint(
        "TOPLEFT",
        panel,
        "TOPLEFT",
        16,
        -nextY
    )

    heading:SetText(title)
    nextY = nextY + 25
end

local function AddRow(key, label)
    local caption = panel:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

    caption:SetWidth(145)
    caption:SetJustifyH("LEFT")
    caption:SetPoint(
        "TOPLEFT",
        panel,
        "TOPLEFT",
        18,
        -nextY
    )

    caption:SetText(label)

    local value = panel:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

    value:SetWidth(270)
    value:SetJustifyH("RIGHT")
    value:SetPoint(
        "TOPRIGHT",
        panel,
        "TOPRIGHT",
        -16,
        -nextY
    )

    rows[key] = value
    nextY = nextY + 19
end

AddSection("Client")
AddRow("addonVersion", "Addon Version")
AddRow("flavor", "Flavor")

nextY = nextY + 9

AddSection("ClassicAPI")
AddRow("classicDetected", "Detected")
AddRow("classicVersion", "Version")
AddRow("classicMinimum", "Minimum")
AddRow("classicSupported", "Supported")
AddRow("classicAdapter", "Adapter Loaded")

nextY = nextY + 9

AddSection("Quest History")
AddRow("turnIn", "QUEST_TURNED_IN")
AddRow("serverQuery", "Server Query")

nextY = nextY + 9

AddSection("Other Extensions")
AddRow("superWoW", "SuperWoW")
AddRow("nampower", "Nampower")
AddRow("unitXP", "UnitXP SP3")

local footer = panel:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontDisableSmall"
)

footer:SetWidth(430)
footer:SetJustifyH("LEFT")
footer:SetPoint(
    "BOTTOMLEFT",
    panel,
    "BOTTOMLEFT",
    16,
    10
)

footer:SetText(
    "DLL detection is sampled at startup. Event registration does not confirm delivery."
)

--------------------------------------------------
-- Helpers
--------------------------------------------------

local function FormatClassicAPIVersion(version)
    local packed = tonumber(version)

    if not packed
    or packed <= 0 then
        return "unavailable"
    end

    packed = math.floor(packed)

    local major = math.floor(
        packed / 10000
    )

    local minor = math.floor(
        (packed % 10000) / 100
    )

    local patch = packed % 100

    return string.format(
        "%d.%d.%d",
        major,
        minor,
        patch
    )
end

local function EnabledText(value)
    if value == true then
        return "Yes"
    end

    return "No"
end

local function SetRow(key, value)
    if rows[key] then
        rows[key]:SetText(
            tostring(value or "unavailable")
        )
    end
end

--------------------------------------------------
-- Live Display Refresh
--------------------------------------------------

function panel.Refresh()
    local capabilities = PC.Capabilities or {}
    local environment = PC.Environment or {}
    local history = PC.QuestHistory

    SetRow(
        "addonVersion",
        PC.version or "unknown"
    )

    SetRow(
        "flavor",
        environment.flavor or "unknown"
    )

    SetRow(
        "classicDetected",
        EnabledText(
            capabilities.classicAPI
        )
    )

    SetRow(
        "classicVersion",
        FormatClassicAPIVersion(
            capabilities.classicAPIVersion
        )
    )

    SetRow(
        "classicMinimum",
        FormatClassicAPIVersion(
            capabilities.classicAPIMinVersion
        )
    )

    SetRow(
        "classicSupported",
        EnabledText(
            capabilities.classicAPISupported
        )
    )

    SetRow(
        "classicAdapter",
        EnabledText(
            capabilities.classicAPIAdapter
        )
    )

    local turnInStatus = "Unavailable"

    if capabilities.questTurnInEvent then
        turnInStatus = "Not registered"

        if history
        and history.LiveTurnInRegistered == true then
            turnInStatus =
                "Registered (delivery not verified)"
        end
    end

    SetRow("turnIn", turnInStatus)

    local serverStatus = "Not queried"

    if history
    and type(
        history.GetServerQueryState
    ) == "function" then

        local state =
            history.GetServerQueryState()

        if state then
            if state.unavailableReason then
                serverStatus =
                    "Unavailable (" ..
                    tostring(state.unavailableReason) ..
                    ")"
            elseif state.active then
                serverStatus =
                    "Waiting for response"
            elseif state.responded then
                serverStatus =
                    "Responded (" ..
                    tostring(state.received or 0) ..
                    " IDs processed)"
            elseif state.attempted then
                serverStatus = "No response"
            end
        end
    end

    SetRow("serverQuery", serverStatus)

    local superWoWStatus =
        EnabledText(capabilities.superWoW)

    if capabilities.superWoWVersion then
        superWoWStatus =
            superWoWStatus ..
            " (v" ..
            tostring(
                capabilities.superWoWVersion
            ) ..
            ")"
    elseif capabilities.superWoWDetection ==
    "legacy" then
        superWoWStatus =
            superWoWStatus ..
            " (legacy APIs)"
    end

    SetRow("superWoW", superWoWStatus)

    local nampowerStatus =
        EnabledText(capabilities.nampower)

    if capabilities.nampowerVersion then
        nampowerStatus =
            nampowerStatus ..
            " (v" ..
            tostring(
                capabilities.nampowerVersion
            ) ..
            ")"
    elseif capabilities.nampowerDetection ==
    "probe_failed" then
        nampowerStatus =
            nampowerStatus ..
            " (probe failed)"
    end

    SetRow("nampower", nampowerStatus)

    local unitXPStatus =
        EnabledText(capabilities.unitXP)

    if capabilities.unitXPDetection ==
    "loader" then
        unitXPStatus =
            unitXPStatus .. " (loader flag)"
    elseif capabilities.unitXPDetection ==
    "dispatcher" then
        unitXPStatus =
            unitXPStatus .. " (dispatcher probe)"
    elseif capabilities.unitXPDetection ==
    "probe_failed" then
        unitXPStatus =
            unitXPStatus .. " (probe failed)"
    end

    SetRow("unitXP", unitXPStatus)
end

--------------------------------------------------
-- Manual Display Refresh
--------------------------------------------------

local refreshButton = CreateFrame(
    "Button",
    nil,
    panel,
    "UIPanelButtonTemplate"
)

refreshButton:SetWidth(74)
refreshButton:SetHeight(20)

refreshButton:SetPoint(
    "TOPRIGHT",
    panel,
    "TOPRIGHT",
    -12,
    -9
)

refreshButton:SetText("Refresh")

refreshButton:SetScript(
    "OnClick",
    function()
        panel.Refresh()
    end
)
