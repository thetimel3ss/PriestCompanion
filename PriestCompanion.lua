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
    ) or "0.1.0"

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

function PC.ShowEnvironment()
    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff66ccffPriest Companion Environment|r"
    )

    DEFAULT_CHAT_FRAME:AddMessage(
        "Flavor: " ..
        tostring(
            PC.Environment.flavor
        )
    )

    DEFAULT_CHAT_FRAME:AddMessage(
        "ClassicAPI: " ..
        tostring(
            PC.Capabilities.classicAPI
        )
    )

    DEFAULT_CHAT_FRAME:AddMessage(
        "SuperWoW: " ..
        tostring(
            PC.Capabilities.superWoW
        )
    )

    DEFAULT_CHAT_FRAME:AddMessage(
        "Nampower: " ..
        tostring(
            PC.Capabilities.nampower
        )
    )

    DEFAULT_CHAT_FRAME:AddMessage(
        "UnitXP: " ..
        tostring(
            PC.Capabilities.unitXP
        )
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
            "/priest env - Show detected client extensions"
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