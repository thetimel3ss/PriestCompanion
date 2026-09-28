-- Priest Companion
-- Quest Chain Database
--
-- Steps are stored in chronological order.
-- SourceDetails intentionally renders them in reverse order:
-- reward quest first, then each prerequisite below it.

local PC = PriestCompanion

PC.Data.QuestChains =
    PC.Data.QuestChains or {}

local QuestChains =
    PC.Data.QuestChains

--------------------------------------------------
-- Gravestone Scepter - Alliance
--------------------------------------------------

QuestChains[
    "gravestone_scepter_alliance"
] = {
    name = "Blackfathom Villainy",

    rewardQuestID = 1200,

    steps = {
        1198,
        1200
    }
}
