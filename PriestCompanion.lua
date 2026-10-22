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
    ) or "0.2.0"

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
-- Options
--------------------------------------------------

function PC.ShowOptions()
    if PC.UI
    and type(PC.UI.OpenTab) == "function" then
        PC.UI.OpenTab("options", "general")
        return
    end

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cffff0000Priest Companion:|r " ..
        "Options panel is unavailable."
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
            "/priest options - Open Options > General"
        )
        DEFAULT_CHAT_FRAME:AddMessage(
            "/pc res status - Preview eligible Resurrection targets"
        )
        DEFAULT_CHAT_FRAME:AddMessage(
            "/pc res - Cast once on the next eligible Resurrection target"
        )

        return
    end

    if message == "options" then
        PC.ShowOptions()
        return
    end

    if message == "res status" or message == "res next" then
        local assistant = PC.Modules.ResurrectionAssistant
        if assistant and type(assistant.PrintStatus) == "function" then
            assistant.PrintStatus()
        else
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cffff0000Priest Companion:|r " ..
                "Resurrection Assistant is unavailable."
            )
        end
        return
    end

    if message == "res" then
        local assistant = PC.Modules.ResurrectionAssistant
        if not assistant or type(assistant.TryResurrect) ~= "function" then
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cffff0000Priest Companion:|r " ..
                "Resurrection Assistant is unavailable."
            )
            return
        end
        local ok, result = assistant.TryResurrect()
        if not ok or (result and
        string.find(result, "Click the released", 1, true)) then
            DEFAULT_CHAT_FRAME:AddMessage(
                "|cff66ccffPriest Companion:|r " ..
                (result or "No eligible target.")
            )
        end
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