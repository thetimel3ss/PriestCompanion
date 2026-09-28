-- Priest Companion
-- Item Sources Database
--
-- Basic catalog entries may contain quest/source metadata without a full
-- Data/Quests.lua record yet. Source Details is enabled only when detailed
-- data is actually available.
--
-- Project rule:
-- Every progression item must be confirmed to exist in OctoWoW before its
-- source is added here.

local PC = PriestCompanion

PC.Data.Sources = PC.Data.Sources or {}

local Sources = PC.Data.Sources

--------------------------------------------------
-- Crafting
--------------------------------------------------

Sources[11287] = {
    {
        type = "craft",

        profession = "Enchanting",
        skill = 10,

        faction = "Both",
        requiredLevel = 5,

        spellID = 14293,
        taughtBy = "trainer",

        reagents = {
            {
                itemID = 4470,
                amount = 1
            },

            {
                itemID = 10938,
                amount = 1
            }
        },

        tools = {
            {
                itemID = 6218
            }
        }
    }
}

Sources[11288] = {
    {
        type = "craft",

        profession = "Enchanting",
        skill = 70,

        faction = "Both",
        requiredLevel = 13,

        spellID = 14807,
        taughtBy = "trainer",

        reagents = {
            {
                itemID = 4470,
                amount = 1
            },

            {
                itemID = 10939,
                amount = 1
            }
        },

        tools = {
            {
                itemID = 6218
            }
        }
    }
}

--------------------------------------------------
-- Early Quest / Dungeon Options
--------------------------------------------------

Sources[12296] = {
    {
        type = "quest",
        questID = 14,
        questName = "The People's Militia",
        faction = "Alliance",
        requiredLevel = 9,
        zone = "Westfall"
    }
}

Sources[5208] = {
    {
        type = "vendor",
        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",
        faction = "Both",
        requiredLevel = 15
    }
}

Sources[5326] = {
    {
        type = "quest",
        questID = 863,
        questName = "The Escape",
        faction = "Both",
        requiredLevel = 13,
        zone = "The Barrens"
    }
}

Sources[15204] = {
    {
        type = "quest",
        questID = 4763,
        questName = "The Blackwood Corrupted",
        faction = "Alliance",
        requiredLevel = 15,
        zone = "Darkshore"
    }
}

Sources[5240] = {
    {
        type = "quest",
        questID = 104,
        questName = "The Coastal Menace",
        faction = "Both",
        requiredLevel = 15,
        zone = "Westfall"
    }
}

Sources[7607] = {
    {
        type = "quest",
        questID = 2040,
        questName = "Underground Assault",
        faction = "Alliance",
        requiredLevel = 15,
        zone = "The Deadmines"
    }
}

Sources[5252] = {
    {
        type = "quest",
        questID = 516,
        questName = "Beren's Peril",
        faction = "Horde",
        requiredLevel = 16,
        zone = "Silverpine Forest"
    }
}

Sources[5211] = {
    {
        type = "vendor",
        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",
        faction = "Both",
        requiredLevel = 20
    }
}

Sources[8071] = {
    {
        type = "quest",
        questID = 1487,
        questName = "Deviate Eradication",
        faction = "Both",
        requiredLevel = 15,
        zone = "Wailing Caverns"
    }
}

Sources[5198] = {
    {
        type = "drop",
        npcID = 645,
        npcName = "Cookie",
        npcType = "Boss",
        zone = "The Deadmines",
        dropChance = 35,
        faction = "Both",
        requiredLevel = 17
    }
}

Sources[6677] = {
    {
        type = "quest",
        questID = 1078,
        questName = "Retrieval for Mauren",
        faction = "Alliance",
        requiredLevel = 17,
        zone = "Stonetalon Mountains"
    }
}

Sources[5356] = {
    {
        type = "quest",
        questID = 873,
        questName = "Isha Awak",
        faction = "Horde",
        requiredLevel = 10,
        zone = "The Barrens"
    }
}

--------------------------------------------------
-- Level 20-40 Progression
--------------------------------------------------

Sources[5246] = {
    {
        type = "quest",
        questID = 296,
        questName = "Ormer's Revenge",
        faction = "Alliance",
        requiredLevel = 22,
        zone = "Wetlands"
    }
}

Sources[5244] = {
    {
        type = "quest",
        questID = 223,
        questName = "Worgen in the Woods",
        faction = "Alliance",
        requiredLevel = 23,
        zone = "Duskwood"
    }
}

Sources[5818] = {
    {
        type = "quest",
        questID = 1044,
        questName = "Answered Questions",
        faction = "Alliance",
        requiredLevel = 25,
        zone = "Ashenvale"
    }
}

Sources[7001] = {
    {
        type = "quest",

        questID = 1200,
        chainID =
            "gravestone_scepter_alliance",

        faction = "Alliance",
        requiredLevel = 18,
        instanceID = 719,

        details = true
    },

    {
        type = "quest",

        questID = 6561,

        faction = "Horde",
        requiredLevel = 18,
        instanceID = 719,

        details = true
    }
}

Sources[5250] = {
    {
        type = "quest",
        questID = 567,
        questName = "Dangerous!",
        faction = "Horde",
        requiredLevel = 19,
        zone = "Hillsbrad Foothills"
    }
}

Sources[6806] = {
    {
        type = "quest",
        questID = 1394,
        questName = "Final Passage",
        faction = "Horde",
        requiredLevel = 25,
        zone = "Thousand Needles"
    }
}

Sources[16789] = {
    {
        type = "quest",
        questID = 6161,
        questName = "Claim Rackmore's Treasure!",
        faction = "Both",
        requiredLevel = 30,
        zone = "Desolace"
    }
}

Sources[5247] = {
    {
        type = "quest",
        questID = 685,
        questName = "Wanted! Otto and Falconcrest",
        faction = "Alliance",
        requiredLevel = 30,
        zone = "Arathi Highlands"
    }
}

Sources[5249] = {
    {
        type = "quest",
        questID = 504,
        questName = "Crushridge Warmongers",
        faction = "Alliance",
        requiredLevel = 30,
        zone = "Alterac Mountains"
    }
}

Sources[5248] = {
    {
        type = "quest",
        questID = 705,
        questName = "Pearl Diving",
        faction = "Both",
        requiredLevel = 30,
        zone = "Badlands"
    }
}

Sources[6797] = {
    {
        type = "quest",
        questID = 1273,
        questName = "Questioning Reethe",
        faction = "Horde",
        requiredLevel = 30,
        zone = "Dustwallow Marsh"
    }
}

Sources[15692] = {
    {
        type = "quest",
        questID = 5943,
        questName = "Gizelton Caravan",
        faction = "Both",
        requiredLevel = 32,
        zone = "Desolace"
    }
}

Sources[4547] = {
    {
        type = "quest",
        questID = 666,
        questName = "Sunken Treasure",
        faction = "Both",
        requiredLevel = 35,
        zone = "Arathi Highlands"
    }
}

Sources[5253] = {
    {
        type = "quest",
        questID = 600,
        questName = "Venture Company Mining",
        faction = "Both",
        requiredLevel = 30,
        zone = "Stranglethorn Vale"
    }
}

--------------------------------------------------
-- Late Progression
--------------------------------------------------

Sources[5239] = {
    {
        type = "vendor",
        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",
        faction = "Both",
        requiredLevel = 41
    }
}

Sources[9654] = {
    {
        type = "quest",
        questID = 2942,
        questName = "The Morrow Stone",
        faction = "Alliance",
        requiredLevel = 42,
        zone = "Feralas"
    }
}

Sources[11860] = {
    {
        type = "quest",
        questID = 4450,
        questName = "Ledger from Tanaris",
        faction = "Both",
        requiredLevel = 43,
        zone = "Searing Gorge"
    }
}

Sources[19118] = {
    {
        type = "quest",
        questID = 7850,
        questName = "Dark Vessels",
        faction = "Horde",
        requiredLevel = 46,
        zone = "The Hinterlands"
    }
}

Sources[17745] = {
    {
        type = "drop",
        npcID = 13282,
        npcName = "Noxxion",
        npcType = "Boss",
        zone = "Maraudon",
        dropChance = 33,
        faction = "Both",
        requiredLevel = 46
    }
}

Sources[10836] = {
    {
        type = "drop",
        npcID = 5709,
        npcName = "Shade of Eranikus",
        npcType = "Boss",
        zone = "The Temple of Atal'Hakkar",
        faction = "Both",
        requiredLevel = 51
    }
}

Sources[15281] = {
    {
        type = "drop",
        npcName = "World drop",
        zone = "Azeroth",
        faction = "Both",
        requiredLevel = 52
    }
}

Sources[15282] = {
    {
        type = "drop",
        npcName = "World drop",
        zone = "Azeroth",
        faction = "Both",
        requiredLevel = 55
    }
}

Sources[16993] = {
    {
        type = "quest",
        questID = 6041,
        questName = "When Smokey Sings, I Get Violent",
        faction = "Both",
        requiredLevel = 54,
        zone = "Eastern Plaguelands"
    }
}
