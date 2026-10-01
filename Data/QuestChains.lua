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

--------------------------------------------------
-- Branding Rod
--------------------------------------------------

QuestChains[
    "branding_rod"
] = {
    name = "Sergra Darkthorn",

    rewardQuestID = 873,

    steps = {
        860,
        844,
        845,
        903,
        881,
        905,
        3261,
        882,
        907,
        913,
        874,
        873
    }
}

--------------------------------------------------
-- Dancing Flame
--------------------------------------------------

QuestChains[
    "dancing_flame"
] = {
    name = "Test of Faith",

    rewardQuestID = 1394,

    steps = {
        1149,
        1150,
        1151,
        1152,
        1154,
        6627,
        1159,
        1160,
        6628,
        1394
    }
}

--------------------------------------------------
-- Eyepoker
--------------------------------------------------

QuestChains[
    "eyepoker"
] = {
    name = "Lieutenant Paval Reethe",

    rewardQuestID = 1273,

    steps = {
        1269,
        1273
    }
}
QuestChains["octo:1044"] = { name = "Answered Questions", rewardQuestID = 1044, steps = { 1022, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044 } }
QuestChains["octo:1137"] = { name = "News for Fizzle", rewardQuestID = 1137, steps = { 1104, 1106, 1108, 1137 } }
QuestChains["octo:1173"] = { name = "Challenge Overlord Mok'Morokk", rewardQuestID = 1173, steps = { 1169, 1170, 1171, 1172, 1173 } }
QuestChains["octo:1200"] = { name = "Blackfathom Villainy", rewardQuestID = 1200, steps = { 1198, 1200 } }
QuestChains["octo:1273"] = { name = "Questioning Reethe", rewardQuestID = 1273, steps = { 1269, 1273 } }
QuestChains["octo:1394"] = { name = "Final Passage", rewardQuestID = 1394, steps = { 1149, 1150, 1151, 1152, 1154, 6627, 1159, 1160, 6628, 1394 } }
QuestChains["octo:14"] = { name = "The People's Militia", rewardQuestID = 14, steps = { 12, 13, 14 } }
QuestChains["octo:1952"] = { name = "Mage's Wand", rewardQuestID = 1952, steps = { 1947, 1949, 1950, 1951, 1948, 1952 } }
QuestChains["octo:2040"] = { name = "Underground Assault", rewardQuestID = 2040, steps = { 2041, 2040 } }
QuestChains["octo:223"] = { name = "Worgen in the Woods", rewardQuestID = 223, steps = { 173, 221, 222, 223 } }
QuestChains["octo:2942"] = { name = "The Morrow Stone", rewardQuestID = 2942, steps = { 2939, 2940, 2941, 2944, 2943, 2879, 2942 } }
QuestChains["octo:296"] = { name = "Ormer's Revenge", rewardQuestID = 296, steps = { 294, 295, 296 } }
QuestChains["octo:297"] = { name = "Gathering Idols", rewardQuestID = 297, steps = { 436, 297 } }
QuestChains["octo:41360"] = { name = "Warm is the Day", rewardQuestID = 41360, steps = { 41353, 41354, 41355, 41356, 41357, 41358, 41359, 41360 } }
QuestChains["octo:41841"] = { name = "Artifact of the Dark Lady", rewardQuestID = 41841, steps = { 544, 41841 } }
QuestChains["octo:4450"] = { name = "Ledger from Tanaris", rewardQuestID = 4450, steps = { 4449, 4450 } }
QuestChains["octo:4763"] = { name = "The Blackwood Corrupted", rewardQuestID = 4763, steps = { 984, 4761, 4762, 4763 } }
QuestChains["octo:504"] = { name = "Crushridge Warmongers", rewardQuestID = 504, steps = { 500, 504 } }
QuestChains["octo:5088"] = { name = "Arikara", rewardQuestID = 5088, steps = { 4821, 4865, 5062, 5088 } }
QuestChains["octo:55006"] = { name = "Backup Capacitor", rewardQuestID = 55006, steps = { 55003, 55006 } }
QuestChains["octo:600"] = { name = "Venture Company Mining", rewardQuestID = 600, steps = { 605, 600 } }
QuestChains["octo:60110"] = { name = "Githyiss the Vile", rewardQuestID = 60110, steps = { 4495, 3519, 3521, 3522, 60110 } }
QuestChains["octo:60112"] = { name = "Fallen Adventurers", rewardQuestID = 60112, steps = { 376, 60112 } }
QuestChains["octo:6041"] = { name = "When Smokey Sings, I Get Violent", rewardQuestID = 6041, steps = { 6026, 6041 } }
QuestChains["octo:6148"] = { name = "The Scarlet Oracle, Demetria", rewardQuestID = 6148, steps = { 6133, 6135, 6144, 6145, 6146, 6147, 6148 } }
QuestChains["octo:6187"] = { name = "Order Must Be Restored", rewardQuestID = 6187, steps = { 6182, 6183, 6184, 6185, 6186, 6187 } }
QuestChains["octo:666"] = { name = "Sunken Treasure", rewardQuestID = 666, steps = { 665, 666 } }
QuestChains["octo:70033"] = { name = "The Seeker's Demise", rewardQuestID = 70033, steps = { 70020, 70021, 70022, 70023, 70024, 70025, 70026, 70027, 70028, 70029, 70030, 70031, 70032, 70033 } }
QuestChains["octo:8257"] = { name = "Blood of Morphaz", rewardQuestID = 8257, steps = { 8254, 8255, 8256, 8257 } }
QuestChains["octo:863"] = { name = "The Escape", rewardQuestID = 863, steps = { 858, 863 } }
QuestChains["octo:873"] = { name = "Isha Awak", rewardQuestID = 873, steps = { 861, 860, 844, 845, 903, 881, 905, 3261, 882, 907, 913, 874, 873 } }
QuestChains["octo:957"] = { name = "Bashal'Aran", rewardQuestID = 957, steps = { 954, 955, 956, 957 } }
QuestChains[
    "99"
    ] = { 
        name = "Arugal's Folly", 
        rewardQuestID = 99, 
        steps = { 421, 422, 423, 424, 99 } }
