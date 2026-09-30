-- Priest Companion
-- Item Sources Database

local PC = PriestCompanion

PC.Data.Sources = PC.Data.Sources or {}

PC.Data.BossLoot = PC.Data.BossLoot or {}

local Sources = PC.Data.Sources
local BossLoot = PC.Data.BossLoot

--------------------------------------------------
-- Lesser Magic Wand
--------------------------------------------------

Sources[11287] = {
    {
        type = "craft",

        profession = "Enchanting",
        skill = 10,

        faction = "Both",

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
        },

        requiredLevel = 5,
        details = true
    }
}

--------------------------------------------------
-- Greater Magic Wand
--------------------------------------------------

Sources[11288] = {
    {
        type = "craft",

        profession = "Enchanting",
        skill = 70,

        faction = "Both",

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
        },

        requiredLevel = 13,
        details = true
    }
}

--------------------------------------------------
-- Smoldering Wand
--------------------------------------------------

Sources[5208] = {
    {
        type = "vendor",

        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",

        faction = "Both",
        requiredLevel = 15
    }
}

--------------------------------------------------
-- Flaring Baton
--------------------------------------------------

Sources[5326] = {
    {
        type = "quest",

        questID = 863,
        chainID = "flaring_baton",

        faction = "Both",
        zone = "The Barrens",
        requiredLevel = 13,

        details = true
    }
}

--------------------------------------------------
-- Dusk Wand
--------------------------------------------------

Sources[5211] = {
    {
        type = "vendor",

        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",

        faction = "Both",
        requiredLevel = 20
    }
}

--------------------------------------------------
-- Gravestone Scepter
--------------------------------------------------

Sources[7001] = {
    --------------------------------------------------
    -- Alliance
    --------------------------------------------------

    {
        type = "quest",

        questID = 1200,
        chainID =
            "gravestone_scepter_alliance",

        faction = "Alliance",
        instanceID = 719,

        details = true
    },

    --------------------------------------------------
    -- Horde
    --------------------------------------------------

    {
        type = "quest",

        questID = 6561,

        faction = "Horde",
        instanceID = 719,

        details = true
    }
}

--------------------------------------------------
-- Charred Razormane Wand
--------------------------------------------------

Sources[5092] = {
    {
        type = "drop",

        npcID = 3458,
        npcName = "Razormane Seer",
        npcType = "Named creature",

        zone = "The Barrens",
        dropChance = 29.94,

        faction = "Both",
        requiredLevel = 18
    }
}

--------------------------------------------------
-- Cookie's Stirring Rod
--------------------------------------------------

Sources[5198] = {
    {
        type = "drop",

        npcID = 645,
        npcName = "Cookie",
        npcType = "Boss",

        instanceID = 1581,
        zone = "The Deadmines",
        dropChance = 35,

        mobs = {
            {
                id = 645,
                chance = 35
            }
        },

        mobCount = 1,
        lootNPCID = 645,
        details = true,

        faction = "Both",
        requiredLevel = 17
    }
}

--------------------------------------------------
-- Cookie Loot Table
--------------------------------------------------

BossLoot[645] = {
    {
        itemID = 730,
        name = "Murloc Eye",
        chance = 30,
        quality = 1
    },

    {
        itemID = 1179,
        name = "Ice Cold Milk",
        chance = 4,
        quality = 1
    },

    {
        itemID = 2589,
        name = "Linen Cloth",
        chance = 13,
        quality = 1
    },

    {
        itemID = 2592,
        name = "Wool Cloth",
        chance = 17,
        quality = 1
    },

    {
        itemID = 5523,
        name = "Small Barnacled Clam",
        chance = 30,
        quality = 1
    },

    {
        itemID = 5784,
        name = "Slimy Murloc Scale",
        chance = 15,
        quality = 1
    },

    {
        itemID = 6289,
        name = "Raw Longjaw Mud Snapper",
        chance = 4,
        quality = 1
    },

    {
        itemID = 8490,
        name = "Siamese",
        chance = 15,
        quality = 1
    },

    {
        itemID = 17057,
        name = "Shiny Fish Scales",
        chance = 20,
        quality = 1
    },

    {
        itemID = 5197,
        name = "Cookie's Tenderizer",
        chance = 65,
        quality = 2
    },

    {
        itemID = 5198,
        name = "Cookie's Stirring Rod",
        chance = 35,
        quality = 3
    },

    {
        itemID = 9338,
        name = "Murloc Eye on a String",
        chance = 100,
        quality = 2,
        note = "Level One Lunatic only"
    },

    {
        itemID = 60526,
        name = "Grayson's Pendant",
        quality = 1
    },

    {
        itemID = 80708,
        name = "Cookie's Apron",
        chance = 60,
        quality = 2
    }
}

--------------------------------------------------
-- Blackbone Wand
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

--------------------------------------------------
-- Noxious Shooter
--------------------------------------------------

Sources[17745] = {
    {
        type = "drop",

        npcID = 13282,
        npcName = "Noxxion",
        npcType = "Boss",

        instanceID = 349,
        zone = "Maraudon",
        dropChance = 33.33,

        mobs = {
            {
                id = 13282,
                chance = 33.33
            }
        },

        mobCount = 1,
        lootNPCID = 13282,
        details = true,

        faction = "Both",
        requiredLevel = 46
    }
}

--------------------------------------------------
-- Rod of Corrosion
--------------------------------------------------

Sources[10836] = {
    {
        type = "drop",

        npcID = 5709,
        npcName = "Shade of Eranikus",
        npcType = "Boss",

        instanceID = 109,
        zone = "Sunken Temple",
        dropChance = 16.67,

        mobs = {
            {
                id = 5709,
                chance = 16.67
            }
        },

        mobCount = 1,
        lootNPCID = 5709,
        details = true,

        faction = "Both",
        requiredLevel = 51
    }
}

--------------------------------------------------
-- Glowstar Rod
--------------------------------------------------

Sources[15281] = {
    {
        type = "drop",

        npcName = "World drop",
        zone = "Azeroth",

        faction = "Both",
        requiredLevel = 52
    }
}

--------------------------------------------------
-- Dragon Finger
--------------------------------------------------

Sources[15282] = {
    {
        type = "drop",

        npcName = "World drop",
        zone = "Azeroth",

        faction = "Both",
        requiredLevel = 55
    }
}

--------------------------------------------------
-- Noxxion Loot Table
--------------------------------------------------

BossLoot[13282] = {
    {
        itemID = 4791,
        name = "Enchanted Water",
        chance = 18,
        quality = 1
    },

    {
        itemID = 17684,
        name = "Theradric Crystal Carving",
        quality = 1
    },

    {
        itemID = 17702,
        name = "Celebrian Rod",
        quality = 1
    },

    {
        itemID = 17744,
        name = "Heart of Noxxion",
        chance = 33.33,
        quality = 3
    },

    {
        itemID = 17745,
        name = "Noxious Shooter",
        chance = 33.33,
        quality = 3
    },

    {
        itemID = 17746,
        name = "Noxxion's Shackles",
        chance = 33.33,
        quality = 3
    }
}

--------------------------------------------------
-- Shade of Eranikus Loot Table
--------------------------------------------------

BossLoot[5709] = {
    {
        itemID = 4460,
        name = "Ripped Wing Webbing",
        chance = 11,
        quality = 0
    },

    {
        itemID = 6707,
        name = "Proof of Reliance",
        quality = 1
    },

    {
        itemID = 10847,
        name = "Dragon's Call",
        chance = 0.5,
        quality = 4
    },

    {
        itemID = 10828,
        name = "Dire Nail",
        chance = 16.67,
        quality = 3
    },

    {
        itemID = 10829,
        name = "Dragon's Eye",
        chance = 16.67,
        quality = 3
    },

    {
        itemID = 10833,
        name = "Horns of Eranikus",
        chance = 16.67,
        quality = 3
    },

    {
        itemID = 10835,
        name = "Crest of Supremacy",
        chance = 16.67,
        quality = 3
    },

    {
        itemID = 10836,
        name = "Rod of Corrosion",
        chance = 16.67,
        quality = 3
    },

    {
        itemID = 10837,
        name = "Tooth of Eranikus",
        chance = 16.67,
        quality = 3
    },

    {
        itemID = 10454,
        name = "Essence of Eranikus",
        chance = 100,
        quality = 2
    },

    {
        itemID = 61791,
        name = "Plans: Arcanite Belt Buckle",
        chance = 0.25,
        quality = 2
    },

    {
        itemID = 70226,
        name = "Ancient Warfare Text",
        chance = 3,
        quality = 3
    }
}

--------------------------------------------------
-- Spark of the People's Militia
--------------------------------------------------

Sources[12296] = {
    {
        type = "quest",
        questID = 14,
        chainID = "peoples_militia",
        faction = "Alliance",
        zone = "Westfall",
        requiredLevel = 9,
        details = true
    }
}

--------------------------------------------------
-- Moonstone Wand
--------------------------------------------------

Sources[15204] = {
    {
        type = "quest",
        questID = 4763,
        chainID = "blackwood_corrupted",
        faction = "Alliance",
        zone = "Darkshore",
        requiredLevel = 15,
        details = true
    }
}

--------------------------------------------------
-- Torchlight Wand
--------------------------------------------------

Sources[5240] = {
    {
        type = "quest",
        questID = 104,
        faction = "Both",
        zone = "Westfall",
        requiredLevel = 15,
        details = true
    }
}

--------------------------------------------------
-- Sable Wand
--------------------------------------------------

Sources[7607] = {
    {
        type = "quest",
        questID = 2040,
        chainID = "sable_wand",
        faction = "Alliance",
        zone = "The Deadmines",
        requiredLevel = 15,
        instanceID = 1581,
        details = true
    }
}

--------------------------------------------------
-- Wand of Decay
--------------------------------------------------

Sources[5252] = {
    {
        type = "quest",
        questID = 516,
        faction = "Horde",
        zone = "Silverpine Forest",
        requiredLevel = 16,
        details = true
    }
}

--------------------------------------------------
-- Sizzle Stick
--------------------------------------------------

Sources[8071] = {
    {
        type = "quest",
        questID = 1487,
        faction = "Both",
        zone = "Wailing Caverns",
        requiredLevel = 15,
        instanceID = 43,
        details = true
    }
}

--------------------------------------------------
-- Spellcrafter Wand
--------------------------------------------------

Sources[6677] = {
    {
        type = "quest",
        questID = 1078,
        faction = "Alliance",
        zone = "Stonetalon Mountains",
        requiredLevel = 17,
        details = true
    }
}

--------------------------------------------------
-- Branding Rod
--------------------------------------------------

Sources[5356] = {
    {
        type = "quest",
        questID = 873,
        chainID = "branding_rod",
        faction = "Horde",
        zone = "The Barrens",
        requiredLevel = 10,
        details = true
    }
}

--------------------------------------------------
-- Excavation Rod
--------------------------------------------------

Sources[5246] = {
    {
        type = "quest",
        questID = 296,
        chainID = "excavation_rod",
        faction = "Alliance",
        zone = "Wetlands",
        requiredLevel = 22,
        details = true
    }
}

--------------------------------------------------
-- Consecrated Wand
--------------------------------------------------

Sources[5244] = {
    {
        type = "quest",
        questID = 223,
        chainID = "consecrated_wand",
        faction = "Alliance",
        zone = "Duskwood",
        requiredLevel = 23,
        details = true
    }
}

--------------------------------------------------
-- Moonbeam Wand
--------------------------------------------------

Sources[5818] = {
    {
        type = "quest",
        questID = 1044,
        chainID = "moonbeam_wand",
        faction = "Alliance",
        zone = "Ashenvale",
        requiredLevel = 25,
        details = true
    }
}

--------------------------------------------------
-- Charred Wand
--------------------------------------------------

Sources[5250] = {
    {
        type = "quest",
        questID = 567,
        faction = "Horde",
        zone = "Hillsbrad Foothills",
        requiredLevel = 19,
        details = true
    }
}

--------------------------------------------------
-- Dancing Flame
--------------------------------------------------

Sources[6806] = {
    {
        type = "quest",
        questID = 1394,
        chainID = "dancing_flame",
        faction = "Horde",
        zone = "Thousand Needles",
        requiredLevel = 25,
        details = true
    }
}

--------------------------------------------------
-- Captain Rackmore's Tiller
--------------------------------------------------

Sources[16789] = {
    {
        type = "quest",
        questID = 6161,
        faction = "Both",
        zone = "Desolace",
        requiredLevel = 30,
        details = true
    }
}

--------------------------------------------------
-- Rod of Sorrow
--------------------------------------------------

Sources[5247] = {
    {
        type = "quest",
        questID = 685,
        faction = "Alliance",
        zone = "Arathi Highlands",
        requiredLevel = 30,
        details = true
    }
}

--------------------------------------------------
-- Burning Sliver
--------------------------------------------------

Sources[5249] = {
    {
        type = "quest",
        questID = 504,
        chainID = "burning_sliver",
        faction = "Alliance",
        zone = "Alterac Mountains",
        requiredLevel = 30,
        details = true
    }
}

--------------------------------------------------
-- Flash Wand
--------------------------------------------------

Sources[5248] = {
    {
        type = "quest",
        questID = 705,
        faction = "Both",
        zone = "Badlands",
        requiredLevel = 30,
        details = true
    }
}

--------------------------------------------------
-- Eyepoker
--------------------------------------------------

Sources[6797] = {
    {
        type = "quest",
        questID = 1273,
        chainID = "eyepoker",
        faction = "Horde",
        zone = "Dustwallow Marsh",
        requiredLevel = 30,
        details = true
    }
}

--------------------------------------------------
-- Kodo Brander
--------------------------------------------------

Sources[15692] = {
    {
        type = "quest",
        questID = 5943,
        faction = "Both",
        zone = "Desolace",
        requiredLevel = 32,
        details = true
    }
}

--------------------------------------------------
-- Gnomish Zapper
--------------------------------------------------

Sources[4547] = {
    {
        type = "quest",
        questID = 666,
        chainID = "gnomish_zapper",
        faction = "Both",
        zone = "Arathi Highlands",
        requiredLevel = 35,
        details = true
    }
}

--------------------------------------------------
-- Goblin Igniter
--------------------------------------------------

Sources[5253] = {
    {
        type = "quest",
        questID = 600,
        faction = "Both",
        zone = "Stranglethorn Vale",
        requiredLevel = 30,
        details = true
    }
}

--------------------------------------------------
-- Cairnstone Sliver
--------------------------------------------------

Sources[9654] = {
    {
        type = "quest",
        questID = 2942,
        chainID = "cairnstone_sliver",
        faction = "Alliance",
        zone = "Feralas",
        requiredLevel = 42,
        details = true
    }
}

--------------------------------------------------
-- Charged Lightning Rod
--------------------------------------------------

Sources[11860] = {
    {
        type = "quest",
        questID = 4450,
        chainID = "charged_lightning_rod",
        faction = "Both",
        zone = "Searing Gorge",
        requiredLevel = 43,
        details = true
    }
}

--------------------------------------------------
-- Nature's Breath
--------------------------------------------------

Sources[19118] = {
    {
        type = "quest",
        questID = 7850,
        faction = "Horde",
        zone = "Hinterlands",
        requiredLevel = 46,
        instanceID = 47,
        details = true
    }
}

--------------------------------------------------
-- Smokey's Fireshooter
--------------------------------------------------

Sources[16993] = {
    {
        type = "quest",
        questID = 6041,
        chainID = "smokeys_fireshooter",
        faction = "Both",
        zone = "Eastern Plaguelands",
        requiredLevel = 54,
        details = true
    }
}

--------------------------------------------------
-- Lesser Mystic Wand
--------------------------------------------------

Sources[11289] = {
    {
        type = "craft",

        profession = "Enchanting",
        skill = 155,
        spellID = 14809,

        reagents = {
            {
                itemID = 11291,
                amount = 1
            },

            {
                itemID = 11134,
                amount = 1
            },

            {
                itemID = 11083,
                amount = 1
            }
        },

        tools = {
            {
                itemID = 11130
            }
        },

        requiredLevel = 26,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Greater Mystic Wand
--------------------------------------------------

Sources[11290] = {
    {
        type = "craft",

        profession = "Enchanting",
        skill = 175,
        spellID = 14810,

        reagents = {
            {
                itemID = 11291,
                amount = 1
            },

            {
                itemID = 11135,
                amount = 1
            },

            {
                itemID = 11137,
                amount = 1
            }
        },

        tools = {
            {
                itemID = 11130
            }
        },

        requiredLevel = 30,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Future Drop Example
--------------------------------------------------
--
-- Sources[ITEM_ID] = {
--     {
--         type = "drop",
--         npcID = NPC_ID,
--         npcName = "Boss Name",
--         npcType = "Boss",
--         instanceID = 719,
--         dropChance = 12.5,
--         faction = "Both",
--         details = true
--     }
-- }
