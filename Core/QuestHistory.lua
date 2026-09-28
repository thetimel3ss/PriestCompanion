-- Priest Companion
-- Quest History
-- Unified per-character quest completion tracking.
--
-- Completion providers:
--   1. Current Quest Log (active/in progress state).
--   2. Direct server history query (.queststatus -> TWQUEST).
--   3. Priest Companion local history (QUEST_TURNED_IN).
--   4. pfQuest_history import when pfQuest is available.
--   5. Positive answers from an available API provider.
--
-- Important:
--   A negative/false answer is never treated as proof that a quest was
--   never completed on Vanilla-style clients.

local PC = PriestCompanion

PC.QuestHistory =
    PC.QuestHistory or {}

local QuestHistory =
    PC.QuestHistory

--------------------------------------------------
-- Constants
--------------------------------------------------

local SERVER_QUERY_DELAY = 2
local SERVER_QUERY_TIMEOUT = 4
local SERVER_PREFIX = "TWQUEST"
local SERVER_COMMAND = ".queststatus"
local SERVER_CHANNEL = "GUILD"

--------------------------------------------------
-- Session State
--------------------------------------------------

local session = {
    loginTime = nil,
    queryScheduled = false,
    queryAttempted = false,
    queryActive = false,
    queryStartedAt = nil,
    serverResponded = false,
    serverReceived = 0,
    pfQuestImported = false
}

QuestHistory.Session = session

--------------------------------------------------
-- Character Identity
--------------------------------------------------

local function GetCharacterKey()
    local playerName =
        UnitName("player")

    if not playerName
    or playerName == "" then
        return nil
    end

    local realmName = nil

    if type(GetRealmName) == "function" then
        realmName = GetRealmName()
    end

    if (not realmName
    or realmName == "")
    and type(GetCVar) == "function" then
        realmName =
            GetCVar("realmName")
    end

    if not realmName
    or realmName == "" then
        realmName = "UnknownRealm"
    end

    return
        tostring(realmName) ..
        "::" ..
        tostring(playerName)
end

--------------------------------------------------
-- Database
--------------------------------------------------

local function EnsureRootDatabase()
    PriestCompanionDB =
        PriestCompanionDB or {}

    PriestCompanionDB.questHistory =
        PriestCompanionDB.questHistory or {}

    PriestCompanionDB.questHistory.characters =
        PriestCompanionDB.questHistory.characters or {}

    return PriestCompanionDB.questHistory
end

local function GetCharacterDatabase(
    create
)
    local root =
        EnsureRootDatabase()

    local characterKey =
        GetCharacterKey()

    if not characterKey then
        return nil
    end

    local character =
        root.characters[
            characterKey
        ]

    if not character
    and create then
        character = {
            completed = {},
            completionSources = {}
        }

        root.characters[
            characterKey
        ] = character
    end

    if character then
        character.completed =
            character.completed or {}

        character.completionSources =
            character.completionSources or {}
    end

    return character
end

--------------------------------------------------
-- UI Refresh
--------------------------------------------------

local function RefreshQuestUI()
    if PC.UI
    and PC.UI.SourceDetails
    and type(
        PC.UI.SourceDetails.Refresh
    ) == "function" then
        PC.UI.SourceDetails.Refresh()
    end

    if PC.UI
    and PC.UI.SourceTooltip
    and type(
        PC.UI.SourceTooltip.Refresh
    ) == "function" then
        PC.UI.SourceTooltip.Refresh()
    end
end

--------------------------------------------------
-- Public Database Access
--------------------------------------------------

function QuestHistory.GetCharacterKey()
    return GetCharacterKey()
end

function QuestHistory.GetCharacterDatabase()
    return
        GetCharacterDatabase(
            true
        )
end

--------------------------------------------------
-- Completion Sources
--------------------------------------------------

local function AddCompletionSource(
    character,
    questID,
    source
)
    if not character
    or not source then
        return
    end

    local sources =
        character.completionSources[
            questID
        ]

    if type(sources) ~= "table" then
        sources = {}

        character.completionSources[
            questID
        ] = sources
    end

    sources[source] = true
end

function QuestHistory.GetCompletionSources(
    questID
)
    questID =
        tonumber(questID)

    if not questID then
        return nil
    end

    local character =
        GetCharacterDatabase(
            false
        )

    if not character
    or not character.completionSources then
        return nil
    end

    return
        character.completionSources[
            questID
        ]
end

--------------------------------------------------
-- Completion History
--------------------------------------------------

function QuestHistory.MarkCompleted(
    questID,
    source
)
    questID =
        tonumber(questID)

    if not questID then
        return false
    end

    local character =
        GetCharacterDatabase(
            true
        )

    if not character then
        return false
    end

    character.completed[
        questID
    ] = true

    AddCompletionSource(
        character,
        questID,
        source or "local"
    )

    return true
end

function QuestHistory.IsLocallyCompleted(
    questID
)
    questID =
        tonumber(questID)

    if not questID then
        return false
    end

    local character =
        GetCharacterDatabase(
            false
        )

    if not character
    or not character.completed then
        return false
    end

    return
        character.completed[
            questID
        ] == true
end

--------------------------------------------------
-- pfQuest Provider
--------------------------------------------------

function QuestHistory.ImportPfQuestHistory()
    if type(pfQuest_history) ~= "table" then
        return 0
    end

    local imported = 0
    local questID

    for questID in pairs(
        pfQuest_history
    ) do
        local numericID =
            tonumber(questID)

        if numericID then
            local wasCompleted =
                QuestHistory.IsLocallyCompleted(
                    numericID
                )

            QuestHistory.MarkCompleted(
                numericID,
                "pfquest"
            )

            if not wasCompleted then
                imported =
                    imported + 1
            end
        end
    end

    session.pfQuestImported = true

    if imported > 0 then
        RefreshQuestUI()
    end

    return imported
end

--------------------------------------------------
-- API Completion Provider
--------------------------------------------------

function QuestHistory.ImportCompletionFromAPI(
    questID
)
    questID =
        tonumber(questID)

    if not questID then
        return false
    end

    if not PC.API
    or type(
        PC.API.IsQuestCompleted
    ) ~= "function" then
        return false
    end

    local completed =
        PC.API.IsQuestCompleted(
            questID
        )

    -- Only a positive result is trustworthy enough to persist.
    -- false/nil remains unknown on Vanilla-style clients.
    if completed == true then
        QuestHistory.MarkCompleted(
            questID,
            "api"
        )

        return true
    end

    return false
end

--------------------------------------------------
-- Server Provider
--------------------------------------------------

local function ParseServerQuestIDs(
    message
)
    local count = 0

    if not message
    or message == "" then
        return count
    end

    local questIDText

    for questIDText in
        string.gfind(
            tostring(message),
            "%d+"
        )
    do
        local questID =
            tonumber(
                questIDText
            )

        if questID then
            QuestHistory.MarkCompleted(
                questID,
                "server"
            )

            count =
                count + 1
        end
    end

    return count
end

local function FinishServerQuery()
    if not session.queryActive then
        return
    end

    session.queryActive = false
    session.queryStartedAt = nil

    RefreshQuestUI()
end

function QuestHistory.QueryServer(
    force
)
    if session.queryActive then
        return false
    end

    if session.queryAttempted
    and not force then
        return false
    end

    if type(SendChatMessage) ~=
    "function" then
        return false
    end

    session.queryAttempted = true
    session.queryScheduled = false
    session.queryActive = true
    session.queryStartedAt = GetTime()
    session.serverResponded = false
    session.serverReceived = 0

    SendChatMessage(
        SERVER_COMMAND,
        SERVER_CHANNEL
    )

    return true
end

function QuestHistory.GetServerQueryState()
    return {
        attempted =
            session.queryAttempted,

        active =
            session.queryActive,

        responded =
            session.serverResponded,

        received =
            session.serverReceived
    }
end

--------------------------------------------------
-- Unified Completion State
--------------------------------------------------

function QuestHistory.IsCompleted(
    questID
)
    if QuestHistory.IsLocallyCompleted(
        questID
    ) then
        return true
    end

    -- pfQuest can already contain a valid snapshot from an earlier
    -- /db query. Import lazily as well as during login so load order
    -- never becomes a hard dependency.
    if not session.pfQuestImported
    and type(pfQuest_history) ==
    "table" then
        QuestHistory.ImportPfQuestHistory()

        if QuestHistory.IsLocallyCompleted(
            questID
        ) then
            return true
        end
    end

    if QuestHistory.ImportCompletionFromAPI(
        questID
    ) then
        return true
    end

    return false
end

--------------------------------------------------
-- Quest State
--------------------------------------------------

function QuestHistory.GetStatus(
    questID,
    questName
)
    -- Current Quest Log wins for presentation. A repeatable quest can be
    -- historically completed and currently active again.
    if questName
    and PC.API
    and type(
        PC.API.IsQuestInLog
    ) == "function"
    and PC.API.IsQuestInLog(
        questName
    ) then
        return "in_progress"
    end

    if QuestHistory.IsCompleted(
        questID
    ) then
        return "completed"
    end

    return "unknown"
end

--------------------------------------------------
-- Event Frame
--------------------------------------------------

local eventFrame =
    CreateFrame("Frame")

eventFrame:RegisterEvent(
    "VARIABLES_LOADED"
)

eventFrame:RegisterEvent(
    "PLAYER_LOGIN"
)

-- Direct server history provider.
eventFrame:RegisterEvent(
    "CHAT_MSG_ADDON"
)

-- ClassicAPI backports QUEST_TURNED_IN with the quest ID in arg1.
-- Register it only in the ClassicAPI flavor so Vanilla clients are not
-- asked to subscribe to an event they do not know.
if PC.Environment
and PC.Environment.classicAPI then
    eventFrame:RegisterEvent(
        "QUEST_TURNED_IN"
    )
end

eventFrame:SetScript(
    "OnEvent",
    function()
        --------------------------------------------------
        -- SavedVariables Ready
        --------------------------------------------------

        if event == "VARIABLES_LOADED" then
            EnsureRootDatabase()
            return
        end

        --------------------------------------------------
        -- Login
        --------------------------------------------------

        if event == "PLAYER_LOGIN" then
            GetCharacterDatabase(
                true
            )

            QuestHistory.ImportPfQuestHistory()

            session.loginTime =
                GetTime()

            session.queryScheduled = true

            return
        end

        --------------------------------------------------
        -- Server Quest History
        --------------------------------------------------

        if event == "CHAT_MSG_ADDON" then
            if not session.queryActive then
                return
            end

            if arg1 ~= SERVER_PREFIX then
                return
            end

            session.serverResponded = true

            session.serverReceived =
                session.serverReceived +
                ParseServerQuestIDs(
                    arg2
                )

            return
        end

        --------------------------------------------------
        -- Live Quest Turn-In
        --------------------------------------------------

        if event == "QUEST_TURNED_IN" then
            local questID =
                tonumber(arg1)

            if questID then
                QuestHistory.MarkCompleted(
                    questID,
                    "turnin"
                )

                RefreshQuestUI()
            end
        end
    end
)

--------------------------------------------------
-- Delayed Query / Timeout
--------------------------------------------------

eventFrame:SetScript(
    "OnUpdate",
    function()
        local now =
            GetTime()

        --------------------------------------------------
        -- Query once after login
        --------------------------------------------------

        if session.queryScheduled
        and not session.queryAttempted
        and session.loginTime
        and now >=
        session.loginTime +
        SERVER_QUERY_DELAY then

            QuestHistory.QueryServer(
                false
            )
        end

        --------------------------------------------------
        -- Finish collection window
        --------------------------------------------------

        if session.queryActive
        and session.queryStartedAt
        and now >=
        session.queryStartedAt +
        SERVER_QUERY_TIMEOUT then

            FinishServerQuery()
        end
    end
)
