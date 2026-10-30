-- Priest Companion
-- Quest History
-- Unified per-character quest completion tracking.
--
-- Completion providers:
--   1. Current Quest Log (active/in progress state).
--   2. Direct server history query (.queststatus -> TWQUEST).
--   3. Priest Companion local history (QUEST_TURNED_IN).
--   4. pfQuest_history import when pfQuest is available.
--   5. Optional ClassicAPI completed-quest snapshots and positive API answers.
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
    serverUnavailableReason = nil,
    pfQuestImported = false,
    databaseReady = false,
    historyQueryAttempted = false,
    classicAttempted = false,
    classicActive = false,
    classicStartedAt = nil,
    classicResponded = false,
    classicReceived = 0,
    classicUnavailableReason = nil
}

QuestHistory.Session = session
local eventFrame
local UpdateQueryTimer

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
-- Optional ClassicAPI completed-quest snapshot
--------------------------------------------------

local function ValidQuestID(value)
    local id = tonumber(value)
    if not id or id ~= id or id < 1 or id > 4294967295 or id ~= math.floor(id) then return nil end
    return id
end

local function HasClassicHistoryReader()
    return type(GetQuestsCompleted) == "function"
        or (type(C_QuestLog) == "table" and type(C_QuestLog.GetAllCompletedQuestIDs) == "function")
end

function QuestHistory.ImportClassicAPIHistory()
    if not session.databaseReady then return 0, false end
    local data, array
    if type(GetQuestsCompleted) == "function" then
        local ok, result = pcall(GetQuestsCompleted)
        if ok and type(result) == "table" then data = result end
    end
    if not data and type(C_QuestLog) == "table"
    and type(C_QuestLog.GetAllCompletedQuestIDs) == "function" then
        local ok, result = pcall(C_QuestLog.GetAllCompletedQuestIDs)
        if ok and type(result) == "table" then data, array = result, true end
    end
    if not data then
        session.classicUnavailableReason = HasClassicHistoryReader() and "read_failed" or "unavailable"
        return 0, false
    end
    local imported, count, seen = 0, 0, {}
    -- Import positives only, including a nonempty cache surviving /reload.
    -- An empty table, even after a response, never clears local history.
    for key, value in pairs(data) do
        local id = ValidQuestID(array and value or key)
        if id and not seen[id] and (array or value == true or value == 1) then
            seen[id] = true
            count = count + 1
            local prior = QuestHistory.IsLocallyCompleted(id)
            if QuestHistory.MarkCompleted(id, "classicapi") and not prior then imported = imported + 1 end
        end
    end
    session.classicReceived = count
    if imported > 0 then RefreshQuestUI() end
    return imported, true
end

local function ImportClassicAPICompletion(questID)
    if not session.databaseReady or type(C_QuestLog) ~= "table"
    or type(C_QuestLog.IsQuestFlaggedCompleted) ~= "function" then return false end
    local ok, result = pcall(C_QuestLog.IsQuestFlaggedCompleted, questID)
    -- False before the server response means unknown, not incomplete.
    if ok and (result == true or result == 1) then
        return QuestHistory.MarkCompleted(questID, "classicapi")
    end
    return false
end

function QuestHistory.GetClassicAPIQueryState()
    return { available = HasClassicHistoryReader(),
        canQuery = HasClassicHistoryReader() and type(QueryQuestsCompleted) == "function"
            and QuestHistory.ClassicQueryRegistered == true,
        eventRegistered = QuestHistory.ClassicQueryRegistered == true,
        attempted = session.classicAttempted, active = session.classicActive,
        responded = session.classicResponded, received = session.classicReceived,
        unavailableReason = session.classicUnavailableReason }
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

    if ImportClassicAPICompletion(questID) then return true end

    if not PC.API
    or type(
        PC.API.IsQuestCompleted
    ) ~= "function" then
        return false
    end

    local success
    local completed

    success, completed = pcall(
        PC.API.IsQuestCompleted,
        questID
    )

    -- Providers are optional. Only a successful positive result
    -- may be persisted; nil, false and API errors remain unknown.
    if success and completed == true then
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
    if UpdateQueryTimer then UpdateQueryTimer() end
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
        session.queryScheduled = false
        session.serverUnavailableReason = "no_chat_api"
        return false
    end

    -- Guild chat is the server-specific transport used by OctoWoW.
    -- Do not try to send to GUILD when the character has no guild.
    if type(IsInGuild) == "function"
    and not IsInGuild() then
        session.queryScheduled = false
        session.serverUnavailableReason = "not_in_guild"
        return false
    end

    session.queryAttempted = true
    session.queryScheduled = false
    session.queryActive = true
    session.queryStartedAt = GetTime()
    session.serverResponded = false
    session.serverReceived = 0
    session.serverUnavailableReason = nil
    if UpdateQueryTimer then UpdateQueryTimer() end

    local success = pcall(
        SendChatMessage,
        SERVER_COMMAND,
        SERVER_CHANNEL
    )

    if not success then
        session.queryActive = false
        session.queryAttempted = false
        session.queryStartedAt = nil
        session.queryScheduled = false
        session.serverUnavailableReason = "send_failed"
        if UpdateQueryTimer then UpdateQueryTimer() end
        return false
    end

    return true
end

-- One orchestrated attempt: prefer the DLL's automatic/login cache first,
-- then its query, and keep the original direct server transport as fallback.
function QuestHistory.QueryCompletionHistory(force)
    if not session.databaseReady then return false end
    if session.classicActive or session.queryActive then return false end
    if session.historyQueryAttempted and not force then return false end
    session.historyQueryAttempted = true
    session.queryScheduled = false
    QuestHistory.ImportClassicAPIHistory()
    if not force and (session.classicResponded or session.classicReceived > 0) then
        if UpdateQueryTimer then UpdateQueryTimer() end
        return true
    end
    if HasClassicHistoryReader() and type(QueryQuestsCompleted) == "function"
    and QuestHistory.ClassicQueryRegistered then
        session.classicAttempted = true
        session.classicActive = true
        session.classicStartedAt = GetTime()
        session.classicResponded = false
        session.classicUnavailableReason = nil
        if UpdateQueryTimer then UpdateQueryTimer() end
        local ok, result = pcall(QueryQuestsCompleted)
        if ok and result ~= false then return true end
        session.classicActive = false
        session.classicStartedAt = nil
        session.classicUnavailableReason = "query_failed"
    else
        session.classicUnavailableReason = HasClassicHistoryReader() and "query_unavailable" or "unavailable"
    end
    local result = QuestHistory.QueryServer(force)
    if UpdateQueryTimer then UpdateQueryTimer() end
    return result
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
            session.serverReceived,

        unavailableReason =
            session.serverUnavailableReason
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

-- Explicit exclusions only: sharing a reward does not imply exclusivity.
function QuestHistory.GetBlockingQuest(questID)
    local quest = PC.Data and PC.Data.Quests
        and PC.Data.Quests[tonumber(questID)]
    local alternatives = quest and quest.exclusiveWith

    if alternatives then
        local i
        for i = 1, table.getn(alternatives) do
            if QuestHistory.IsCompleted(alternatives[i]) then
                return alternatives[i]
            end
        end
    end

    return nil
end

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

    local blockingQuestID = QuestHistory.GetBlockingQuest(questID)
    if blockingQuestID then
        return "blocked", blockingQuestID
    end

    return "unknown"
end

--------------------------------------------------
-- Event Frame
--------------------------------------------------

eventFrame =
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

-- ClassicAPI backports QUEST_TURNED_IN with questID in arg1.
-- It may be present even if the client loaded the standard TOC.
-- A successful RegisterEvent call is not proof that a client will
-- deliver an event, so keep the other history providers enabled.
QuestHistory.LiveTurnInRegistered = false

if PC.Capabilities
and PC.Capabilities.questTurnInEvent then
    QuestHistory.LiveTurnInRegistered = pcall(
        eventFrame.RegisterEvent,
        eventFrame,
        "QUEST_TURNED_IN"
    )
end

-- Callable APIs are the capability check: these functions are deliberately
-- absent on non-Turtle clients, regardless of the DLL version or TOC flavor.
QuestHistory.ClassicQueryRegistered = false
if HasClassicHistoryReader() then
    QuestHistory.ClassicQueryRegistered = pcall(eventFrame.RegisterEvent, eventFrame, "QUEST_QUERY_COMPLETE")
end

eventFrame:SetScript(
    "OnEvent",
    function()
        --------------------------------------------------
        -- SavedVariables Ready
        --------------------------------------------------

        if event == "VARIABLES_LOADED" then
            EnsureRootDatabase()
            session.databaseReady = true
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
            QuestHistory.ImportClassicAPIHistory()

            session.loginTime =
                GetTime()

            session.queryScheduled = not session.classicResponded
            if UpdateQueryTimer then UpdateQueryTimer() end
            return
        end

        if event == "QUEST_QUERY_COMPLETE" then
            local _, readable = QuestHistory.ImportClassicAPIHistory()
            if readable then
                session.classicResponded = true
                session.classicActive = false
                session.classicStartedAt = nil
                session.classicUnavailableReason = nil
                session.queryScheduled = false
                if UpdateQueryTimer then UpdateQueryTimer() end
            end
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

local function QueryTick()
    local now = GetTime()
    if session.queryScheduled and session.loginTime
    and now >= session.loginTime + SERVER_QUERY_DELAY then
        QuestHistory.QueryCompletionHistory(false)
    end
    if session.classicActive and session.classicStartedAt
    and now >= session.classicStartedAt + SERVER_QUERY_TIMEOUT then
        session.classicActive = false
        session.classicStartedAt = nil
        session.classicUnavailableReason = "timeout"
        QuestHistory.ImportClassicAPIHistory()
        -- Preserve the last positive snapshot and try the old transport once.
        QuestHistory.QueryServer(false)
    end
    if session.queryActive and session.queryStartedAt
    and now >= session.queryStartedAt + SERVER_QUERY_TIMEOUT then FinishServerQuery() end
    UpdateQueryTimer()
end
UpdateQueryTimer = function()
    if session.queryScheduled or session.classicActive or session.queryActive then
        eventFrame:SetScript("OnUpdate", QueryTick)
    else eventFrame:SetScript("OnUpdate", nil) end
end
