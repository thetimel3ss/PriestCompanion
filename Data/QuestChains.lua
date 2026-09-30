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

--------------------------------------------------
-- Flaring Baton
--------------------------------------------------

QuestChains[
    "flaring_baton"
] = {
    name = "The Escape",

    rewardQuestID = 863,

    steps = {
        858,
        863
    }
}

--------------------------------------------------
-- Spark of the People's Militia
--------------------------------------------------

QuestChains[
    "peoples_militia"
] = {
    name = "The People's Militia",

    rewardQuestID = 14,

    steps = {
        12,
        13,
        14
    }
}

--------------------------------------------------
-- Moonstone Wand
--------------------------------------------------

QuestChains[
    "blackwood_corrupted"
] = {
    name = "Darkshore Furbolg Investigation",

    rewardQuestID = 4763,

    steps = {
        984,
        4761,
        4762,
        4763
    }
}

--------------------------------------------------
-- Sable Wand
--------------------------------------------------

QuestChains[
    "sable_wand"
] = {
    name = "Gnomeregan Underground Assault",

    rewardQuestID = 2040,

    steps = {
        2041,
        2040
    }
}

--------------------------------------------------
-- Excavation Rod
--------------------------------------------------

QuestChains[
    "excavation_rod"
] = {
    name = "Ormer's Revenge",

    rewardQuestID = 296,

    steps = {
        294,
        295,
        296
    }
}

--------------------------------------------------
-- Consecrated Wand
--------------------------------------------------

QuestChains[
    "consecrated_wand"
] = {
    name = "Worgen in the Woods",

    rewardQuestID = 223,

    steps = {
        173,
        221,
        222,
        223
    }
}

--------------------------------------------------
-- Moonbeam Wand
--------------------------------------------------

QuestChains[
    "moonbeam_wand"
] = {
    name = "The Howling Vale",

    rewardQuestID = 1044,

    steps = {
        1022,
        1037,
        1038,
        1039,
        1040,
        1041,
        1042,
        1043,
        1044
    }
}

--------------------------------------------------
-- Burning Sliver
--------------------------------------------------

QuestChains[
    "burning_sliver"
] = {
    name = "Crushridge Bounty",

    rewardQuestID = 504,

    steps = {
        500,
        504
    }
}

--------------------------------------------------
-- Gnomish Zapper
--------------------------------------------------

QuestChains[
    "gnomish_zapper"
] = {
    name = "Sunken Treasure",

    rewardQuestID = 666,

    -- The wand is rewarded by the second quest. Later
    -- Sunken Treasure follow-ups are not prerequisites
    -- for obtaining it and are intentionally omitted.
    steps = {
        665,
        666
    }
}

--------------------------------------------------
-- Charged Lightning Rod
--------------------------------------------------

QuestChains[
    "charged_lightning_rod"
] = {
    name = "Caught!",

    rewardQuestID = 4450,

    steps = {
        4449,
        4450
    }
}

--------------------------------------------------
-- Cairnstone Sliver
--------------------------------------------------

QuestChains[
    "cairnstone_sliver"
] = {
    name = "In Search of Knowledge",

    rewardQuestID = 2942,

    steps = {
        2939,
        2940,
        2941,
        2944,
        2943,
        2879,
        2942
    }
}

--------------------------------------------------
-- Smokey's Fireshooter
--------------------------------------------------

QuestChains[
    "smokeys_fireshooter"
] = {
    name = "That's Asking A Lot",

    rewardQuestID = 6041,

    steps = {
        6026,
        6041
    }
}
