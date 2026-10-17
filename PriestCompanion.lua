-- Priest Companion
-- Main

local PC = PriestCompanion

--------------------------------------------------
-- Metadata
--------------------------------------------------

PC.version =
    GetAddOnMetadata(
        PC.name,
        "Version"
    ) or "0.1.2"

--------------------------------------------------
-- SavedVariables
--------------------------------------------------

function PC.InitializeDatabase()
    PriestCompanionDB =
        PriestCompanionDB or {}

    if PriestCompanionDB.debug == nil then
        PriestCompanionDB.debug = false
    end
end

--------------------------------------------------
-- Main Window
--------------------------------------------------

function PC.ToggleMainFrame()
    local frame =
        PC.UI.MainFrame

    if not frame then
        DEFAULT_CHAT_FRAME:AddMessage(
            "|cffff0000Priest Companion:|r " ..
            "Main frame was not loaded."
        )

        return
    end

    if frame:IsShown() then
        frame:Hide()
    else
        frame:Show()
    end
end

--------------------------------------------------
-- Environment Information
--------------------------------------------------

local function FormatClassicAPIVersion(version)
    local packed = tonumber(version)

    if not packed
    or packed <= 0 then
        return "unavailable"
    end

    packed = math.floor(packed)

    local major = math.floor(packed / 10000)
    local minor = math.floor((packed % 10000) / 100)
    local patch = packed % 100

    return string.format(
        "%d.%d.%d",
        major,
        minor,
        patch
    )
end

local function PrintEnvironmentValue(label, value)
    DEFAULT_CHAT_FRAME:AddMessage(
        "  " .. label .. ": " .. tostring(value)
    )
end

function PC.ShowEnvironment()
    local capabilities = PC.Capabilities or {}
    local environment = PC.Environment or {}
    local history = PC.QuestHistory

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff66ccffPriest Companion Environment|r"
    )

    PrintEnvironmentValue(
        "Addon Version",
        PC.version or "unknown"
    )

    PrintEnvironmentValue(
        "Flavor",
        environment.flavor or "unknown"
    )

    --------------------------------------------------
    -- ClassicAPI
    --------------------------------------------------

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff66ccffClassicAPI|r"
    )

    PrintEnvironmentValue(
        "Detected",
        capabilities.classicAPI == true
    )

    PrintEnvironmentValue(
        "Version",
        FormatClassicAPIVersion(
            capabilities.classicAPIVersion
        )
    )

    PrintEnvironmentValue(
        "Minimum",
        FormatClassicAPIVersion(
            capabilities.classicAPIMinVersion
        )
    )

    PrintEnvironmentValue(
        "Supported",
        capabilities.classicAPISupported == true
    )

    PrintEnvironmentValue(
        "Adapter Loaded",
        capabilities.classicAPIAdapter == true
    )

    --------------------------------------------------
    -- Quest History
    --------------------------------------------------

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff66ccffQuest History|r"
    )

    local turnInStatus = "unavailable"

    if capabilities.questTurnInEvent then
        turnInStatus = "not registered"

        if history
        and history.LiveTurnInRegistered == true then
            turnInStatus =
                "registered (delivery not verified)"
        end
    end

    PrintEnvironmentValue(
        "QUEST_TURNED_IN",
        turnInStatus
    )

    if history
    and type(
        history.GetServerQueryState
    ) == "function" then
        local state = history.GetServerQueryState()
        local serverStatus = "not queried"

        if state then
            if state.unavailableReason then
                serverStatus =
                    "unavailable (" ..
                    tostring(state.unavailableReason) ..
                    ")"
            elseif state.active then
                serverStatus = "waiting for response"
            elseif state.responded then
                serverStatus =
                    "responded (" ..
                    tostring(state.received or 0) ..
                    " quest IDs)"
            elseif state.attempted then
                serverStatus = "no response"
            end
        end

        PrintEnvironmentValue(
            "Server Query",
            serverStatus
        )
    end

    --------------------------------------------------
    -- Other Extensions
    --------------------------------------------------

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff66ccffOther Extensions|r"
    )

    local superWoWStatus =
        tostring(capabilities.superWoW == true)

    if capabilities.superWoWVersion then
        superWoWStatus =
            superWoWStatus .. " (v" ..
            tostring(capabilities.superWoWVersion) ..
            ")"
    elseif capabilities.superWoWDetection == "legacy" then
        superWoWStatus =
            superWoWStatus ..
            " (legacy APIs; version unknown)"
    end

    PrintEnvironmentValue(
        "SuperWoW",
        superWoWStatus
    )

    local nampowerStatus =
        tostring(capabilities.nampower == true)

    if capabilities.nampowerVersion then
        nampowerStatus =
            nampowerStatus .. " (v" ..
            tostring(capabilities.nampowerVersion) ..
            ")"
    elseif capabilities.nampowerDetection == "probe_failed" then
        nampowerStatus =
            nampowerStatus .. " (version probe failed)"
    end

    PrintEnvironmentValue(
        "Nampower",
        nampowerStatus
    )

    local unitXPStatus =
        tostring(capabilities.unitXP == true)

    if capabilities.unitXPDetection == "loader" then
        unitXPStatus =
            unitXPStatus .. " (loader flag)"
    elseif capabilities.unitXPDetection == "dispatcher" then
        unitXPStatus =
            unitXPStatus .. " (dispatcher probe)"
    elseif capabilities.unitXPDetection == "probe_failed" then
        unitXPStatus =
            unitXPStatus .. " (dispatcher probe failed)"
    end

    PrintEnvironmentValue(
        "UnitXP SP3",
        unitXPStatus
    )
end

--------------------------------------------------
-- Slash Commands
--------------------------------------------------

function PC.OnSlashCommand(message)
    message =
        string.lower(
            message or ""
        )

    if message == "" then
        PC.ToggleMainFrame()
        return
    end

    if message == "help" then
        DEFAULT_CHAT_FRAME:AddMessage(
            "|cff66ccffPriest Companion|r"
        )

        DEFAULT_CHAT_FRAME:AddMessage(
            "/priest - Open or close Priest Companion"
        )

        DEFAULT_CHAT_FRAME:AddMessage(
            "/priest help - Show available commands"
        )

        DEFAULT_CHAT_FRAME:AddMessage(
            "/priest env - Show client capabilities and quest diagnostics"
        )

        return
    end

    if message == "env" then
        PC.ShowEnvironment()
        return
    end

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff66ccffPriest Companion:|r " ..
        "Unknown command. Type /priest help."
    )
end

SLASH_PRIESTCOMPANION1 = "/priest"
SLASH_PRIESTCOMPANION2 = "/pc"

SlashCmdList["PRIESTCOMPANION"] =
    PC.OnSlashCommand

--------------------------------------------------
-- Events
--------------------------------------------------

function PC.OnEvent()
    if event == "VARIABLES_LOADED" then
        PC.InitializeDatabase()
    end
end

local eventFrame =
    CreateFrame("Frame")

eventFrame:RegisterEvent(
    "VARIABLES_LOADED"
)

eventFrame:SetScript(
    "OnEvent",
    PC.OnEvent
)