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
        chainID = "gravestone_scepter_alliance",
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
        note = "Level One Lunatic Challenge"
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
        npcName = "Multiple creatures",
        npcType = "Creatures", 
        requiredLevel = 52,
        dropChance = 0.0049,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Dragon Finger
--------------------------------------------------

Sources[15282] = {
    {
        type = "drop",
        npcName = "Multiple creatures",
        npcType = "Creatures",
        requiredLevel = 55,
        dropChance = 0.0104,
        faction = "Both",
        details = true
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
        chainID = "goblin_igniter",
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
-- Fire Wand
--------------------------------------------------

Sources[5069] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 7,
        dropChance = 0.03,
        faction = "Both",
        details = true 
    } 
}

--------------------------------------------------
-- Shadow Wand
--------------------------------------------------

Sources[5071] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures",
        requiredLevel = 9,
        dropChance = 0.0119, 
        faction = "Both",
        details = true 
    } 
}

--------------------------------------------------
-- Opaque Wand
--------------------------------------------------

Sources[5207] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 9,
        dropChance = 0.0083,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Gloom Wand
--------------------------------------------------

Sources[5209] = { 
    {
        type = "vendor",
        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",
        faction = "Both",
        requiredLevel = 16
    }
}

--------------------------------------------------
-- Burning Wand
--------------------------------------------------

Sources[5210] = { 
    {
        type = "vendor",
        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",
        faction = "Both",
        requiredLevel = 20
    }
} 

--------------------------------------------------
-- Blazing Wand
--------------------------------------------------

Sources[5212] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 12,
        dropChance = 0.0088,
        faction = "Both",
        details = true 
    } 
}

--------------------------------------------------
-- Scorching Wand
--------------------------------------------------

Sources[5213] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 30,
        dropChance = 0.0056,
        faction = "Both",
        details = true 
    } 
}

--------------------------------------------------
-- Wand of Eventide
--------------------------------------------------

Sources[5214] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 27,
        dropChance = 0.0055,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Ember Wand
--------------------------------------------------

Sources[5215] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 36,
        dropChance = 0.0053,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Umbral Wand
--------------------------------------------------

Sources[5216] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 40,
        dropChance = 0.0032,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Cultist's Firestick
--------------------------------------------------

Sources[5235] = { 
    { 
        type = "drop", 
        npcID = 11520, 
        npcName = "Taragaman the Hungerer", 
        npcType = "Boss", 
        instanceID = 389, 
        zone = "Ragefire Chasm", 
        dropChance = 100, 
        mobs = { 
            { 
                id = 11520, 
                chance = 100 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 11520 
    } 
}

--------------------------------------------------
-- Combustible Wand
------------------------------------------------

Sources[5236] = { 
    { 
        type = "vendor",
        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",
        faction = "Both",
        requiredLevel = 29
    }
} 

--------------------------------------------------
-- Pitchwood Wand
--------------------------------------------------

Sources[5238] = { 
    { 
        type = "vendor",
        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",
        faction = "Both",
        requiredLevel = 40
    }
} 

--------------------------------------------------
-- Dwarven Flamestick
--------------------------------------------------

Sources[5241] = { 
    { 
        type = "quest", 
        questID = 297, 
        questName = "Gathering Idols", 
        faction = "Alliance", 
        requiredLevel = 13, 
        zone = "Loch Modan", 
        chainID = "dwarven_firestick", 
        details = true 
    } 
}

--------------------------------------------------
-- Cinder Wand
--------------------------------------------------

Sources[5242] = { 
    { 
        type = "quest", 
        questID = 99, 
        questName = "Arugal's Folly", 
        faction = "Horde", 
        requiredLevel = 9, 
        zone = "Silverpine Forest", 
        chainID = "cinder_wand", 
        details = true 
    } 
}

--------------------------------------------------
-- Firebelcher
--------------------------------------------------

Sources[5243] = { 
    { 
        type = "drop", 
        npcID = 5912, 
        npcName = "Deviate Faerie Dragon", 
        npcType = "Boss", 
        instanceID = 43, 
        zone = "Wailing Caverns", 
        dropChance = 50, 
        mobs = { 
            { 
                id = 5912, 
                chance = 50 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 5912 
    } 
}

--------------------------------------------------
-- Summoner's Wand
--------------------------------------------------

Sources[5245] = { 
    { 
        type = "drop", 
        npcID = 2358, 
        npcName = "Dalaran Summoner", 
        npcType = "Named creature", 
        zone = "Alterac Mountains", 
        dropChance = 0.54, 
        mobs = { 
            { 
                id = 2358, 
                chance = 0.54 
            } 
        }, 
        mobCount = 1, 
        details = true 
    }, { 
        type = "drop", 
        npcID = 91350, 
        npcName = "Magus Bromley", 
        npcType = "Named creature", 
        zone = "Azshara", 
        dropChance = 0.54, 
        mobs = { 
            { 
                id = 91350, 
                chance = 0.54 
            } 
        }, 
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Pestilent Wand
--------------------------------------------------

Sources[5347] = { 
    { 
        type = "vendor",
        npcName = "Wand merchants",
        zone = "Stormwind, Ironforge, Orgrimmar, Undercity",
        faction = "Both",
        requiredLevel = 30
    }
} 

--------------------------------------------------
-- Elven Wand
--------------------------------------------------

Sources[5604] = { 
    { 
        type = "quest", 
        questID = 957, 
        questName = "Bashal'Aran", 
        faction = "Alliance", 
        requiredLevel = 7, 
        zone = "Darkshore", 
        chainID = "elven_wand", 
        details = true 
    } 
}

--------------------------------------------------
-- Fizzle's Zippy Lighter
--------------------------------------------------

Sources[6729] = { 
    { 
        type = "quest", 
        questID = 1137, 
        questName = "News for Fizzle", 
        faction = "Both", 
        requiredLevel = 28, 
        zone = "Badlands", 
        chainID = "fizzles_zippy_lighter", 
        details = true 
    } 
}

--------------------------------------------------
-- Ragefire Wand
--------------------------------------------------

Sources[7513] = { 
    { 
        type = "quest", 
        questID = 1952, 
        questName = "Mage's Wand", 
        faction = "Both", 
        requiredLevel = 30, 
        zone = "Dustwallow Marsh", 
        chainID = "mages_wand", 
        details = true 
    } 
}

--------------------------------------------------
-- Icefury Wand
--------------------------------------------------

Sources[7514] = { 
    { 
        type = "quest", 
        questID = 1952, 
        questName = "Mage's Wand", 
        faction = "Both", 
        requiredLevel = 30, 
        zone = "Dustwallow Marsh", 
        chainID = "mages_wand", 
        details = true 
    } 
}

--------------------------------------------------
-- Necrotic Wand
--------------------------------------------------

Sources[7708] = { 
    { 
        type = "drop", 
        npcID = 6490, 
        npcName = "Azshir the Sleepless", 
        npcType = "Boss", 
        instanceID = 796, 
        zone = "Scarlet Monastery", 
        dropChance = 33.33, 
        mobs = { 
            { 
                id = 6490, 
                chance = 33.33 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 6490 
    } 
}

--------------------------------------------------
-- Firestarter
--------------------------------------------------

Sources[8184] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 24,
        dropChance = 0.0064,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Dire Wand
--------------------------------------------------

Sources[8186] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures",
        requiredLevel = 24,
        dropChance = 0.000625,
        faction = "Both",
        details = true    
    }
}

--------------------------------------------------
-- Earthen Rod
--------------------------------------------------
        
Sources[9381] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        instanceID = 70,
        requiredLevel = 33,
        dropChance = 0.02,
        faction = "Both",
        details = true
    }
}

--------------------------------------------------
-- Flaming Incinerator
--------------------------------------------------

Sources[9483] = { 
    { 
        type = "drop", 
        npcID = 7272, 
        npcName = "Theka the Martyr", 
        npcType = "Named creature", 
        instanceID = 209, 
        zone = "Zul'Farrak", 
        dropChance = 0.02, 
        mobs = { 
            { 
                id = 7272, 
                chance = 0.02 
            } 
        }, 
        mobCount = 1, 
        details = true, 
    }, { 
        type = "drop", 
        npcID = 7274, 
        npcName = "Sandfury Executioner", 
        npcType = "Named creature", 
        instanceID = 209, 
        zone = "Zul'Farrak", 
        dropChance = 0.02, 
        mobs = { 
            { 
                id = 7274, 
                chance = 0.02 
            } 
        }, 
        mobCount = 1, 
        details = true, 
    }, { 
        type = "drop", 
        npcID = 7795, 
        npcName = "Hydromancer Velratha", 
        npcType = "Named creature", 
        instanceID = 209, 
        zone = "Zul'Farrak", 
        dropChance = 0.02, 
        mobs = { 
            { 
                id = 7795, 
                chance = 0.02 
            } 
        }, 
        mobCount = 1, 
        details = true, 
    } 
}

--------------------------------------------------
-- Gyromatic Icemaker
--------------------------------------------------

Sources[9489] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures",
        instanceID = 721,
        mobCount = 11,
        requiredLevel = 26,
        dropChance = 0.02,
        faction = "Both", 
        details = true
    } 
}

--------------------------------------------------
-- Freezing Shard
--------------------------------------------------

Sources[10572] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        instanceID = 129, 
        mobCount = 14, 
        requiredLevel = 34,
        dropChance = 0.02,
        faction = "Both",
        details = true 
    } 
}

--------------------------------------------------
-- Chillnail Splinter
--------------------------------------------------

Sources[10704] = { 
    { 
        type = "quest", 
        questID = 1173, 
        questName = "Challenge Overlord Mok'Morokk", 
        faction = "Horde", 
        requiredLevel = 38, 
        zone = "Dustwallow Marsh", 
        chainID = "chillnail_splinter", 
        details = true 
    } 
}

--------------------------------------------------
-- Plaguerot Sprint
--------------------------------------------------

Sources[10766] = { 
    { 
        type = "drop", 
        npcID = 7356, 
        npcName = "Plaguemaw the Rotting", 
        npcType = "Boss", 
        instanceID = 129, 
        dropChance = 33.3333333, 
        mobs = { 
            { 
                id = 7356, 
                chance = 33.3333333 
            } 
        }, 
        mobCount = 1,
        faction = "Both",
        details = true, 
        lootNPCID = 7356 
    } 
}

--------------------------------------------------
-- Nether Force Wand
--------------------------------------------------

Sources[11263] = { 
    { 
        type = "quest", 
        questID = 1952, 
        questName = "Mage's Wand", 
        faction = "Both", 
        requiredLevel = 30, 
        zone = "Dustwallow Marsh", 
        chainID = "mages_wand", 
        details = true 
    } 
}

--------------------------------------------------
-- Pyric Caduceus
--------------------------------------------------

Sources[11748] = { 
    { 
        type = "drop", 
        npcID = 9024, 
        npcName = "Pyromancer Loregrain", 
        npcType = "Boss", 
        instanceID = 1584, 
        zone = "Blackrock Depths", 
        dropChance = 25, 
        mobs = { 
            { 
                id = 9024, 
                chance = 25 
            } 
        }, 
        faction = "Both",
        mobCount = 1, 
        details = true, 
        lootNPCID = 9024 
    } 
}

--------------------------------------------------
-- Chilton Wand
--------------------------------------------------

Sources[12468] = { 
    { 
        type = "drop", 
        npcID = 12159, 
        npcName = "Korrak the Bloodrager", 
        npcType = "Named creature", 
        zone = "Alterac Valley", 
        dropChance = 5, 
        mobs = { 
            { 
                id = 12159, 
                chance = 5 
            } 
        }, 
        faction = "Both",
        mobCount = 1, 
        details = true,  
    } 
}

--------------------------------------------------
-- Serpentine Skuller
--------------------------------------------------

Sources[12605] = { 
    { 
        type = "drop", 
        npcID = 10509, 
        npcName = "Jed Runewatcher", 
        npcType = "Boss", 
        instanceID = 229, 
        zone = "Blackrock Spire", 
        dropChance = 33.3333333, 
        mobs = { 
            { 
                id = 10509, 
                chance = 33.3333333 
            } 
        }, 
        faction = "Both",
        mobCount = 1, 
        details = true, 
        lootNPCID = 10509 
    } 
}

--------------------------------------------------
-- Skycaller
--------------------------------------------------

Sources[12984] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures",
        requiredLevel = 16,
        dropChance = 0.0009,
        faction = "Both",
        mobCount = 215, 
        details = true 
    } 
}

--------------------------------------------------
-- Torch of Austen
--------------------------------------------------

Sources[13004] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures",
        requiredLevel = 53,
        dropChance = 0.001,
        faction = "Both",
        mobCount = 466, 
        details = true 
    } 
}

--------------------------------------------------
-- Thunderwood
--------------------------------------------------

Sources[13062] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures",
        npcType = "Creatures",
        requiredLevel = 22,
        dropChance = 0.001,
        faction = "Both",
        mobCount = 426,
        details = true
    }
}

--------------------------------------------------
-- Starfaller
--------------------------------------------------

Sources[13063] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 29,
        dropChance = 0.001,
        faction = "Both",
        mobCount = 459,
        details = true
    }
}

--------------------------------------------------
-- Jaina's Firestarter
--------------------------------------------------

Sources[13064] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 37,
        dropChance = 0.0011,
        faction = "Both",
        mobCount = 354,
        details = true
    }
}

--------------------------------------------------
-- Wand of Allistarj
--------------------------------------------------

Sources[13065] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 45,
        dropChance = 0.0025,
        faction = "Both",
        mobCount = 560,
        details = true
    }
}

--------------------------------------------------
-- Skul's Ghastly Touch
--------------------------------------------------

Sources[13396] = { 
    { 
        type = "drop", 
        npcID = 10393, 
        npcName = "Skul", 
        npcType = "Boss", 
        instanceID = 2017, 
        zone = "Stratholme", 
        dropChance = 33.33, 
        mobs = { 
            { 
                id = 10393, chance = 33.33 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 10393 
    } 
}

--------------------------------------------------
-- Banshee Finger
--------------------------------------------------

Sources[13534] = { 
    { 
        type = "drop", 
        npcID = 10436, 
        npcName = "Baroness Anastari", 
        npcType = "Boss", 
        instanceID = 2017, 
        zone = "Stratholme", 
        dropChance = 20, 
        mobs = { 
            { 
                id = 10436, 
                chance = 20 
            } 
        }, 
        faction = "Both",
        mobCount = 1, 
        details = true, 
        lootNPCID = 10436 
    } 
}

--------------------------------------------------
-- Bonecreeper Stylus
--------------------------------------------------

Sources[13938] = { 
    { 
        type = "drop", 
        npcID = 1853, 
        npcName = "Darkmaster Gandling", 
        npcType = "Boss", 
        instanceID = 2057, 
        dropChance = 14.2857143, 
        mobs = { 
            { 
                id = 1853, 
                chance = 14.2857143 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 1853 
    } 
}

--------------------------------------------------
-- Ivory Wand
--------------------------------------------------

Sources[15279] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures",
        requiredLevel = 46,
        dropChance = 0.0044,
        mobCount = 753,
        details = true
    }
}

--------------------------------------------------
-- Wizard's Hand
--------------------------------------------------

Sources[15280] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 48,
        dropChance = 0.0051,
        mobCount = 846,
        details = true
    }
}

--------------------------------------------------
-- Lunar Wand
--------------------------------------------------

Sources[15283] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        requiredLevel = 59,
        dropChance = 0.0217391304, 
        mobCount = 254,
        details = true
    }
}

--------------------------------------------------
-- Stingshot Wand
--------------------------------------------------

Sources[15465] = { 
    { 
        type = "quest", 
        questID = 5088, 
        questName = "Arikara", 
        faction = "Horde", 
        requiredLevel = 24, 
        zone = "Mulgore", 
        chainID = "stingshot_wand", 
        details = true 
    } 
}

--------------------------------------------------
-- Stormrager
--------------------------------------------------

Sources[16997] = { 
    { 
        type = "quest", 
        questID = 6148, 
        questName = "The Scarlet Oracle, Demetria", 
        faction = "Horde", 
        requiredLevel = 56, 
        zone = "Eastern Plaguelands", 
        chainID = "stormrager_horde", 
        details = true 
    }, { 
        type = "quest", 
        questID = 6187, 
        questName = "Order Must Be Restored", 
        faction = "Alliance", 
        requiredLevel = 56, 
        zone = "Stormwind City", 
        chainID = "stormrager_alliance", 
        details = true 
    } 
}

--------------------------------------------------
-- Crimson Shocker
--------------------------------------------------

Sources[17077] = { 
    { 
        type = "drop", 
        npcID = 52145, 
        npcName = "Incindis", 
        npcType = "Named creature", 
        instanceID = 2717, 
        zone = "Molten Core", 
        dropChance = 5, 
        mobs = { 
            { 
                id = 52145, 
                chance = 5 
            } 
        }, 
        mobCount = 1, 
        details = true, 
    }, { 
        type = "drop", 
        npcID = 12098, 
        npcName = "Sulfuron Harbinger", 
        npcType = "Named creature", 
        instanceID = 2717, 
        zone = "Molten Core", 
        dropChance = 4, 
        mobs = { 
            { 
                id = 12098, 
                chance = 4 
            } 
        }, 
        mobCount = 1, 
        details = true, 
    }, { 
        type = "drop", 
        npcID = 12118, 
        npcName = "Lucifron", 
        npcType = "Named creature", 
        instanceID = 2717, 
        zone = "Molten Core", 
        dropChance = 4, 
        mobs = { 
            { 
                id = 12118, 
                chance = 4 
            } 
        }, 
        mobCount = 1, 
        details = true, 
    }, { 
        type = "drop", 
        npcID = 12264, 
        npcName = "Shazzrah", 
        npcType = "Named creature", 
        instanceID = 2717, 
        zone = "Molten Core", 
        dropChance = 2.5, 
        mobs = { 
            { 
                id = 12264, 
                chance = 2.5 
            } 
        }, 
        mobCount = 1, 
        details = true, 
    } 
}

--------------------------------------------------
-- Lethtendris's Wand
--------------------------------------------------

Sources[18301] = { 
    { 
        type = "drop", 
        npcID = 14327, 
        npcName = "Lethtendris", 
        npcType = "Boss", 
        instanceID = 2557, 
        zone = "Dire Maul", 
        dropChance = 25, 
        mobs = { 
            { 
                id = 14327, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 14327 
    } 
}

--------------------------------------------------
-- Wand of Arcane Potency
--------------------------------------------------

Sources[18338] = { 
    { 
        type = "drop", 
        npcID = 11483, 
        npcName = "Mana Remnant", 
        npcType = "Named creature", 
        instanceID = 2557, 
        zone = "Dire Maul", 
        dropChance = 1.98, 
        mobs = { 
            { 
                id = 11483, 
                chance = 1.98 
            } 
        }, 
        mobCount = 1, 
        details = true 
    }, { 
        type = "drop", 
        npcID = 11484, 
        npcName = "Residual Monstrosity", 
        npcType = "Named creature", 
        instanceID = 2557, 
        zone = "Dire Maul", 
        dropChance = 2.06, 
        mobs = { 
            { 
                id = 11484, 
                chance = 2.06 
            } 
        }, 
        mobCount = 1, 
        details = true 
    }, { 
        type = "drop", 
        npcID = 14399, 
        npcName = "Arcane Torrent", 
        npcType = "Named creature", 
        instanceID = 2557, 
        zone = "Dire Maul", 
        dropChance = 1.6, 
        mobs = { 
            { 
                id = 14399, 
                chance = 1.6 
            } }, 
            mobCount = 1, 
            details = true 
        }, { 
            type = "drop", 
            npcID = 11480, 
            npcName = "Arcane Aberration", 
            npcType = "Named creature", 
            instanceID = 2557,
            zone = "Dire Maul",
            dropChance = 1.64, 
            mobs = { 
                { 
                    id = 11480, 
                    chance = 1.64 
                } 
            }, 
            mobCount = 1, 
            details = true 
        } 
}

--------------------------------------------------
-- Mana Channeling Wand
--------------------------------------------------

Sources[18483] = { 
    { 
        type = "drop", 
        npcID = 14324, 
        npcName = "Cho'Rush the Observer", 
        npcType = "Boss", 
        instanceID = 2557, 
        zone = "Dire Maul", 
        dropChance = 25, 
        mobs = { 
            { 
                id = 14324, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 14324 
    } 
}

--------------------------------------------------
-- Oblivion's Touch
--------------------------------------------------

Sources[18761] = { 
    { 
        type = "drop", 
        npcID = 14516, 
        npcName = "Death Knight Darkreaver", 
        npcType = "Boss", 
        instanceID = 2057, 
        dropChance = 25, 
        mobs = { 
            { 
                id = 14516, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 14516 
    } 
}

Sources[19108] = { { type = "quest", questID = 7181, questName = "The Legend of Korrak", faction = "Horde", requiredLevel = 51, zone = "Alterac Mountains", details = true }, { type = "quest", questID = 7202, questName = "Korrak the Bloodrager", faction = "Alliance", requiredLevel = 51, zone = "Alterac Mountains", details = true }, { type = "quest", questID = 8271, questName = "Hero of the Stormpike", faction = "Alliance", requiredLevel = 51, zone = "Alterac Mountains", details = true }, { type = "quest", questID = 8272, questName = "Hero of the Frostwolf", faction = "Horde", requiredLevel = 51, zone = "Alterac Mountains", details = true } }
Sources[19130] = { { type = "drop", npcID = 6109, npcName = "Azuregos", npcType = "Boss", zone = "Aszhara", dropChance = 10, mobs = { { id = 6109, chance = 10 } }, mobCount = 1, details = true, lootNPCID = 6109 }, { type = "drop", npcID = 63107, npcName = "Azuregos", npcType = "Boss", dropChance = 10, mobs = { { id = 63107, chance = 10 } }, mobCount = 1, details = true, lootNPCID = 63107 } }
Sources[19367] = { { type = "drop", npcID = 11981, npcName = "Flamegor", npcType = "Boss", instanceID = 2677, zone = "Blackwing Lair (Raid)", dropChance = 16.6666667, mobs = { { id = 11981, chance = 16.6666667 } }, mobCount = 1, details = true, lootNPCID = 11981 } }
Sources[19435] = { { type = "drop", npcID = 12457, npcName = "Blackwing Spellbinder", npcType = "Named creature", instanceID = 2677, zone = "Blackwing Lair (Raid)", dropChance = 2, mobs = { { id = 12457, chance = 2 } }, mobCount = 1, details = true }, { type = "drop", npcID = 12459, npcName = "Blackwing Warlock", npcType = "Named creature", instanceID = 2677, zone = "Blackwing Lair (Raid)", dropChance = 2, mobs = { { id = 12459, chance = 2 } }, mobCount = 1, details = true }, { type = "drop", npcID = 12461, npcName = "Death Talon Overseer", npcType = "Named creature", instanceID = 2677, zone = "Blackwing Lair (Raid)", dropChance = 2, mobs = { { id = 12461, chance = 2 } }, mobCount = 1, details = true } }
Sources[19861] = { { type = "drop", npcID = 14834, npcName = "Hakkar", npcType = "Boss", instanceID = 309, zone = "Zul'Gurub", dropChance = 14.29, mobs = { { id = 14834, chance = 14.29 } }, mobCount = 1, details = true, lootNPCID = 14834 } }
Sources[19927] = { { type = "drop", npcID = 14510, npcName = "High Priestess Mar'li", npcType = "Boss", instanceID = 309, zone = "Zul'Gurub", dropChance = 16.67, mobs = { { id = 14510, chance = 16.67 } }, mobCount = 1, details = true, lootNPCID = 14510 } }
Sources[19967] = { { type = "drop", npcID = 15083, npcName = "Hazza'rah", npcType = "Boss", instanceID = 309, dropChance = 45, mobs = { { id = 15083, chance = 45 } }, mobCount = 1, details = true, lootNPCID = 15083 } }
Sources[20082] = { { type = "quest", questID = 8257, questName = "Blood of Morphaz", faction = "Both", requiredLevel = 50, zone = "Aszhara", instanceID = 109, chainID = "octo:8257", details = true } }
Sources[20672] = { { type = "drop", npcID = 15208, npcName = "The Duke of Shards", npcType = "Named creature", dropChance = 30, mobs = { { id = 15208, chance = 30 } }, mobCount = 1, details = true } }
Sources[21603] = { { type = "drop", npcID = 15511, npcName = "Lord Kri", npcType = "Boss", instanceID = 531, zone = "Ahn'Qiraj Temple", dropChance = 25, mobs = { { id = 15511, chance = 25 } }, mobCount = 1, details = true, lootNPCID = 15511 } }
Sources[21801] = { { type = "drop", npcID = 15319, npcName = "Multiple creatures", npcType = "Raid creatures", instanceID = 509, mobs = { { id = 15319, chance = 0.06 }, { id = 15320, chance = 0.05 }, { id = 15323, chance = 0.06 }, { id = 15324, chance = 0.4 }, { id = 15325, chance = 0.09 }, { id = 15327, chance = 0.04 }, { id = 15333, chance = 0.06 }, { id = 15335, chance = 0.05 }, { id = 15336, chance = 0.16 }, { id = 15338, chance = 0.07 }, { id = 15343, chance = 0.07 }, { id = 15355, chance = 0.17 }, { id = 15385, chance = 0.16 }, { id = 15386, chance = 0.03 }, { id = 15387, chance = 0.04 }, { id = 15388, chance = 0.09 }, { id = 15389, chance = 0.03 }, { id = 15391, chance = 0.02 }, { id = 15392, chance = 0.02 }, { id = 15461, chance = 0.1 }, { id = 15462, chance = 0.28 } }, mobCount = 21, details = true } }
Sources[22254] = { { type = "drop", npcID = 8905, npcName = "Warbringer Construct", npcType = "Named creature", instanceID = 1584, zone = "BRD (Dungeon)", dropChance = 0.09, mobs = { { id = 8905, chance = 0.09 } }, mobCount = 1, details = true }, { type = "drop", npcID = 9476, npcName = "Watchman Doomgrip", npcType = "Boss", instanceID = 1584, dropChance = 0.75, mobs = { { id = 9476, chance = 0.75 } }, mobCount = 1, details = true, lootNPCID = 9476 } }
Sources[22408] = { { type = "drop", npcID = 10440, npcName = "Baron Rivendare", npcType = "Boss", instanceID = 2017, zone = "Stratholme (Dungeon)", dropChance = 20, mobs = { { id = 10440, chance = 20 } }, mobCount = 1, details = true, lootNPCID = 10440 } }
Sources[22820] = { { type = "drop", npcID = 16028, npcName = "Patchwerk", npcType = "Boss", instanceID = 533, zone = "Naxxramas", dropChance = 20, mobs = { { id = 16028, chance = 20 } }, mobCount = 1, details = true, lootNPCID = 16028 } }
Sources[22821] = { { type = "drop", npcID = 15990, npcName = "Kel'Thuzad", npcType = "Boss", instanceID = 533, zone = "Naxxramas", dropChance = 9.091, mobs = { { id = 15990, chance = 9.091 } }, mobCount = 1, details = true, lootNPCID = 15990 } }
Sources[23009] = { { type = "drop", npcID = 16061, npcName = "Instructor Razuvious", npcType = "Boss", instanceID = 533, zone = "Naxxramas", dropChance = 16.67, mobs = { { id = 16061, chance = 16.67 } }, mobCount = 1, details = true, lootNPCID = 16061 } }
Sources[23177] = { { type = "drop", npcID = 14686, npcName = "Lady Falther'ess", npcType = "Boss", instanceID = 129, zone = "Razorfen Downs", dropChance = 50, mobs = { { id = 14686, chance = 50 } }, mobCount = 1, details = true, lootNPCID = 14686 } }
Sources[33200] = { { type = "drop", npcID = 63032, npcName = "Glurgill", npcType = "Rare creature", zone = "Kalimdor", dropChance = 50, mobs = { { id = 63032, chance = 50 } }, mobCount = 1, details = true } }
Sources[33352] = { { type = "quest", questID = 41945, questName = "Respect the Elderly", faction = "Both", requiredLevel = 49, details = true } }
Sources[41117] = { 
    { 
        type = "quest", 
        questID = 41196, 
        questName = "Maddening Hunger", 
        faction = "Alliance", 
        requiredLevel = 3, 
        zone = "Thalassian Highlands", 
        details = true 
    } 
}
Sources[42365] = { { type = "quest", questID = 42000, questName = "Highborne Burden", faction = "Horde", requiredLevel = 48, zone = "Winterspring", details = true } }
Sources[51735] = { { type = "drop", npcID = 16184, npcName = "Nerubian Overseer", npcType = "Boss", zone = "Western Plaguelands", dropChance = 20, mobs = { { id = 16184, chance = 20 } }, mobCount = 1, details = true, lootNPCID = 16184 } }
Sources[51816] = { { type = "quest", questID = 60110, questName = "Githyiss the Vile", faction = "Alliance", requiredLevel = 3, zone = "Teldrassil", chainID = "octo:60110", details = true } }
Sources[51820] = { { type = "quest", questID = 60112, questName = "Fallen Adventurers", faction = "Horde", requiredLevel = 3, zone = "Tirisfal Glades", chainID = "octo:60112", details = true } }
Sources[55134] = { { type = "quest", questID = 41360, questName = "Warm is the Day", faction = "Both", requiredLevel = 60, zone = "Winterspring", chainID = "octo:41360", details = true } }
Sources[55511] = { { type = "drop", npcID = 59991, npcName = "Kruul", npcType = "Boss", instanceID = 814, zone = "Tower of Karazhan", dropChance = 11.2, mobs = { { id = 59991, chance = 11.2 } }, mobCount = 1, details = true, lootNPCID = 59991 } }
Sources[58009] = { { type = "drop", npcID = 62193, npcName = "Quistis the Malign", npcType = "Rare creature", zone = "Dun Morogh", dropChance = 50, mobs = { { id = 62193, chance = 50 } }, mobCount = 1, details = true } }
Sources[58026] = { { type = "quest", questID = 41667, questName = "In Need of Shoes", faction = "Alliance", requiredLevel = 25, zone = "Azeroth", details = true } }
Sources[58047] = { { type = "drop", npcID = 62069, npcName = "Halgan Redbrand", npcType = "Named creature", zone = "Dragonmaw Retreat", dropChance = 25, mobs = { { id = 62069, chance = 25 } }, mobCount = 1, details = true } }
Sources[58089] = { { type = "drop", npcID = 62503, npcName = "Rotthorn", npcType = "Boss", instanceID = 47, zone = "Razorfen Kraul", dropChance = 25, mobs = { { id = 62503, chance = 25 } }, mobCount = 1, details = true, lootNPCID = 62503 } }
Sources[58137] = { { type = "drop", npcID = 62548, npcName = "Oronok Torn-Heart", npcType = "Named creature", zone = "Stormwrought Ruins", dropChance = 25, mobs = { { id = 62548, chance = 25 } }, mobCount = 1, details = true } }
Sources[58205] = { { type = "drop", npcID = 52145, npcName = "Incindis", npcType = "Boss", instanceID = 2717, zone = "Molten Core (Raid)", dropChance = 20, mobs = { { id = 52145, chance = 20 } }, mobCount = 1, details = true, lootNPCID = 52145 } }
Sources[58253] = { { type = "vendor", npcID = 80945, npcName = "Elisandra Spellbinder", faction = "Both", details = true } }
Sources[58277] = { { type = "quest", questID = 41841, questName = "Artifact of the Dark Lady", faction = "Horde", requiredLevel = 32, zone = "Silverpine Forest", chainID = "octo:41841", details = true } }
Sources[60427] = { 
    { type = "drop", 
    npcID = 80854, 
    npcName = "Damian", 
    npcType = "Boss", 
    instanceID = 35, 
    dropChance = 20, 
    mobs = { 
        { 
            id = 80854, 
            chance = 20 
        } 
    }, 
    mobCount = 1, 
    details = true, 
    lootNPCID = 80854 
}, 
{ 
    type = "drop", 
    npcID = 80854, 
    npcName = "Damian", 
    npcType = "Boss", 
    instanceID = 35, 
    zone = "Stormwind Vault", 
    dropChance = 20, 
    mobs = { 
        { id = 80854, chance = 20 } }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 80854 } }
Sources[60805] = { { type = "drop", npcID = 91910, npcName = "Multiple creatures", npcType = "Creatures", instanceID = 800, mobs = { { id = 91910, chance = 0.02 }, { id = 91911, chance = 0.02 }, { id = 91912, chance = 0.02 }, { id = 91913, chance = 0.02 }, { id = 91914, chance = 0.02 }, { id = 91915, chance = 0.02 }, { id = 91918, chance = 0.02 }, { id = 91919, chance = 0.02 }, { id = 91922, chance = 0.02 }, { id = 91923, chance = 0.02 }, { id = 91924, chance = 0.02 }, { id = 91925, chance = 0.02 }, { id = 91926, chance = 0.02 }, { id = 91932, chance = 0.02 }, { id = 91930, chance = 0.02 } }, mobCount = 15, details = true } }
Sources[61019] = { { type = "drop", npcID = 65113, npcName = "Chronar", npcType = "Boss", instanceID = 269, zone = "Caverns of Time", dropChance = 16.7, mobs = { { id = 65113, chance = 16.7 } }, mobCount = 1, details = true, lootNPCID = 65113 } }
Sources[61020] = { { type = "drop", npcID = 61316, npcName = "Drifting Avatar of Sand", npcType = "Named creature", instanceID = 269, zone = "Caverns of Time", dropChance = 2, mobs = { { id = 61316, chance = 2 } }, mobCount = 1, details = true }, { type = "drop", npcID = 65114, npcName = "Harbinger Aph'ygth", npcType = "Named creature", instanceID = 269, dropChance = 2, mobs = { { id = 65114, chance = 2 } }, mobCount = 1, details = true } }
Sources[61286] = { { type = "drop", npcID = 61222, npcName = "Lord Blackwald II", npcType = "Boss", instanceID = 532, zone = "Lower Karazhan Halls", dropChance = 14, mobs = { { id = 61222, chance = 14 } }, mobCount = 1, details = true, lootNPCID = 61222 } }
Sources[61374] = { { type = "drop", npcID = 80116, npcName = "Risen Oilblaze", npcType = "Named creature", dropChance = 0.2, mobs = { { id = 80116, chance = 0.2 } }, mobCount = 1, details = true } }
Sources[61615] = { { type = "drop", npcID = 61517, npcName = "Ruk'thok the Pyromancer", npcType = "Rare creature", zone = "Azeroth", dropChance = 33.33, mobs = { { id = 61517, chance = 33.33 } }, mobCount = 1, details = true } }
Sources[80544] = { { type = "vendor", npcID = 80266, npcName = "Soalara Dawnstar", faction = "Both", details = true } }
Sources[80545] = { { type = "vendor", npcID = 80266, npcName = "Soalara Dawnstar", faction = "Both", details = true } }
Sources[80644] = { { type = "vendor", npcID = 80807, npcName = "Reolis Riptusk", faction = "Both", details = true } }
Sources[80645] = { { type = "vendor", npcID = 80807, npcName = "Reolis Riptusk", faction = "Both", details = true } }
Sources[80748] = { { type = "drop", npcID = 11783, npcName = "Multiple creatures", npcType = "Creatures", instanceID = 349, mobs = { { id = 11783, chance = 0.01 }, { id = 11784, chance = 0.01 }, { id = 11790, chance = 0.01 }, { id = 11791, chance = 0.01 }, { id = 11792, chance = 0.01 }, { id = 11793, chance = 0.01 }, { id = 11794, chance = 0.01 }, { id = 12206, chance = 0.01 }, { id = 12219, chance = 0.01 }, { id = 12220, chance = 0.01 }, { id = 12221, chance = 0.01 }, { id = 12222, chance = 0.01 }, { id = 12223, chance = 0.01 }, { id = 12224, chance = 0.01 }, { id = 13141, chance = 0.01 }, { id = 13142, chance = 0.01 }, { id = 13323, chance = 0.01 }, { id = 62879, chance = 0.01 }, { id = 62880, chance = 0.01 } }, mobCount = 19, details = true }, { type = "drop", npcID = 60841, npcName = "Enraged Cave Rumbler", npcType = "Named creature", dropChance = 0.01, mobs = { { id = 60841, chance = 0.01 } }, mobCount = 1, details = true } }
Sources[80799] = { { type = "drop", npcID = 4287, npcName = "Multiple creatures", npcType = "Creatures", instanceID = 796, mobs = { { id = 4287, chance = 0.005 }, { id = 4288, chance = 0.005 }, { id = 4291, chance = 0.005 }, { id = 4296, chance = 0.02 }, { id = 4299, chance = 0.02 }, { id = 4304, chance = 0.005 }, { id = 4540, chance = 0.005 } }, mobCount = 7, details = true }, { type = "drop", npcID = 4285, npcName = "Scarlet Disciple", npcType = "Named creature", dropChance = 0.02, mobs = { { id = 4285, chance = 0.02 } }, mobCount = 1, details = true } }
Sources[80829] = { { type = "drop", npcID = 4066, npcName = "Nal'taszar", npcType = "Rare creature", zone = "Stonetalon Mountains", dropChance = 35, mobs = { { id = 4066, chance = 35 } }, mobCount = 1, details = true } }
Sources[81290] = { { type = "quest", questID = 70033, questName = "The Seeker's Demise", faction = "Horde", requiredLevel = 27, zone = "Ashenvale", chainID = "octo:70033", details = true } }
Sources[81320] = { { type = "quest", questID = 55006, questName = "Backup Capacitor", faction = "Horde", requiredLevel = 29, instanceID = 721, chainID = "octo:55006", details = true } }
Sources[83215] = { { type = "drop", npcID = 92111, npcName = "Fenektis the Deceiver", npcType = "Boss", instanceID = 802, zone = "Crescent Grove", dropChance = 25, mobs = { { id = 92111, chance = 25 } }, mobCount = 1, details = true, lootNPCID = 92111 } }
Sources[83467] = { { type = "drop", npcID = 91928, npcName = "Alarus", npcType = "Boss", instanceID = 800, dropChance = 25, mobs = { { id = 91928, chance = 25 } }, mobCount = 1, details = true, lootNPCID = 91928 } }
Sources[84602] = { { type = "vendor", npcID = 80943, npcName = "Dronormu", faction = "Both", details = true } }
BossLoot[1853] = { { itemID = 12843, name = "Corruptor's Scourgestone", chance = 100, quality = 2 }, { itemID = 13501, name = "Recipe: Major Mana Potion", chance = 10, quality = 2 }, { itemID = 13937, name = "Headmaster's Charge", chance = 1, quality = 4 }, { itemID = 14514, name = "Pattern: Robe of the Void", chance = 7, quality = 4 }, { itemID = 19276, name = "Ace of Portals", chance = 3, quality = 3 }, { itemID = 13398, name = "Boots of the Shrieker", chance = 14.29, quality = 3 }, { itemID = 13938, name = "Bonecreeper Stylus", chance = 14.29, quality = 3 }, { itemID = 13944, name = "Tombstone Breastplate", chance = 14.29, quality = 3 }, { itemID = 13951, name = "Vigorsteel Vambraces", chance = 14.29, quality = 3 }, { itemID = 13953, name = "Silent Fang", chance = 14.29, quality = 3 }, { itemID = 13964, name = "Witchblade", chance = 14.29, quality = 3 }, { itemID = 22433, name = "Don Mauricio's Band of Domination", chance = 14.29, quality = 3 }, { itemID = 16667, name = "Coif of Elements", chance = 11.11, quality = 3 }, { itemID = 16677, name = "Beaststalker's Cap", chance = 11.11, quality = 3 }, { itemID = 16686, name = "Magister's Crown", chance = 11.11, quality = 3 }, { itemID = 16693, name = "Devout Crown", chance = 11.11, quality = 3 }, { itemID = 16698, name = "Dreadmist Mask", chance = 11.11, quality = 3 }, { itemID = 16707, name = "Shadowcraft Cap", chance = 11.11, quality = 3 }, { itemID = 16720, name = "Wildheart Cowl", chance = 11.11, quality = 3 }, { itemID = 16727, name = "Lightforge Helm", chance = 11.11, quality = 3 }, { itemID = 16731, name = "Helm of Valor", chance = 11.11, quality = 3 }, { itemID = 61460, name = "Necromantic Potion", quality = 1 }, { itemID = 21525, name = "Green Winter Hat", chance = 100, quality = 2 }, { itemID = 51217, name = "Fashion Coin", chance = 100, quality = 2 }, { itemID = 56107, name = "Bottom Half of Advanced Gemology II", chance = 30, quality = 3 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 3, quality = 3 } }
BossLoot[5912] = { { itemID = 3176, name = "Small Claw", chance = 25, quality = 0 }, { itemID = 3177, name = "Tiny Fang", chance = 35, quality = 0 }, { itemID = 5635, name = "Sharp Claw", chance = 2, quality = 1 }, { itemID = 6443, name = "Deviate Hide", quality = 1 }, { itemID = 6470, name = "Deviate Scale", chance = 6, quality = 1 }, { itemID = 6471, name = "Perfect Deviate Scale", chance = 2, quality = 1 }, { itemID = 5243, name = "Firebelcher", chance = 50, quality = 3 }, { itemID = 6632, name = "Feyscale Cloak", chance = 50, quality = 2 } }
BossLoot[6109] = { { itemID = 18704, name = "Mature Blue Dragon Sinew", chance = 100, quality = 4 }, { itemID = 10135, name = "High Councillor's Tunic", chance = 2.174, quality = 2 }, { itemID = 10143, name = "High Councillor's Robe", chance = 2.174, quality = 2 }, { itemID = 10151, name = "Mighty Tunic", chance = 2.174, quality = 2 }, { itemID = 10157, name = "Mercurial Breastplate", chance = 2.174, quality = 2 }, { itemID = 10158, name = "Mercurial Guard", chance = 2.174, quality = 2 }, { itemID = 10246, name = "Master's Vest", chance = 2.174, quality = 2 }, { itemID = 10252, name = "Master's Leggings", chance = 2.174, quality = 2 }, { itemID = 10254, name = "Master's Robe", chance = 2.174, quality = 2 }, { itemID = 10262, name = "Adventurer's Legguards", chance = 2.174, quality = 2 }, { itemID = 10264, name = "Adventurer's Tunic", chance = 2.174, quality = 2 }, { itemID = 10266, name = "Masterwork Breastplate", chance = 2.174, quality = 2 }, { itemID = 10271, name = "Masterwork Shield", chance = 2.174, quality = 2 }, { itemID = 10273, name = "Masterwork Legplates", chance = 2.174, quality = 2 }, { itemID = 10367, name = "Hyperion Shield", chance = 2.174, quality = 2 }, { itemID = 10384, name = "Hyperion Armor", chance = 2.174, quality = 2 }, { itemID = 10389, name = "Hyperion Legplates", chance = 2.174, quality = 2 }, { itemID = 11980, name = "Opal Ring", chance = 2.174, quality = 2 }, { itemID = 12017, name = "Prismatic Band", chance = 2.174, quality = 2 }, { itemID = 12048, name = "Prismatic Pendant", chance = 2.174, quality = 2 }, { itemID = 12058, name = "Demonic Bone Ring", chance = 2.174, quality = 2 }, { itemID = 14328, name = "Eternal Chestguard", chance = 2.174, quality = 2 }, { itemID = 14332, name = "Eternal Crown", chance = 2.174, quality = 2 }, { itemID = 14336, name = "Eternal Wraps", chance = 2.174, quality = 2 }, { itemID = 14456, name = "Elunarian Vest", chance = 2.174, quality = 2 }, { itemID = 14464, name = "Elunarian Silk Robes", chance = 2.174, quality = 2 }, { itemID = 14680, name = "Indomitable Vest", chance = 2.174, quality = 2 }, { itemID = 14811, name = "Warstrike Chestguard", chance = 2.174, quality = 2 }, { itemID = 14812, name = "Warstrike Buckler", chance = 2.174, quality = 2 }, { itemID = 14975, name = "Exalted Harness", chance = 2.174, quality = 2 }, { itemID = 14979, name = "Exalted Helmet", chance = 2.174, quality = 2 }, { itemID = 14982, name = "Exalted Shield", chance = 2.174, quality = 2 }, { itemID = 15221, name = "Holy War Sword", chance = 2.174, quality = 2 }, { itemID = 15240, name = "Demon's Claw", chance = 2.174, quality = 2 }, { itemID = 15247, name = "Bloodstrike Dagger", chance = 2.174, quality = 2 }, { itemID = 15258, name = "Divine Warblade", chance = 2.174, quality = 2 }, { itemID = 15283, name = "Lunar Wand", chance = 2.174, quality = 2 }, { itemID = 15289, name = "Archstrike Bow", chance = 2.174, quality = 2 }, { itemID = 15439, name = "Supreme Crown", chance = 2.174, quality = 2 }, { itemID = 15442, name = "Supreme Breastplate", chance = 2.174, quality = 2 }, { itemID = 15680, name = "Triumphant Chestpiece", chance = 2.174, quality = 2 }, { itemID = 15684, name = "Triumphant Skullcap", chance = 2.174, quality = 2 }, { itemID = 15687, name = "Triumphant Shield", chance = 2.174, quality = 2 }, { itemID = 15941, name = "High Councillor's Scepter", chance = 2.174, quality = 2 }, { itemID = 15942, name = "Master's Rod", chance = 2.174, quality = 2 }, { itemID = 15968, name = "Elunarian Sphere", chance = 2.174, quality = 2 }, { itemID = 15989, name = "Eternal Rod", chance = 2.174, quality = 2 }, { itemID = 2564, name = "Elven Spirit Claws", chance = 10, quality = 3 }, { itemID = 7734, name = "Six Demon Bag", chance = 10, quality = 3 }, { itemID = 13009, name = "Cow King's Hide", chance = 10, quality = 3 }, { itemID = 13030, name = "Basilisk Bone", chance = 10, quality = 3 }, { itemID = 13046, name = "Blanchard's Stout", chance = 10, quality = 3 }, { itemID = 13065, name = "Wand of Allistarj", chance = 10, quality = 3 }, { itemID = 13066, name = "Wyrmslayer Spaulders", chance = 10, quality = 3 }, { itemID = 13085, name = "Horizon Choker", chance = 10, quality = 3 }, { itemID = 13125, name = "Elven Chain Boots", chance = 10, quality = 3 }, { itemID = 13139, name = "Guttbuster", chance = 10, quality = 3 }, { itemID = 1203, name = "Aegis of Stormwind", chance = 1.316, quality = 3 }, { itemID = 1973, name = "Orb of Deception", chance = 1.316, quality = 3 }, { itemID = 2564, name = "Elven Spirit Claws", chance = 1.316, quality = 3 }, { itemID = 4696, name = "Lapidis Tankard of Tidesippe", chance = 1.316, quality = 3 }, { itemID = 5266, name = "Eye of Adaegus", chance = 1.316, quality = 3 }, { itemID = 5267, name = "Scarlet Kris", chance = 1.316, quality = 3 }, { itemID = 6622, name = "Sword of Zeal", chance = 1.316, quality = 3 }, { itemID = 7734, name = "Six Demon Bag", chance = 1.316, quality = 3 }, { itemID = 7976, name = "Plans: Mithril Shield Spike", chance = 1.316, quality = 3 }, { itemID = 7991, name = "Plans: Mithril Scale Shoulders", chance = 1.316, quality = 3 }, { itemID = 8028, name = "Plans: Runed Mithril Hammer", chance = 1.316, quality = 3 }, { itemID = 9402, name = "Earthborn Kilt", chance = 1.316, quality = 3 }, { itemID = 10605, name = "Schematic: Spellpower Goggles Xtreme", chance = 1.316, quality = 2 }, { itemID = 10608, name = "Schematic: Sniper Scope", chance = 1.316, quality = 3 }, { itemID = 11302, name = "Uther's Strength", chance = 1.316, quality = 3 }, { itemID = 12698, name = "Plans: Dawnbringer Shoulders", chance = 1.316, quality = 3 }, { itemID = 12711, name = "Plans: Whitesoul Helm", chance = 1.316, quality = 3 }, { itemID = 12717, name = "Plans: Lionheart Helm", chance = 1.316, quality = 4 }, { itemID = 12720, name = "Plans: Stronghold Gauntlets", chance = 1.316, quality = 4 }, { itemID = 12728, name = "Plans: Invulnerable Mail", chance = 1.316, quality = 4 }, { itemID = 13000, name = "Staff of Hale Magefire", chance = 1.316, quality = 3 }, { itemID = 13001, name = "Maiden's Circle", chance = 1.316, quality = 3 }, { itemID = 13002, name = "Lady Alizabeth's Pendant", chance = 1.316, quality = 3 }, { itemID = 13003, name = "Lord Alexander's Battle Axe", chance = 1.316, quality = 3 }, { itemID = 13004, name = "Torch of Austen", chance = 1.316, quality = 3 }, { itemID = 13006, name = "Mass of McGowan", chance = 1.316, quality = 3 }, { itemID = 13007, name = "Mageflame Cloak", chance = 1.316, quality = 3 }, { itemID = 13008, name = "Dalewind Trousers", chance = 1.316, quality = 3 }, { itemID = 13009, name = "Cow King's Hide", chance = 1.316, quality = 3 }, { itemID = 13013, name = "Elder Wizard's Mantle", chance = 1.316, quality = 3 }, { itemID = 13015, name = "Serathil", chance = 1.316, quality = 3 }, { itemID = 13030, name = "Basilisk Bone", chance = 1.316, quality = 3 }, { itemID = 13036, name = "Assassination Blade", chance = 1.316, quality = 3 }, { itemID = 13040, name = "Heartseeking Crossbow", chance = 1.316, quality = 3 }, { itemID = 13047, name = "Twig of the World Tree", chance = 1.316, quality = 3 }, { itemID = 13053, name = "Doombringer", chance = 1.316, quality = 3 }, { itemID = 13060, name = "The Needler", chance = 1.316, quality = 3 }, { itemID = 13066, name = "Wyrmslayer Spaulders", chance = 1.316, quality = 3 }, { itemID = 13067, name = "Hydralick Armor", chance = 1.316, quality = 3 }, { itemID = 13070, name = "Sapphiron's Scale Boots", chance = 1.316, quality = 3 }, { itemID = 13072, name = "Stonegrip Gauntlets", chance = 1.316, quality = 3 }, { itemID = 13073, name = "Mugthol's Helm", chance = 1.316, quality = 3 }, { itemID = 13075, name = "Direwing Legguards", chance = 1.316, quality = 3 }, { itemID = 13077, name = "Girdle of Uther", chance = 1.316, quality = 3 }, { itemID = 13083, name = "Garrett Family Crest", chance = 1.316, quality = 3 }, { itemID = 13085, name = "Horizon Choker", chance = 1.316, quality = 3 }, { itemID = 13091, name = "Medallion of Grand Marshal Morris", chance = 1.316, quality = 3 }, { itemID = 13096, name = "Band of the Hierophant", chance = 1.316, quality = 3 }, { itemID = 13107, name = "Magiskull Cuffs", chance = 1.316, quality = 3 }, { itemID = 13111, name = "Sandals of the Insurgent", chance = 1.316, quality = 3 }, { itemID = 13113, name = "Feathermoon Headdress", chance = 1.316, quality = 3 }, { itemID = 13116, name = "Spaulders of the Unseen", chance = 1.316, quality = 3 }, { itemID = 13118, name = "Serpentine Sash", chance = 1.316, quality = 3 }, { itemID = 13120, name = "Deepfury Bracers", chance = 1.316, quality = 3 }, { itemID = 13123, name = "Dreamwalker Armor", chance = 1.316, quality = 3 }, { itemID = 13125, name = "Elven Chain Boots", chance = 1.316, quality = 3 }, { itemID = 13126, name = "Battlecaller Gauntlets", chance = 1.316, quality = 3 }, { itemID = 13130, name = "Windrunner Legguards", chance = 1.316, quality = 3 }, { itemID = 13133, name = "Drakesfire Epaulets", chance = 1.316, quality = 3 }, { itemID = 13135, name = "Lordly Armguards", chance = 1.316, quality = 3 }, { itemID = 13144, name = "Serenity Belt", chance = 1.316, quality = 3 }, { itemID = 13146, name = "Shell Launcher Shotgun", chance = 1.316, quality = 3 }, { itemID = 14501, name = "Pattern: Mooncloth Vest", chance = 1.316, quality = 3 }, { itemID = 14509, name = "Pattern: Mooncloth Circlet", chance = 1.316, quality = 3 }, { itemID = 14511, name = "Pattern: Gloves of Spell Mastery", chance = 1.316, quality = 4 }, { itemID = 17413, name = "Codex: Prayer of Fortitude", chance = 1.316, quality = 3 }, { itemID = 17414, name = "Codex: Prayer of Fortitude II", chance = 1.316, quality = 3 }, { itemID = 17682, name = "Book: Gift of the Wild", chance = 1.316, quality = 3 }, { itemID = 17683, name = "Book: Gift of the Wild II", chance = 1.316, quality = 3 }, { itemID = 18600, name = "Tome of Arcane Brilliance", chance = 1.316, quality = 3 }, { itemID = 22388, name = "Plans: Titanic Leggings", chance = 1.316, quality = 4 }, { itemID = 22389, name = "Plans: Sageblade", chance = 1.316, quality = 4 }, { itemID = 22390, name = "Plans: Persuader", chance = 1.316, quality = 4 }, { itemID = 22393, name = "Codex: Prayer of Shadow Protection", chance = 1.316, quality = 3 }, { itemID = 22890, name = "Tome of Frost Ward V", chance = 1.316, quality = 3 }, { itemID = 22891, name = "Grimoire of Shadow Ward IV", chance = 1.316, quality = 3 }, { itemID = 9297, name = "Recipe: Elixir of Dream Vision", chance = 0.9524, quality = 2 }, { itemID = 10246, name = "Master's Vest", chance = 0.9524, quality = 2 }, { itemID = 10247, name = "Master's Boots", chance = 0.9524, quality = 2 }, { itemID = 10248, name = "Master's Bracers", chance = 0.9524, quality = 2 }, { itemID = 10249, name = "Master's Cloak", chance = 0.9524, quality = 2 }, { itemID = 10250, name = "Master's Hat", chance = 0.9524, quality = 2 }, { itemID = 10251, name = "Master's Gloves", chance = 0.9524, quality = 2 }, { itemID = 10252, name = "Master's Leggings", chance = 0.9524, quality = 2 }, { itemID = 10253, name = "Master's Mantle", chance = 0.9524, quality = 2 }, { itemID = 10254, name = "Master's Robe", chance = 0.9524, quality = 2 }, { itemID = 10255, name = "Master's Belt", chance = 0.9524, quality = 2 }, { itemID = 10256, name = "Adventurer's Bracers", chance = 0.9524, quality = 2 }, { itemID = 10257, name = "Adventurer's Boots", chance = 0.9524, quality = 2 }, { itemID = 10258, name = "Adventurer's Cape", chance = 0.9524, quality = 2 }, { itemID = 10259, name = "Adventurer's Belt", chance = 0.9524, quality = 2 }, { itemID = 10260, name = "Adventurer's Gloves", chance = 0.9524, quality = 2 }, { itemID = 10261, name = "Adventurer's Bandana", chance = 0.9524, quality = 2 }, { itemID = 10262, name = "Adventurer's Legguards", chance = 0.9524, quality = 2 }, { itemID = 10263, name = "Adventurer's Shoulders", chance = 0.9524, quality = 2 }, { itemID = 10264, name = "Adventurer's Tunic", chance = 0.9524, quality = 2 }, { itemID = 10265, name = "Masterwork Bracers", chance = 0.9524, quality = 2 }, { itemID = 10266, name = "Masterwork Breastplate", chance = 0.9524, quality = 2 }, { itemID = 10267, name = "Masterwork Cape", chance = 0.9524, quality = 2 }, { itemID = 10268, name = "Masterwork Gauntlets", chance = 0.9524, quality = 2 }, { itemID = 10269, name = "Masterwork Girdle", chance = 0.9524, quality = 2 }, { itemID = 10270, name = "Masterwork Boots", chance = 0.9524, quality = 2 }, { itemID = 10272, name = "Masterwork Circlet", chance = 0.9524, quality = 2 }, { itemID = 10273, name = "Masterwork Legplates", chance = 0.9524, quality = 2 }, { itemID = 10274, name = "Masterwork Pauldrons", chance = 0.9524, quality = 2 }, { itemID = 10367, name = "Hyperion Shield", chance = 0.9524, quality = 2 }, { itemID = 10384, name = "Hyperion Armor", chance = 0.9524, quality = 2 }, { itemID = 10385, name = "Hyperion Greaves", chance = 0.9524, quality = 2 }, { itemID = 10386, name = "Hyperion Gauntlets", chance = 0.9524, quality = 2 }, { itemID = 10387, name = "Hyperion Girdle", chance = 0.9524, quality = 2 }, { itemID = 10388, name = "Hyperion Helm", chance = 0.9524, quality = 2 }, { itemID = 10389, name = "Hyperion Legplates", chance = 0.9524, quality = 2 }, { itemID = 10390, name = "Hyperion Pauldrons", chance = 0.9524, quality = 2 }, { itemID = 10391, name = "Hyperion Vambraces", chance = 0.9524, quality = 2 }, { itemID = 11224, name = "Formula: Enchant Shield - Frost Resistance", chance = 0.9524, quality = 2 }, { itemID = 11226, name = "Formula: Enchant Gloves - Riding Skill", chance = 0.9524, quality = 2 }, { itemID = 12017, name = "Prismatic Band", chance = 0.9524, quality = 2 }, { itemID = 12048, name = "Prismatic Pendant", chance = 0.9524, quality = 2 }, { itemID = 12682, name = "Plans: Thorium Armor", chance = 0.9524, quality = 2 }, { itemID = 12683, name = "Plans: Thorium Belt", chance = 0.9524, quality = 2 }, { itemID = 12684, name = "Plans: Thorium Bracers", chance = 0.9524, quality = 2 }, { itemID = 12685, name = "Plans: Radiant Belt", chance = 0.9524, quality = 2 }, { itemID = 12689, name = "Plans: Radiant Breastplate", chance = 0.9524, quality = 2 }, { itemID = 12702, name = "Plans: Radiant Circlet", chance = 0.9524, quality = 2 }, { itemID = 13486, name = "Recipe: Transmute Undeath to Water", chance = 0.9524, quality = 2 }, { itemID = 13487, name = "Recipe: Transmute Water to Undeath", chance = 0.9524, quality = 2 }, { itemID = 13488, name = "Recipe: Transmute Life to Earth", chance = 0.9524, quality = 2 }, { itemID = 13489, name = "Recipe: Transmute Earth to Life", chance = 0.9524, quality = 2 }, { itemID = 14328, name = "Eternal Chestguard", chance = 0.9524, quality = 2 }, { itemID = 14329, name = "Eternal Boots", chance = 0.9524, quality = 2 }, { itemID = 14330, name = "Eternal Bindings", chance = 0.9524, quality = 2 }, { itemID = 14331, name = "Eternal Cloak", chance = 0.9524, quality = 2 }, { itemID = 14332, name = "Eternal Crown", chance = 0.9524, quality = 2 }, { itemID = 14333, name = "Eternal Gloves", chance = 0.9524, quality = 2 }, { itemID = 14334, name = "Eternal Sarong", chance = 0.9524, quality = 2 }, { itemID = 14335, name = "Eternal Spaulders", chance = 0.9524, quality = 2 }, { itemID = 14336, name = "Eternal Wraps", chance = 0.9524, quality = 2 }, { itemID = 14337, name = "Eternal Cord", chance = 0.9524, quality = 2 }, { itemID = 14975, name = "Exalted Harness", chance = 0.9524, quality = 2 }, { itemID = 14976, name = "Exalted Gauntlets", chance = 0.9524, quality = 2 }, { itemID = 14977, name = "Exalted Girdle", chance = 0.9524, quality = 2 }, { itemID = 14978, name = "Exalted Sabatons", chance = 0.9524, quality = 2 }, { itemID = 14979, name = "Exalted Helmet", chance = 0.9524, quality = 2 }, { itemID = 14980, name = "Exalted Legplates", chance = 0.9524, quality = 2 }, { itemID = 14981, name = "Exalted Epaulets", chance = 0.9524, quality = 2 }, { itemID = 14982, name = "Exalted Shield", chance = 0.9524, quality = 2 }, { itemID = 14983, name = "Exalted Armsplints", chance = 0.9524, quality = 2 }, { itemID = 15221, name = "Holy War Sword", chance = 0.9524, quality = 2 }, { itemID = 15229, name = "Blesswind Hammer", chance = 0.9524, quality = 2 }, { itemID = 15240, name = "Demon's Claw", chance = 0.9524, quality = 2 }, { itemID = 15247, name = "Bloodstrike Dagger", chance = 0.9524, quality = 2 }, { itemID = 15258, name = "Divine Warblade", chance = 0.9524, quality = 2 }, { itemID = 15267, name = "Brutehammer", chance = 0.9524, quality = 2 }, { itemID = 15273, name = "Death Striker", chance = 0.9524, quality = 2 }, { itemID = 15278, name = "Solstice Staff", chance = 0.9524, quality = 2 }, { itemID = 15283, name = "Lunar Wand", chance = 0.9524, quality = 2 }, { itemID = 15289, name = "Archstrike Bow", chance = 0.9524, quality = 2 }, { itemID = 15325, name = "Sharpshooter Harquebus", chance = 0.9524, quality = 2 }, { itemID = 15434, name = "Supreme Sash", chance = 0.9524, quality = 2 }, { itemID = 15435, name = "Supreme Shoes", chance = 0.9524, quality = 2 }, { itemID = 15436, name = "Supreme Bracers", chance = 0.9524, quality = 2 }, { itemID = 15437, name = "Supreme Cape", chance = 0.9524, quality = 2 }, { itemID = 15438, name = "Supreme Gloves", chance = 0.9524, quality = 2 }, { itemID = 15439, name = "Supreme Crown", chance = 0.9524, quality = 2 }, { itemID = 15440, name = "Supreme Leggings", chance = 0.9524, quality = 2 }, { itemID = 15441, name = "Supreme Shoulders", chance = 0.9524, quality = 2 }, { itemID = 15442, name = "Supreme Breastplate", chance = 0.9524, quality = 2 }, { itemID = 15678, name = "Triumphant Sabatons", chance = 0.9524, quality = 2 }, { itemID = 15679, name = "Triumphant Bracers", chance = 0.9524, quality = 2 }, { itemID = 15680, name = "Triumphant Chestpiece", chance = 0.9524, quality = 2 }, { itemID = 15681, name = "Triumphant Cloak", chance = 0.9524, quality = 2 }, { itemID = 15682, name = "Triumphant Gauntlets", chance = 0.9524, quality = 2 }, { itemID = 15683, name = "Triumphant Girdle", chance = 0.9524, quality = 2 }, { itemID = 15684, name = "Triumphant Skullcap", chance = 0.9524, quality = 2 }, { itemID = 15685, name = "Triumphant Legplates", chance = 0.9524, quality = 2 }, { itemID = 15686, name = "Triumphant Shoulder Pads", chance = 0.9524, quality = 2 }, { itemID = 15687, name = "Triumphant Shield", chance = 0.9524, quality = 2 }, { itemID = 15942, name = "Master's Rod", chance = 0.9524, quality = 2 }, { itemID = 16044, name = "Schematic: Lifelike Mechanical Toad", chance = 0.9524, quality = 2 }, { itemID = 16055, name = "Schematic: Arcane Bomb", chance = 0.9524, quality = 2 }, { itemID = 16253, name = "Formula: Enchant Chest - Greater Stats", chance = 0.9524, quality = 2 }, { itemID = 17962, name = "Blue Sack of Gems", chance = 20, quality = 2 }, { itemID = 17963, name = "Green Sack of Gems", chance = 20, quality = 2 }, { itemID = 17964, name = "Gray Sack of Gems", chance = 20, quality = 2 }, { itemID = 17965, name = "Yellow Sack of Gems", chance = 20, quality = 2 }, { itemID = 17969, name = "Red Sack of Gems", chance = 20, quality = 2 }, { itemID = 17070, name = "Fang of the Mystics", chance = 10, quality = 4 }, { itemID = 18202, name = "Eskhandar's Left Claw", chance = 10, quality = 4 }, { itemID = 18208, name = "Drape of Benediction", chance = 10, quality = 4 }, { itemID = 18541, name = "Puissant Cape", chance = 10, quality = 4 }, { itemID = 18542, name = "Typhoon", chance = 10, quality = 4 }, { itemID = 18545, name = "Leggings of Arcane Supremacy", chance = 10, quality = 4 }, { itemID = 18547, name = "Unmelting Ice Girdle", chance = 10, quality = 4 }, { itemID = 19130, name = "Cold Snap", chance = 10, quality = 4 }, { itemID = 19131, name = "Snowblind Shoes", chance = 10, quality = 4 }, { itemID = 19132, name = "Crystal Adorned Crown", chance = 10, quality = 4 }, { itemID = 17070, name = "Fang of the Mystics", chance = 10, quality = 4 }, { itemID = 18202, name = "Eskhandar's Left Claw", chance = 10, quality = 4 }, { itemID = 18208, name = "Drape of Benediction", chance = 10, quality = 4 }, { itemID = 18541, name = "Puissant Cape", chance = 10, quality = 4 }, { itemID = 18542, name = "Typhoon", chance = 10, quality = 4 }, { itemID = 18545, name = "Leggings of Arcane Supremacy", chance = 10, quality = 4 }, { itemID = 18547, name = "Unmelting Ice Girdle", chance = 10, quality = 4 }, { itemID = 19130, name = "Cold Snap", chance = 10, quality = 4 }, { itemID = 19131, name = "Snowblind Shoes", chance = 10, quality = 4 }, { itemID = 19132, name = "Crystal Adorned Crown", chance = 10, quality = 4 }, { itemID = 83544, name = "Pattern: Stormscale Leggings", chance = 40, quality = 4 } }
BossLoot[6490] = { { itemID = 4306, name = "Silk Cloth", chance = 19, quality = 1 }, { itemID = 7708, name = "Necrotic Wand", chance = 33.33, quality = 3 }, { itemID = 7709, name = "Blighted Leggings", chance = 33.33, quality = 3 }, { itemID = 7731, name = "Ghostshard Talisman", chance = 33.33, quality = 3 } }
BossLoot[7272] = { { itemID = 862, name = "Runed Ring", chance = 0.02, quality = 3 }, { itemID = 1520, name = "Troll Sweat", chance = 24.0011, quality = 0 }, { itemID = 1645, name = "Moonberry Juice", chance = 2.0245, quality = 1 }, { itemID = 1685, name = "Troll-hide Bag", chance = 0.02, quality = 1 }, { itemID = 2040, name = "Troll Protector", chance = 0.02, quality = 3 }, { itemID = 3864, name = "Citrine", chance = 0.0266, quality = 2 }, { itemID = 3869, name = "Plans: Shadow Crescent Axe", chance = 0.02, quality = 2 }, { itemID = 3874, name = "Plans: Polished Steel Boots", chance = 0.02, quality = 2 }, { itemID = 3875, name = "Plans: Golden Scale Boots", chance = 0.02, quality = 3 }, { itemID = 3914, name = "Journeyman's Backpack", chance = 0.1, quality = 1 }, { itemID = 3928, name = "Superior Healing Potion", chance = 1.32, quality = 1 }, { itemID = 4300, name = "Pattern: Guardian Bracers", chance = 0.02, quality = 2 }, { itemID = 4306, name = "Silk Cloth", chance = 11.4544, quality = 1 }, { itemID = 4338, name = "Mageweave Cloth", chance = 13.5589, quality = 1 }, { itemID = 4416, name = "Schematic: Goblin Land Mine", chance = 0.02, quality = 2 }, { itemID = 4417, name = "Schematic: Large Seaforium Charge", chance = 0.02, quality = 2 }, { itemID = 4419, name = "Scroll of Intellect III", chance = 0.16, quality = 1 }, { itemID = 4421, name = "Scroll of Protection III", chance = 0.32, quality = 1 }, { itemID = 4422, name = "Scroll of Stamina III", chance = 0.24, quality = 1 }, { itemID = 4424, name = "Scroll of Spirit III", chance = 0.48, quality = 1 }, { itemID = 4599, name = "Cured Ham Steak", chance = 3.6228, quality = 1 }, { itemID = 4637, name = "Steel Lockbox", chance = 0.0266, quality = 2 }, { itemID = 4638, name = "Reinforced Steel Lockbox", chance = 0.2131, quality = 2 }, { itemID = 5616, name = "Gutwrencher", chance = 0.02, quality = 3 }, { itemID = 5974, name = "Pattern: Guardian Cloak", chance = 0.02, quality = 2 }, { itemID = 6149, name = "Greater Mana Potion", chance = 1.08, quality = 1 }, { itemID = 7086, name = "Pattern: Earthen Silk Belt", chance = 0.02, quality = 2 }, { itemID = 7909, name = "Aquamarine", chance = 0.2131, quality = 2 }, { itemID = 7910, name = "Star Ruby", chance = 0.1332, quality = 2 }, { itemID = 7989, name = "Plans: Mithril Spurs", chance = 0.06, quality = 2 }, { itemID = 7990, name = "Plans: Heavy Mithril Helm", chance = 0.02, quality = 2 }, { itemID = 7992, name = "Plans: Blue Glittering Axe", chance = 0.02, quality = 2 }, { itemID = 7993, name = "Plans: Dazzling Mithril Rapier", chance = 0.02, quality = 2 }, { itemID = 8151, name = "Flask of Mojo", chance = 7.6185, quality = 1 }, { itemID = 8385, name = "Pattern: Turtle Scale Gloves", chance = 0.02, quality = 1 }, { itemID = 8386, name = "Pattern: Big Voodoo Robe", chance = 0.02, quality = 2 }, { itemID = 8387, name = "Pattern: Big Voodoo Mask", chance = 0.02, quality = 2 }, { itemID = 8389, name = "Pattern: Big Voodoo Pants", chance = 0.02, quality = 2 }, { itemID = 8390, name = "Pattern: Big Voodoo Cloak", chance = 0.04, quality = 2 }, { itemID = 8623, name = "OOX-17/TN Distress Beacon", chance = 0.6, quality = 2 }, { itemID = 9242, name = "Ancient Tablet", chance = 1.6249, quality = 0 }, { itemID = 9243, name = "Shriveled Heart", chance = 0.5594, quality = 2 }, { itemID = 9293, name = "Recipe: Magic Resistance Potion", chance = 0.02, quality = 2 }, { itemID = 9295, name = "Recipe: Invisibility Potion", chance = 0.02, quality = 2 }, { itemID = 9298, name = "Recipe: Elixir of Giants", chance = 0.02, quality = 2 }, { itemID = 9480, name = "Eyegouger", chance = 0.02, quality = 3 }, { itemID = 9481, name = "The Minotaur", chance = 0.02, quality = 3 }, { itemID = 9482, name = "Witch Doctor's Cane", chance = 0.02, quality = 3 }, { itemID = 9483, name = "Flaming Incinerator", chance = 0.02, quality = 3 }, { itemID = 9484, name = "Spellshock Leggings", chance = 0.01, quality = 3 }, { itemID = 9511, name = "Bloodletter Scalpel", chance = 0.02, quality = 3 }, { itemID = 9512, name = "Blackmetal Cape", chance = 0.02, quality = 3 }, { itemID = 9523, name = "Troll Temper", quality = 1 }, { itemID = 10300, name = "Pattern: Red Mageweave Vest", chance = 0.02, quality = 2 }, { itemID = 10302, name = "Pattern: Red Mageweave Pants", chance = 0.02, quality = 2 }, { itemID = 10312, name = "Pattern: Red Mageweave Gloves", chance = 0.02, quality = 2 }, { itemID = 10315, name = "Pattern: Red Mageweave Shoulders", chance = 0.02, quality = 2 }, { itemID = 10603, name = "Schematic: Catseye Ultra Goggles", chance = 0.02, quality = 2 }, { itemID = 10604, name = "Schematic: Mithril Heavy-bore Rifle", chance = 0.06, quality = 2 }, { itemID = 10606, name = "Schematic: Parachute Cloak", chance = 0.02, quality = 2 }, { itemID = 10660, name = "First Mosh'aru Tablet", quality = 1 }, { itemID = 11224, name = "Formula: Enchant Shield - Frost Resistance", chance = 0.02, quality = 2 }, { itemID = 12683, name = "Plans: Thorium Belt", chance = 0.02, quality = 2 }, { itemID = 12684, name = "Plans: Thorium Bracers", chance = 0.02, quality = 2 }, { itemID = 12691, name = "Plans: Wildthorn Mail", chance = 0.02, quality = 2 }, { itemID = 866, name = "Monk's Staff", chance = 0.01124, quality = 2 }, { itemID = 1640, name = "Monstrous War Axe", chance = 0.01124, quality = 2 }, { itemID = 4045, name = "Mistscape Bracers", chance = 0.01124, quality = 2 }, { itemID = 4047, name = "Mistscape Boots", chance = 0.01124, quality = 2 }, { itemID = 4061, name = "Imperial Leather Bracers", chance = 0.01124, quality = 2 }, { itemID = 4063, name = "Imperial Leather Gloves", chance = 0.01124, quality = 2 }, { itemID = 4734, name = "Mistscape Mantle", chance = 0.01124, quality = 2 }, { itemID = 4736, name = "Mistscape Sash", chance = 0.01124, quality = 2 }, { itemID = 4738, name = "Imperial Leather Belt", chance = 0.01124, quality = 2 }, { itemID = 6424, name = "Blackforge Cape", chance = 0.01124, quality = 2 }, { itemID = 6426, name = "Blackforge Bracers", chance = 0.01124, quality = 2 }, { itemID = 6428, name = "Mistscape Gloves", chance = 0.01124, quality = 2 }, { itemID = 6431, name = "Imperial Leather Boots", chance = 0.01124, quality = 2 }, { itemID = 6433, name = "Imperial Leather Helm", chance = 0.01124, quality = 2 }, { itemID = 7470, name = "Regal Wizard Hat", chance = 0.01124, quality = 2 }, { itemID = 7471, name = "Regal Gloves", chance = 0.01124, quality = 2 }, { itemID = 7473, name = "Regal Mantle", chance = 0.01124, quality = 2 }, { itemID = 7478, name = "Ranger Leggings", chance = 0.01124, quality = 2 }, { itemID = 7479, name = "Ranger Helm", chance = 0.01124, quality = 2 }, { itemID = 7481, name = "Ranger Boots", chance = 0.01124, quality = 2 }, { itemID = 7482, name = "Ranger Shoulders", chance = 0.01124, quality = 2 }, { itemID = 7487, name = "Captain's Leggings", chance = 0.01124, quality = 2 }, { itemID = 7488, name = "Captain's Circlet", chance = 0.01124, quality = 2 }, { itemID = 7490, name = "Captain's Boots", chance = 0.01124, quality = 2 }, { itemID = 7491, name = "Captain's Shoulderguards", chance = 0.01124, quality = 2 }, { itemID = 7496, name = "Field Plate Shield", chance = 0.01124, quality = 2 }, { itemID = 8194, name = "Goblin Nutcracker", chance = 0.01124, quality = 2 }, { itemID = 8196, name = "Ebon Scimitar", chance = 0.01124, quality = 2 }, { itemID = 9874, name = "Sorcerer Drape", chance = 0.01124, quality = 2 }, { itemID = 9882, name = "Sorcerer Sphere", chance = 0.01124, quality = 2 }, { itemID = 9883, name = "Sorcerer Pants", chance = 0.01124, quality = 2 }, { itemID = 9884, name = "Sorcerer Robe", chance = 0.01124, quality = 2 }, { itemID = 9887, name = "Huntsman's Armor", chance = 0.01124, quality = 2 }, { itemID = 9893, name = "Huntsman's Leggings", chance = 0.01124, quality = 2 }, { itemID = 9897, name = "Jazeraint Chestguard", chance = 0.01124, quality = 2 }, { itemID = 9899, name = "Jazeraint Shield", chance = 0.01124, quality = 2 }, { itemID = 9903, name = "Jazeraint Leggings", chance = 0.01124, quality = 2 }, { itemID = 9908, name = "Royal Cape", chance = 0.01124, quality = 2 }, { itemID = 9909, name = "Royal Bands", chance = 0.01124, quality = 2 }, { itemID = 9919, name = "Tracker's Cloak", chance = 0.01124, quality = 2 }, { itemID = 9926, name = "Brigade Boots", chance = 0.01124, quality = 2 }, { itemID = 9927, name = "Brigade Bracers", chance = 0.01124, quality = 2 }, { itemID = 9930, name = "Brigade Gauntlets", chance = 0.01124, quality = 2 }, { itemID = 9931, name = "Brigade Girdle", chance = 0.01124, quality = 2 }, { itemID = 11973, name = "Hematite Link", chance = 0.01124, quality = 2 }, { itemID = 11987, name = "Iridium Circle", chance = 0.01124, quality = 2 }, { itemID = 11998, name = "Jet Loop", chance = 0.01124, quality = 2 }, { itemID = 12042, name = "Marsh Chain", chance = 0.01124, quality = 2 }, { itemID = 14230, name = "Embersilk Tunic", chance = 0.01124, quality = 2 }, { itemID = 14234, name = "Embersilk Robes", chance = 0.01124, quality = 2 }, { itemID = 14242, name = "Darkmist Pants", chance = 0.01124, quality = 2 }, { itemID = 14243, name = "Darkmist Mantle", chance = 0.01124, quality = 2 }, { itemID = 14250, name = "Lunar Slippers", chance = 0.01124, quality = 2 }, { itemID = 14253, name = "Lunar Handwraps", chance = 0.01124, quality = 2 }, { itemID = 14261, name = "Bloodwoven Cloak", chance = 0.01124, quality = 2 }, { itemID = 14421, name = "Silksand Circlet", chance = 0.01124, quality = 2 }, { itemID = 14424, name = "Silksand Legwraps", chance = 0.01124, quality = 2 }, { itemID = 14429, name = "Windchaser Cuffs", chance = 0.01124, quality = 2 }, { itemID = 14430, name = "Windchaser Cloak", chance = 0.01124, quality = 2 }, { itemID = 14435, name = "Windchaser Cinch", chance = 0.01124, quality = 2 }, { itemID = 14599, name = "Warden's Footpads", chance = 0.01124, quality = 2 }, { itemID = 14605, name = "Warden's Woolies", chance = 0.01124, quality = 2 }, { itemID = 14769, name = "Ravager's Sandals", chance = 0.01124, quality = 2 }, { itemID = 14774, name = "Ravager's Crown", chance = 0.01124, quality = 2 }, { itemID = 14775, name = "Ravager's Woolies", chance = 0.01124, quality = 2 }, { itemID = 14776, name = "Ravager's Mantle", chance = 0.01124, quality = 2 }, { itemID = 14825, name = "Symbolic Crest", chance = 0.01124, quality = 2 }, { itemID = 15156, name = "Nocturnal Cap", chance = 0.01124, quality = 2 }, { itemID = 15159, name = "Nocturnal Tunic", chance = 0.01124, quality = 2 }, { itemID = 15161, name = "Imposing Belt", chance = 0.01124, quality = 2 }, { itemID = 15163, name = "Imposing Bracers", chance = 0.01124, quality = 2 }, { itemID = 15165, name = "Imposing Cape", chance = 0.01124, quality = 2 }, { itemID = 15244, name = "Razor Blade", chance = 0.01124, quality = 2 }, { itemID = 15251, name = "Headstriker Sword", chance = 0.01124, quality = 2 }, { itemID = 15363, name = "Trickster's Headdress", chance = 0.01124, quality = 2 }, { itemID = 15369, name = "Wolf Rider's Belt", chance = 0.01124, quality = 2 }, { itemID = 15372, name = "Wolf Rider's Gloves", chance = 0.01124, quality = 2 }, { itemID = 15375, name = "Wolf Rider's Shoulder Pads", chance = 0.01124, quality = 2 }, { itemID = 15377, name = "Wolf Rider's Wristbands", chance = 0.01124, quality = 2 }, { itemID = 15591, name = "Steadfast Breastplate", chance = 0.01124, quality = 2 }, { itemID = 15592, name = "Steadfast Buckler", chance = 0.01124, quality = 2 }, { itemID = 15593, name = "Steadfast Coronet", chance = 0.01124, quality = 2 }, { itemID = 15597, name = "Steadfast Shoulders", chance = 0.01124, quality = 2 }, { itemID = 15600, name = "Ancient Vambraces", chance = 0.01124, quality = 2 }, { itemID = 15605, name = "Ancient Gauntlets", chance = 0.01124, quality = 2 }, { itemID = 15610, name = "Bonelink Bracers", chance = 0.01124, quality = 2 }, { itemID = 15611, name = "Bonelink Cape", chance = 0.01124, quality = 2 }, { itemID = 15613, name = "Bonelink Belt", chance = 0.01124, quality = 2 }, { itemID = 15979, name = "Embersilk Stave", chance = 0.01124, quality = 2 }, { itemID = 1613, name = "Spiritchaser Staff", chance = 0.00641, quality = 2 }, { itemID = 3187, name = "Sacrificial Kris", chance = 0.00641, quality = 2 }, { itemID = 3430, name = "Sniper Rifle", chance = 0.00641, quality = 2 }, { itemID = 4046, name = "Mistscape Pants", chance = 0.00641, quality = 2 }, { itemID = 4062, name = "Imperial Leather Pants", chance = 0.00641, quality = 2 }, { itemID = 4080, name = "Blackforge Cowl", chance = 0.00641, quality = 2 }, { itemID = 4083, name = "Blackforge Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 4737, name = "Imperial Leather Spaulders", chance = 0.00641, quality = 2 }, { itemID = 5216, name = "Umbral Wand", chance = 0.00641, quality = 2 }, { itemID = 6423, name = "Blackforge Greaves", chance = 0.00641, quality = 2 }, { itemID = 6425, name = "Blackforge Girdle", chance = 0.00641, quality = 2 }, { itemID = 6429, name = "Mistscape Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 7332, name = "Regal Armor", chance = 0.00641, quality = 2 }, { itemID = 7468, name = "Regal Robe", chance = 0.00641, quality = 2 }, { itemID = 7469, name = "Regal Leggings", chance = 0.00641, quality = 2 }, { itemID = 7477, name = "Ranger Tunic", chance = 0.00641, quality = 2 }, { itemID = 7486, name = "Captain's Breastplate", chance = 0.00641, quality = 2 }, { itemID = 7495, name = "Captain's Buckler", chance = 0.00641, quality = 2 }, { itemID = 7522, name = "Gossamer Boots", chance = 0.00641, quality = 2 }, { itemID = 7524, name = "Gossamer Cape", chance = 0.00641, quality = 2 }, { itemID = 7525, name = "Gossamer Bracers", chance = 0.00641, quality = 2 }, { itemID = 7533, name = "Cabalist Cloak", chance = 0.00641, quality = 2 }, { itemID = 7534, name = "Cabalist Bracers", chance = 0.00641, quality = 2 }, { itemID = 7544, name = "Champion's Cape", chance = 0.00641, quality = 2 }, { itemID = 7545, name = "Champion's Bracers", chance = 0.00641, quality = 2 }, { itemID = 7552, name = "Falcon's Hook", chance = 0.00641, quality = 2 }, { itemID = 7555, name = "Regal Star", chance = 0.00641, quality = 2 }, { itemID = 8120, name = "Heraldic Cloak", chance = 0.00641, quality = 2 }, { itemID = 8137, name = "Chromite Bracers", chance = 0.00641, quality = 2 }, { itemID = 8139, name = "Chromite Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 8140, name = "Chromite Girdle", chance = 0.00641, quality = 2 }, { itemID = 8141, name = "Chromite Greaves", chance = 0.00641, quality = 2 }, { itemID = 8142, name = "Chromite Barbute", chance = 0.00641, quality = 2 }, { itemID = 8144, name = "Chromite Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 8156, name = "Jouster's Wristguards", chance = 0.00641, quality = 2 }, { itemID = 8157, name = "Jouster's Chestplate", chance = 0.00641, quality = 2 }, { itemID = 8158, name = "Jouster's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 8159, name = "Jouster's Girdle", chance = 0.00641, quality = 2 }, { itemID = 8160, name = "Jouster's Greaves", chance = 0.00641, quality = 2 }, { itemID = 8161, name = "Jouster's Visor", chance = 0.00641, quality = 2 }, { itemID = 8162, name = "Jouster's Legplates", chance = 0.00641, quality = 2 }, { itemID = 8163, name = "Jouster's Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9285, name = "Field Plate Vambraces", chance = 0.00641, quality = 2 }, { itemID = 9286, name = "Field Plate Armor", chance = 0.00641, quality = 2 }, { itemID = 9287, name = "Field Plate Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 9288, name = "Field Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 9289, name = "Field Plate Boots", chance = 0.00641, quality = 2 }, { itemID = 9290, name = "Field Plate Helmet", chance = 0.00641, quality = 2 }, { itemID = 9291, name = "Field Plate Leggings", chance = 0.00641, quality = 2 }, { itemID = 9292, name = "Field Plate Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9906, name = "Royal Sash", chance = 0.00641, quality = 2 }, { itemID = 9907, name = "Royal Boots", chance = 0.00641, quality = 2 }, { itemID = 9910, name = "Royal Gloves", chance = 0.00641, quality = 2 }, { itemID = 9912, name = "Royal Amice", chance = 0.00641, quality = 2 }, { itemID = 9915, name = "Royal Headband", chance = 0.00641, quality = 2 }, { itemID = 9916, name = "Tracker's Belt", chance = 0.00641, quality = 2 }, { itemID = 9917, name = "Tracker's Boots", chance = 0.00641, quality = 2 }, { itemID = 9918, name = "Brigade Defender", chance = 0.00641, quality = 2 }, { itemID = 9920, name = "Tracker's Gloves", chance = 0.00641, quality = 2 }, { itemID = 9921, name = "Tracker's Headband", chance = 0.00641, quality = 2 }, { itemID = 9923, name = "Tracker's Shoulderpads", chance = 0.00641, quality = 2 }, { itemID = 9925, name = "Tracker's Wristguards", chance = 0.00641, quality = 2 }, { itemID = 9928, name = "Brigade Breastplate", chance = 0.00641, quality = 2 }, { itemID = 9932, name = "Brigade Circlet", chance = 0.00641, quality = 2 }, { itemID = 9933, name = "Brigade Leggings", chance = 0.00641, quality = 2 }, { itemID = 9934, name = "Brigade Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9935, name = "Embossed Plate Shield", chance = 0.00641, quality = 2 }, { itemID = 9959, name = "Warmonger's Cloak", chance = 0.00641, quality = 2 }, { itemID = 9966, name = "Embossed Plate Armor", chance = 0.00641, quality = 2 }, { itemID = 9967, name = "Embossed Plate Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 9968, name = "Embossed Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 9969, name = "Embossed Plate Helmet", chance = 0.00641, quality = 2 }, { itemID = 9970, name = "Embossed Plate Leggings", chance = 0.00641, quality = 2 }, { itemID = 9971, name = "Embossed Plate Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9972, name = "Embossed Plate Bracers", chance = 0.00641, quality = 2 }, { itemID = 9973, name = "Embossed Plate Boots", chance = 0.00641, quality = 2 }, { itemID = 10088, name = "Gothic Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 10089, name = "Gothic Sabatons", chance = 0.00641, quality = 2 }, { itemID = 10094, name = "Gothic Plate Vambraces", chance = 0.00641, quality = 2 }, { itemID = 12012, name = "Marsh Ring", chance = 0.00641, quality = 2 }, { itemID = 12023, name = "Tellurium Necklace", chance = 0.00641, quality = 2 }, { itemID = 12031, name = "Lodestone Necklace", chance = 0.00641, quality = 2 }, { itemID = 14246, name = "Darkmist Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 14247, name = "Lunar Mantle", chance = 0.00641, quality = 2 }, { itemID = 14252, name = "Lunar Coronet", chance = 0.00641, quality = 2 }, { itemID = 14257, name = "Lunar Leggings", chance = 0.00641, quality = 2 }, { itemID = 14258, name = "Bloodwoven Cord", chance = 0.00641, quality = 2 }, { itemID = 14260, name = "Bloodwoven Bracers", chance = 0.00641, quality = 2 }, { itemID = 14262, name = "Bloodwoven Mitts", chance = 0.00641, quality = 2 }, { itemID = 14270, name = "Gaea's Cloak", chance = 0.00641, quality = 2 }, { itemID = 14417, name = "Silksand Tunic", chance = 0.00641, quality = 2 }, { itemID = 14425, name = "Silksand Wraps", chance = 0.00641, quality = 2 }, { itemID = 14428, name = "Windchaser Footpads", chance = 0.00641, quality = 2 }, { itemID = 14431, name = "Windchaser Handguards", chance = 0.00641, quality = 2 }, { itemID = 14432, name = "Windchaser Amice", chance = 0.00641, quality = 2 }, { itemID = 14601, name = "Warden's Wraps", chance = 0.00641, quality = 2 }, { itemID = 14604, name = "Warden's Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 14652, name = "Scorpashi Sash", chance = 0.00641, quality = 2 }, { itemID = 14654, name = "Scorpashi Wristbands", chance = 0.00641, quality = 2 }, { itemID = 14656, name = "Scorpashi Cape", chance = 0.00641, quality = 2 }, { itemID = 14768, name = "Ravager's Armor", chance = 0.00641, quality = 2 }, { itemID = 14777, name = "Ravager's Shield", chance = 0.00641, quality = 2 }, { itemID = 14778, name = "Khan's Bindings", chance = 0.00641, quality = 2 }, { itemID = 14781, name = "Khan's Cloak", chance = 0.00641, quality = 2 }, { itemID = 14782, name = "Khan's Gloves", chance = 0.00641, quality = 2 }, { itemID = 14821, name = "Symbolic Breastplate", chance = 0.00641, quality = 2 }, { itemID = 14826, name = "Symbolic Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14827, name = "Symbolic Belt", chance = 0.00641, quality = 2 }, { itemID = 14828, name = "Symbolic Greaves", chance = 0.00641, quality = 2 }, { itemID = 14829, name = "Symbolic Legplates", chance = 0.00641, quality = 2 }, { itemID = 14830, name = "Symbolic Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 14831, name = "Symbolic Crown", chance = 0.00641, quality = 2 }, { itemID = 14832, name = "Symbolic Vambraces", chance = 0.00641, quality = 2 }, { itemID = 14833, name = "Tyrant's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14834, name = "Tyrant's Armguards", chance = 0.00641, quality = 2 }, { itemID = 14838, name = "Tyrant's Belt", chance = 0.00641, quality = 2 }, { itemID = 14839, name = "Tyrant's Greaves", chance = 0.00641, quality = 2 }, { itemID = 14841, name = "Tyrant's Epaulets", chance = 0.00641, quality = 2 }, { itemID = 14895, name = "Saltstone Surcoat", chance = 0.00641, quality = 2 }, { itemID = 14896, name = "Saltstone Sabatons", chance = 0.00641, quality = 2 }, { itemID = 14897, name = "Saltstone Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14898, name = "Saltstone Girdle", chance = 0.00641, quality = 2 }, { itemID = 14899, name = "Saltstone Helm", chance = 0.00641, quality = 2 }, { itemID = 14900, name = "Saltstone Legplates", chance = 0.00641, quality = 2 }, { itemID = 14901, name = "Saltstone Shoulder Pads", chance = 0.00641, quality = 2 }, { itemID = 14903, name = "Saltstone Armsplints", chance = 0.00641, quality = 2 }, { itemID = 14905, name = "Brutish Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14906, name = "Brutish Belt", chance = 0.00641, quality = 2 }, { itemID = 14909, name = "Brutish Shoulders", chance = 0.00641, quality = 2 }, { itemID = 14910, name = "Brutish Armguards", chance = 0.00641, quality = 2 }, { itemID = 14940, name = "Warbringer's Sabatons", chance = 0.00641, quality = 2 }, { itemID = 14941, name = "Warbringer's Armsplints", chance = 0.00641, quality = 2 }, { itemID = 14942, name = "Warbringer's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14943, name = "Warbringer's Belt", chance = 0.00641, quality = 2 }, { itemID = 14944, name = "Warbringer's Crown", chance = 0.00641, quality = 2 }, { itemID = 14945, name = "Warbringer's Legguards", chance = 0.00641, quality = 2 }, { itemID = 14946, name = "Warbringer's Spaulders", chance = 0.00641, quality = 2 }, { itemID = 14956, name = "Bloodforged Bindings", chance = 0.00641, quality = 2 }, { itemID = 15162, name = "Imposing Boots", chance = 0.00641, quality = 2 }, { itemID = 15166, name = "Imposing Gloves", chance = 0.00641, quality = 2 }, { itemID = 15168, name = "Imposing Pants", chance = 0.00641, quality = 2 }, { itemID = 15169, name = "Imposing Shoulders", chance = 0.00641, quality = 2 }, { itemID = 15215, name = "Furious Falchion", chance = 0.00641, quality = 2 }, { itemID = 15287, name = "Crusader Bow", chance = 0.00641, quality = 2 }, { itemID = 15370, name = "Wolf Rider's Boots", chance = 0.00641, quality = 2 }, { itemID = 15374, name = "Wolf Rider's Leggings", chance = 0.00641, quality = 2 }, { itemID = 15382, name = "Rageclaw Cloak", chance = 0.00641, quality = 2 }, { itemID = 15599, name = "Ancient Greaves", chance = 0.00641, quality = 2 }, { itemID = 15602, name = "Ancient Crown", chance = 0.00641, quality = 2 }, { itemID = 15607, name = "Ancient Legguards", chance = 0.00641, quality = 2 }, { itemID = 15608, name = "Ancient Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 15612, name = "Bonelink Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 15614, name = "Bonelink Sabatons", chance = 0.00641, quality = 2 }, { itemID = 15617, name = "Bonelink Epaulets", chance = 0.00641, quality = 2 }, { itemID = 15624, name = "Gryphon Cloak", chance = 0.00641, quality = 2 }, { itemID = 15964, name = "Silksand Star", chance = 0.00641, quality = 2 }, { itemID = 1713, name = "Ankh of Life", chance = 0.002273, quality = 3 }, { itemID = 1715, name = "Polished Jazeraint Armor", chance = 0.002273, quality = 3 }, { itemID = 2815, name = "Curve-bladed Ripper", chance = 0.002273, quality = 3 }, { itemID = 13026, name = "Heaven's Light", chance = 0.002273, quality = 3 }, { itemID = 13051, name = "Witchfury", chance = 0.002273, quality = 3 }, { itemID = 13058, name = "Khoo's Point", chance = 0.002273, quality = 3 }, { itemID = 13071, name = "Plated Fist of Hakoo", chance = 0.002273, quality = 3 }, { itemID = 13095, name = "Assault Band", chance = 0.002273, quality = 3 }, { itemID = 13100, name = "Furen's Boots", chance = 0.002273, quality = 3 }, { itemID = 13115, name = "Sheepshear Mantle", chance = 0.002273, quality = 3 }, { itemID = 13145, name = "Enormous Ogre Belt", chance = 0.002273, quality = 3 }, { itemID = 7517, name = "Gossamer Tunic", chance = 0.008772, quality = 2 }, { itemID = 7518, name = "Gossamer Robe", chance = 0.008772, quality = 2 }, { itemID = 7527, name = "Cabalist Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 7557, name = "Gossamer Rod", chance = 0.008772, quality = 2 }, { itemID = 8106, name = "Hibernal Armor", chance = 0.008772, quality = 2 }, { itemID = 8113, name = "Hibernal Robe", chance = 0.008772, quality = 2 }, { itemID = 8119, name = "Heraldic Breastplate", chance = 0.008772, quality = 2 }, { itemID = 8126, name = "Myrmidon's Breastplate", chance = 0.008772, quality = 2 }, { itemID = 8131, name = "Myrmidon's Helm", chance = 0.008772, quality = 2 }, { itemID = 8132, name = "Myrmidon's Leggings", chance = 0.008772, quality = 2 }, { itemID = 8133, name = "Myrmidon's Pauldrons", chance = 0.008772, quality = 2 }, { itemID = 8134, name = "Myrmidon's Defender", chance = 0.008772, quality = 2 }, { itemID = 8247, name = "Imperial Red Bracers", chance = 0.008772, quality = 2 }, { itemID = 8248, name = "Imperial Red Cloak", chance = 0.008772, quality = 2 }, { itemID = 8253, name = "Imperial Red Sash", chance = 0.008772, quality = 2 }, { itemID = 8255, name = "Serpentskin Girdle", chance = 0.008772, quality = 2 }, { itemID = 8257, name = "Serpentskin Bracers", chance = 0.008772, quality = 2 }, { itemID = 8259, name = "Serpentskin Cloak", chance = 0.008772, quality = 2 }, { itemID = 8266, name = "Ebonhold Cloak", chance = 0.008772, quality = 2 }, { itemID = 8274, name = "Valorous Chestguard", chance = 0.008772, quality = 2 }, { itemID = 8282, name = "Valorous Shield", chance = 0.008772, quality = 2 }, { itemID = 9940, name = "Abjurer's Hood", chance = 0.008772, quality = 2 }, { itemID = 9942, name = "Abjurer's Pants", chance = 0.008772, quality = 2 }, { itemID = 9953, name = "Chieftain's Headdress", chance = 0.008772, quality = 2 }, { itemID = 9954, name = "Chieftain's Leggings", chance = 0.008772, quality = 2 }, { itemID = 9955, name = "Chieftain's Shoulders", chance = 0.008772, quality = 2 }, { itemID = 9957, name = "Warmonger's Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 9958, name = "Warmonger's Buckler", chance = 0.008772, quality = 2 }, { itemID = 10058, name = "Duskwoven Sandals", chance = 0.008772, quality = 2 }, { itemID = 10059, name = "Duskwoven Bracers", chance = 0.008772, quality = 2 }, { itemID = 10061, name = "Duskwoven Turban", chance = 0.008772, quality = 2 }, { itemID = 10062, name = "Duskwoven Gloves", chance = 0.008772, quality = 2 }, { itemID = 10063, name = "Duskwoven Amice", chance = 0.008772, quality = 2 }, { itemID = 10068, name = "Righteous Boots", chance = 0.008772, quality = 2 }, { itemID = 10072, name = "Righteous Gloves", chance = 0.008772, quality = 2 }, { itemID = 10075, name = "Righteous Spaulders", chance = 0.008772, quality = 2 }, { itemID = 10080, name = "Lord's Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 10081, name = "Lord's Girdle", chance = 0.008772, quality = 2 }, { itemID = 10082, name = "Lord's Boots", chance = 0.008772, quality = 2 }, { itemID = 10083, name = "Lord's Crown", chance = 0.008772, quality = 2 }, { itemID = 10129, name = "Revenant Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 10130, name = "Revenant Girdle", chance = 0.008772, quality = 2 }, { itemID = 10131, name = "Revenant Boots", chance = 0.008772, quality = 2 }, { itemID = 10132, name = "Revenant Helmet", chance = 0.008772, quality = 2 }, { itemID = 10134, name = "Revenant Shoulders", chance = 0.008772, quality = 2 }, { itemID = 10185, name = "Swashbuckler's Cape", chance = 0.008772, quality = 2 }, { itemID = 10191, name = "Crusader's Armguards", chance = 0.008772, quality = 2 }, { itemID = 10194, name = "Crusader's Cloak", chance = 0.008772, quality = 2 }, { itemID = 10208, name = "Overlord's Legplates", chance = 0.008772, quality = 2 }, { itemID = 10209, name = "Overlord's Spaulders", chance = 0.008772, quality = 2 }, { itemID = 10239, name = "Heavy Lamellar Vambraces", chance = 0.008772, quality = 2 }, { itemID = 10243, name = "Heavy Lamellar Girdle", chance = 0.008772, quality = 2 }, { itemID = 11989, name = "Vanadium Loop", chance = 0.008772, quality = 2 }, { itemID = 12001, name = "Onyx Ring", chance = 0.008772, quality = 2 }, { itemID = 12024, name = "Vanadium Talisman", chance = 0.008772, quality = 2 }, { itemID = 12044, name = "Arctic Pendant", chance = 0.008772, quality = 2 }, { itemID = 14265, name = "Bloodwoven Wraps", chance = 0.008772, quality = 2 }, { itemID = 14267, name = "Bloodwoven Jerkin", chance = 0.008772, quality = 2 }, { itemID = 14274, name = "Gaea's Leggings", chance = 0.008772, quality = 2 }, { itemID = 14278, name = "Opulent Mantle", chance = 0.008772, quality = 2 }, { itemID = 14282, name = "Opulent Gloves", chance = 0.008772, quality = 2 }, { itemID = 14285, name = "Opulent Boots", chance = 0.008772, quality = 2 }, { itemID = 14286, name = "Opulent Belt", chance = 0.008772, quality = 2 }, { itemID = 14289, name = "Arachnidian Girdle", chance = 0.008772, quality = 2 }, { itemID = 14290, name = "Arachnidian Footpads", chance = 0.008772, quality = 2 }, { itemID = 14291, name = "Arachnidian Bracelets", chance = 0.008772, quality = 2 }, { itemID = 14294, name = "Arachnidian Gloves", chance = 0.008772, quality = 2 }, { itemID = 14441, name = "Venomshroud Mask", chance = 0.008772, quality = 2 }, { itemID = 14450, name = "Highborne Cloak", chance = 0.008772, quality = 2 }, { itemID = 14662, name = "Keeper's Hooves", chance = 0.008772, quality = 2 }, { itemID = 14666, name = "Keeper's Gloves", chance = 0.008772, quality = 2 }, { itemID = 14669, name = "Keeper's Mantle", chance = 0.008772, quality = 2 }, { itemID = 14792, name = "Protector Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 14793, name = "Protector Waistband", chance = 0.008772, quality = 2 }, { itemID = 14794, name = "Protector Ankleguards", chance = 0.008772, quality = 2 }, { itemID = 14797, name = "Protector Pads", chance = 0.008772, quality = 2 }, { itemID = 14846, name = "Sunscale Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 14848, name = "Sunscale Sabatons", chance = 0.008772, quality = 2 }, { itemID = 14851, name = "Sunscale Spaulders", chance = 0.008772, quality = 2 }, { itemID = 14904, name = "Brutish Breastplate", chance = 0.008772, quality = 2 }, { itemID = 14912, name = "Brutish Shield", chance = 0.008772, quality = 2 }, { itemID = 14920, name = "Jade Legplates", chance = 0.008772, quality = 2 }, { itemID = 14923, name = "Lofty Armguards", chance = 0.008772, quality = 2 }, { itemID = 14948, name = "Bloodforged Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 14952, name = "Bloodforged Helmet", chance = 0.008772, quality = 2 }, { itemID = 14954, name = "Bloodforged Shield", chance = 0.008772, quality = 2 }, { itemID = 14957, name = "High Chief's Sabatons", chance = 0.008772, quality = 2 }, { itemID = 14960, name = "High Chief's Belt", chance = 0.008772, quality = 2 }, { itemID = 15171, name = "Potent Boots", chance = 0.008772, quality = 2 }, { itemID = 15174, name = "Potent Gloves", chance = 0.008772, quality = 2 }, { itemID = 15175, name = "Potent Helmet", chance = 0.008772, quality = 2 }, { itemID = 15176, name = "Potent Pants", chance = 0.008772, quality = 2 }, { itemID = 15182, name = "Praetorian Wristbands", chance = 0.008772, quality = 2 }, { itemID = 15183, name = "Praetorian Cloak", chance = 0.008772, quality = 2 }, { itemID = 15216, name = "Rune Sword", chance = 0.008772, quality = 2 }, { itemID = 15245, name = "Vorpal Dagger", chance = 0.008772, quality = 2 }, { itemID = 15263, name = "Royal Mallet", chance = 0.008772, quality = 2 }, { itemID = 15279, name = "Ivory Wand", chance = 0.008772, quality = 2 }, { itemID = 15291, name = "Harpy Needler", chance = 0.008772, quality = 2 }, { itemID = 15323, name = "Percussion Shotgun", chance = 0.008772, quality = 2 }, { itemID = 15381, name = "Rageclaw Chestguard", chance = 0.008772, quality = 2 }, { itemID = 15384, name = "Rageclaw Helm", chance = 0.008772, quality = 2 }, { itemID = 15387, name = "Jadefire Bracelets", chance = 0.008772, quality = 2 }, { itemID = 15621, name = "Gryphon Mail Buckler", chance = 0.008772, quality = 2 }, { itemID = 15622, name = "Gryphon Mail Breastplate", chance = 0.008772, quality = 2 }, { itemID = 15623, name = "Gryphon Mail Crown", chance = 0.008772, quality = 2 }, { itemID = 15627, name = "Gryphon Mail Legguards", chance = 0.008772, quality = 2 }, { itemID = 15637, name = "Formidable Legguards", chance = 0.008772, quality = 2 }, { itemID = 15639, name = "Ironhide Bracers", chance = 0.008772, quality = 2 }, { itemID = 15641, name = "Ironhide Belt", chance = 0.008772, quality = 2 }, { itemID = 15649, name = "Merciless Bracers", chance = 0.008772, quality = 2 }, { itemID = 15652, name = "Merciless Cloak", chance = 0.008772, quality = 2 }, { itemID = 15937, name = "Hibernal Sphere", chance = 0.008772, quality = 2 }, { itemID = 15982, name = "Bloodwoven Rod", chance = 0.008772, quality = 2 }, { itemID = 3936, name = "Crochet Belt", chance = 0.125, quality = 0 }, { itemID = 3937, name = "Crochet Boots", chance = 0.125, quality = 0 }, { itemID = 3938, name = "Crochet Bracers", chance = 0.125, quality = 0 }, { itemID = 3939, name = "Crochet Cloak", chance = 0.125, quality = 0 }, { itemID = 3940, name = "Crochet Gloves", chance = 0.125, quality = 0 }, { itemID = 3941, name = "Crochet Pants", chance = 0.125, quality = 0 }, { itemID = 3942, name = "Crochet Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3943, name = "Crochet Vest", chance = 0.125, quality = 0 }, { itemID = 3961, name = "Thick Leather Belt", chance = 0.125, quality = 0 }, { itemID = 3962, name = "Thick Leather Boots", chance = 0.125, quality = 0 }, { itemID = 3963, name = "Thick Leather Bracers", chance = 0.125, quality = 0 }, { itemID = 3964, name = "Thick Cloak", chance = 0.125, quality = 0 }, { itemID = 3965, name = "Thick Leather Gloves", chance = 0.125, quality = 0 }, { itemID = 3966, name = "Thick Leather Pants", chance = 0.125, quality = 0 }, { itemID = 3967, name = "Thick Leather Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3968, name = "Thick Leather Tunic", chance = 0.125, quality = 0 }, { itemID = 3986, name = "Protective Pavise", chance = 0.125, quality = 0 }, { itemID = 3989, name = "Blocking Targe", chance = 0.125, quality = 0 }, { itemID = 4000, name = "Overlinked Chain Belt", chance = 0.125, quality = 0 }, { itemID = 4001, name = "Overlinked Chain Boots", chance = 0.125, quality = 0 }, { itemID = 4002, name = "Overlinked Chain Bracers", chance = 0.125, quality = 0 }, { itemID = 4003, name = "Overlinked Chain Cloak", chance = 0.125, quality = 0 }, { itemID = 4004, name = "Overlinked Chain Gloves", chance = 0.125, quality = 0 }, { itemID = 4005, name = "Overlinked Chain Pants", chance = 0.125, quality = 0 }, { itemID = 4006, name = "Overlinked Chain Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 4007, name = "Overlinked Chain Armor", chance = 0.125, quality = 0 }, { itemID = 4017, name = "Sharp Shortsword", chance = 0.125, quality = 0 }, { itemID = 4018, name = "Whetted Claymore", chance = 0.125, quality = 0 }, { itemID = 4019, name = "Heavy Flint Axe", chance = 0.125, quality = 0 }, { itemID = 4020, name = "Splintering Battle Axe", chance = 0.125, quality = 0 }, { itemID = 4021, name = "Blunting Mace", chance = 0.125, quality = 0 }, { itemID = 4022, name = "Crushing Maul", chance = 0.125, quality = 0 }, { itemID = 4023, name = "Fine Pointed Dagger", chance = 0.125, quality = 0 }, { itemID = 4024, name = "Heavy War Staff", chance = 0.125, quality = 0 }, { itemID = 4025, name = "Balanced Long Bow", chance = 0.125, quality = 0 }, { itemID = 4026, name = "Sentinel Musket", chance = 0.125, quality = 0 }, { itemID = 8749, name = "Crochet Hat", chance = 0.125, quality = 0 }, { itemID = 8750, name = "Thick Leather Hat", chance = 0.125, quality = 0 }, { itemID = 8751, name = "Overlinked Coif", chance = 0.125, quality = 0 }, { itemID = 13824, name = "Recurve Long Bow", chance = 0.125, quality = 0 }, { itemID = 1639, name = "Grinning Axe", chance = 0.009091, quality = 2 }, { itemID = 3208, name = "Conk Hammer", chance = 0.009091, quality = 2 }, { itemID = 4089, name = "Ricochet Blunderbuss", chance = 0.009091, quality = 2 }, { itemID = 7528, name = "Cabalist Leggings", chance = 0.009091, quality = 2 }, { itemID = 7536, name = "Champion's Wall Shield", chance = 0.009091, quality = 2 }, { itemID = 7537, name = "Gothic Shield", chance = 0.009091, quality = 2 }, { itemID = 7538, name = "Champion's Armor", chance = 0.009091, quality = 2 }, { itemID = 7539, name = "Champion's Leggings", chance = 0.009091, quality = 2 }, { itemID = 7553, name = "Band of the Unicorn", chance = 0.009091, quality = 2 }, { itemID = 8111, name = "Hibernal Mantle", chance = 0.009091, quality = 2 }, { itemID = 8112, name = "Hibernal Pants", chance = 0.009091, quality = 2 }, { itemID = 8115, name = "Hibernal Cowl", chance = 0.009091, quality = 2 }, { itemID = 8122, name = "Heraldic Headpiece", chance = 0.009091, quality = 2 }, { itemID = 8123, name = "Heraldic Leggings", chance = 0.009091, quality = 2 }, { itemID = 8124, name = "Heraldic Spaulders", chance = 0.009091, quality = 2 }, { itemID = 8125, name = "Myrmidon's Bracers", chance = 0.009091, quality = 2 }, { itemID = 8128, name = "Myrmidon's Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 8129, name = "Myrmidon's Girdle", chance = 0.009091, quality = 2 }, { itemID = 8130, name = "Myrmidon's Greaves", chance = 0.009091, quality = 2 }, { itemID = 8279, name = "Valorous Helm", chance = 0.009091, quality = 2 }, { itemID = 8280, name = "Valorous Legguards", chance = 0.009091, quality = 2 }, { itemID = 8281, name = "Valorous Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 9905, name = "Royal Blouse", chance = 0.009091, quality = 2 }, { itemID = 9913, name = "Royal Gown", chance = 0.009091, quality = 2 }, { itemID = 9914, name = "Royal Scepter", chance = 0.009091, quality = 2 }, { itemID = 9924, name = "Tracker's Tunic", chance = 0.009091, quality = 2 }, { itemID = 9936, name = "Abjurer's Boots", chance = 0.009091, quality = 2 }, { itemID = 9937, name = "Abjurer's Bands", chance = 0.009091, quality = 2 }, { itemID = 9938, name = "Abjurer's Cloak", chance = 0.009091, quality = 2 }, { itemID = 9939, name = "Abjurer's Gloves", chance = 0.009091, quality = 2 }, { itemID = 9941, name = "Abjurer's Mantle", chance = 0.009091, quality = 2 }, { itemID = 9945, name = "Abjurer's Sash", chance = 0.009091, quality = 2 }, { itemID = 9947, name = "Chieftain's Belt", chance = 0.009091, quality = 2 }, { itemID = 9948, name = "Chieftain's Boots", chance = 0.009091, quality = 2 }, { itemID = 9949, name = "Chieftain's Bracers", chance = 0.009091, quality = 2 }, { itemID = 9952, name = "Chieftain's Gloves", chance = 0.009091, quality = 2 }, { itemID = 9962, name = "Warmonger's Greaves", chance = 0.009091, quality = 2 }, { itemID = 9963, name = "Warmonger's Circlet", chance = 0.009091, quality = 2 }, { itemID = 9964, name = "Warmonger's Leggings", chance = 0.009091, quality = 2 }, { itemID = 9965, name = "Warmonger's Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 10060, name = "Duskwoven Cape", chance = 0.009091, quality = 2 }, { itemID = 10066, name = "Duskwoven Sash", chance = 0.009091, quality = 2 }, { itemID = 10067, name = "Righteous Waistguard", chance = 0.009091, quality = 2 }, { itemID = 10069, name = "Righteous Bracers", chance = 0.009091, quality = 2 }, { itemID = 10071, name = "Righteous Cloak", chance = 0.009091, quality = 2 }, { itemID = 10076, name = "Lord's Armguards", chance = 0.009091, quality = 2 }, { itemID = 10079, name = "Lord's Cape", chance = 0.009091, quality = 2 }, { itemID = 10086, name = "Gothic Plate Armor", chance = 0.009091, quality = 2 }, { itemID = 10127, name = "Revenant Bracers", chance = 0.009091, quality = 2 }, { itemID = 10201, name = "Overlord's Greaves", chance = 0.009091, quality = 2 }, { itemID = 10202, name = "Overlord's Vambraces", chance = 0.009091, quality = 2 }, { itemID = 10205, name = "Overlord's Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 10206, name = "Overlord's Girdle", chance = 0.009091, quality = 2 }, { itemID = 10207, name = "Overlord's Crown", chance = 0.009091, quality = 2 }, { itemID = 11975, name = "Topaz Ring", chance = 0.009091, quality = 2 }, { itemID = 12013, name = "Desert Ring", chance = 0.009091, quality = 2 }, { itemID = 12032, name = "Onyx Choker", chance = 0.009091, quality = 2 }, { itemID = 14263, name = "Bloodwoven Mask", chance = 0.009091, quality = 2 }, { itemID = 14264, name = "Bloodwoven Pants", chance = 0.009091, quality = 2 }, { itemID = 14271, name = "Gaea's Circlet", chance = 0.009091, quality = 2 }, { itemID = 14273, name = "Gaea's Amice", chance = 0.009091, quality = 2 }, { itemID = 14279, name = "Opulent Bracers", chance = 0.009091, quality = 2 }, { itemID = 14280, name = "Opulent Cape", chance = 0.009091, quality = 2 }, { itemID = 14292, name = "Arachnidian Cape", chance = 0.009091, quality = 2 }, { itemID = 14427, name = "Windchaser Wraps", chance = 0.009091, quality = 2 }, { itemID = 14434, name = "Windchaser Robes", chance = 0.009091, quality = 2 }, { itemID = 14438, name = "Venomshroud Boots", chance = 0.009091, quality = 2 }, { itemID = 14442, name = "Venomshroud Mitts", chance = 0.009091, quality = 2 }, { itemID = 14443, name = "Venomshroud Mantle", chance = 0.009091, quality = 2 }, { itemID = 14446, name = "Venomshroud Belt", chance = 0.009091, quality = 2 }, { itemID = 14655, name = "Scorpashi Breastplate", chance = 0.009091, quality = 2 }, { itemID = 14658, name = "Scorpashi Skullcap", chance = 0.009091, quality = 2 }, { itemID = 14661, name = "Keeper's Cord", chance = 0.009091, quality = 2 }, { itemID = 14663, name = "Keeper's Bindings", chance = 0.009091, quality = 2 }, { itemID = 14665, name = "Keeper's Cloak", chance = 0.009091, quality = 2 }, { itemID = 14779, name = "Khan's Chestpiece", chance = 0.009091, quality = 2 }, { itemID = 14780, name = "Khan's Buckler", chance = 0.009091, quality = 2 }, { itemID = 14785, name = "Khan's Helmet", chance = 0.009091, quality = 2 }, { itemID = 14788, name = "Protector Armguards", chance = 0.009091, quality = 2 }, { itemID = 14791, name = "Protector Cape", chance = 0.009091, quality = 2 }, { itemID = 14835, name = "Tyrant's Chestpiece", chance = 0.009091, quality = 2 }, { itemID = 14842, name = "Tyrant's Shield", chance = 0.009091, quality = 2 }, { itemID = 14847, name = "Sunscale Belt", chance = 0.009091, quality = 2 }, { itemID = 14853, name = "Sunscale Wristguards", chance = 0.009091, quality = 2 }, { itemID = 14907, name = "Brutish Helmet", chance = 0.009091, quality = 2 }, { itemID = 14908, name = "Brutish Legguards", chance = 0.009091, quality = 2 }, { itemID = 14913, name = "Jade Greaves", chance = 0.009091, quality = 2 }, { itemID = 14917, name = "Jade Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 14921, name = "Jade Epaulets", chance = 0.009091, quality = 2 }, { itemID = 14953, name = "Bloodforged Legplates", chance = 0.009091, quality = 2 }, { itemID = 14965, name = "High Chief's Bindings", chance = 0.009091, quality = 2 }, { itemID = 15167, name = "Imposing Bandana", chance = 0.009091, quality = 2 }, { itemID = 15177, name = "Potent Shoulders", chance = 0.009091, quality = 2 }, { itemID = 15227, name = "Diamond-Tip Bludgeon", chance = 0.009091, quality = 2 }, { itemID = 15235, name = "Crescent Edge", chance = 0.009091, quality = 2 }, { itemID = 15252, name = "Tusker Sword", chance = 0.009091, quality = 2 }, { itemID = 15379, name = "Rageclaw Boots", chance = 0.009091, quality = 2 }, { itemID = 15383, name = "Rageclaw Gloves", chance = 0.009091, quality = 2 }, { itemID = 15385, name = "Rageclaw Leggings", chance = 0.009091, quality = 2 }, { itemID = 15386, name = "Rageclaw Shoulder Pads", chance = 0.009091, quality = 2 }, { itemID = 15392, name = "Jadefire Cloak", chance = 0.009091, quality = 2 }, { itemID = 15619, name = "Gryphon Mail Belt", chance = 0.009091, quality = 2 }, { itemID = 15628, name = "Gryphon Mail Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 15629, name = "Formidable Bracers", chance = 0.009091, quality = 2 }, { itemID = 15630, name = "Formidable Sabatons", chance = 0.009091, quality = 2 }, { itemID = 15635, name = "Formidable Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 15636, name = "Formidable Belt", chance = 0.009091, quality = 2 }, { itemID = 15638, name = "Formidable Shoulder Pads", chance = 0.009091, quality = 2 }, { itemID = 15643, name = "Ironhide Cloak", chance = 0.009091, quality = 2 }, { itemID = 15965, name = "Windchaser Orb", chance = 0.009091, quality = 2 }, { itemID = 13018, name = "Executioner's Cleaver", chance = 0.0025, quality = 3 }, { itemID = 13035, name = "Serpent Slicer", chance = 0.0025, quality = 3 }, { itemID = 13039, name = "Skull Splitting Crossbow", chance = 0.0025, quality = 3 }, { itemID = 13043, name = "Blade of the Titans", chance = 0.0025, quality = 3 }, { itemID = 13055, name = "Bonechewer", chance = 0.0025, quality = 3 }, { itemID = 13076, name = "Giantslayer Bracers", chance = 0.0025, quality = 3 }, { itemID = 13089, name = "Skibi's Pendant", chance = 0.0025, quality = 3 }, { itemID = 13109, name = "Blackflame Cape", chance = 0.0025, quality = 3 }, { itemID = 13112, name = "Winged Helm", chance = 0.0025, quality = 3 }, { itemID = 13134, name = "Belt of the Gladiator", chance = 0.0025, quality = 3 }, { itemID = 1608, name = "Skullcrusher Mace", chance = 0.00885, quality = 2 }, { itemID = 1994, name = "Ebonclaw Reaver", chance = 0.00885, quality = 2 }, { itemID = 4069, name = "Blackforge Buckler", chance = 0.00885, quality = 2 }, { itemID = 4082, name = "Blackforge Breastplate", chance = 0.00885, quality = 2 }, { itemID = 4084, name = "Blackforge Leggings", chance = 0.00885, quality = 2 }, { itemID = 4088, name = "Dreadblade", chance = 0.00885, quality = 2 }, { itemID = 4733, name = "Blackforge Pauldrons", chance = 0.00885, quality = 2 }, { itemID = 6427, name = "Mistscape Robe", chance = 0.00885, quality = 2 }, { itemID = 6430, name = "Imperial Leather Breastplate", chance = 0.00885, quality = 2 }, { itemID = 7113, name = "Mistscape Armor", chance = 0.00885, quality = 2 }, { itemID = 7519, name = "Gossamer Pants", chance = 0.00885, quality = 2 }, { itemID = 7520, name = "Gossamer Headpiece", chance = 0.00885, quality = 2 }, { itemID = 7521, name = "Gossamer Gloves", chance = 0.00885, quality = 2 }, { itemID = 7523, name = "Gossamer Shoulderpads", chance = 0.00885, quality = 2 }, { itemID = 7526, name = "Gossamer Belt", chance = 0.00885, quality = 2 }, { itemID = 7529, name = "Cabalist Helm", chance = 0.00885, quality = 2 }, { itemID = 7530, name = "Cabalist Gloves", chance = 0.00885, quality = 2 }, { itemID = 7531, name = "Cabalist Boots", chance = 0.00885, quality = 2 }, { itemID = 7532, name = "Cabalist Spaulders", chance = 0.00885, quality = 2 }, { itemID = 7535, name = "Cabalist Belt", chance = 0.00885, quality = 2 }, { itemID = 7540, name = "Champion's Helmet", chance = 0.00885, quality = 2 }, { itemID = 7541, name = "Champion's Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 7542, name = "Champion's Greaves", chance = 0.00885, quality = 2 }, { itemID = 7543, name = "Champion's Pauldrons", chance = 0.00885, quality = 2 }, { itemID = 7546, name = "Champion's Girdle", chance = 0.00885, quality = 2 }, { itemID = 7611, name = "Mistscape Stave", chance = 0.00885, quality = 2 }, { itemID = 8107, name = "Hibernal Boots", chance = 0.00885, quality = 2 }, { itemID = 8108, name = "Hibernal Bracers", chance = 0.00885, quality = 2 }, { itemID = 8109, name = "Hibernal Cloak", chance = 0.00885, quality = 2 }, { itemID = 8110, name = "Hibernal Gloves", chance = 0.00885, quality = 2 }, { itemID = 8114, name = "Hibernal Sash", chance = 0.00885, quality = 2 }, { itemID = 8116, name = "Heraldic Belt", chance = 0.00885, quality = 2 }, { itemID = 8117, name = "Heraldic Boots", chance = 0.00885, quality = 2 }, { itemID = 8118, name = "Heraldic Bracers", chance = 0.00885, quality = 2 }, { itemID = 8121, name = "Heraldic Gloves", chance = 0.00885, quality = 2 }, { itemID = 8127, name = "Myrmidon's Cape", chance = 0.00885, quality = 2 }, { itemID = 8135, name = "Chromite Shield", chance = 0.00885, quality = 2 }, { itemID = 8138, name = "Chromite Chestplate", chance = 0.00885, quality = 2 }, { itemID = 8143, name = "Chromite Legplates", chance = 0.00885, quality = 2 }, { itemID = 8199, name = "Battlefield Destroyer", chance = 0.00885, quality = 2 }, { itemID = 8273, name = "Valorous Wristguards", chance = 0.00885, quality = 2 }, { itemID = 8276, name = "Valorous Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 8277, name = "Valorous Girdle", chance = 0.00885, quality = 2 }, { itemID = 8278, name = "Valorous Greaves", chance = 0.00885, quality = 2 }, { itemID = 9911, name = "Royal Trousers", chance = 0.00885, quality = 2 }, { itemID = 9922, name = "Tracker's Leggings", chance = 0.00885, quality = 2 }, { itemID = 9951, name = "Chieftain's Cloak", chance = 0.00885, quality = 2 }, { itemID = 9956, name = "Warmonger's Bracers", chance = 0.00885, quality = 2 }, { itemID = 9960, name = "Warmonger's Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 9961, name = "Warmonger's Belt", chance = 0.00885, quality = 2 }, { itemID = 10087, name = "Gothic Plate Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 10090, name = "Gothic Plate Helmet", chance = 0.00885, quality = 2 }, { itemID = 10091, name = "Gothic Plate Leggings", chance = 0.00885, quality = 2 }, { itemID = 10092, name = "Gothic Plate Spaulders", chance = 0.00885, quality = 2 }, { itemID = 11974, name = "Aquamarine Ring", chance = 0.00885, quality = 2 }, { itemID = 11988, name = "Tellurium Band", chance = 0.00885, quality = 2 }, { itemID = 11999, name = "Lodestone Hoop", chance = 0.00885, quality = 2 }, { itemID = 12043, name = "Desert Choker", chance = 0.00885, quality = 2 }, { itemID = 14237, name = "Darkmist Armor", chance = 0.00885, quality = 2 }, { itemID = 14244, name = "Darkmist Wraps", chance = 0.00885, quality = 2 }, { itemID = 14249, name = "Lunar Vest", chance = 0.00885, quality = 2 }, { itemID = 14254, name = "Lunar Raiment", chance = 0.00885, quality = 2 }, { itemID = 14259, name = "Bloodwoven Boots", chance = 0.00885, quality = 2 }, { itemID = 14266, name = "Bloodwoven Pads", chance = 0.00885, quality = 2 }, { itemID = 14268, name = "Gaea's Cuffs", chance = 0.00885, quality = 2 }, { itemID = 14269, name = "Gaea's Slippers", chance = 0.00885, quality = 2 }, { itemID = 14272, name = "Gaea's Handwraps", chance = 0.00885, quality = 2 }, { itemID = 14276, name = "Gaea's Belt", chance = 0.00885, quality = 2 }, { itemID = 14433, name = "Windchaser Woolies", chance = 0.00885, quality = 2 }, { itemID = 14436, name = "Windchaser Coronet", chance = 0.00885, quality = 2 }, { itemID = 14439, name = "Venomshroud Armguards", chance = 0.00885, quality = 2 }, { itemID = 14440, name = "Venomshroud Cape", chance = 0.00885, quality = 2 }, { itemID = 14653, name = "Scorpashi Slippers", chance = 0.00885, quality = 2 }, { itemID = 14657, name = "Scorpashi Gloves", chance = 0.00885, quality = 2 }, { itemID = 14659, name = "Scorpashi Leggings", chance = 0.00885, quality = 2 }, { itemID = 14660, name = "Scorpashi Shoulder Pads", chance = 0.00885, quality = 2 }, { itemID = 14783, name = "Khan's Belt", chance = 0.00885, quality = 2 }, { itemID = 14784, name = "Khan's Greaves", chance = 0.00885, quality = 2 }, { itemID = 14786, name = "Khan's Legguards", chance = 0.00885, quality = 2 }, { itemID = 14787, name = "Khan's Mantle", chance = 0.00885, quality = 2 }, { itemID = 14840, name = "Tyrant's Legplates", chance = 0.00885, quality = 2 }, { itemID = 14843, name = "Tyrant's Helm", chance = 0.00885, quality = 2 }, { itemID = 14911, name = "Brutish Boots", chance = 0.00885, quality = 2 }, { itemID = 14914, name = "Jade Bracers", chance = 0.00885, quality = 2 }, { itemID = 14918, name = "Jade Belt", chance = 0.00885, quality = 2 }, { itemID = 14939, name = "Warbringer's Chestguard", chance = 0.00885, quality = 2 }, { itemID = 14947, name = "Warbringer's Shield", chance = 0.00885, quality = 2 }, { itemID = 14949, name = "Bloodforged Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 14950, name = "Bloodforged Belt", chance = 0.00885, quality = 2 }, { itemID = 14951, name = "Bloodforged Sabatons", chance = 0.00885, quality = 2 }, { itemID = 14955, name = "Bloodforged Shoulder Pads", chance = 0.00885, quality = 2 }, { itemID = 15164, name = "Imposing Vest", chance = 0.00885, quality = 2 }, { itemID = 15172, name = "Potent Bands", chance = 0.00885, quality = 2 }, { itemID = 15173, name = "Potent Cape", chance = 0.00885, quality = 2 }, { itemID = 15178, name = "Potent Belt", chance = 0.00885, quality = 2 }, { itemID = 15262, name = "Greater Maul", chance = 0.00885, quality = 2 }, { itemID = 15270, name = "Gigantic War Axe", chance = 0.00885, quality = 2 }, { itemID = 15373, name = "Wolf Rider's Headgear", chance = 0.00885, quality = 2 }, { itemID = 15376, name = "Wolf Rider's Padded Armor", chance = 0.00885, quality = 2 }, { itemID = 15378, name = "Rageclaw Belt", chance = 0.00885, quality = 2 }, { itemID = 15380, name = "Rageclaw Bracers", chance = 0.00885, quality = 2 }, { itemID = 15601, name = "Ancient Chestpiece", chance = 0.00885, quality = 2 }, { itemID = 15604, name = "Ancient Defender", chance = 0.00885, quality = 2 }, { itemID = 15609, name = "Bonelink Armor", chance = 0.00885, quality = 2 }, { itemID = 15615, name = "Bonelink Helmet", chance = 0.00885, quality = 2 }, { itemID = 15616, name = "Bonelink Legplates", chance = 0.00885, quality = 2 }, { itemID = 15618, name = "Bonelink Wall Shield", chance = 0.00885, quality = 2 }, { itemID = 15620, name = "Gryphon Mail Bracelets", chance = 0.00885, quality = 2 }, { itemID = 15625, name = "Gryphon Mail Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 15626, name = "Gryphon Mail Greaves", chance = 0.00885, quality = 2 }, { itemID = 15632, name = "Formidable Cape", chance = 0.00885, quality = 2 }, { itemID = 15980, name = "Darkmist Orb", chance = 0.00885, quality = 2 }, { itemID = 15981, name = "Lunar Sphere", chance = 0.00885, quality = 2 }, { itemID = 754, name = "Shortsword of Vengeance", chance = 0.0025, quality = 3 }, { itemID = 1720, name = "Tanglewood Staff", chance = 0.0025, quality = 3 }, { itemID = 4090, name = "Mug O' Hurt", chance = 0.0025, quality = 3 }, { itemID = 4091, name = "Widowmaker", chance = 0.0025, quality = 3 }, { itemID = 9433, name = "Forgotten Wraps", chance = 0.0025, quality = 3 }, { itemID = 13021, name = "Needle Threader", chance = 0.0025, quality = 3 }, { itemID = 13074, name = "Golem Shard Leggings", chance = 0.0025, quality = 3 }, { itemID = 13082, name = "Mountainside Buckler", chance = 0.0025, quality = 3 }, { itemID = 13102, name = "Cassandra's Grace", chance = 0.0025, quality = 3 }, { itemID = 13128, name = "High Bergg Helm", chance = 0.0025, quality = 3 }, { itemID = 55250, name = "Emberstone", chance = 0.2131, quality = 2 }, { itemID = 55251, name = "Pure Moonstone", chance = 0.1332, quality = 2 }, { itemID = 56028, name = "Plans: Sunburst Tiara", chance = 0.02, quality = 2 }, { itemID = 56029, name = "Plans: Ocean's Gaze", chance = 0.02, quality = 2 }, { itemID = 70103, name = "Plans: Prism Amulet", chance = 0.02, quality = 2 }, { itemID = 70107, name = "Plans: Runebound Amulet", chance = 0.02, quality = 3 }, { itemID = 70108, name = "Plans: Shimmering Moonstone Tablet", chance = 0.02, quality = 2 }, { itemID = 70125, name = "Plans: Crystalfire Armlets", chance = 0.02, quality = 2 }, { itemID = 70126, name = "Plans: Cinderfall Band", chance = 0.02, quality = 2 }, { itemID = 70149, name = "Plans: Spectre Shade Ring", chance = 0.02, quality = 2 }, { itemID = 70151, name = "Plans: Marine's Demise", chance = 0.02, quality = 2 }, { itemID = 70161, name = "Plans: Gloomy Diamond Gemstone", chance = 0.02, quality = 2 }, { itemID = 70164, name = "Plans: Tempered Azerothian Gemstone", chance = 0.02, quality = 2 }, { itemID = 70167, name = "Plans: Enchanted Emerald Gemstone", chance = 0.02, quality = 2 }, { itemID = 70169, name = "Plans: Beautiful Diamond Gemstone", chance = 0.02, quality = 2 }, { itemID = 70191, name = "Plans: Marine Root", chance = 0.02, quality = 2 }, { itemID = 70194, name = "Plans: Facetted Moonstone Brooch", chance = 0.02, quality = 2 }, { itemID = 70196, name = "Plans: Smoldering Brooch", chance = 0.02, quality = 2 }, { itemID = 70200, name = "Plans: Dreary Opal Gemstone", chance = 0.02, quality = 2 }, { itemID = 70207, name = "Plans: Spellweaver Pendant", chance = 0.02, quality = 2 }, { itemID = 70127, name = "Plans: Opaline Illuminator", chance = 0.02, quality = 3 }, { itemID = 70138, name = "Plans: Golden Jade Ring", chance = 0.02, quality = 3 }, { itemID = 70148, name = "Plans: Ogre Bone Band", chance = 0.02, quality = 3 }, { itemID = 70179, name = "Plans: Opal Guided Bangles", chance = 0.02, quality = 3 }, { itemID = 70184, name = "Plans: Ornament of Restraint", chance = 0.02, quality = 3 }, { itemID = 70201, name = "Plans: Resurged Topaz Gemstone", chance = 0.02, quality = 3 }, { itemID = 70202, name = "Plans: Resilient Arcane Gemstone", chance = 0.02, quality = 3 } }
BossLoot[7274] = { { itemID = 862, name = "Runed Ring", chance = 0.0935, quality = 3 }, { itemID = 1520, name = "Troll Sweat", chance = 32.5023, quality = 0 }, { itemID = 1645, name = "Moonberry Juice", chance = 2.2125, quality = 1 }, { itemID = 1685, name = "Troll-hide Bag", chance = 0.0312, quality = 1 }, { itemID = 2040, name = "Troll Protector", chance = 0.0312, quality = 3 }, { itemID = 3395, name = "Recipe: Limited Invulnerability Potion", chance = 0.02, quality = 2 }, { itemID = 3914, name = "Journeyman's Backpack", chance = 0.2, quality = 1 }, { itemID = 3928, name = "Superior Healing Potion", chance = 1.24, quality = 1 }, { itemID = 4338, name = "Mageweave Cloth", chance = 26.8931, quality = 1 }, { itemID = 4419, name = "Scroll of Intellect III", chance = 0.4, quality = 1 }, { itemID = 4422, name = "Scroll of Stamina III", chance = 0.34, quality = 1 }, { itemID = 4425, name = "Scroll of Agility III", chance = 0.14, quality = 1 }, { itemID = 4426, name = "Scroll of Strength III", chance = 0.2, quality = 1 }, { itemID = 4599, name = "Cured Ham Steak", chance = 4.612, quality = 1 }, { itemID = 4638, name = "Reinforced Steel Lockbox", chance = 0.187, quality = 2 }, { itemID = 5616, name = "Gutwrencher", chance = 0.02, quality = 3 }, { itemID = 6149, name = "Greater Mana Potion", chance = 1.1, quality = 1 }, { itemID = 6440, name = "Brainlash", chance = 0.0312, quality = 3 }, { itemID = 7909, name = "Aquamarine", chance = 0.3739, quality = 2 }, { itemID = 7910, name = "Star Ruby", chance = 0.2493, quality = 2 }, { itemID = 7975, name = "Plans: Heavy Mithril Pants", chance = 0.02, quality = 2 }, { itemID = 7989, name = "Plans: Mithril Spurs", chance = 0.02, quality = 2 }, { itemID = 7990, name = "Plans: Heavy Mithril Helm", chance = 0.04, quality = 2 }, { itemID = 7993, name = "Plans: Dazzling Mithril Rapier", chance = 0.03, quality = 2 }, { itemID = 8029, name = "Plans: Wicked Mithril Blade", chance = 0.14, quality = 2 }, { itemID = 8151, name = "Flask of Mojo", chance = 9.1617, quality = 1 }, { itemID = 8385, name = "Pattern: Turtle Scale Gloves", chance = 0.02, quality = 1 }, { itemID = 8387, name = "Pattern: Big Voodoo Mask", chance = 0.02, quality = 2 }, { itemID = 8389, name = "Pattern: Big Voodoo Pants", chance = 0.02, quality = 2 }, { itemID = 8390, name = "Pattern: Big Voodoo Cloak", chance = 0.06, quality = 2 }, { itemID = 8444, name = "Executioner's Key", chance = 100, quality = 1 }, { itemID = 8623, name = "OOX-17/TN Distress Beacon", chance = 0.8, quality = 2 }, { itemID = 9242, name = "Ancient Tablet", chance = 1.7451, quality = 0 }, { itemID = 9243, name = "Shriveled Heart", chance = 0.7167, quality = 2 }, { itemID = 9295, name = "Recipe: Invisibility Potion", chance = 0.08, quality = 2 }, { itemID = 9298, name = "Recipe: Elixir of Giants", chance = 0.12, quality = 2 }, { itemID = 9480, name = "Eyegouger", chance = 0.1, quality = 3 }, { itemID = 9481, name = "The Minotaur", chance = 0.0935, quality = 3 }, { itemID = 9482, name = "Witch Doctor's Cane", chance = 0.04, quality = 3 }, { itemID = 9483, name = "Flaming Incinerator", chance = 0.02, quality = 3 }, { itemID = 9484, name = "Spellshock Leggings", chance = 0.01, quality = 3 }, { itemID = 9511, name = "Bloodletter Scalpel", chance = 0.04, quality = 3 }, { itemID = 9512, name = "Blackmetal Cape", chance = 0.0935, quality = 3 }, { itemID = 9523, name = "Troll Temper", quality = 1 }, { itemID = 10300, name = "Pattern: Red Mageweave Vest", chance = 0.12, quality = 2 }, { itemID = 10302, name = "Pattern: Red Mageweave Pants", chance = 0.02, quality = 2 }, { itemID = 10312, name = "Pattern: Red Mageweave Gloves", chance = 0.02, quality = 2 }, { itemID = 10315, name = "Pattern: Red Mageweave Shoulders", chance = 0.04, quality = 2 }, { itemID = 10320, name = "Pattern: Red Mageweave Headband", chance = 0.06, quality = 2 }, { itemID = 10606, name = "Schematic: Parachute Cloak", chance = 0.02, quality = 2 }, { itemID = 11204, name = "Formula: Enchant Bracer - Greater Spirit", chance = 0.02, quality = 2 }, { itemID = 11208, name = "Formula: Enchant Weapon - Demonslaying", chance = 0.04, quality = 2 }, { itemID = 11225, name = "Formula: Enchant Bracer - Greater Stamina", chance = 0.06, quality = 2 }, { itemID = 11226, name = "Formula: Enchant Gloves - Riding Skill", chance = 0.02, quality = 2 }, { itemID = 12682, name = "Plans: Thorium Armor", chance = 0.02, quality = 2 }, { itemID = 12689, name = "Plans: Radiant Breastplate", chance = 0.02, quality = 2 }, { itemID = 12691, name = "Plans: Wildthorn Mail", chance = 0.06, quality = 2 }, { itemID = 14467, name = "Pattern: Frostweave Robe", chance = 0.02, quality = 2 }, { itemID = 14474, name = "Pattern: Frostweave Gloves", chance = 0.04, quality = 2 }, { itemID = 14484, name = "Pattern: Brightcloth Cloak", chance = 0.02, quality = 2 }, { itemID = 15731, name = "Pattern: Runic Leather Gauntlets", chance = 0.02, quality = 2 }, { itemID = 16043, name = "Schematic: Thorium Rifle", chance = 0.02, quality = 2 }, { itemID = 16215, name = "Formula: Enchant Boots - Greater Stamina", chance = 0.02, quality = 2 }, { itemID = 16218, name = "Formula: Enchant Bracer - Superior Spirit", chance = 0.02, quality = 2 }, { itemID = 16220, name = "Formula: Enchant Boots - Spirit", chance = 0.02, quality = 2 }, { itemID = 24232, name = "Shabby Knot", chance = 0.0312, quality = 0 }, { itemID = 1625, name = "Exquisite Flamberge", chance = 0.01064, quality = 2 }, { itemID = 4044, name = "Aurora Pants", chance = 0.01064, quality = 2 }, { itemID = 4058, name = "Glyphed Breastplate", chance = 0.01064, quality = 2 }, { itemID = 4060, name = "Glyphed Leggings", chance = 0.01064, quality = 2 }, { itemID = 4068, name = "Chief Brigadier Shield", chance = 0.01064, quality = 2 }, { itemID = 4070, name = "Jouster's Crest", chance = 0.01064, quality = 2 }, { itemID = 4079, name = "Chief Brigadier Leggings", chance = 0.01064, quality = 2 }, { itemID = 4087, name = "Trueshot Bow", chance = 0.01064, quality = 2 }, { itemID = 4725, name = "Chief Brigadier Pauldrons", chance = 0.01064, quality = 2 }, { itemID = 4735, name = "Mistscape Cloak", chance = 0.01064, quality = 2 }, { itemID = 5011, name = "Welken Ring", chance = 0.01064, quality = 2 }, { itemID = 5215, name = "Ember Wand", chance = 0.01064, quality = 2 }, { itemID = 6411, name = "Chief Brigadier Armor", chance = 0.01064, quality = 2 }, { itemID = 6415, name = "Aurora Robe", chance = 0.01064, quality = 2 }, { itemID = 6432, name = "Imperial Cloak", chance = 0.01064, quality = 2 }, { itemID = 7112, name = "Aurora Armor", chance = 0.01064, quality = 2 }, { itemID = 7429, name = "Twilight Armor", chance = 0.01064, quality = 2 }, { itemID = 7430, name = "Twilight Robe", chance = 0.01064, quality = 2 }, { itemID = 7439, name = "Sentinel Breastplate", chance = 0.01064, quality = 2 }, { itemID = 7472, name = "Regal Boots", chance = 0.01064, quality = 2 }, { itemID = 7474, name = "Regal Cloak", chance = 0.01064, quality = 2 }, { itemID = 7475, name = "Regal Cuffs", chance = 0.01064, quality = 2 }, { itemID = 7476, name = "Regal Sash", chance = 0.01064, quality = 2 }, { itemID = 7480, name = "Ranger Gloves", chance = 0.01064, quality = 2 }, { itemID = 7483, name = "Ranger Cloak", chance = 0.01064, quality = 2 }, { itemID = 7484, name = "Ranger Wristguards", chance = 0.01064, quality = 2 }, { itemID = 7485, name = "Ranger Cord", chance = 0.01064, quality = 2 }, { itemID = 7489, name = "Captain's Gauntlets", chance = 0.01064, quality = 2 }, { itemID = 7493, name = "Captain's Bracers", chance = 0.01064, quality = 2 }, { itemID = 7494, name = "Captain's Waistguard", chance = 0.01064, quality = 2 }, { itemID = 7556, name = "Twilight Orb", chance = 0.01064, quality = 2 }, { itemID = 7610, name = "Aurora Sphere", chance = 0.01064, quality = 2 }, { itemID = 9876, name = "Sorcerer Slippers", chance = 0.01064, quality = 2 }, { itemID = 9878, name = "Sorcerer Hat", chance = 0.01064, quality = 2 }, { itemID = 9880, name = "Sorcerer Gloves", chance = 0.01064, quality = 2 }, { itemID = 9881, name = "Sorcerer Mantle", chance = 0.01064, quality = 2 }, { itemID = 9885, name = "Huntsman's Boots", chance = 0.01064, quality = 2 }, { itemID = 9889, name = "Huntsman's Cap", chance = 0.01064, quality = 2 }, { itemID = 9892, name = "Huntsman's Gloves", chance = 0.01064, quality = 2 }, { itemID = 9894, name = "Huntsman's Shoulders", chance = 0.01064, quality = 2 }, { itemID = 9895, name = "Jazeraint Boots", chance = 0.01064, quality = 2 }, { itemID = 9900, name = "Jazeraint Gauntlets", chance = 0.01064, quality = 2 }, { itemID = 9901, name = "Jazeraint Belt", chance = 0.01064, quality = 2 }, { itemID = 9902, name = "Jazeraint Helm", chance = 0.01064, quality = 2 }, { itemID = 9904, name = "Jazeraint Pauldrons", chance = 0.01064, quality = 2 }, { itemID = 9929, name = "Brigade Cloak", chance = 0.01064, quality = 2 }, { itemID = 11972, name = "Carnelian Loop", chance = 0.01064, quality = 2 }, { itemID = 12011, name = "Forest Hoop", chance = 0.01064, quality = 2 }, { itemID = 12022, name = "Iridium Chain", chance = 0.01064, quality = 2 }, { itemID = 14216, name = "Geomancer's Jerkin", chance = 0.01064, quality = 2 }, { itemID = 14220, name = "Geomancer's Cap", chance = 0.01064, quality = 2 }, { itemID = 14225, name = "Geomancer's Wraps", chance = 0.01064, quality = 2 }, { itemID = 14228, name = "Embersilk Coronet", chance = 0.01064, quality = 2 }, { itemID = 14233, name = "Embersilk Leggings", chance = 0.01064, quality = 2 }, { itemID = 14238, name = "Darkmist Boots", chance = 0.01064, quality = 2 }, { itemID = 14240, name = "Darkmist Bands", chance = 0.01064, quality = 2 }, { itemID = 14241, name = "Darkmist Handguards", chance = 0.01064, quality = 2 }, { itemID = 14245, name = "Darkmist Girdle", chance = 0.01064, quality = 2 }, { itemID = 14248, name = "Lunar Bindings", chance = 0.01064, quality = 2 }, { itemID = 14251, name = "Lunar Cloak", chance = 0.01064, quality = 2 }, { itemID = 14255, name = "Lunar Belt", chance = 0.01064, quality = 2 }, { itemID = 14422, name = "Silksand Gloves", chance = 0.01064, quality = 2 }, { itemID = 14423, name = "Silksand Shoulder Pads", chance = 0.01064, quality = 2 }, { itemID = 14591, name = "Hawkeye's Helm", chance = 0.01064, quality = 2 }, { itemID = 14592, name = "Hawkeye's Tunic", chance = 0.01064, quality = 2 }, { itemID = 14598, name = "Warden's Waistband", chance = 0.01064, quality = 2 }, { itemID = 14600, name = "Warden's Wristbands", chance = 0.01064, quality = 2 }, { itemID = 14603, name = "Warden's Mantle", chance = 0.01064, quality = 2 }, { itemID = 14606, name = "Warden's Gloves", chance = 0.01064, quality = 2 }, { itemID = 14770, name = "Ravager's Armguards", chance = 0.01064, quality = 2 }, { itemID = 14772, name = "Ravager's Handwraps", chance = 0.01064, quality = 2 }, { itemID = 14902, name = "Saltstone Shield", chance = 0.01064, quality = 2 }, { itemID = 15152, name = "Nocturnal Shoes", chance = 0.01064, quality = 2 }, { itemID = 15157, name = "Nocturnal Leggings", chance = 0.01064, quality = 2 }, { itemID = 15158, name = "Nocturnal Shoulder Pads", chance = 0.01064, quality = 2 }, { itemID = 15214, name = "Nobles Brand", chance = 0.01064, quality = 2 }, { itemID = 15234, name = "Greater Scythe", chance = 0.01064, quality = 2 }, { itemID = 15261, name = "Sequoia Branch", chance = 0.01064, quality = 2 }, { itemID = 15359, name = "Trickster's Vest", chance = 0.01064, quality = 2 }, { itemID = 15366, name = "Trickster's Leggings", chance = 0.01064, quality = 2 }, { itemID = 15371, name = "Wolf Rider's Cloak", chance = 0.01064, quality = 2 }, { itemID = 15567, name = "Marauder's Tunic", chance = 0.01064, quality = 2 }, { itemID = 15569, name = "Marauder's Crest", chance = 0.01064, quality = 2 }, { itemID = 15574, name = "Marauder's Shoulder Pads", chance = 0.01064, quality = 2 }, { itemID = 15578, name = "Sparkleshell Breastplate", chance = 0.01064, quality = 2 }, { itemID = 15580, name = "Sparkleshell Headwrap", chance = 0.01064, quality = 2 }, { itemID = 15582, name = "Sparkleshell Legguards", chance = 0.01064, quality = 2 }, { itemID = 15583, name = "Sparkleshell Shoulder Pads", chance = 0.01064, quality = 2 }, { itemID = 15584, name = "Sparkleshell Shield", chance = 0.01064, quality = 2 }, { itemID = 15589, name = "Steadfast Stompers", chance = 0.01064, quality = 2 }, { itemID = 15596, name = "Steadfast Legplates", chance = 0.01064, quality = 2 }, { itemID = 15603, name = "Ancient Cloak", chance = 0.01064, quality = 2 }, { itemID = 15606, name = "Ancient Belt", chance = 0.01064, quality = 2 }, { itemID = 15978, name = "Geomancer's Rod", chance = 0.01064, quality = 2 }, { itemID = 866, name = "Monk's Staff", chance = 0.01124, quality = 2 }, { itemID = 1640, name = "Monstrous War Axe", chance = 0.01124, quality = 2 }, { itemID = 4045, name = "Mistscape Bracers", chance = 0.01124, quality = 2 }, { itemID = 4047, name = "Mistscape Boots", chance = 0.01124, quality = 2 }, { itemID = 4061, name = "Imperial Leather Bracers", chance = 0.01124, quality = 2 }, { itemID = 4063, name = "Imperial Leather Gloves", chance = 0.01124, quality = 2 }, { itemID = 4734, name = "Mistscape Mantle", chance = 0.01124, quality = 2 }, { itemID = 4736, name = "Mistscape Sash", chance = 0.01124, quality = 2 }, { itemID = 4738, name = "Imperial Leather Belt", chance = 0.01124, quality = 2 }, { itemID = 6424, name = "Blackforge Cape", chance = 0.01124, quality = 2 }, { itemID = 6426, name = "Blackforge Bracers", chance = 0.01124, quality = 2 }, { itemID = 6428, name = "Mistscape Gloves", chance = 0.01124, quality = 2 }, { itemID = 6431, name = "Imperial Leather Boots", chance = 0.01124, quality = 2 }, { itemID = 6433, name = "Imperial Leather Helm", chance = 0.01124, quality = 2 }, { itemID = 7470, name = "Regal Wizard Hat", chance = 0.01124, quality = 2 }, { itemID = 7471, name = "Regal Gloves", chance = 0.01124, quality = 2 }, { itemID = 7473, name = "Regal Mantle", chance = 0.01124, quality = 2 }, { itemID = 7478, name = "Ranger Leggings", chance = 0.01124, quality = 2 }, { itemID = 7479, name = "Ranger Helm", chance = 0.01124, quality = 2 }, { itemID = 7481, name = "Ranger Boots", chance = 0.01124, quality = 2 }, { itemID = 7482, name = "Ranger Shoulders", chance = 0.01124, quality = 2 }, { itemID = 7487, name = "Captain's Leggings", chance = 0.01124, quality = 2 }, { itemID = 7488, name = "Captain's Circlet", chance = 0.01124, quality = 2 }, { itemID = 7490, name = "Captain's Boots", chance = 0.01124, quality = 2 }, { itemID = 7491, name = "Captain's Shoulderguards", chance = 0.01124, quality = 2 }, { itemID = 7496, name = "Field Plate Shield", chance = 0.01124, quality = 2 }, { itemID = 8194, name = "Goblin Nutcracker", chance = 0.01124, quality = 2 }, { itemID = 8196, name = "Ebon Scimitar", chance = 0.01124, quality = 2 }, { itemID = 9874, name = "Sorcerer Drape", chance = 0.01124, quality = 2 }, { itemID = 9882, name = "Sorcerer Sphere", chance = 0.01124, quality = 2 }, { itemID = 9883, name = "Sorcerer Pants", chance = 0.01124, quality = 2 }, { itemID = 9884, name = "Sorcerer Robe", chance = 0.01124, quality = 2 }, { itemID = 9887, name = "Huntsman's Armor", chance = 0.01124, quality = 2 }, { itemID = 9893, name = "Huntsman's Leggings", chance = 0.01124, quality = 2 }, { itemID = 9897, name = "Jazeraint Chestguard", chance = 0.01124, quality = 2 }, { itemID = 9899, name = "Jazeraint Shield", chance = 0.01124, quality = 2 }, { itemID = 9903, name = "Jazeraint Leggings", chance = 0.01124, quality = 2 }, { itemID = 9908, name = "Royal Cape", chance = 0.01124, quality = 2 }, { itemID = 9909, name = "Royal Bands", chance = 0.01124, quality = 2 }, { itemID = 9919, name = "Tracker's Cloak", chance = 0.01124, quality = 2 }, { itemID = 9926, name = "Brigade Boots", chance = 0.01124, quality = 2 }, { itemID = 9927, name = "Brigade Bracers", chance = 0.01124, quality = 2 }, { itemID = 9930, name = "Brigade Gauntlets", chance = 0.01124, quality = 2 }, { itemID = 9931, name = "Brigade Girdle", chance = 0.01124, quality = 2 }, { itemID = 11973, name = "Hematite Link", chance = 0.01124, quality = 2 }, { itemID = 11987, name = "Iridium Circle", chance = 0.01124, quality = 2 }, { itemID = 11998, name = "Jet Loop", chance = 0.01124, quality = 2 }, { itemID = 12042, name = "Marsh Chain", chance = 0.01124, quality = 2 }, { itemID = 14230, name = "Embersilk Tunic", chance = 0.01124, quality = 2 }, { itemID = 14234, name = "Embersilk Robes", chance = 0.01124, quality = 2 }, { itemID = 14242, name = "Darkmist Pants", chance = 0.01124, quality = 2 }, { itemID = 14243, name = "Darkmist Mantle", chance = 0.01124, quality = 2 }, { itemID = 14250, name = "Lunar Slippers", chance = 0.01124, quality = 2 }, { itemID = 14253, name = "Lunar Handwraps", chance = 0.01124, quality = 2 }, { itemID = 14261, name = "Bloodwoven Cloak", chance = 0.01124, quality = 2 }, { itemID = 14421, name = "Silksand Circlet", chance = 0.01124, quality = 2 }, { itemID = 14424, name = "Silksand Legwraps", chance = 0.01124, quality = 2 }, { itemID = 14429, name = "Windchaser Cuffs", chance = 0.01124, quality = 2 }, { itemID = 14430, name = "Windchaser Cloak", chance = 0.01124, quality = 2 }, { itemID = 14435, name = "Windchaser Cinch", chance = 0.01124, quality = 2 }, { itemID = 14599, name = "Warden's Footpads", chance = 0.01124, quality = 2 }, { itemID = 14605, name = "Warden's Woolies", chance = 0.01124, quality = 2 }, { itemID = 14769, name = "Ravager's Sandals", chance = 0.01124, quality = 2 }, { itemID = 14774, name = "Ravager's Crown", chance = 0.01124, quality = 2 }, { itemID = 14775, name = "Ravager's Woolies", chance = 0.01124, quality = 2 }, { itemID = 14776, name = "Ravager's Mantle", chance = 0.01124, quality = 2 }, { itemID = 14825, name = "Symbolic Crest", chance = 0.01124, quality = 2 }, { itemID = 15156, name = "Nocturnal Cap", chance = 0.01124, quality = 2 }, { itemID = 15159, name = "Nocturnal Tunic", chance = 0.01124, quality = 2 }, { itemID = 15161, name = "Imposing Belt", chance = 0.01124, quality = 2 }, { itemID = 15163, name = "Imposing Bracers", chance = 0.01124, quality = 2 }, { itemID = 15165, name = "Imposing Cape", chance = 0.01124, quality = 2 }, { itemID = 15244, name = "Razor Blade", chance = 0.01124, quality = 2 }, { itemID = 15251, name = "Headstriker Sword", chance = 0.01124, quality = 2 }, { itemID = 15363, name = "Trickster's Headdress", chance = 0.01124, quality = 2 }, { itemID = 15369, name = "Wolf Rider's Belt", chance = 0.01124, quality = 2 }, { itemID = 15372, name = "Wolf Rider's Gloves", chance = 0.01124, quality = 2 }, { itemID = 15375, name = "Wolf Rider's Shoulder Pads", chance = 0.01124, quality = 2 }, { itemID = 15377, name = "Wolf Rider's Wristbands", chance = 0.01124, quality = 2 }, { itemID = 15591, name = "Steadfast Breastplate", chance = 0.01124, quality = 2 }, { itemID = 15592, name = "Steadfast Buckler", chance = 0.01124, quality = 2 }, { itemID = 15593, name = "Steadfast Coronet", chance = 0.01124, quality = 2 }, { itemID = 15597, name = "Steadfast Shoulders", chance = 0.01124, quality = 2 }, { itemID = 15600, name = "Ancient Vambraces", chance = 0.01124, quality = 2 }, { itemID = 15605, name = "Ancient Gauntlets", chance = 0.01124, quality = 2 }, { itemID = 15610, name = "Bonelink Bracers", chance = 0.01124, quality = 2 }, { itemID = 15611, name = "Bonelink Cape", chance = 0.01124, quality = 2 }, { itemID = 15613, name = "Bonelink Belt", chance = 0.01124, quality = 2 }, { itemID = 15979, name = "Embersilk Stave", chance = 0.01124, quality = 2 }, { itemID = 1613, name = "Spiritchaser Staff", chance = 0.00641, quality = 2 }, { itemID = 3187, name = "Sacrificial Kris", chance = 0.00641, quality = 2 }, { itemID = 3430, name = "Sniper Rifle", chance = 0.00641, quality = 2 }, { itemID = 4046, name = "Mistscape Pants", chance = 0.00641, quality = 2 }, { itemID = 4062, name = "Imperial Leather Pants", chance = 0.00641, quality = 2 }, { itemID = 4080, name = "Blackforge Cowl", chance = 0.00641, quality = 2 }, { itemID = 4083, name = "Blackforge Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 4737, name = "Imperial Leather Spaulders", chance = 0.00641, quality = 2 }, { itemID = 5216, name = "Umbral Wand", chance = 0.00641, quality = 2 }, { itemID = 6423, name = "Blackforge Greaves", chance = 0.00641, quality = 2 }, { itemID = 6425, name = "Blackforge Girdle", chance = 0.00641, quality = 2 }, { itemID = 6429, name = "Mistscape Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 7332, name = "Regal Armor", chance = 0.00641, quality = 2 }, { itemID = 7468, name = "Regal Robe", chance = 0.00641, quality = 2 }, { itemID = 7469, name = "Regal Leggings", chance = 0.00641, quality = 2 }, { itemID = 7477, name = "Ranger Tunic", chance = 0.00641, quality = 2 }, { itemID = 7486, name = "Captain's Breastplate", chance = 0.00641, quality = 2 }, { itemID = 7495, name = "Captain's Buckler", chance = 0.00641, quality = 2 }, { itemID = 7522, name = "Gossamer Boots", chance = 0.00641, quality = 2 }, { itemID = 7524, name = "Gossamer Cape", chance = 0.00641, quality = 2 }, { itemID = 7525, name = "Gossamer Bracers", chance = 0.00641, quality = 2 }, { itemID = 7533, name = "Cabalist Cloak", chance = 0.00641, quality = 2 }, { itemID = 7534, name = "Cabalist Bracers", chance = 0.00641, quality = 2 }, { itemID = 7544, name = "Champion's Cape", chance = 0.00641, quality = 2 }, { itemID = 7545, name = "Champion's Bracers", chance = 0.00641, quality = 2 }, { itemID = 7552, name = "Falcon's Hook", chance = 0.00641, quality = 2 }, { itemID = 7555, name = "Regal Star", chance = 0.00641, quality = 2 }, { itemID = 8120, name = "Heraldic Cloak", chance = 0.00641, quality = 2 }, { itemID = 8137, name = "Chromite Bracers", chance = 0.00641, quality = 2 }, { itemID = 8139, name = "Chromite Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 8140, name = "Chromite Girdle", chance = 0.00641, quality = 2 }, { itemID = 8141, name = "Chromite Greaves", chance = 0.00641, quality = 2 }, { itemID = 8142, name = "Chromite Barbute", chance = 0.00641, quality = 2 }, { itemID = 8144, name = "Chromite Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 8156, name = "Jouster's Wristguards", chance = 0.00641, quality = 2 }, { itemID = 8157, name = "Jouster's Chestplate", chance = 0.00641, quality = 2 }, { itemID = 8158, name = "Jouster's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 8159, name = "Jouster's Girdle", chance = 0.00641, quality = 2 }, { itemID = 8160, name = "Jouster's Greaves", chance = 0.00641, quality = 2 }, { itemID = 8161, name = "Jouster's Visor", chance = 0.00641, quality = 2 }, { itemID = 8162, name = "Jouster's Legplates", chance = 0.00641, quality = 2 }, { itemID = 8163, name = "Jouster's Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9285, name = "Field Plate Vambraces", chance = 0.00641, quality = 2 }, { itemID = 9286, name = "Field Plate Armor", chance = 0.00641, quality = 2 }, { itemID = 9287, name = "Field Plate Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 9288, name = "Field Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 9289, name = "Field Plate Boots", chance = 0.00641, quality = 2 }, { itemID = 9290, name = "Field Plate Helmet", chance = 0.00641, quality = 2 }, { itemID = 9291, name = "Field Plate Leggings", chance = 0.00641, quality = 2 }, { itemID = 9292, name = "Field Plate Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9906, name = "Royal Sash", chance = 0.00641, quality = 2 }, { itemID = 9907, name = "Royal Boots", chance = 0.00641, quality = 2 }, { itemID = 9910, name = "Royal Gloves", chance = 0.00641, quality = 2 }, { itemID = 9912, name = "Royal Amice", chance = 0.00641, quality = 2 }, { itemID = 9915, name = "Royal Headband", chance = 0.00641, quality = 2 }, { itemID = 9916, name = "Tracker's Belt", chance = 0.00641, quality = 2 }, { itemID = 9917, name = "Tracker's Boots", chance = 0.00641, quality = 2 }, { itemID = 9918, name = "Brigade Defender", chance = 0.00641, quality = 2 }, { itemID = 9920, name = "Tracker's Gloves", chance = 0.00641, quality = 2 }, { itemID = 9921, name = "Tracker's Headband", chance = 0.00641, quality = 2 }, { itemID = 9923, name = "Tracker's Shoulderpads", chance = 0.00641, quality = 2 }, { itemID = 9925, name = "Tracker's Wristguards", chance = 0.00641, quality = 2 }, { itemID = 9928, name = "Brigade Breastplate", chance = 0.00641, quality = 2 }, { itemID = 9932, name = "Brigade Circlet", chance = 0.00641, quality = 2 }, { itemID = 9933, name = "Brigade Leggings", chance = 0.00641, quality = 2 }, { itemID = 9934, name = "Brigade Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9935, name = "Embossed Plate Shield", chance = 0.00641, quality = 2 }, { itemID = 9959, name = "Warmonger's Cloak", chance = 0.00641, quality = 2 }, { itemID = 9966, name = "Embossed Plate Armor", chance = 0.00641, quality = 2 }, { itemID = 9967, name = "Embossed Plate Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 9968, name = "Embossed Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 9969, name = "Embossed Plate Helmet", chance = 0.00641, quality = 2 }, { itemID = 9970, name = "Embossed Plate Leggings", chance = 0.00641, quality = 2 }, { itemID = 9971, name = "Embossed Plate Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9972, name = "Embossed Plate Bracers", chance = 0.00641, quality = 2 }, { itemID = 9973, name = "Embossed Plate Boots", chance = 0.00641, quality = 2 }, { itemID = 10088, name = "Gothic Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 10089, name = "Gothic Sabatons", chance = 0.00641, quality = 2 }, { itemID = 10094, name = "Gothic Plate Vambraces", chance = 0.00641, quality = 2 }, { itemID = 12012, name = "Marsh Ring", chance = 0.00641, quality = 2 }, { itemID = 12023, name = "Tellurium Necklace", chance = 0.00641, quality = 2 }, { itemID = 12031, name = "Lodestone Necklace", chance = 0.00641, quality = 2 }, { itemID = 14246, name = "Darkmist Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 14247, name = "Lunar Mantle", chance = 0.00641, quality = 2 }, { itemID = 14252, name = "Lunar Coronet", chance = 0.00641, quality = 2 }, { itemID = 14257, name = "Lunar Leggings", chance = 0.00641, quality = 2 }, { itemID = 14258, name = "Bloodwoven Cord", chance = 0.00641, quality = 2 }, { itemID = 14260, name = "Bloodwoven Bracers", chance = 0.00641, quality = 2 }, { itemID = 14262, name = "Bloodwoven Mitts", chance = 0.00641, quality = 2 }, { itemID = 14270, name = "Gaea's Cloak", chance = 0.00641, quality = 2 }, { itemID = 14417, name = "Silksand Tunic", chance = 0.00641, quality = 2 }, { itemID = 14425, name = "Silksand Wraps", chance = 0.00641, quality = 2 }, { itemID = 14428, name = "Windchaser Footpads", chance = 0.00641, quality = 2 }, { itemID = 14431, name = "Windchaser Handguards", chance = 0.00641, quality = 2 }, { itemID = 14432, name = "Windchaser Amice", chance = 0.00641, quality = 2 }, { itemID = 14601, name = "Warden's Wraps", chance = 0.00641, quality = 2 }, { itemID = 14604, name = "Warden's Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 14652, name = "Scorpashi Sash", chance = 0.00641, quality = 2 }, { itemID = 14654, name = "Scorpashi Wristbands", chance = 0.00641, quality = 2 }, { itemID = 14656, name = "Scorpashi Cape", chance = 0.00641, quality = 2 }, { itemID = 14768, name = "Ravager's Armor", chance = 0.00641, quality = 2 }, { itemID = 14777, name = "Ravager's Shield", chance = 0.00641, quality = 2 }, { itemID = 14778, name = "Khan's Bindings", chance = 0.00641, quality = 2 }, { itemID = 14781, name = "Khan's Cloak", chance = 0.00641, quality = 2 }, { itemID = 14782, name = "Khan's Gloves", chance = 0.00641, quality = 2 }, { itemID = 14821, name = "Symbolic Breastplate", chance = 0.00641, quality = 2 }, { itemID = 14826, name = "Symbolic Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14827, name = "Symbolic Belt", chance = 0.00641, quality = 2 }, { itemID = 14828, name = "Symbolic Greaves", chance = 0.00641, quality = 2 }, { itemID = 14829, name = "Symbolic Legplates", chance = 0.00641, quality = 2 }, { itemID = 14830, name = "Symbolic Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 14831, name = "Symbolic Crown", chance = 0.00641, quality = 2 }, { itemID = 14832, name = "Symbolic Vambraces", chance = 0.00641, quality = 2 }, { itemID = 14833, name = "Tyrant's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14834, name = "Tyrant's Armguards", chance = 0.00641, quality = 2 }, { itemID = 14838, name = "Tyrant's Belt", chance = 0.00641, quality = 2 }, { itemID = 14839, name = "Tyrant's Greaves", chance = 0.00641, quality = 2 }, { itemID = 14841, name = "Tyrant's Epaulets", chance = 0.00641, quality = 2 }, { itemID = 14895, name = "Saltstone Surcoat", chance = 0.00641, quality = 2 }, { itemID = 14896, name = "Saltstone Sabatons", chance = 0.00641, quality = 2 }, { itemID = 14897, name = "Saltstone Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14898, name = "Saltstone Girdle", chance = 0.00641, quality = 2 }, { itemID = 14899, name = "Saltstone Helm", chance = 0.00641, quality = 2 }, { itemID = 14900, name = "Saltstone Legplates", chance = 0.00641, quality = 2 }, { itemID = 14901, name = "Saltstone Shoulder Pads", chance = 0.00641, quality = 2 }, { itemID = 14903, name = "Saltstone Armsplints", chance = 0.00641, quality = 2 }, { itemID = 14905, name = "Brutish Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14906, name = "Brutish Belt", chance = 0.00641, quality = 2 }, { itemID = 14909, name = "Brutish Shoulders", chance = 0.00641, quality = 2 }, { itemID = 14910, name = "Brutish Armguards", chance = 0.00641, quality = 2 }, { itemID = 14940, name = "Warbringer's Sabatons", chance = 0.00641, quality = 2 }, { itemID = 14941, name = "Warbringer's Armsplints", chance = 0.00641, quality = 2 }, { itemID = 14942, name = "Warbringer's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14943, name = "Warbringer's Belt", chance = 0.00641, quality = 2 }, { itemID = 14944, name = "Warbringer's Crown", chance = 0.00641, quality = 2 }, { itemID = 14945, name = "Warbringer's Legguards", chance = 0.00641, quality = 2 }, { itemID = 14946, name = "Warbringer's Spaulders", chance = 0.00641, quality = 2 }, { itemID = 14956, name = "Bloodforged Bindings", chance = 0.00641, quality = 2 }, { itemID = 15162, name = "Imposing Boots", chance = 0.00641, quality = 2 }, { itemID = 15166, name = "Imposing Gloves", chance = 0.00641, quality = 2 }, { itemID = 15168, name = "Imposing Pants", chance = 0.00641, quality = 2 }, { itemID = 15169, name = "Imposing Shoulders", chance = 0.00641, quality = 2 }, { itemID = 15215, name = "Furious Falchion", chance = 0.00641, quality = 2 }, { itemID = 15287, name = "Crusader Bow", chance = 0.00641, quality = 2 }, { itemID = 15370, name = "Wolf Rider's Boots", chance = 0.00641, quality = 2 }, { itemID = 15374, name = "Wolf Rider's Leggings", chance = 0.00641, quality = 2 }, { itemID = 15382, name = "Rageclaw Cloak", chance = 0.00641, quality = 2 }, { itemID = 15599, name = "Ancient Greaves", chance = 0.00641, quality = 2 }, { itemID = 15602, name = "Ancient Crown", chance = 0.00641, quality = 2 }, { itemID = 15607, name = "Ancient Legguards", chance = 0.00641, quality = 2 }, { itemID = 15608, name = "Ancient Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 15612, name = "Bonelink Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 15614, name = "Bonelink Sabatons", chance = 0.00641, quality = 2 }, { itemID = 15617, name = "Bonelink Epaulets", chance = 0.00641, quality = 2 }, { itemID = 15624, name = "Gryphon Cloak", chance = 0.00641, quality = 2 }, { itemID = 15964, name = "Silksand Star", chance = 0.00641, quality = 2 }, { itemID = 1713, name = "Ankh of Life", chance = 0.002273, quality = 3 }, { itemID = 1715, name = "Polished Jazeraint Armor", chance = 0.002273, quality = 3 }, { itemID = 2815, name = "Curve-bladed Ripper", chance = 0.002273, quality = 3 }, { itemID = 13026, name = "Heaven's Light", chance = 0.002273, quality = 3 }, { itemID = 13051, name = "Witchfury", chance = 0.002273, quality = 3 }, { itemID = 13058, name = "Khoo's Point", chance = 0.002273, quality = 3 }, { itemID = 13071, name = "Plated Fist of Hakoo", chance = 0.002273, quality = 3 }, { itemID = 13095, name = "Assault Band", chance = 0.002273, quality = 3 }, { itemID = 13100, name = "Furen's Boots", chance = 0.002273, quality = 3 }, { itemID = 13115, name = "Sheepshear Mantle", chance = 0.002273, quality = 3 }, { itemID = 13145, name = "Enormous Ogre Belt", chance = 0.002273, quality = 3 }, { itemID = 7517, name = "Gossamer Tunic", chance = 0.008772, quality = 2 }, { itemID = 7518, name = "Gossamer Robe", chance = 0.008772, quality = 2 }, { itemID = 7527, name = "Cabalist Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 7557, name = "Gossamer Rod", chance = 0.008772, quality = 2 }, { itemID = 8106, name = "Hibernal Armor", chance = 0.008772, quality = 2 }, { itemID = 8113, name = "Hibernal Robe", chance = 0.008772, quality = 2 }, { itemID = 8119, name = "Heraldic Breastplate", chance = 0.008772, quality = 2 }, { itemID = 8126, name = "Myrmidon's Breastplate", chance = 0.008772, quality = 2 }, { itemID = 8131, name = "Myrmidon's Helm", chance = 0.008772, quality = 2 }, { itemID = 8132, name = "Myrmidon's Leggings", chance = 0.008772, quality = 2 }, { itemID = 8133, name = "Myrmidon's Pauldrons", chance = 0.008772, quality = 2 }, { itemID = 8134, name = "Myrmidon's Defender", chance = 0.008772, quality = 2 }, { itemID = 8247, name = "Imperial Red Bracers", chance = 0.008772, quality = 2 }, { itemID = 8248, name = "Imperial Red Cloak", chance = 0.008772, quality = 2 }, { itemID = 8253, name = "Imperial Red Sash", chance = 0.008772, quality = 2 }, { itemID = 8255, name = "Serpentskin Girdle", chance = 0.008772, quality = 2 }, { itemID = 8257, name = "Serpentskin Bracers", chance = 0.008772, quality = 2 }, { itemID = 8259, name = "Serpentskin Cloak", chance = 0.008772, quality = 2 }, { itemID = 8266, name = "Ebonhold Cloak", chance = 0.008772, quality = 2 }, { itemID = 8274, name = "Valorous Chestguard", chance = 0.008772, quality = 2 }, { itemID = 8282, name = "Valorous Shield", chance = 0.008772, quality = 2 }, { itemID = 9940, name = "Abjurer's Hood", chance = 0.008772, quality = 2 }, { itemID = 9942, name = "Abjurer's Pants", chance = 0.008772, quality = 2 }, { itemID = 9953, name = "Chieftain's Headdress", chance = 0.008772, quality = 2 }, { itemID = 9954, name = "Chieftain's Leggings", chance = 0.008772, quality = 2 }, { itemID = 9955, name = "Chieftain's Shoulders", chance = 0.008772, quality = 2 }, { itemID = 9957, name = "Warmonger's Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 9958, name = "Warmonger's Buckler", chance = 0.008772, quality = 2 }, { itemID = 10058, name = "Duskwoven Sandals", chance = 0.008772, quality = 2 }, { itemID = 10059, name = "Duskwoven Bracers", chance = 0.008772, quality = 2 }, { itemID = 10061, name = "Duskwoven Turban", chance = 0.008772, quality = 2 }, { itemID = 10062, name = "Duskwoven Gloves", chance = 0.008772, quality = 2 }, { itemID = 10063, name = "Duskwoven Amice", chance = 0.008772, quality = 2 }, { itemID = 10068, name = "Righteous Boots", chance = 0.008772, quality = 2 }, { itemID = 10072, name = "Righteous Gloves", chance = 0.008772, quality = 2 }, { itemID = 10075, name = "Righteous Spaulders", chance = 0.008772, quality = 2 }, { itemID = 10080, name = "Lord's Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 10081, name = "Lord's Girdle", chance = 0.008772, quality = 2 }, { itemID = 10082, name = "Lord's Boots", chance = 0.008772, quality = 2 }, { itemID = 10083, name = "Lord's Crown", chance = 0.008772, quality = 2 }, { itemID = 10129, name = "Revenant Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 10130, name = "Revenant Girdle", chance = 0.008772, quality = 2 }, { itemID = 10131, name = "Revenant Boots", chance = 0.008772, quality = 2 }, { itemID = 10132, name = "Revenant Helmet", chance = 0.008772, quality = 2 }, { itemID = 10134, name = "Revenant Shoulders", chance = 0.008772, quality = 2 }, { itemID = 10185, name = "Swashbuckler's Cape", chance = 0.008772, quality = 2 }, { itemID = 10191, name = "Crusader's Armguards", chance = 0.008772, quality = 2 }, { itemID = 10194, name = "Crusader's Cloak", chance = 0.008772, quality = 2 }, { itemID = 10208, name = "Overlord's Legplates", chance = 0.008772, quality = 2 }, { itemID = 10209, name = "Overlord's Spaulders", chance = 0.008772, quality = 2 }, { itemID = 10239, name = "Heavy Lamellar Vambraces", chance = 0.008772, quality = 2 }, { itemID = 10243, name = "Heavy Lamellar Girdle", chance = 0.008772, quality = 2 }, { itemID = 11989, name = "Vanadium Loop", chance = 0.008772, quality = 2 }, { itemID = 12001, name = "Onyx Ring", chance = 0.008772, quality = 2 }, { itemID = 12024, name = "Vanadium Talisman", chance = 0.008772, quality = 2 }, { itemID = 12044, name = "Arctic Pendant", chance = 0.008772, quality = 2 }, { itemID = 14265, name = "Bloodwoven Wraps", chance = 0.008772, quality = 2 }, { itemID = 14267, name = "Bloodwoven Jerkin", chance = 0.008772, quality = 2 }, { itemID = 14274, name = "Gaea's Leggings", chance = 0.008772, quality = 2 }, { itemID = 14278, name = "Opulent Mantle", chance = 0.008772, quality = 2 }, { itemID = 14282, name = "Opulent Gloves", chance = 0.008772, quality = 2 }, { itemID = 14285, name = "Opulent Boots", chance = 0.008772, quality = 2 }, { itemID = 14286, name = "Opulent Belt", chance = 0.008772, quality = 2 }, { itemID = 14289, name = "Arachnidian Girdle", chance = 0.008772, quality = 2 }, { itemID = 14290, name = "Arachnidian Footpads", chance = 0.008772, quality = 2 }, { itemID = 14291, name = "Arachnidian Bracelets", chance = 0.008772, quality = 2 }, { itemID = 14294, name = "Arachnidian Gloves", chance = 0.008772, quality = 2 }, { itemID = 14441, name = "Venomshroud Mask", chance = 0.008772, quality = 2 }, { itemID = 14450, name = "Highborne Cloak", chance = 0.008772, quality = 2 }, { itemID = 14662, name = "Keeper's Hooves", chance = 0.008772, quality = 2 }, { itemID = 14666, name = "Keeper's Gloves", chance = 0.008772, quality = 2 }, { itemID = 14669, name = "Keeper's Mantle", chance = 0.008772, quality = 2 }, { itemID = 14792, name = "Protector Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 14793, name = "Protector Waistband", chance = 0.008772, quality = 2 }, { itemID = 14794, name = "Protector Ankleguards", chance = 0.008772, quality = 2 }, { itemID = 14797, name = "Protector Pads", chance = 0.008772, quality = 2 }, { itemID = 14846, name = "Sunscale Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 14848, name = "Sunscale Sabatons", chance = 0.008772, quality = 2 }, { itemID = 14851, name = "Sunscale Spaulders", chance = 0.008772, quality = 2 }, { itemID = 14904, name = "Brutish Breastplate", chance = 0.008772, quality = 2 }, { itemID = 14912, name = "Brutish Shield", chance = 0.008772, quality = 2 }, { itemID = 14920, name = "Jade Legplates", chance = 0.008772, quality = 2 }, { itemID = 14923, name = "Lofty Armguards", chance = 0.008772, quality = 2 }, { itemID = 14948, name = "Bloodforged Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 14952, name = "Bloodforged Helmet", chance = 0.008772, quality = 2 }, { itemID = 14954, name = "Bloodforged Shield", chance = 0.008772, quality = 2 }, { itemID = 14957, name = "High Chief's Sabatons", chance = 0.008772, quality = 2 }, { itemID = 14960, name = "High Chief's Belt", chance = 0.008772, quality = 2 }, { itemID = 15171, name = "Potent Boots", chance = 0.008772, quality = 2 }, { itemID = 15174, name = "Potent Gloves", chance = 0.008772, quality = 2 }, { itemID = 15175, name = "Potent Helmet", chance = 0.008772, quality = 2 }, { itemID = 15176, name = "Potent Pants", chance = 0.008772, quality = 2 }, { itemID = 15182, name = "Praetorian Wristbands", chance = 0.008772, quality = 2 }, { itemID = 15183, name = "Praetorian Cloak", chance = 0.008772, quality = 2 }, { itemID = 15216, name = "Rune Sword", chance = 0.008772, quality = 2 }, { itemID = 15245, name = "Vorpal Dagger", chance = 0.008772, quality = 2 }, { itemID = 15263, name = "Royal Mallet", chance = 0.008772, quality = 2 }, { itemID = 15279, name = "Ivory Wand", chance = 0.008772, quality = 2 }, { itemID = 15291, name = "Harpy Needler", chance = 0.008772, quality = 2 }, { itemID = 15323, name = "Percussion Shotgun", chance = 0.008772, quality = 2 }, { itemID = 15381, name = "Rageclaw Chestguard", chance = 0.008772, quality = 2 }, { itemID = 15384, name = "Rageclaw Helm", chance = 0.008772, quality = 2 }, { itemID = 15387, name = "Jadefire Bracelets", chance = 0.008772, quality = 2 }, { itemID = 15621, name = "Gryphon Mail Buckler", chance = 0.008772, quality = 2 }, { itemID = 15622, name = "Gryphon Mail Breastplate", chance = 0.008772, quality = 2 }, { itemID = 15623, name = "Gryphon Mail Crown", chance = 0.008772, quality = 2 }, { itemID = 15627, name = "Gryphon Mail Legguards", chance = 0.008772, quality = 2 }, { itemID = 15637, name = "Formidable Legguards", chance = 0.008772, quality = 2 }, { itemID = 15639, name = "Ironhide Bracers", chance = 0.008772, quality = 2 }, { itemID = 15641, name = "Ironhide Belt", chance = 0.008772, quality = 2 }, { itemID = 15649, name = "Merciless Bracers", chance = 0.008772, quality = 2 }, { itemID = 15652, name = "Merciless Cloak", chance = 0.008772, quality = 2 }, { itemID = 15937, name = "Hibernal Sphere", chance = 0.008772, quality = 2 }, { itemID = 15982, name = "Bloodwoven Rod", chance = 0.008772, quality = 2 }, { itemID = 3936, name = "Crochet Belt", chance = 0.125, quality = 0 }, { itemID = 3937, name = "Crochet Boots", chance = 0.125, quality = 0 }, { itemID = 3938, name = "Crochet Bracers", chance = 0.125, quality = 0 }, { itemID = 3939, name = "Crochet Cloak", chance = 0.125, quality = 0 }, { itemID = 3940, name = "Crochet Gloves", chance = 0.125, quality = 0 }, { itemID = 3941, name = "Crochet Pants", chance = 0.125, quality = 0 }, { itemID = 3942, name = "Crochet Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3943, name = "Crochet Vest", chance = 0.125, quality = 0 }, { itemID = 3961, name = "Thick Leather Belt", chance = 0.125, quality = 0 }, { itemID = 3962, name = "Thick Leather Boots", chance = 0.125, quality = 0 }, { itemID = 3963, name = "Thick Leather Bracers", chance = 0.125, quality = 0 }, { itemID = 3964, name = "Thick Cloak", chance = 0.125, quality = 0 }, { itemID = 3965, name = "Thick Leather Gloves", chance = 0.125, quality = 0 }, { itemID = 3966, name = "Thick Leather Pants", chance = 0.125, quality = 0 }, { itemID = 3967, name = "Thick Leather Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3968, name = "Thick Leather Tunic", chance = 0.125, quality = 0 }, { itemID = 3986, name = "Protective Pavise", chance = 0.125, quality = 0 }, { itemID = 3989, name = "Blocking Targe", chance = 0.125, quality = 0 }, { itemID = 4000, name = "Overlinked Chain Belt", chance = 0.125, quality = 0 }, { itemID = 4001, name = "Overlinked Chain Boots", chance = 0.125, quality = 0 }, { itemID = 4002, name = "Overlinked Chain Bracers", chance = 0.125, quality = 0 }, { itemID = 4003, name = "Overlinked Chain Cloak", chance = 0.125, quality = 0 }, { itemID = 4004, name = "Overlinked Chain Gloves", chance = 0.125, quality = 0 }, { itemID = 4005, name = "Overlinked Chain Pants", chance = 0.125, quality = 0 }, { itemID = 4006, name = "Overlinked Chain Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 4007, name = "Overlinked Chain Armor", chance = 0.125, quality = 0 }, { itemID = 4017, name = "Sharp Shortsword", chance = 0.125, quality = 0 }, { itemID = 4018, name = "Whetted Claymore", chance = 0.125, quality = 0 }, { itemID = 4019, name = "Heavy Flint Axe", chance = 0.125, quality = 0 }, { itemID = 4020, name = "Splintering Battle Axe", chance = 0.125, quality = 0 }, { itemID = 4021, name = "Blunting Mace", chance = 0.125, quality = 0 }, { itemID = 4022, name = "Crushing Maul", chance = 0.125, quality = 0 }, { itemID = 4023, name = "Fine Pointed Dagger", chance = 0.125, quality = 0 }, { itemID = 4024, name = "Heavy War Staff", chance = 0.125, quality = 0 }, { itemID = 4025, name = "Balanced Long Bow", chance = 0.125, quality = 0 }, { itemID = 4026, name = "Sentinel Musket", chance = 0.125, quality = 0 }, { itemID = 8749, name = "Crochet Hat", chance = 0.125, quality = 0 }, { itemID = 8750, name = "Thick Leather Hat", chance = 0.125, quality = 0 }, { itemID = 8751, name = "Overlinked Coif", chance = 0.125, quality = 0 }, { itemID = 13824, name = "Recurve Long Bow", chance = 0.125, quality = 0 }, { itemID = 1639, name = "Grinning Axe", chance = 0.009091, quality = 2 }, { itemID = 3208, name = "Conk Hammer", chance = 0.009091, quality = 2 }, { itemID = 4089, name = "Ricochet Blunderbuss", chance = 0.009091, quality = 2 }, { itemID = 7528, name = "Cabalist Leggings", chance = 0.009091, quality = 2 }, { itemID = 7536, name = "Champion's Wall Shield", chance = 0.009091, quality = 2 }, { itemID = 7537, name = "Gothic Shield", chance = 0.009091, quality = 2 }, { itemID = 7538, name = "Champion's Armor", chance = 0.009091, quality = 2 }, { itemID = 7539, name = "Champion's Leggings", chance = 0.009091, quality = 2 }, { itemID = 7553, name = "Band of the Unicorn", chance = 0.009091, quality = 2 }, { itemID = 8111, name = "Hibernal Mantle", chance = 0.009091, quality = 2 }, { itemID = 8112, name = "Hibernal Pants", chance = 0.009091, quality = 2 }, { itemID = 8115, name = "Hibernal Cowl", chance = 0.009091, quality = 2 }, { itemID = 8122, name = "Heraldic Headpiece", chance = 0.009091, quality = 2 }, { itemID = 8123, name = "Heraldic Leggings", chance = 0.009091, quality = 2 }, { itemID = 8124, name = "Heraldic Spaulders", chance = 0.009091, quality = 2 }, { itemID = 8125, name = "Myrmidon's Bracers", chance = 0.009091, quality = 2 }, { itemID = 8128, name = "Myrmidon's Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 8129, name = "Myrmidon's Girdle", chance = 0.009091, quality = 2 }, { itemID = 8130, name = "Myrmidon's Greaves", chance = 0.009091, quality = 2 }, { itemID = 8279, name = "Valorous Helm", chance = 0.009091, quality = 2 }, { itemID = 8280, name = "Valorous Legguards", chance = 0.009091, quality = 2 }, { itemID = 8281, name = "Valorous Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 9905, name = "Royal Blouse", chance = 0.009091, quality = 2 }, { itemID = 9913, name = "Royal Gown", chance = 0.009091, quality = 2 }, { itemID = 9914, name = "Royal Scepter", chance = 0.009091, quality = 2 }, { itemID = 9924, name = "Tracker's Tunic", chance = 0.009091, quality = 2 }, { itemID = 9936, name = "Abjurer's Boots", chance = 0.009091, quality = 2 }, { itemID = 9937, name = "Abjurer's Bands", chance = 0.009091, quality = 2 }, { itemID = 9938, name = "Abjurer's Cloak", chance = 0.009091, quality = 2 }, { itemID = 9939, name = "Abjurer's Gloves", chance = 0.009091, quality = 2 }, { itemID = 9941, name = "Abjurer's Mantle", chance = 0.009091, quality = 2 }, { itemID = 9945, name = "Abjurer's Sash", chance = 0.009091, quality = 2 }, { itemID = 9947, name = "Chieftain's Belt", chance = 0.009091, quality = 2 }, { itemID = 9948, name = "Chieftain's Boots", chance = 0.009091, quality = 2 }, { itemID = 9949, name = "Chieftain's Bracers", chance = 0.009091, quality = 2 }, { itemID = 9952, name = "Chieftain's Gloves", chance = 0.009091, quality = 2 }, { itemID = 9962, name = "Warmonger's Greaves", chance = 0.009091, quality = 2 }, { itemID = 9963, name = "Warmonger's Circlet", chance = 0.009091, quality = 2 }, { itemID = 9964, name = "Warmonger's Leggings", chance = 0.009091, quality = 2 }, { itemID = 9965, name = "Warmonger's Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 10060, name = "Duskwoven Cape", chance = 0.009091, quality = 2 }, { itemID = 10066, name = "Duskwoven Sash", chance = 0.009091, quality = 2 }, { itemID = 10067, name = "Righteous Waistguard", chance = 0.009091, quality = 2 }, { itemID = 10069, name = "Righteous Bracers", chance = 0.009091, quality = 2 }, { itemID = 10071, name = "Righteous Cloak", chance = 0.009091, quality = 2 }, { itemID = 10076, name = "Lord's Armguards", chance = 0.009091, quality = 2 }, { itemID = 10079, name = "Lord's Cape", chance = 0.009091, quality = 2 }, { itemID = 10086, name = "Gothic Plate Armor", chance = 0.009091, quality = 2 }, { itemID = 10127, name = "Revenant Bracers", chance = 0.009091, quality = 2 }, { itemID = 10201, name = "Overlord's Greaves", chance = 0.009091, quality = 2 }, { itemID = 10202, name = "Overlord's Vambraces", chance = 0.009091, quality = 2 }, { itemID = 10205, name = "Overlord's Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 10206, name = "Overlord's Girdle", chance = 0.009091, quality = 2 }, { itemID = 10207, name = "Overlord's Crown", chance = 0.009091, quality = 2 }, { itemID = 11975, name = "Topaz Ring", chance = 0.009091, quality = 2 }, { itemID = 12013, name = "Desert Ring", chance = 0.009091, quality = 2 }, { itemID = 12032, name = "Onyx Choker", chance = 0.009091, quality = 2 }, { itemID = 14263, name = "Bloodwoven Mask", chance = 0.009091, quality = 2 }, { itemID = 14264, name = "Bloodwoven Pants", chance = 0.009091, quality = 2 }, { itemID = 14271, name = "Gaea's Circlet", chance = 0.009091, quality = 2 }, { itemID = 14273, name = "Gaea's Amice", chance = 0.009091, quality = 2 }, { itemID = 14279, name = "Opulent Bracers", chance = 0.009091, quality = 2 }, { itemID = 14280, name = "Opulent Cape", chance = 0.009091, quality = 2 }, { itemID = 14292, name = "Arachnidian Cape", chance = 0.009091, quality = 2 }, { itemID = 14427, name = "Windchaser Wraps", chance = 0.009091, quality = 2 }, { itemID = 14434, name = "Windchaser Robes", chance = 0.009091, quality = 2 }, { itemID = 14438, name = "Venomshroud Boots", chance = 0.009091, quality = 2 }, { itemID = 14442, name = "Venomshroud Mitts", chance = 0.009091, quality = 2 }, { itemID = 14443, name = "Venomshroud Mantle", chance = 0.009091, quality = 2 }, { itemID = 14446, name = "Venomshroud Belt", chance = 0.009091, quality = 2 }, { itemID = 14655, name = "Scorpashi Breastplate", chance = 0.009091, quality = 2 }, { itemID = 14658, name = "Scorpashi Skullcap", chance = 0.009091, quality = 2 }, { itemID = 14661, name = "Keeper's Cord", chance = 0.009091, quality = 2 }, { itemID = 14663, name = "Keeper's Bindings", chance = 0.009091, quality = 2 }, { itemID = 14665, name = "Keeper's Cloak", chance = 0.009091, quality = 2 }, { itemID = 14779, name = "Khan's Chestpiece", chance = 0.009091, quality = 2 }, { itemID = 14780, name = "Khan's Buckler", chance = 0.009091, quality = 2 }, { itemID = 14785, name = "Khan's Helmet", chance = 0.009091, quality = 2 }, { itemID = 14788, name = "Protector Armguards", chance = 0.009091, quality = 2 }, { itemID = 14791, name = "Protector Cape", chance = 0.009091, quality = 2 }, { itemID = 14835, name = "Tyrant's Chestpiece", chance = 0.009091, quality = 2 }, { itemID = 14842, name = "Tyrant's Shield", chance = 0.009091, quality = 2 }, { itemID = 14847, name = "Sunscale Belt", chance = 0.009091, quality = 2 }, { itemID = 14853, name = "Sunscale Wristguards", chance = 0.009091, quality = 2 }, { itemID = 14907, name = "Brutish Helmet", chance = 0.009091, quality = 2 }, { itemID = 14908, name = "Brutish Legguards", chance = 0.009091, quality = 2 }, { itemID = 14913, name = "Jade Greaves", chance = 0.009091, quality = 2 }, { itemID = 14917, name = "Jade Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 14921, name = "Jade Epaulets", chance = 0.009091, quality = 2 }, { itemID = 14953, name = "Bloodforged Legplates", chance = 0.009091, quality = 2 }, { itemID = 14965, name = "High Chief's Bindings", chance = 0.009091, quality = 2 }, { itemID = 15167, name = "Imposing Bandana", chance = 0.009091, quality = 2 }, { itemID = 15177, name = "Potent Shoulders", chance = 0.009091, quality = 2 }, { itemID = 15227, name = "Diamond-Tip Bludgeon", chance = 0.009091, quality = 2 }, { itemID = 15235, name = "Crescent Edge", chance = 0.009091, quality = 2 }, { itemID = 15252, name = "Tusker Sword", chance = 0.009091, quality = 2 }, { itemID = 15379, name = "Rageclaw Boots", chance = 0.009091, quality = 2 }, { itemID = 15383, name = "Rageclaw Gloves", chance = 0.009091, quality = 2 }, { itemID = 15385, name = "Rageclaw Leggings", chance = 0.009091, quality = 2 }, { itemID = 15386, name = "Rageclaw Shoulder Pads", chance = 0.009091, quality = 2 }, { itemID = 15392, name = "Jadefire Cloak", chance = 0.009091, quality = 2 }, { itemID = 15619, name = "Gryphon Mail Belt", chance = 0.009091, quality = 2 }, { itemID = 15628, name = "Gryphon Mail Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 15629, name = "Formidable Bracers", chance = 0.009091, quality = 2 }, { itemID = 15630, name = "Formidable Sabatons", chance = 0.009091, quality = 2 }, { itemID = 15635, name = "Formidable Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 15636, name = "Formidable Belt", chance = 0.009091, quality = 2 }, { itemID = 15638, name = "Formidable Shoulder Pads", chance = 0.009091, quality = 2 }, { itemID = 15643, name = "Ironhide Cloak", chance = 0.009091, quality = 2 }, { itemID = 15965, name = "Windchaser Orb", chance = 0.009091, quality = 2 }, { itemID = 13018, name = "Executioner's Cleaver", chance = 0.0025, quality = 3 }, { itemID = 13035, name = "Serpent Slicer", chance = 0.0025, quality = 3 }, { itemID = 13039, name = "Skull Splitting Crossbow", chance = 0.0025, quality = 3 }, { itemID = 13043, name = "Blade of the Titans", chance = 0.0025, quality = 3 }, { itemID = 13055, name = "Bonechewer", chance = 0.0025, quality = 3 }, { itemID = 13076, name = "Giantslayer Bracers", chance = 0.0025, quality = 3 }, { itemID = 13089, name = "Skibi's Pendant", chance = 0.0025, quality = 3 }, { itemID = 13109, name = "Blackflame Cape", chance = 0.0025, quality = 3 }, { itemID = 13112, name = "Winged Helm", chance = 0.0025, quality = 3 }, { itemID = 13134, name = "Belt of the Gladiator", chance = 0.0025, quality = 3 }, { itemID = 943, name = "Warden Staff", chance = 0.001, quality = 4 }, { itemID = 2100, name = "Precisely Calibrated Boomstick", chance = 0.001, quality = 4 }, { itemID = 2291, name = "Kang the Decapitator", chance = 0.001, quality = 4 }, { itemID = 14550, name = "Bladebane Armguards", chance = 0.001, quality = 4 }, { itemID = 14551, name = "Edgemaster's Handguards", chance = 0.001, quality = 4 }, { itemID = 1608, name = "Skullcrusher Mace", chance = 0.00885, quality = 2 }, { itemID = 1994, name = "Ebonclaw Reaver", chance = 0.00885, quality = 2 }, { itemID = 4069, name = "Blackforge Buckler", chance = 0.00885, quality = 2 }, { itemID = 4082, name = "Blackforge Breastplate", chance = 0.00885, quality = 2 }, { itemID = 4084, name = "Blackforge Leggings", chance = 0.00885, quality = 2 }, { itemID = 4088, name = "Dreadblade", chance = 0.00885, quality = 2 }, { itemID = 4733, name = "Blackforge Pauldrons", chance = 0.00885, quality = 2 }, { itemID = 6427, name = "Mistscape Robe", chance = 0.00885, quality = 2 }, { itemID = 6430, name = "Imperial Leather Breastplate", chance = 0.00885, quality = 2 }, { itemID = 7113, name = "Mistscape Armor", chance = 0.00885, quality = 2 }, { itemID = 7519, name = "Gossamer Pants", chance = 0.00885, quality = 2 }, { itemID = 7520, name = "Gossamer Headpiece", chance = 0.00885, quality = 2 }, { itemID = 7521, name = "Gossamer Gloves", chance = 0.00885, quality = 2 }, { itemID = 7523, name = "Gossamer Shoulderpads", chance = 0.00885, quality = 2 }, { itemID = 7526, name = "Gossamer Belt", chance = 0.00885, quality = 2 }, { itemID = 7529, name = "Cabalist Helm", chance = 0.00885, quality = 2 }, { itemID = 7530, name = "Cabalist Gloves", chance = 0.00885, quality = 2 }, { itemID = 7531, name = "Cabalist Boots", chance = 0.00885, quality = 2 }, { itemID = 7532, name = "Cabalist Spaulders", chance = 0.00885, quality = 2 }, { itemID = 7535, name = "Cabalist Belt", chance = 0.00885, quality = 2 }, { itemID = 7540, name = "Champion's Helmet", chance = 0.00885, quality = 2 }, { itemID = 7541, name = "Champion's Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 7542, name = "Champion's Greaves", chance = 0.00885, quality = 2 }, { itemID = 7543, name = "Champion's Pauldrons", chance = 0.00885, quality = 2 }, { itemID = 7546, name = "Champion's Girdle", chance = 0.00885, quality = 2 }, { itemID = 7611, name = "Mistscape Stave", chance = 0.00885, quality = 2 }, { itemID = 8107, name = "Hibernal Boots", chance = 0.00885, quality = 2 }, { itemID = 8108, name = "Hibernal Bracers", chance = 0.00885, quality = 2 }, { itemID = 8109, name = "Hibernal Cloak", chance = 0.00885, quality = 2 }, { itemID = 8110, name = "Hibernal Gloves", chance = 0.00885, quality = 2 }, { itemID = 8114, name = "Hibernal Sash", chance = 0.00885, quality = 2 }, { itemID = 8116, name = "Heraldic Belt", chance = 0.00885, quality = 2 }, { itemID = 8117, name = "Heraldic Boots", chance = 0.00885, quality = 2 }, { itemID = 8118, name = "Heraldic Bracers", chance = 0.00885, quality = 2 }, { itemID = 8121, name = "Heraldic Gloves", chance = 0.00885, quality = 2 }, { itemID = 8127, name = "Myrmidon's Cape", chance = 0.00885, quality = 2 }, { itemID = 8135, name = "Chromite Shield", chance = 0.00885, quality = 2 }, { itemID = 8138, name = "Chromite Chestplate", chance = 0.00885, quality = 2 }, { itemID = 8143, name = "Chromite Legplates", chance = 0.00885, quality = 2 }, { itemID = 8199, name = "Battlefield Destroyer", chance = 0.00885, quality = 2 }, { itemID = 8273, name = "Valorous Wristguards", chance = 0.00885, quality = 2 }, { itemID = 8276, name = "Valorous Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 8277, name = "Valorous Girdle", chance = 0.00885, quality = 2 }, { itemID = 8278, name = "Valorous Greaves", chance = 0.00885, quality = 2 }, { itemID = 9911, name = "Royal Trousers", chance = 0.00885, quality = 2 }, { itemID = 9922, name = "Tracker's Leggings", chance = 0.00885, quality = 2 }, { itemID = 9951, name = "Chieftain's Cloak", chance = 0.00885, quality = 2 }, { itemID = 9956, name = "Warmonger's Bracers", chance = 0.00885, quality = 2 }, { itemID = 9960, name = "Warmonger's Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 9961, name = "Warmonger's Belt", chance = 0.00885, quality = 2 }, { itemID = 10087, name = "Gothic Plate Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 10090, name = "Gothic Plate Helmet", chance = 0.00885, quality = 2 }, { itemID = 10091, name = "Gothic Plate Leggings", chance = 0.00885, quality = 2 }, { itemID = 10092, name = "Gothic Plate Spaulders", chance = 0.00885, quality = 2 }, { itemID = 11974, name = "Aquamarine Ring", chance = 0.00885, quality = 2 }, { itemID = 11988, name = "Tellurium Band", chance = 0.00885, quality = 2 }, { itemID = 11999, name = "Lodestone Hoop", chance = 0.00885, quality = 2 }, { itemID = 12043, name = "Desert Choker", chance = 0.00885, quality = 2 }, { itemID = 14237, name = "Darkmist Armor", chance = 0.00885, quality = 2 }, { itemID = 14244, name = "Darkmist Wraps", chance = 0.00885, quality = 2 }, { itemID = 14249, name = "Lunar Vest", chance = 0.00885, quality = 2 }, { itemID = 14254, name = "Lunar Raiment", chance = 0.00885, quality = 2 }, { itemID = 14259, name = "Bloodwoven Boots", chance = 0.00885, quality = 2 }, { itemID = 14266, name = "Bloodwoven Pads", chance = 0.00885, quality = 2 }, { itemID = 14268, name = "Gaea's Cuffs", chance = 0.00885, quality = 2 }, { itemID = 14269, name = "Gaea's Slippers", chance = 0.00885, quality = 2 }, { itemID = 14272, name = "Gaea's Handwraps", chance = 0.00885, quality = 2 }, { itemID = 14276, name = "Gaea's Belt", chance = 0.00885, quality = 2 }, { itemID = 14433, name = "Windchaser Woolies", chance = 0.00885, quality = 2 }, { itemID = 14436, name = "Windchaser Coronet", chance = 0.00885, quality = 2 }, { itemID = 14439, name = "Venomshroud Armguards", chance = 0.00885, quality = 2 }, { itemID = 14440, name = "Venomshroud Cape", chance = 0.00885, quality = 2 }, { itemID = 14653, name = "Scorpashi Slippers", chance = 0.00885, quality = 2 }, { itemID = 14657, name = "Scorpashi Gloves", chance = 0.00885, quality = 2 }, { itemID = 14659, name = "Scorpashi Leggings", chance = 0.00885, quality = 2 }, { itemID = 14660, name = "Scorpashi Shoulder Pads", chance = 0.00885, quality = 2 }, { itemID = 14783, name = "Khan's Belt", chance = 0.00885, quality = 2 }, { itemID = 14784, name = "Khan's Greaves", chance = 0.00885, quality = 2 }, { itemID = 14786, name = "Khan's Legguards", chance = 0.00885, quality = 2 }, { itemID = 14787, name = "Khan's Mantle", chance = 0.00885, quality = 2 }, { itemID = 14840, name = "Tyrant's Legplates", chance = 0.00885, quality = 2 }, { itemID = 14843, name = "Tyrant's Helm", chance = 0.00885, quality = 2 }, { itemID = 14911, name = "Brutish Boots", chance = 0.00885, quality = 2 }, { itemID = 14914, name = "Jade Bracers", chance = 0.00885, quality = 2 }, { itemID = 14918, name = "Jade Belt", chance = 0.00885, quality = 2 }, { itemID = 14939, name = "Warbringer's Chestguard", chance = 0.00885, quality = 2 }, { itemID = 14947, name = "Warbringer's Shield", chance = 0.00885, quality = 2 }, { itemID = 14949, name = "Bloodforged Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 14950, name = "Bloodforged Belt", chance = 0.00885, quality = 2 }, { itemID = 14951, name = "Bloodforged Sabatons", chance = 0.00885, quality = 2 }, { itemID = 14955, name = "Bloodforged Shoulder Pads", chance = 0.00885, quality = 2 }, { itemID = 15164, name = "Imposing Vest", chance = 0.00885, quality = 2 }, { itemID = 15172, name = "Potent Bands", chance = 0.00885, quality = 2 }, { itemID = 15173, name = "Potent Cape", chance = 0.00885, quality = 2 }, { itemID = 15178, name = "Potent Belt", chance = 0.00885, quality = 2 }, { itemID = 15262, name = "Greater Maul", chance = 0.00885, quality = 2 }, { itemID = 15270, name = "Gigantic War Axe", chance = 0.00885, quality = 2 }, { itemID = 15373, name = "Wolf Rider's Headgear", chance = 0.00885, quality = 2 }, { itemID = 15376, name = "Wolf Rider's Padded Armor", chance = 0.00885, quality = 2 }, { itemID = 15378, name = "Rageclaw Belt", chance = 0.00885, quality = 2 }, { itemID = 15380, name = "Rageclaw Bracers", chance = 0.00885, quality = 2 }, { itemID = 15601, name = "Ancient Chestpiece", chance = 0.00885, quality = 2 }, { itemID = 15604, name = "Ancient Defender", chance = 0.00885, quality = 2 }, { itemID = 15609, name = "Bonelink Armor", chance = 0.00885, quality = 2 }, { itemID = 15615, name = "Bonelink Helmet", chance = 0.00885, quality = 2 }, { itemID = 15616, name = "Bonelink Legplates", chance = 0.00885, quality = 2 }, { itemID = 15618, name = "Bonelink Wall Shield", chance = 0.00885, quality = 2 }, { itemID = 15620, name = "Gryphon Mail Bracelets", chance = 0.00885, quality = 2 }, { itemID = 15625, name = "Gryphon Mail Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 15626, name = "Gryphon Mail Greaves", chance = 0.00885, quality = 2 }, { itemID = 15632, name = "Formidable Cape", chance = 0.00885, quality = 2 }, { itemID = 15980, name = "Darkmist Orb", chance = 0.00885, quality = 2 }, { itemID = 15981, name = "Lunar Sphere", chance = 0.00885, quality = 2 }, { itemID = 754, name = "Shortsword of Vengeance", chance = 0.0025, quality = 3 }, { itemID = 1720, name = "Tanglewood Staff", chance = 0.0025, quality = 3 }, { itemID = 4090, name = "Mug O' Hurt", chance = 0.0025, quality = 3 }, { itemID = 4091, name = "Widowmaker", chance = 0.0025, quality = 3 }, { itemID = 9433, name = "Forgotten Wraps", chance = 0.0025, quality = 3 }, { itemID = 13021, name = "Needle Threader", chance = 0.0025, quality = 3 }, { itemID = 13074, name = "Golem Shard Leggings", chance = 0.0025, quality = 3 }, { itemID = 13082, name = "Mountainside Buckler", chance = 0.0025, quality = 3 }, { itemID = 13102, name = "Cassandra's Grace", chance = 0.0025, quality = 3 }, { itemID = 13128, name = "High Bergg Helm", chance = 0.0025, quality = 3 }, { itemID = 871, name = "Flurry Axe", chance = 0.0008333, quality = 4 }, { itemID = 940, name = "Robes of Insight", chance = 0.0008333, quality = 4 }, { itemID = 1169, name = "Blackskull Shield", chance = 0.0008333, quality = 4 }, { itemID = 1447, name = "Ring of Saviors", chance = 0.0008333, quality = 4 }, { itemID = 60787, name = "Scythe of the Harvest", chance = 0.0008333, quality = 4 }, { itemID = 80801, name = "Cowl of Terror", chance = 0.0008333, quality = 4 }, { itemID = 55250, name = "Emberstone", chance = 0.3739, quality = 2 }, { itemID = 55251, name = "Pure Moonstone", chance = 0.2493, quality = 2 }, { itemID = 56028, name = "Plans: Sunburst Tiara", chance = 0.03, quality = 2 }, { itemID = 70107, name = "Plans: Runebound Amulet", chance = 0.03, quality = 3 }, { itemID = 70167, name = "Plans: Enchanted Emerald Gemstone", chance = 0.03, quality = 2 }, { itemID = 70127, name = "Plans: Opaline Illuminator", chance = 0.06, quality = 3 }, { itemID = 70138, name = "Plans: Golden Jade Ring", chance = 0.02, quality = 3 }, { itemID = 70148, name = "Plans: Ogre Bone Band", chance = 0.06, quality = 3 }, { itemID = 70179, name = "Plans: Opal Guided Bangles", chance = 0.06, quality = 3 }, { itemID = 70184, name = "Plans: Ornament of Restraint", chance = 0.06, quality = 3 }, { itemID = 70201, name = "Plans: Resurged Topaz Gemstone", chance = 0.06, quality = 3 }, { itemID = 70202, name = "Plans: Resilient Arcane Gemstone", chance = 0.06, quality = 3 }, { itemID = 70212, name = "Plans: Mana Binding Signet", chance = 0.005, quality = 4 } }
BossLoot[7356] = { { itemID = 1708, name = "Sweet Nectar", chance = 2, quality = 1 }, { itemID = 4306, name = "Silk Cloth", chance = 16, quality = 1 }, { itemID = 4338, name = "Mageweave Cloth", chance = 2, quality = 1 }, { itemID = 4539, name = "Goldenbark Apple", chance = 3, quality = 1 }, { itemID = 10760, name = "Swine Fists", chance = 33.3333333, quality = 3 }, { itemID = 10766, name = "Plaguerot Sprig", chance = 33.3333333, quality = 3 }, { itemID = 80744, name = "Plaguemaw's Staff of Rotting", chance = 33.3333333, quality = 3 }, { itemID = 51217, name = "Fashion Coin", chance = 1, quality = 2 } }
BossLoot[7795] = { { itemID = 862, name = "Runed Ring", chance = 0.02, quality = 3 }, { itemID = 1520, name = "Troll Sweat", chance = 22.1445, quality = 0 }, { itemID = 1645, name = "Moonberry Juice", chance = 2.38, quality = 1 }, { itemID = 1685, name = "Troll-hide Bag", chance = 0.02, quality = 1 }, { itemID = 3395, name = "Recipe: Limited Invulnerability Potion", chance = 0.02, quality = 2 }, { itemID = 3914, name = "Journeyman's Backpack", chance = 0.06, quality = 1 }, { itemID = 3928, name = "Superior Healing Potion", chance = 1.24, quality = 1 }, { itemID = 4338, name = "Mageweave Cloth", chance = 18.315, quality = 1 }, { itemID = 4419, name = "Scroll of Intellect III", chance = 0.2, quality = 1 }, { itemID = 4422, name = "Scroll of Stamina III", chance = 0.28, quality = 1 }, { itemID = 4425, name = "Scroll of Agility III", chance = 0.14, quality = 1 }, { itemID = 4426, name = "Scroll of Strength III", chance = 0.12, quality = 1 }, { itemID = 4599, name = "Cured Ham Steak", chance = 3.0636, quality = 1 }, { itemID = 4638, name = "Reinforced Steel Lockbox", chance = 0.3996, quality = 2 }, { itemID = 5616, name = "Gutwrencher", chance = 0.02, quality = 3 }, { itemID = 6149, name = "Greater Mana Potion", chance = 0.68, quality = 1 }, { itemID = 7909, name = "Aquamarine", chance = 0.0333, quality = 2 }, { itemID = 7910, name = "Star Ruby", chance = 0.1332, quality = 2 }, { itemID = 7989, name = "Plans: Mithril Spurs", chance = 0.03, quality = 2 }, { itemID = 7990, name = "Plans: Heavy Mithril Helm", chance = 0.02, quality = 2 }, { itemID = 7992, name = "Plans: Blue Glittering Axe", chance = 0.02, quality = 2 }, { itemID = 7993, name = "Plans: Dazzling Mithril Rapier", chance = 0.02, quality = 2 }, { itemID = 8029, name = "Plans: Wicked Mithril Blade", chance = 0.02, quality = 2 }, { itemID = 8151, name = "Flask of Mojo", chance = 6.8265, quality = 1 }, { itemID = 8389, name = "Pattern: Big Voodoo Pants", chance = 0.02, quality = 2 }, { itemID = 8390, name = "Pattern: Big Voodoo Cloak", chance = 0.02, quality = 2 }, { itemID = 8623, name = "OOX-17/TN Distress Beacon", chance = 0.7, quality = 2 }, { itemID = 9234, name = "Tiara of the Deep", quality = 1 }, { itemID = 9242, name = "Ancient Tablet", chance = 1.2987, quality = 0 }, { itemID = 9243, name = "Shriveled Heart", chance = 0.6993, quality = 2 }, { itemID = 9295, name = "Recipe: Invisibility Potion", chance = 0.04, quality = 2 }, { itemID = 9298, name = "Recipe: Elixir of Giants", chance = 0.02, quality = 2 }, { itemID = 9481, name = "The Minotaur", chance = 0.02, quality = 3 }, { itemID = 9483, name = "Flaming Incinerator", chance = 0.02, quality = 3 }, { itemID = 9484, name = "Spellshock Leggings", chance = 0.01, quality = 3 }, { itemID = 9512, name = "Blackmetal Cape", chance = 0.02, quality = 3 }, { itemID = 10300, name = "Pattern: Red Mageweave Vest", chance = 0.02, quality = 2 }, { itemID = 10315, name = "Pattern: Red Mageweave Shoulders", chance = 0.1, quality = 2 }, { itemID = 10320, name = "Pattern: Red Mageweave Headband", chance = 0.1, quality = 2 }, { itemID = 10604, name = "Schematic: Mithril Heavy-bore Rifle", chance = 0.02, quality = 2 }, { itemID = 10661, name = "Second Mosh'aru Tablet", quality = 1 }, { itemID = 11202, name = "Formula: Enchant Shield - Stamina", chance = 0.02, quality = 2 }, { itemID = 11208, name = "Formula: Enchant Weapon - Demonslaying", chance = 0.02, quality = 2 }, { itemID = 11225, name = "Formula: Enchant Bracer - Greater Stamina", chance = 0.02, quality = 2 }, { itemID = 12682, name = "Plans: Thorium Armor", chance = 0.04, quality = 2 }, { itemID = 12683, name = "Plans: Thorium Belt", chance = 0.02, quality = 2 }, { itemID = 14466, name = "Pattern: Frostweave Tunic", chance = 0.02, quality = 2 }, { itemID = 14479, name = "Pattern: Brightcloth Gloves", chance = 0.06, quality = 2 }, { itemID = 14484, name = "Pattern: Brightcloth Cloak", chance = 0.02, quality = 2 }, { itemID = 15731, name = "Pattern: Runic Leather Gauntlets", chance = 0.02, quality = 2 }, { itemID = 15737, name = "Pattern: Chimeric Boots", chance = 0.02, quality = 2 }, { itemID = 17413, name = "Codex: Prayer of Fortitude", chance = 0.22, quality = 3 }, { itemID = 17682, name = "Book: Gift of the Wild", chance = 0.06, quality = 3 }, { itemID = 866, name = "Monk's Staff", chance = 0.01124, quality = 2 }, { itemID = 1640, name = "Monstrous War Axe", chance = 0.01124, quality = 2 }, { itemID = 4045, name = "Mistscape Bracers", chance = 0.01124, quality = 2 }, { itemID = 4047, name = "Mistscape Boots", chance = 0.01124, quality = 2 }, { itemID = 4061, name = "Imperial Leather Bracers", chance = 0.01124, quality = 2 }, { itemID = 4063, name = "Imperial Leather Gloves", chance = 0.01124, quality = 2 }, { itemID = 4734, name = "Mistscape Mantle", chance = 0.01124, quality = 2 }, { itemID = 4736, name = "Mistscape Sash", chance = 0.01124, quality = 2 }, { itemID = 4738, name = "Imperial Leather Belt", chance = 0.01124, quality = 2 }, { itemID = 6424, name = "Blackforge Cape", chance = 0.01124, quality = 2 }, { itemID = 6426, name = "Blackforge Bracers", chance = 0.01124, quality = 2 }, { itemID = 6428, name = "Mistscape Gloves", chance = 0.01124, quality = 2 }, { itemID = 6431, name = "Imperial Leather Boots", chance = 0.01124, quality = 2 }, { itemID = 6433, name = "Imperial Leather Helm", chance = 0.01124, quality = 2 }, { itemID = 7470, name = "Regal Wizard Hat", chance = 0.01124, quality = 2 }, { itemID = 7471, name = "Regal Gloves", chance = 0.01124, quality = 2 }, { itemID = 7473, name = "Regal Mantle", chance = 0.01124, quality = 2 }, { itemID = 7478, name = "Ranger Leggings", chance = 0.01124, quality = 2 }, { itemID = 7479, name = "Ranger Helm", chance = 0.01124, quality = 2 }, { itemID = 7481, name = "Ranger Boots", chance = 0.01124, quality = 2 }, { itemID = 7482, name = "Ranger Shoulders", chance = 0.01124, quality = 2 }, { itemID = 7487, name = "Captain's Leggings", chance = 0.01124, quality = 2 }, { itemID = 7488, name = "Captain's Circlet", chance = 0.01124, quality = 2 }, { itemID = 7490, name = "Captain's Boots", chance = 0.01124, quality = 2 }, { itemID = 7491, name = "Captain's Shoulderguards", chance = 0.01124, quality = 2 }, { itemID = 7496, name = "Field Plate Shield", chance = 0.01124, quality = 2 }, { itemID = 8194, name = "Goblin Nutcracker", chance = 0.01124, quality = 2 }, { itemID = 8196, name = "Ebon Scimitar", chance = 0.01124, quality = 2 }, { itemID = 9874, name = "Sorcerer Drape", chance = 0.01124, quality = 2 }, { itemID = 9882, name = "Sorcerer Sphere", chance = 0.01124, quality = 2 }, { itemID = 9883, name = "Sorcerer Pants", chance = 0.01124, quality = 2 }, { itemID = 9884, name = "Sorcerer Robe", chance = 0.01124, quality = 2 }, { itemID = 9887, name = "Huntsman's Armor", chance = 0.01124, quality = 2 }, { itemID = 9893, name = "Huntsman's Leggings", chance = 0.01124, quality = 2 }, { itemID = 9897, name = "Jazeraint Chestguard", chance = 0.01124, quality = 2 }, { itemID = 9899, name = "Jazeraint Shield", chance = 0.01124, quality = 2 }, { itemID = 9903, name = "Jazeraint Leggings", chance = 0.01124, quality = 2 }, { itemID = 9908, name = "Royal Cape", chance = 0.01124, quality = 2 }, { itemID = 9909, name = "Royal Bands", chance = 0.01124, quality = 2 }, { itemID = 9919, name = "Tracker's Cloak", chance = 0.01124, quality = 2 }, { itemID = 9926, name = "Brigade Boots", chance = 0.01124, quality = 2 }, { itemID = 9927, name = "Brigade Bracers", chance = 0.01124, quality = 2 }, { itemID = 9930, name = "Brigade Gauntlets", chance = 0.01124, quality = 2 }, { itemID = 9931, name = "Brigade Girdle", chance = 0.01124, quality = 2 }, { itemID = 11973, name = "Hematite Link", chance = 0.01124, quality = 2 }, { itemID = 11987, name = "Iridium Circle", chance = 0.01124, quality = 2 }, { itemID = 11998, name = "Jet Loop", chance = 0.01124, quality = 2 }, { itemID = 12042, name = "Marsh Chain", chance = 0.01124, quality = 2 }, { itemID = 14230, name = "Embersilk Tunic", chance = 0.01124, quality = 2 }, { itemID = 14234, name = "Embersilk Robes", chance = 0.01124, quality = 2 }, { itemID = 14242, name = "Darkmist Pants", chance = 0.01124, quality = 2 }, { itemID = 14243, name = "Darkmist Mantle", chance = 0.01124, quality = 2 }, { itemID = 14250, name = "Lunar Slippers", chance = 0.01124, quality = 2 }, { itemID = 14253, name = "Lunar Handwraps", chance = 0.01124, quality = 2 }, { itemID = 14261, name = "Bloodwoven Cloak", chance = 0.01124, quality = 2 }, { itemID = 14421, name = "Silksand Circlet", chance = 0.01124, quality = 2 }, { itemID = 14424, name = "Silksand Legwraps", chance = 0.01124, quality = 2 }, { itemID = 14429, name = "Windchaser Cuffs", chance = 0.01124, quality = 2 }, { itemID = 14430, name = "Windchaser Cloak", chance = 0.01124, quality = 2 }, { itemID = 14435, name = "Windchaser Cinch", chance = 0.01124, quality = 2 }, { itemID = 14599, name = "Warden's Footpads", chance = 0.01124, quality = 2 }, { itemID = 14605, name = "Warden's Woolies", chance = 0.01124, quality = 2 }, { itemID = 14769, name = "Ravager's Sandals", chance = 0.01124, quality = 2 }, { itemID = 14774, name = "Ravager's Crown", chance = 0.01124, quality = 2 }, { itemID = 14775, name = "Ravager's Woolies", chance = 0.01124, quality = 2 }, { itemID = 14776, name = "Ravager's Mantle", chance = 0.01124, quality = 2 }, { itemID = 14825, name = "Symbolic Crest", chance = 0.01124, quality = 2 }, { itemID = 15156, name = "Nocturnal Cap", chance = 0.01124, quality = 2 }, { itemID = 15159, name = "Nocturnal Tunic", chance = 0.01124, quality = 2 }, { itemID = 15161, name = "Imposing Belt", chance = 0.01124, quality = 2 }, { itemID = 15163, name = "Imposing Bracers", chance = 0.01124, quality = 2 }, { itemID = 15165, name = "Imposing Cape", chance = 0.01124, quality = 2 }, { itemID = 15244, name = "Razor Blade", chance = 0.01124, quality = 2 }, { itemID = 15251, name = "Headstriker Sword", chance = 0.01124, quality = 2 }, { itemID = 15363, name = "Trickster's Headdress", chance = 0.01124, quality = 2 }, { itemID = 15369, name = "Wolf Rider's Belt", chance = 0.01124, quality = 2 }, { itemID = 15372, name = "Wolf Rider's Gloves", chance = 0.01124, quality = 2 }, { itemID = 15375, name = "Wolf Rider's Shoulder Pads", chance = 0.01124, quality = 2 }, { itemID = 15377, name = "Wolf Rider's Wristbands", chance = 0.01124, quality = 2 }, { itemID = 15591, name = "Steadfast Breastplate", chance = 0.01124, quality = 2 }, { itemID = 15592, name = "Steadfast Buckler", chance = 0.01124, quality = 2 }, { itemID = 15593, name = "Steadfast Coronet", chance = 0.01124, quality = 2 }, { itemID = 15597, name = "Steadfast Shoulders", chance = 0.01124, quality = 2 }, { itemID = 15600, name = "Ancient Vambraces", chance = 0.01124, quality = 2 }, { itemID = 15605, name = "Ancient Gauntlets", chance = 0.01124, quality = 2 }, { itemID = 15610, name = "Bonelink Bracers", chance = 0.01124, quality = 2 }, { itemID = 15611, name = "Bonelink Cape", chance = 0.01124, quality = 2 }, { itemID = 15613, name = "Bonelink Belt", chance = 0.01124, quality = 2 }, { itemID = 15979, name = "Embersilk Stave", chance = 0.01124, quality = 2 }, { itemID = 1613, name = "Spiritchaser Staff", chance = 0.00641, quality = 2 }, { itemID = 3187, name = "Sacrificial Kris", chance = 0.00641, quality = 2 }, { itemID = 3430, name = "Sniper Rifle", chance = 0.00641, quality = 2 }, { itemID = 4046, name = "Mistscape Pants", chance = 0.00641, quality = 2 }, { itemID = 4062, name = "Imperial Leather Pants", chance = 0.00641, quality = 2 }, { itemID = 4080, name = "Blackforge Cowl", chance = 0.00641, quality = 2 }, { itemID = 4083, name = "Blackforge Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 4737, name = "Imperial Leather Spaulders", chance = 0.00641, quality = 2 }, { itemID = 5216, name = "Umbral Wand", chance = 0.00641, quality = 2 }, { itemID = 6423, name = "Blackforge Greaves", chance = 0.00641, quality = 2 }, { itemID = 6425, name = "Blackforge Girdle", chance = 0.00641, quality = 2 }, { itemID = 6429, name = "Mistscape Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 7332, name = "Regal Armor", chance = 0.00641, quality = 2 }, { itemID = 7468, name = "Regal Robe", chance = 0.00641, quality = 2 }, { itemID = 7469, name = "Regal Leggings", chance = 0.00641, quality = 2 }, { itemID = 7477, name = "Ranger Tunic", chance = 0.00641, quality = 2 }, { itemID = 7486, name = "Captain's Breastplate", chance = 0.00641, quality = 2 }, { itemID = 7495, name = "Captain's Buckler", chance = 0.00641, quality = 2 }, { itemID = 7522, name = "Gossamer Boots", chance = 0.00641, quality = 2 }, { itemID = 7524, name = "Gossamer Cape", chance = 0.00641, quality = 2 }, { itemID = 7525, name = "Gossamer Bracers", chance = 0.00641, quality = 2 }, { itemID = 7533, name = "Cabalist Cloak", chance = 0.00641, quality = 2 }, { itemID = 7534, name = "Cabalist Bracers", chance = 0.00641, quality = 2 }, { itemID = 7544, name = "Champion's Cape", chance = 0.00641, quality = 2 }, { itemID = 7545, name = "Champion's Bracers", chance = 0.00641, quality = 2 }, { itemID = 7552, name = "Falcon's Hook", chance = 0.00641, quality = 2 }, { itemID = 7555, name = "Regal Star", chance = 0.00641, quality = 2 }, { itemID = 8120, name = "Heraldic Cloak", chance = 0.00641, quality = 2 }, { itemID = 8137, name = "Chromite Bracers", chance = 0.00641, quality = 2 }, { itemID = 8139, name = "Chromite Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 8140, name = "Chromite Girdle", chance = 0.00641, quality = 2 }, { itemID = 8141, name = "Chromite Greaves", chance = 0.00641, quality = 2 }, { itemID = 8142, name = "Chromite Barbute", chance = 0.00641, quality = 2 }, { itemID = 8144, name = "Chromite Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 8156, name = "Jouster's Wristguards", chance = 0.00641, quality = 2 }, { itemID = 8157, name = "Jouster's Chestplate", chance = 0.00641, quality = 2 }, { itemID = 8158, name = "Jouster's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 8159, name = "Jouster's Girdle", chance = 0.00641, quality = 2 }, { itemID = 8160, name = "Jouster's Greaves", chance = 0.00641, quality = 2 }, { itemID = 8161, name = "Jouster's Visor", chance = 0.00641, quality = 2 }, { itemID = 8162, name = "Jouster's Legplates", chance = 0.00641, quality = 2 }, { itemID = 8163, name = "Jouster's Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9285, name = "Field Plate Vambraces", chance = 0.00641, quality = 2 }, { itemID = 9286, name = "Field Plate Armor", chance = 0.00641, quality = 2 }, { itemID = 9287, name = "Field Plate Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 9288, name = "Field Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 9289, name = "Field Plate Boots", chance = 0.00641, quality = 2 }, { itemID = 9290, name = "Field Plate Helmet", chance = 0.00641, quality = 2 }, { itemID = 9291, name = "Field Plate Leggings", chance = 0.00641, quality = 2 }, { itemID = 9292, name = "Field Plate Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9906, name = "Royal Sash", chance = 0.00641, quality = 2 }, { itemID = 9907, name = "Royal Boots", chance = 0.00641, quality = 2 }, { itemID = 9910, name = "Royal Gloves", chance = 0.00641, quality = 2 }, { itemID = 9912, name = "Royal Amice", chance = 0.00641, quality = 2 }, { itemID = 9915, name = "Royal Headband", chance = 0.00641, quality = 2 }, { itemID = 9916, name = "Tracker's Belt", chance = 0.00641, quality = 2 }, { itemID = 9917, name = "Tracker's Boots", chance = 0.00641, quality = 2 }, { itemID = 9918, name = "Brigade Defender", chance = 0.00641, quality = 2 }, { itemID = 9920, name = "Tracker's Gloves", chance = 0.00641, quality = 2 }, { itemID = 9921, name = "Tracker's Headband", chance = 0.00641, quality = 2 }, { itemID = 9923, name = "Tracker's Shoulderpads", chance = 0.00641, quality = 2 }, { itemID = 9925, name = "Tracker's Wristguards", chance = 0.00641, quality = 2 }, { itemID = 9928, name = "Brigade Breastplate", chance = 0.00641, quality = 2 }, { itemID = 9932, name = "Brigade Circlet", chance = 0.00641, quality = 2 }, { itemID = 9933, name = "Brigade Leggings", chance = 0.00641, quality = 2 }, { itemID = 9934, name = "Brigade Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9935, name = "Embossed Plate Shield", chance = 0.00641, quality = 2 }, { itemID = 9959, name = "Warmonger's Cloak", chance = 0.00641, quality = 2 }, { itemID = 9966, name = "Embossed Plate Armor", chance = 0.00641, quality = 2 }, { itemID = 9967, name = "Embossed Plate Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 9968, name = "Embossed Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 9969, name = "Embossed Plate Helmet", chance = 0.00641, quality = 2 }, { itemID = 9970, name = "Embossed Plate Leggings", chance = 0.00641, quality = 2 }, { itemID = 9971, name = "Embossed Plate Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 9972, name = "Embossed Plate Bracers", chance = 0.00641, quality = 2 }, { itemID = 9973, name = "Embossed Plate Boots", chance = 0.00641, quality = 2 }, { itemID = 10088, name = "Gothic Plate Girdle", chance = 0.00641, quality = 2 }, { itemID = 10089, name = "Gothic Sabatons", chance = 0.00641, quality = 2 }, { itemID = 10094, name = "Gothic Plate Vambraces", chance = 0.00641, quality = 2 }, { itemID = 12012, name = "Marsh Ring", chance = 0.00641, quality = 2 }, { itemID = 12023, name = "Tellurium Necklace", chance = 0.00641, quality = 2 }, { itemID = 12031, name = "Lodestone Necklace", chance = 0.00641, quality = 2 }, { itemID = 14246, name = "Darkmist Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 14247, name = "Lunar Mantle", chance = 0.00641, quality = 2 }, { itemID = 14252, name = "Lunar Coronet", chance = 0.00641, quality = 2 }, { itemID = 14257, name = "Lunar Leggings", chance = 0.00641, quality = 2 }, { itemID = 14258, name = "Bloodwoven Cord", chance = 0.00641, quality = 2 }, { itemID = 14260, name = "Bloodwoven Bracers", chance = 0.00641, quality = 2 }, { itemID = 14262, name = "Bloodwoven Mitts", chance = 0.00641, quality = 2 }, { itemID = 14270, name = "Gaea's Cloak", chance = 0.00641, quality = 2 }, { itemID = 14417, name = "Silksand Tunic", chance = 0.00641, quality = 2 }, { itemID = 14425, name = "Silksand Wraps", chance = 0.00641, quality = 2 }, { itemID = 14428, name = "Windchaser Footpads", chance = 0.00641, quality = 2 }, { itemID = 14431, name = "Windchaser Handguards", chance = 0.00641, quality = 2 }, { itemID = 14432, name = "Windchaser Amice", chance = 0.00641, quality = 2 }, { itemID = 14601, name = "Warden's Wraps", chance = 0.00641, quality = 2 }, { itemID = 14604, name = "Warden's Wizard Hat", chance = 0.00641, quality = 2 }, { itemID = 14652, name = "Scorpashi Sash", chance = 0.00641, quality = 2 }, { itemID = 14654, name = "Scorpashi Wristbands", chance = 0.00641, quality = 2 }, { itemID = 14656, name = "Scorpashi Cape", chance = 0.00641, quality = 2 }, { itemID = 14768, name = "Ravager's Armor", chance = 0.00641, quality = 2 }, { itemID = 14777, name = "Ravager's Shield", chance = 0.00641, quality = 2 }, { itemID = 14778, name = "Khan's Bindings", chance = 0.00641, quality = 2 }, { itemID = 14781, name = "Khan's Cloak", chance = 0.00641, quality = 2 }, { itemID = 14782, name = "Khan's Gloves", chance = 0.00641, quality = 2 }, { itemID = 14821, name = "Symbolic Breastplate", chance = 0.00641, quality = 2 }, { itemID = 14826, name = "Symbolic Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14827, name = "Symbolic Belt", chance = 0.00641, quality = 2 }, { itemID = 14828, name = "Symbolic Greaves", chance = 0.00641, quality = 2 }, { itemID = 14829, name = "Symbolic Legplates", chance = 0.00641, quality = 2 }, { itemID = 14830, name = "Symbolic Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 14831, name = "Symbolic Crown", chance = 0.00641, quality = 2 }, { itemID = 14832, name = "Symbolic Vambraces", chance = 0.00641, quality = 2 }, { itemID = 14833, name = "Tyrant's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14834, name = "Tyrant's Armguards", chance = 0.00641, quality = 2 }, { itemID = 14838, name = "Tyrant's Belt", chance = 0.00641, quality = 2 }, { itemID = 14839, name = "Tyrant's Greaves", chance = 0.00641, quality = 2 }, { itemID = 14841, name = "Tyrant's Epaulets", chance = 0.00641, quality = 2 }, { itemID = 14895, name = "Saltstone Surcoat", chance = 0.00641, quality = 2 }, { itemID = 14896, name = "Saltstone Sabatons", chance = 0.00641, quality = 2 }, { itemID = 14897, name = "Saltstone Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14898, name = "Saltstone Girdle", chance = 0.00641, quality = 2 }, { itemID = 14899, name = "Saltstone Helm", chance = 0.00641, quality = 2 }, { itemID = 14900, name = "Saltstone Legplates", chance = 0.00641, quality = 2 }, { itemID = 14901, name = "Saltstone Shoulder Pads", chance = 0.00641, quality = 2 }, { itemID = 14903, name = "Saltstone Armsplints", chance = 0.00641, quality = 2 }, { itemID = 14905, name = "Brutish Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14906, name = "Brutish Belt", chance = 0.00641, quality = 2 }, { itemID = 14909, name = "Brutish Shoulders", chance = 0.00641, quality = 2 }, { itemID = 14910, name = "Brutish Armguards", chance = 0.00641, quality = 2 }, { itemID = 14940, name = "Warbringer's Sabatons", chance = 0.00641, quality = 2 }, { itemID = 14941, name = "Warbringer's Armsplints", chance = 0.00641, quality = 2 }, { itemID = 14942, name = "Warbringer's Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 14943, name = "Warbringer's Belt", chance = 0.00641, quality = 2 }, { itemID = 14944, name = "Warbringer's Crown", chance = 0.00641, quality = 2 }, { itemID = 14945, name = "Warbringer's Legguards", chance = 0.00641, quality = 2 }, { itemID = 14946, name = "Warbringer's Spaulders", chance = 0.00641, quality = 2 }, { itemID = 14956, name = "Bloodforged Bindings", chance = 0.00641, quality = 2 }, { itemID = 15162, name = "Imposing Boots", chance = 0.00641, quality = 2 }, { itemID = 15166, name = "Imposing Gloves", chance = 0.00641, quality = 2 }, { itemID = 15168, name = "Imposing Pants", chance = 0.00641, quality = 2 }, { itemID = 15169, name = "Imposing Shoulders", chance = 0.00641, quality = 2 }, { itemID = 15215, name = "Furious Falchion", chance = 0.00641, quality = 2 }, { itemID = 15287, name = "Crusader Bow", chance = 0.00641, quality = 2 }, { itemID = 15370, name = "Wolf Rider's Boots", chance = 0.00641, quality = 2 }, { itemID = 15374, name = "Wolf Rider's Leggings", chance = 0.00641, quality = 2 }, { itemID = 15382, name = "Rageclaw Cloak", chance = 0.00641, quality = 2 }, { itemID = 15599, name = "Ancient Greaves", chance = 0.00641, quality = 2 }, { itemID = 15602, name = "Ancient Crown", chance = 0.00641, quality = 2 }, { itemID = 15607, name = "Ancient Legguards", chance = 0.00641, quality = 2 }, { itemID = 15608, name = "Ancient Pauldrons", chance = 0.00641, quality = 2 }, { itemID = 15612, name = "Bonelink Gauntlets", chance = 0.00641, quality = 2 }, { itemID = 15614, name = "Bonelink Sabatons", chance = 0.00641, quality = 2 }, { itemID = 15617, name = "Bonelink Epaulets", chance = 0.00641, quality = 2 }, { itemID = 15624, name = "Gryphon Cloak", chance = 0.00641, quality = 2 }, { itemID = 15964, name = "Silksand Star", chance = 0.00641, quality = 2 }, { itemID = 1713, name = "Ankh of Life", chance = 0.002273, quality = 3 }, { itemID = 1715, name = "Polished Jazeraint Armor", chance = 0.002273, quality = 3 }, { itemID = 2815, name = "Curve-bladed Ripper", chance = 0.002273, quality = 3 }, { itemID = 13026, name = "Heaven's Light", chance = 0.002273, quality = 3 }, { itemID = 13051, name = "Witchfury", chance = 0.002273, quality = 3 }, { itemID = 13058, name = "Khoo's Point", chance = 0.002273, quality = 3 }, { itemID = 13071, name = "Plated Fist of Hakoo", chance = 0.002273, quality = 3 }, { itemID = 13095, name = "Assault Band", chance = 0.002273, quality = 3 }, { itemID = 13100, name = "Furen's Boots", chance = 0.002273, quality = 3 }, { itemID = 13115, name = "Sheepshear Mantle", chance = 0.002273, quality = 3 }, { itemID = 13145, name = "Enormous Ogre Belt", chance = 0.002273, quality = 3 }, { itemID = 7517, name = "Gossamer Tunic", chance = 0.008772, quality = 2 }, { itemID = 7518, name = "Gossamer Robe", chance = 0.008772, quality = 2 }, { itemID = 7527, name = "Cabalist Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 7557, name = "Gossamer Rod", chance = 0.008772, quality = 2 }, { itemID = 8106, name = "Hibernal Armor", chance = 0.008772, quality = 2 }, { itemID = 8113, name = "Hibernal Robe", chance = 0.008772, quality = 2 }, { itemID = 8119, name = "Heraldic Breastplate", chance = 0.008772, quality = 2 }, { itemID = 8126, name = "Myrmidon's Breastplate", chance = 0.008772, quality = 2 }, { itemID = 8131, name = "Myrmidon's Helm", chance = 0.008772, quality = 2 }, { itemID = 8132, name = "Myrmidon's Leggings", chance = 0.008772, quality = 2 }, { itemID = 8133, name = "Myrmidon's Pauldrons", chance = 0.008772, quality = 2 }, { itemID = 8134, name = "Myrmidon's Defender", chance = 0.008772, quality = 2 }, { itemID = 8247, name = "Imperial Red Bracers", chance = 0.008772, quality = 2 }, { itemID = 8248, name = "Imperial Red Cloak", chance = 0.008772, quality = 2 }, { itemID = 8253, name = "Imperial Red Sash", chance = 0.008772, quality = 2 }, { itemID = 8255, name = "Serpentskin Girdle", chance = 0.008772, quality = 2 }, { itemID = 8257, name = "Serpentskin Bracers", chance = 0.008772, quality = 2 }, { itemID = 8259, name = "Serpentskin Cloak", chance = 0.008772, quality = 2 }, { itemID = 8266, name = "Ebonhold Cloak", chance = 0.008772, quality = 2 }, { itemID = 8274, name = "Valorous Chestguard", chance = 0.008772, quality = 2 }, { itemID = 8282, name = "Valorous Shield", chance = 0.008772, quality = 2 }, { itemID = 9940, name = "Abjurer's Hood", chance = 0.008772, quality = 2 }, { itemID = 9942, name = "Abjurer's Pants", chance = 0.008772, quality = 2 }, { itemID = 9953, name = "Chieftain's Headdress", chance = 0.008772, quality = 2 }, { itemID = 9954, name = "Chieftain's Leggings", chance = 0.008772, quality = 2 }, { itemID = 9955, name = "Chieftain's Shoulders", chance = 0.008772, quality = 2 }, { itemID = 9957, name = "Warmonger's Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 9958, name = "Warmonger's Buckler", chance = 0.008772, quality = 2 }, { itemID = 10058, name = "Duskwoven Sandals", chance = 0.008772, quality = 2 }, { itemID = 10059, name = "Duskwoven Bracers", chance = 0.008772, quality = 2 }, { itemID = 10061, name = "Duskwoven Turban", chance = 0.008772, quality = 2 }, { itemID = 10062, name = "Duskwoven Gloves", chance = 0.008772, quality = 2 }, { itemID = 10063, name = "Duskwoven Amice", chance = 0.008772, quality = 2 }, { itemID = 10068, name = "Righteous Boots", chance = 0.008772, quality = 2 }, { itemID = 10072, name = "Righteous Gloves", chance = 0.008772, quality = 2 }, { itemID = 10075, name = "Righteous Spaulders", chance = 0.008772, quality = 2 }, { itemID = 10080, name = "Lord's Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 10081, name = "Lord's Girdle", chance = 0.008772, quality = 2 }, { itemID = 10082, name = "Lord's Boots", chance = 0.008772, quality = 2 }, { itemID = 10083, name = "Lord's Crown", chance = 0.008772, quality = 2 }, { itemID = 10129, name = "Revenant Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 10130, name = "Revenant Girdle", chance = 0.008772, quality = 2 }, { itemID = 10131, name = "Revenant Boots", chance = 0.008772, quality = 2 }, { itemID = 10132, name = "Revenant Helmet", chance = 0.008772, quality = 2 }, { itemID = 10134, name = "Revenant Shoulders", chance = 0.008772, quality = 2 }, { itemID = 10185, name = "Swashbuckler's Cape", chance = 0.008772, quality = 2 }, { itemID = 10191, name = "Crusader's Armguards", chance = 0.008772, quality = 2 }, { itemID = 10194, name = "Crusader's Cloak", chance = 0.008772, quality = 2 }, { itemID = 10208, name = "Overlord's Legplates", chance = 0.008772, quality = 2 }, { itemID = 10209, name = "Overlord's Spaulders", chance = 0.008772, quality = 2 }, { itemID = 10239, name = "Heavy Lamellar Vambraces", chance = 0.008772, quality = 2 }, { itemID = 10243, name = "Heavy Lamellar Girdle", chance = 0.008772, quality = 2 }, { itemID = 11989, name = "Vanadium Loop", chance = 0.008772, quality = 2 }, { itemID = 12001, name = "Onyx Ring", chance = 0.008772, quality = 2 }, { itemID = 12024, name = "Vanadium Talisman", chance = 0.008772, quality = 2 }, { itemID = 12044, name = "Arctic Pendant", chance = 0.008772, quality = 2 }, { itemID = 14265, name = "Bloodwoven Wraps", chance = 0.008772, quality = 2 }, { itemID = 14267, name = "Bloodwoven Jerkin", chance = 0.008772, quality = 2 }, { itemID = 14274, name = "Gaea's Leggings", chance = 0.008772, quality = 2 }, { itemID = 14278, name = "Opulent Mantle", chance = 0.008772, quality = 2 }, { itemID = 14282, name = "Opulent Gloves", chance = 0.008772, quality = 2 }, { itemID = 14285, name = "Opulent Boots", chance = 0.008772, quality = 2 }, { itemID = 14286, name = "Opulent Belt", chance = 0.008772, quality = 2 }, { itemID = 14289, name = "Arachnidian Girdle", chance = 0.008772, quality = 2 }, { itemID = 14290, name = "Arachnidian Footpads", chance = 0.008772, quality = 2 }, { itemID = 14291, name = "Arachnidian Bracelets", chance = 0.008772, quality = 2 }, { itemID = 14294, name = "Arachnidian Gloves", chance = 0.008772, quality = 2 }, { itemID = 14441, name = "Venomshroud Mask", chance = 0.008772, quality = 2 }, { itemID = 14450, name = "Highborne Cloak", chance = 0.008772, quality = 2 }, { itemID = 14662, name = "Keeper's Hooves", chance = 0.008772, quality = 2 }, { itemID = 14666, name = "Keeper's Gloves", chance = 0.008772, quality = 2 }, { itemID = 14669, name = "Keeper's Mantle", chance = 0.008772, quality = 2 }, { itemID = 14792, name = "Protector Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 14793, name = "Protector Waistband", chance = 0.008772, quality = 2 }, { itemID = 14794, name = "Protector Ankleguards", chance = 0.008772, quality = 2 }, { itemID = 14797, name = "Protector Pads", chance = 0.008772, quality = 2 }, { itemID = 14846, name = "Sunscale Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 14848, name = "Sunscale Sabatons", chance = 0.008772, quality = 2 }, { itemID = 14851, name = "Sunscale Spaulders", chance = 0.008772, quality = 2 }, { itemID = 14904, name = "Brutish Breastplate", chance = 0.008772, quality = 2 }, { itemID = 14912, name = "Brutish Shield", chance = 0.008772, quality = 2 }, { itemID = 14920, name = "Jade Legplates", chance = 0.008772, quality = 2 }, { itemID = 14923, name = "Lofty Armguards", chance = 0.008772, quality = 2 }, { itemID = 14948, name = "Bloodforged Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 14952, name = "Bloodforged Helmet", chance = 0.008772, quality = 2 }, { itemID = 14954, name = "Bloodforged Shield", chance = 0.008772, quality = 2 }, { itemID = 14957, name = "High Chief's Sabatons", chance = 0.008772, quality = 2 }, { itemID = 14960, name = "High Chief's Belt", chance = 0.008772, quality = 2 }, { itemID = 15171, name = "Potent Boots", chance = 0.008772, quality = 2 }, { itemID = 15174, name = "Potent Gloves", chance = 0.008772, quality = 2 }, { itemID = 15175, name = "Potent Helmet", chance = 0.008772, quality = 2 }, { itemID = 15176, name = "Potent Pants", chance = 0.008772, quality = 2 }, { itemID = 15182, name = "Praetorian Wristbands", chance = 0.008772, quality = 2 }, { itemID = 15183, name = "Praetorian Cloak", chance = 0.008772, quality = 2 }, { itemID = 15216, name = "Rune Sword", chance = 0.008772, quality = 2 }, { itemID = 15245, name = "Vorpal Dagger", chance = 0.008772, quality = 2 }, { itemID = 15263, name = "Royal Mallet", chance = 0.008772, quality = 2 }, { itemID = 15279, name = "Ivory Wand", chance = 0.008772, quality = 2 }, { itemID = 15291, name = "Harpy Needler", chance = 0.008772, quality = 2 }, { itemID = 15323, name = "Percussion Shotgun", chance = 0.008772, quality = 2 }, { itemID = 15381, name = "Rageclaw Chestguard", chance = 0.008772, quality = 2 }, { itemID = 15384, name = "Rageclaw Helm", chance = 0.008772, quality = 2 }, { itemID = 15387, name = "Jadefire Bracelets", chance = 0.008772, quality = 2 }, { itemID = 15621, name = "Gryphon Mail Buckler", chance = 0.008772, quality = 2 }, { itemID = 15622, name = "Gryphon Mail Breastplate", chance = 0.008772, quality = 2 }, { itemID = 15623, name = "Gryphon Mail Crown", chance = 0.008772, quality = 2 }, { itemID = 15627, name = "Gryphon Mail Legguards", chance = 0.008772, quality = 2 }, { itemID = 15637, name = "Formidable Legguards", chance = 0.008772, quality = 2 }, { itemID = 15639, name = "Ironhide Bracers", chance = 0.008772, quality = 2 }, { itemID = 15641, name = "Ironhide Belt", chance = 0.008772, quality = 2 }, { itemID = 15649, name = "Merciless Bracers", chance = 0.008772, quality = 2 }, { itemID = 15652, name = "Merciless Cloak", chance = 0.008772, quality = 2 }, { itemID = 15937, name = "Hibernal Sphere", chance = 0.008772, quality = 2 }, { itemID = 15982, name = "Bloodwoven Rod", chance = 0.008772, quality = 2 }, { itemID = 3936, name = "Crochet Belt", chance = 0.125, quality = 0 }, { itemID = 3937, name = "Crochet Boots", chance = 0.125, quality = 0 }, { itemID = 3938, name = "Crochet Bracers", chance = 0.125, quality = 0 }, { itemID = 3939, name = "Crochet Cloak", chance = 0.125, quality = 0 }, { itemID = 3940, name = "Crochet Gloves", chance = 0.125, quality = 0 }, { itemID = 3941, name = "Crochet Pants", chance = 0.125, quality = 0 }, { itemID = 3942, name = "Crochet Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3943, name = "Crochet Vest", chance = 0.125, quality = 0 }, { itemID = 3961, name = "Thick Leather Belt", chance = 0.125, quality = 0 }, { itemID = 3962, name = "Thick Leather Boots", chance = 0.125, quality = 0 }, { itemID = 3963, name = "Thick Leather Bracers", chance = 0.125, quality = 0 }, { itemID = 3964, name = "Thick Cloak", chance = 0.125, quality = 0 }, { itemID = 3965, name = "Thick Leather Gloves", chance = 0.125, quality = 0 }, { itemID = 3966, name = "Thick Leather Pants", chance = 0.125, quality = 0 }, { itemID = 3967, name = "Thick Leather Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3968, name = "Thick Leather Tunic", chance = 0.125, quality = 0 }, { itemID = 3986, name = "Protective Pavise", chance = 0.125, quality = 0 }, { itemID = 3989, name = "Blocking Targe", chance = 0.125, quality = 0 }, { itemID = 4000, name = "Overlinked Chain Belt", chance = 0.125, quality = 0 }, { itemID = 4001, name = "Overlinked Chain Boots", chance = 0.125, quality = 0 }, { itemID = 4002, name = "Overlinked Chain Bracers", chance = 0.125, quality = 0 }, { itemID = 4003, name = "Overlinked Chain Cloak", chance = 0.125, quality = 0 }, { itemID = 4004, name = "Overlinked Chain Gloves", chance = 0.125, quality = 0 }, { itemID = 4005, name = "Overlinked Chain Pants", chance = 0.125, quality = 0 }, { itemID = 4006, name = "Overlinked Chain Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 4007, name = "Overlinked Chain Armor", chance = 0.125, quality = 0 }, { itemID = 4017, name = "Sharp Shortsword", chance = 0.125, quality = 0 }, { itemID = 4018, name = "Whetted Claymore", chance = 0.125, quality = 0 }, { itemID = 4019, name = "Heavy Flint Axe", chance = 0.125, quality = 0 }, { itemID = 4020, name = "Splintering Battle Axe", chance = 0.125, quality = 0 }, { itemID = 4021, name = "Blunting Mace", chance = 0.125, quality = 0 }, { itemID = 4022, name = "Crushing Maul", chance = 0.125, quality = 0 }, { itemID = 4023, name = "Fine Pointed Dagger", chance = 0.125, quality = 0 }, { itemID = 4024, name = "Heavy War Staff", chance = 0.125, quality = 0 }, { itemID = 4025, name = "Balanced Long Bow", chance = 0.125, quality = 0 }, { itemID = 4026, name = "Sentinel Musket", chance = 0.125, quality = 0 }, { itemID = 8749, name = "Crochet Hat", chance = 0.125, quality = 0 }, { itemID = 8750, name = "Thick Leather Hat", chance = 0.125, quality = 0 }, { itemID = 8751, name = "Overlinked Coif", chance = 0.125, quality = 0 }, { itemID = 13824, name = "Recurve Long Bow", chance = 0.125, quality = 0 }, { itemID = 1639, name = "Grinning Axe", chance = 0.009091, quality = 2 }, { itemID = 3208, name = "Conk Hammer", chance = 0.009091, quality = 2 }, { itemID = 4089, name = "Ricochet Blunderbuss", chance = 0.009091, quality = 2 }, { itemID = 7528, name = "Cabalist Leggings", chance = 0.009091, quality = 2 }, { itemID = 7536, name = "Champion's Wall Shield", chance = 0.009091, quality = 2 }, { itemID = 7537, name = "Gothic Shield", chance = 0.009091, quality = 2 }, { itemID = 7538, name = "Champion's Armor", chance = 0.009091, quality = 2 }, { itemID = 7539, name = "Champion's Leggings", chance = 0.009091, quality = 2 }, { itemID = 7553, name = "Band of the Unicorn", chance = 0.009091, quality = 2 }, { itemID = 8111, name = "Hibernal Mantle", chance = 0.009091, quality = 2 }, { itemID = 8112, name = "Hibernal Pants", chance = 0.009091, quality = 2 }, { itemID = 8115, name = "Hibernal Cowl", chance = 0.009091, quality = 2 }, { itemID = 8122, name = "Heraldic Headpiece", chance = 0.009091, quality = 2 }, { itemID = 8123, name = "Heraldic Leggings", chance = 0.009091, quality = 2 }, { itemID = 8124, name = "Heraldic Spaulders", chance = 0.009091, quality = 2 }, { itemID = 8125, name = "Myrmidon's Bracers", chance = 0.009091, quality = 2 }, { itemID = 8128, name = "Myrmidon's Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 8129, name = "Myrmidon's Girdle", chance = 0.009091, quality = 2 }, { itemID = 8130, name = "Myrmidon's Greaves", chance = 0.009091, quality = 2 }, { itemID = 8279, name = "Valorous Helm", chance = 0.009091, quality = 2 }, { itemID = 8280, name = "Valorous Legguards", chance = 0.009091, quality = 2 }, { itemID = 8281, name = "Valorous Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 9905, name = "Royal Blouse", chance = 0.009091, quality = 2 }, { itemID = 9913, name = "Royal Gown", chance = 0.009091, quality = 2 }, { itemID = 9914, name = "Royal Scepter", chance = 0.009091, quality = 2 }, { itemID = 9924, name = "Tracker's Tunic", chance = 0.009091, quality = 2 }, { itemID = 9936, name = "Abjurer's Boots", chance = 0.009091, quality = 2 }, { itemID = 9937, name = "Abjurer's Bands", chance = 0.009091, quality = 2 }, { itemID = 9938, name = "Abjurer's Cloak", chance = 0.009091, quality = 2 }, { itemID = 9939, name = "Abjurer's Gloves", chance = 0.009091, quality = 2 }, { itemID = 9941, name = "Abjurer's Mantle", chance = 0.009091, quality = 2 }, { itemID = 9945, name = "Abjurer's Sash", chance = 0.009091, quality = 2 }, { itemID = 9947, name = "Chieftain's Belt", chance = 0.009091, quality = 2 }, { itemID = 9948, name = "Chieftain's Boots", chance = 0.009091, quality = 2 }, { itemID = 9949, name = "Chieftain's Bracers", chance = 0.009091, quality = 2 }, { itemID = 9952, name = "Chieftain's Gloves", chance = 0.009091, quality = 2 }, { itemID = 9962, name = "Warmonger's Greaves", chance = 0.009091, quality = 2 }, { itemID = 9963, name = "Warmonger's Circlet", chance = 0.009091, quality = 2 }, { itemID = 9964, name = "Warmonger's Leggings", chance = 0.009091, quality = 2 }, { itemID = 9965, name = "Warmonger's Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 10060, name = "Duskwoven Cape", chance = 0.009091, quality = 2 }, { itemID = 10066, name = "Duskwoven Sash", chance = 0.009091, quality = 2 }, { itemID = 10067, name = "Righteous Waistguard", chance = 0.009091, quality = 2 }, { itemID = 10069, name = "Righteous Bracers", chance = 0.009091, quality = 2 }, { itemID = 10071, name = "Righteous Cloak", chance = 0.009091, quality = 2 }, { itemID = 10076, name = "Lord's Armguards", chance = 0.009091, quality = 2 }, { itemID = 10079, name = "Lord's Cape", chance = 0.009091, quality = 2 }, { itemID = 10086, name = "Gothic Plate Armor", chance = 0.009091, quality = 2 }, { itemID = 10127, name = "Revenant Bracers", chance = 0.009091, quality = 2 }, { itemID = 10201, name = "Overlord's Greaves", chance = 0.009091, quality = 2 }, { itemID = 10202, name = "Overlord's Vambraces", chance = 0.009091, quality = 2 }, { itemID = 10205, name = "Overlord's Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 10206, name = "Overlord's Girdle", chance = 0.009091, quality = 2 }, { itemID = 10207, name = "Overlord's Crown", chance = 0.009091, quality = 2 }, { itemID = 11975, name = "Topaz Ring", chance = 0.009091, quality = 2 }, { itemID = 12013, name = "Desert Ring", chance = 0.009091, quality = 2 }, { itemID = 12032, name = "Onyx Choker", chance = 0.009091, quality = 2 }, { itemID = 14263, name = "Bloodwoven Mask", chance = 0.009091, quality = 2 }, { itemID = 14264, name = "Bloodwoven Pants", chance = 0.009091, quality = 2 }, { itemID = 14271, name = "Gaea's Circlet", chance = 0.009091, quality = 2 }, { itemID = 14273, name = "Gaea's Amice", chance = 0.009091, quality = 2 }, { itemID = 14279, name = "Opulent Bracers", chance = 0.009091, quality = 2 }, { itemID = 14280, name = "Opulent Cape", chance = 0.009091, quality = 2 }, { itemID = 14292, name = "Arachnidian Cape", chance = 0.009091, quality = 2 }, { itemID = 14427, name = "Windchaser Wraps", chance = 0.009091, quality = 2 }, { itemID = 14434, name = "Windchaser Robes", chance = 0.009091, quality = 2 }, { itemID = 14438, name = "Venomshroud Boots", chance = 0.009091, quality = 2 }, { itemID = 14442, name = "Venomshroud Mitts", chance = 0.009091, quality = 2 }, { itemID = 14443, name = "Venomshroud Mantle", chance = 0.009091, quality = 2 }, { itemID = 14446, name = "Venomshroud Belt", chance = 0.009091, quality = 2 }, { itemID = 14655, name = "Scorpashi Breastplate", chance = 0.009091, quality = 2 }, { itemID = 14658, name = "Scorpashi Skullcap", chance = 0.009091, quality = 2 }, { itemID = 14661, name = "Keeper's Cord", chance = 0.009091, quality = 2 }, { itemID = 14663, name = "Keeper's Bindings", chance = 0.009091, quality = 2 }, { itemID = 14665, name = "Keeper's Cloak", chance = 0.009091, quality = 2 }, { itemID = 14779, name = "Khan's Chestpiece", chance = 0.009091, quality = 2 }, { itemID = 14780, name = "Khan's Buckler", chance = 0.009091, quality = 2 }, { itemID = 14785, name = "Khan's Helmet", chance = 0.009091, quality = 2 }, { itemID = 14788, name = "Protector Armguards", chance = 0.009091, quality = 2 }, { itemID = 14791, name = "Protector Cape", chance = 0.009091, quality = 2 }, { itemID = 14835, name = "Tyrant's Chestpiece", chance = 0.009091, quality = 2 }, { itemID = 14842, name = "Tyrant's Shield", chance = 0.009091, quality = 2 }, { itemID = 14847, name = "Sunscale Belt", chance = 0.009091, quality = 2 }, { itemID = 14853, name = "Sunscale Wristguards", chance = 0.009091, quality = 2 }, { itemID = 14907, name = "Brutish Helmet", chance = 0.009091, quality = 2 }, { itemID = 14908, name = "Brutish Legguards", chance = 0.009091, quality = 2 }, { itemID = 14913, name = "Jade Greaves", chance = 0.009091, quality = 2 }, { itemID = 14917, name = "Jade Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 14921, name = "Jade Epaulets", chance = 0.009091, quality = 2 }, { itemID = 14953, name = "Bloodforged Legplates", chance = 0.009091, quality = 2 }, { itemID = 14965, name = "High Chief's Bindings", chance = 0.009091, quality = 2 }, { itemID = 15167, name = "Imposing Bandana", chance = 0.009091, quality = 2 }, { itemID = 15177, name = "Potent Shoulders", chance = 0.009091, quality = 2 }, { itemID = 15227, name = "Diamond-Tip Bludgeon", chance = 0.009091, quality = 2 }, { itemID = 15235, name = "Crescent Edge", chance = 0.009091, quality = 2 }, { itemID = 15252, name = "Tusker Sword", chance = 0.009091, quality = 2 }, { itemID = 15379, name = "Rageclaw Boots", chance = 0.009091, quality = 2 }, { itemID = 15383, name = "Rageclaw Gloves", chance = 0.009091, quality = 2 }, { itemID = 15385, name = "Rageclaw Leggings", chance = 0.009091, quality = 2 }, { itemID = 15386, name = "Rageclaw Shoulder Pads", chance = 0.009091, quality = 2 }, { itemID = 15392, name = "Jadefire Cloak", chance = 0.009091, quality = 2 }, { itemID = 15619, name = "Gryphon Mail Belt", chance = 0.009091, quality = 2 }, { itemID = 15628, name = "Gryphon Mail Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 15629, name = "Formidable Bracers", chance = 0.009091, quality = 2 }, { itemID = 15630, name = "Formidable Sabatons", chance = 0.009091, quality = 2 }, { itemID = 15635, name = "Formidable Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 15636, name = "Formidable Belt", chance = 0.009091, quality = 2 }, { itemID = 15638, name = "Formidable Shoulder Pads", chance = 0.009091, quality = 2 }, { itemID = 15643, name = "Ironhide Cloak", chance = 0.009091, quality = 2 }, { itemID = 15965, name = "Windchaser Orb", chance = 0.009091, quality = 2 }, { itemID = 943, name = "Warden Staff", chance = 0.001, quality = 4 }, { itemID = 2100, name = "Precisely Calibrated Boomstick", chance = 0.001, quality = 4 }, { itemID = 2291, name = "Kang the Decapitator", chance = 0.001, quality = 4 }, { itemID = 14550, name = "Bladebane Armguards", chance = 0.001, quality = 4 }, { itemID = 14551, name = "Edgemaster's Handguards", chance = 0.001, quality = 4 }, { itemID = 1608, name = "Skullcrusher Mace", chance = 0.00885, quality = 2 }, { itemID = 1994, name = "Ebonclaw Reaver", chance = 0.00885, quality = 2 }, { itemID = 4069, name = "Blackforge Buckler", chance = 0.00885, quality = 2 }, { itemID = 4082, name = "Blackforge Breastplate", chance = 0.00885, quality = 2 }, { itemID = 4084, name = "Blackforge Leggings", chance = 0.00885, quality = 2 }, { itemID = 4088, name = "Dreadblade", chance = 0.00885, quality = 2 }, { itemID = 4733, name = "Blackforge Pauldrons", chance = 0.00885, quality = 2 }, { itemID = 6427, name = "Mistscape Robe", chance = 0.00885, quality = 2 }, { itemID = 6430, name = "Imperial Leather Breastplate", chance = 0.00885, quality = 2 }, { itemID = 7113, name = "Mistscape Armor", chance = 0.00885, quality = 2 }, { itemID = 7519, name = "Gossamer Pants", chance = 0.00885, quality = 2 }, { itemID = 7520, name = "Gossamer Headpiece", chance = 0.00885, quality = 2 }, { itemID = 7521, name = "Gossamer Gloves", chance = 0.00885, quality = 2 }, { itemID = 7523, name = "Gossamer Shoulderpads", chance = 0.00885, quality = 2 }, { itemID = 7526, name = "Gossamer Belt", chance = 0.00885, quality = 2 }, { itemID = 7529, name = "Cabalist Helm", chance = 0.00885, quality = 2 }, { itemID = 7530, name = "Cabalist Gloves", chance = 0.00885, quality = 2 }, { itemID = 7531, name = "Cabalist Boots", chance = 0.00885, quality = 2 }, { itemID = 7532, name = "Cabalist Spaulders", chance = 0.00885, quality = 2 }, { itemID = 7535, name = "Cabalist Belt", chance = 0.00885, quality = 2 }, { itemID = 7540, name = "Champion's Helmet", chance = 0.00885, quality = 2 }, { itemID = 7541, name = "Champion's Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 7542, name = "Champion's Greaves", chance = 0.00885, quality = 2 }, { itemID = 7543, name = "Champion's Pauldrons", chance = 0.00885, quality = 2 }, { itemID = 7546, name = "Champion's Girdle", chance = 0.00885, quality = 2 }, { itemID = 7611, name = "Mistscape Stave", chance = 0.00885, quality = 2 }, { itemID = 8107, name = "Hibernal Boots", chance = 0.00885, quality = 2 }, { itemID = 8108, name = "Hibernal Bracers", chance = 0.00885, quality = 2 }, { itemID = 8109, name = "Hibernal Cloak", chance = 0.00885, quality = 2 }, { itemID = 8110, name = "Hibernal Gloves", chance = 0.00885, quality = 2 }, { itemID = 8114, name = "Hibernal Sash", chance = 0.00885, quality = 2 }, { itemID = 8116, name = "Heraldic Belt", chance = 0.00885, quality = 2 }, { itemID = 8117, name = "Heraldic Boots", chance = 0.00885, quality = 2 }, { itemID = 8118, name = "Heraldic Bracers", chance = 0.00885, quality = 2 }, { itemID = 8121, name = "Heraldic Gloves", chance = 0.00885, quality = 2 }, { itemID = 8127, name = "Myrmidon's Cape", chance = 0.00885, quality = 2 }, { itemID = 8135, name = "Chromite Shield", chance = 0.00885, quality = 2 }, { itemID = 8138, name = "Chromite Chestplate", chance = 0.00885, quality = 2 }, { itemID = 8143, name = "Chromite Legplates", chance = 0.00885, quality = 2 }, { itemID = 8199, name = "Battlefield Destroyer", chance = 0.00885, quality = 2 }, { itemID = 8273, name = "Valorous Wristguards", chance = 0.00885, quality = 2 }, { itemID = 8276, name = "Valorous Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 8277, name = "Valorous Girdle", chance = 0.00885, quality = 2 }, { itemID = 8278, name = "Valorous Greaves", chance = 0.00885, quality = 2 }, { itemID = 9911, name = "Royal Trousers", chance = 0.00885, quality = 2 }, { itemID = 9922, name = "Tracker's Leggings", chance = 0.00885, quality = 2 }, { itemID = 9951, name = "Chieftain's Cloak", chance = 0.00885, quality = 2 }, { itemID = 9956, name = "Warmonger's Bracers", chance = 0.00885, quality = 2 }, { itemID = 9960, name = "Warmonger's Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 9961, name = "Warmonger's Belt", chance = 0.00885, quality = 2 }, { itemID = 10087, name = "Gothic Plate Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 10090, name = "Gothic Plate Helmet", chance = 0.00885, quality = 2 }, { itemID = 10091, name = "Gothic Plate Leggings", chance = 0.00885, quality = 2 }, { itemID = 10092, name = "Gothic Plate Spaulders", chance = 0.00885, quality = 2 }, { itemID = 11974, name = "Aquamarine Ring", chance = 0.00885, quality = 2 }, { itemID = 11988, name = "Tellurium Band", chance = 0.00885, quality = 2 }, { itemID = 11999, name = "Lodestone Hoop", chance = 0.00885, quality = 2 }, { itemID = 12043, name = "Desert Choker", chance = 0.00885, quality = 2 }, { itemID = 14237, name = "Darkmist Armor", chance = 0.00885, quality = 2 }, { itemID = 14244, name = "Darkmist Wraps", chance = 0.00885, quality = 2 }, { itemID = 14249, name = "Lunar Vest", chance = 0.00885, quality = 2 }, { itemID = 14254, name = "Lunar Raiment", chance = 0.00885, quality = 2 }, { itemID = 14259, name = "Bloodwoven Boots", chance = 0.00885, quality = 2 }, { itemID = 14266, name = "Bloodwoven Pads", chance = 0.00885, quality = 2 }, { itemID = 14268, name = "Gaea's Cuffs", chance = 0.00885, quality = 2 }, { itemID = 14269, name = "Gaea's Slippers", chance = 0.00885, quality = 2 }, { itemID = 14272, name = "Gaea's Handwraps", chance = 0.00885, quality = 2 }, { itemID = 14276, name = "Gaea's Belt", chance = 0.00885, quality = 2 }, { itemID = 14433, name = "Windchaser Woolies", chance = 0.00885, quality = 2 }, { itemID = 14436, name = "Windchaser Coronet", chance = 0.00885, quality = 2 }, { itemID = 14439, name = "Venomshroud Armguards", chance = 0.00885, quality = 2 }, { itemID = 14440, name = "Venomshroud Cape", chance = 0.00885, quality = 2 }, { itemID = 14653, name = "Scorpashi Slippers", chance = 0.00885, quality = 2 }, { itemID = 14657, name = "Scorpashi Gloves", chance = 0.00885, quality = 2 }, { itemID = 14659, name = "Scorpashi Leggings", chance = 0.00885, quality = 2 }, { itemID = 14660, name = "Scorpashi Shoulder Pads", chance = 0.00885, quality = 2 }, { itemID = 14783, name = "Khan's Belt", chance = 0.00885, quality = 2 }, { itemID = 14784, name = "Khan's Greaves", chance = 0.00885, quality = 2 }, { itemID = 14786, name = "Khan's Legguards", chance = 0.00885, quality = 2 }, { itemID = 14787, name = "Khan's Mantle", chance = 0.00885, quality = 2 }, { itemID = 14840, name = "Tyrant's Legplates", chance = 0.00885, quality = 2 }, { itemID = 14843, name = "Tyrant's Helm", chance = 0.00885, quality = 2 }, { itemID = 14911, name = "Brutish Boots", chance = 0.00885, quality = 2 }, { itemID = 14914, name = "Jade Bracers", chance = 0.00885, quality = 2 }, { itemID = 14918, name = "Jade Belt", chance = 0.00885, quality = 2 }, { itemID = 14939, name = "Warbringer's Chestguard", chance = 0.00885, quality = 2 }, { itemID = 14947, name = "Warbringer's Shield", chance = 0.00885, quality = 2 }, { itemID = 14949, name = "Bloodforged Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 14950, name = "Bloodforged Belt", chance = 0.00885, quality = 2 }, { itemID = 14951, name = "Bloodforged Sabatons", chance = 0.00885, quality = 2 }, { itemID = 14955, name = "Bloodforged Shoulder Pads", chance = 0.00885, quality = 2 }, { itemID = 15164, name = "Imposing Vest", chance = 0.00885, quality = 2 }, { itemID = 15172, name = "Potent Bands", chance = 0.00885, quality = 2 }, { itemID = 15173, name = "Potent Cape", chance = 0.00885, quality = 2 }, { itemID = 15178, name = "Potent Belt", chance = 0.00885, quality = 2 }, { itemID = 15262, name = "Greater Maul", chance = 0.00885, quality = 2 }, { itemID = 15270, name = "Gigantic War Axe", chance = 0.00885, quality = 2 }, { itemID = 15373, name = "Wolf Rider's Headgear", chance = 0.00885, quality = 2 }, { itemID = 15376, name = "Wolf Rider's Padded Armor", chance = 0.00885, quality = 2 }, { itemID = 15378, name = "Rageclaw Belt", chance = 0.00885, quality = 2 }, { itemID = 15380, name = "Rageclaw Bracers", chance = 0.00885, quality = 2 }, { itemID = 15601, name = "Ancient Chestpiece", chance = 0.00885, quality = 2 }, { itemID = 15604, name = "Ancient Defender", chance = 0.00885, quality = 2 }, { itemID = 15609, name = "Bonelink Armor", chance = 0.00885, quality = 2 }, { itemID = 15615, name = "Bonelink Helmet", chance = 0.00885, quality = 2 }, { itemID = 15616, name = "Bonelink Legplates", chance = 0.00885, quality = 2 }, { itemID = 15618, name = "Bonelink Wall Shield", chance = 0.00885, quality = 2 }, { itemID = 15620, name = "Gryphon Mail Bracelets", chance = 0.00885, quality = 2 }, { itemID = 15625, name = "Gryphon Mail Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 15626, name = "Gryphon Mail Greaves", chance = 0.00885, quality = 2 }, { itemID = 15632, name = "Formidable Cape", chance = 0.00885, quality = 2 }, { itemID = 15980, name = "Darkmist Orb", chance = 0.00885, quality = 2 }, { itemID = 15981, name = "Lunar Sphere", chance = 0.00885, quality = 2 }, { itemID = 1981, name = "Icemail Jerkin", chance = 0.001, quality = 4 }, { itemID = 1982, name = "Nightblade", chance = 0.001, quality = 4 }, { itemID = 2164, name = "Gut Ripper", chance = 0.001, quality = 4 }, { itemID = 14549, name = "Boots of Avoidance", chance = 0.001, quality = 4 }, { itemID = 60785, name = "Choker of Cauterization", chance = 0.001, quality = 4 }, { itemID = 754, name = "Shortsword of Vengeance", chance = 0.0025, quality = 3 }, { itemID = 1720, name = "Tanglewood Staff", chance = 0.0025, quality = 3 }, { itemID = 4090, name = "Mug O' Hurt", chance = 0.0025, quality = 3 }, { itemID = 4091, name = "Widowmaker", chance = 0.0025, quality = 3 }, { itemID = 9433, name = "Forgotten Wraps", chance = 0.0025, quality = 3 }, { itemID = 13021, name = "Needle Threader", chance = 0.0025, quality = 3 }, { itemID = 13074, name = "Golem Shard Leggings", chance = 0.0025, quality = 3 }, { itemID = 13082, name = "Mountainside Buckler", chance = 0.0025, quality = 3 }, { itemID = 13102, name = "Cassandra's Grace", chance = 0.0025, quality = 3 }, { itemID = 13128, name = "High Bergg Helm", chance = 0.0025, quality = 3 }, { itemID = 871, name = "Flurry Axe", chance = 0.0008333, quality = 4 }, { itemID = 940, name = "Robes of Insight", chance = 0.0008333, quality = 4 }, { itemID = 1169, name = "Blackskull Shield", chance = 0.0008333, quality = 4 }, { itemID = 1447, name = "Ring of Saviors", chance = 0.0008333, quality = 4 }, { itemID = 60787, name = "Scythe of the Harvest", chance = 0.0008333, quality = 4 }, { itemID = 80801, name = "Cowl of Terror", chance = 0.0008333, quality = 4 }, { itemID = 55250, name = "Emberstone", chance = 0.0333, quality = 2 }, { itemID = 55251, name = "Pure Moonstone", chance = 0.1332, quality = 2 }, { itemID = 56028, name = "Plans: Sunburst Tiara", chance = 0.02, quality = 2 }, { itemID = 70107, name = "Plans: Runebound Amulet", chance = 0.02, quality = 3 }, { itemID = 70167, name = "Plans: Enchanted Emerald Gemstone", chance = 0.02, quality = 2 }, { itemID = 70138, name = "Plans: Golden Jade Ring", chance = 0.02, quality = 3 }, { itemID = 70212, name = "Plans: Mana Binding Signet", chance = 0.005, quality = 4 } }
BossLoot[9024] = { { itemID = 11207, name = "Formula: Enchant Weapon - Fiery Weapon", chance = 16, quality = 2 }, { itemID = 11446, name = "A Crumpled Up Note", chance = 25, quality = 1 }, { itemID = 14047, name = "Runecloth", chance = 22, quality = 1 }, { itemID = 18945, name = "Dark Iron Residue", chance = 13, quality = 1 }, { itemID = 22528, name = "Dark Iron Scraps", chance = 10, quality = 1 }, { itemID = 11747, name = "Flamestrider Robes", chance = 25, quality = 3 }, { itemID = 11748, name = "Pyric Caduceus", chance = 25, quality = 3 }, { itemID = 11749, name = "Searingscale Leggings", chance = 25, quality = 3 }, { itemID = 11750, name = "Kindling Stave", chance = 25, quality = 3 }, { itemID = 61791, name = "Plans: Arcanite Belt Buckle", chance = 0.25, quality = 2 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 1.2, quality = 3 } }
BossLoot[9476] = { { itemID = 774, name = "Malachite", chance = 0.58, quality = 2 }, { itemID = 818, name = "Tigerseye", chance = 0.25, quality = 2 }, { itemID = 1206, name = "Moss Agate", chance = 0.8, quality = 2 }, { itemID = 1210, name = "Shadowgem", chance = 0.4, quality = 2 }, { itemID = 1529, name = "Jade", chance = 0.64, quality = 2 }, { itemID = 1705, name = "Lesser Moonstone", chance = 0.5, quality = 2 }, { itemID = 3820, name = "Stranglekelp", chance = 0.08, quality = 1 }, { itemID = 3864, name = "Citrine", chance = 0.16, quality = 2 }, { itemID = 3914, name = "Journeyman's Backpack", chance = 0.08, quality = 1 }, { itemID = 4425, name = "Scroll of Agility III", chance = 0.25, quality = 1 }, { itemID = 4426, name = "Scroll of Strength III", chance = 0.25, quality = 1 }, { itemID = 4500, name = "Traveler's Backpack", chance = 0.33, quality = 2 }, { itemID = 5498, name = "Small Lustrous Pearl", chance = 0.25, quality = 2 }, { itemID = 5500, name = "Iridescent Pearl", chance = 0.24, quality = 2 }, { itemID = 5758, name = "Mithril Lockbox", chance = 0.72, quality = 2 }, { itemID = 7909, name = "Aquamarine", chance = 0.88, quality = 2 }, { itemID = 7910, name = "Star Ruby", chance = 0.4454, quality = 2 }, { itemID = 8766, name = "Morning Glory Dew", chance = 3.3408, quality = 1 }, { itemID = 8950, name = "Homemade Cherry Pie", chance = 6.2361, quality = 1 }, { itemID = 10305, name = "Scroll of Protection IV", chance = 0.48, quality = 1 }, { itemID = 10306, name = "Scroll of Spirit IV", chance = 0.42, quality = 1 }, { itemID = 10315, name = "Pattern: Red Mageweave Shoulders", chance = 0.08, quality = 2 }, { itemID = 11078, name = "Relic Coffer Key", chance = 8.686, quality = 1 }, { itemID = 11446, name = "A Crumpled Up Note", chance = 25, quality = 1 }, { itemID = 11468, name = "Dark Iron Fanny Pack", quality = 1 }, { itemID = 11733, name = "Libram of Constitution", chance = 0.16, quality = 2 }, { itemID = 11736, name = "Libram of Resilience", chance = 0.08, quality = 2 }, { itemID = 11737, name = "Libram of Voracity", chance = 0.2227, quality = 2 }, { itemID = 11754, name = "Black Diamond", chance = 2.0045, quality = 2 }, { itemID = 12527, name = "Ribsplitter", chance = 0.08, quality = 3 }, { itemID = 12528, name = "The Judge's Gavel", chance = 0.08, quality = 3 }, { itemID = 12547, name = "Mar Alom's Grip", chance = 0.08, quality = 3 }, { itemID = 12550, name = "Runed Golem Shackles", chance = 0.32, quality = 3 }, { itemID = 12552, name = "Blisterbane Wrap", chance = 0.08, quality = 3 }, { itemID = 12689, name = "Plans: Radiant Breastplate", chance = 0.08, quality = 2 }, { itemID = 12697, name = "Plans: Radiant Boots", chance = 0.08, quality = 2 }, { itemID = 13443, name = "Superior Mana Potion", chance = 0.75, quality = 1 }, { itemID = 13446, name = "Major Healing Potion", chance = 2.56, quality = 1 }, { itemID = 13490, name = "Recipe: Greater Stoneshield Potion", chance = 0.16, quality = 2 }, { itemID = 14047, name = "Runecloth", chance = 22.9399, quality = 1 }, { itemID = 14466, name = "Pattern: Frostweave Tunic", chance = 0.08, quality = 2 }, { itemID = 14474, name = "Pattern: Frostweave Gloves", chance = 0.08, quality = 2 }, { itemID = 14478, name = "Pattern: Brightcloth Robe", chance = 0.08, quality = 2 }, { itemID = 14479, name = "Pattern: Brightcloth Gloves", chance = 0.08, quality = 2 }, { itemID = 14489, name = "Pattern: Frostweave Pants", chance = 0.08, quality = 2 }, { itemID = 15746, name = "Pattern: Chimeric Leggings", chance = 0.08, quality = 2 }, { itemID = 15757, name = "Pattern: Wicked Leather Pants", chance = 0.16, quality = 2 }, { itemID = 16051, name = "Schematic: Thorium Shells", chance = 0.08, quality = 2 }, { itemID = 16218, name = "Formula: Enchant Bracer - Superior Spirit", chance = 0.08, quality = 2 }, { itemID = 17413, name = "Codex: Prayer of Fortitude", chance = 0.17, quality = 3 }, { itemID = 17414, name = "Codex: Prayer of Fortitude II", chance = 0.24, quality = 3 }, { itemID = 17682, name = "Book: Gift of the Wild", chance = 0.08, quality = 3 }, { itemID = 17683, name = "Book: Gift of the Wild II", chance = 0.16, quality = 3 }, { itemID = 18600, name = "Tome of Arcane Brilliance", chance = 0.08, quality = 3 }, { itemID = 18945, name = "Dark Iron Residue", chance = 13.8085, quality = 1 }, { itemID = 19272, name = "Five of Elementals", chance = 0.08, quality = 3 }, { itemID = 19283, name = "Seven of Portals", chance = 0.16, quality = 3 }, { itemID = 20400, name = "Pumpkin Bag", chance = 0.33, quality = 2 }, { itemID = 22205, name = "Black Steel Bindings", chance = 1.83, quality = 3 }, { itemID = 22254, name = "Wand of Eternal Light", chance = 0.75, quality = 3 }, { itemID = 22255, name = "Magma Forged Band", chance = 0.2227, quality = 3 }, { itemID = 22256, name = "Mana Shaping Handwraps", chance = 1.91, quality = 3 }, { itemID = 22393, name = "Codex: Prayer of Shadow Protection", chance = 0.08, quality = 3 }, { itemID = 22528, name = "Dark Iron Scraps", chance = 16.2584, quality = 1 }, { itemID = 3944, name = "Twill Belt", chance = 0.1087, quality = 0 }, { itemID = 3945, name = "Twill Boots", chance = 0.1087, quality = 0 }, { itemID = 3946, name = "Twill Bracers", chance = 0.1087, quality = 0 }, { itemID = 3947, name = "Twill Cloak", chance = 0.1087, quality = 0 }, { itemID = 3948, name = "Twill Gloves", chance = 0.1087, quality = 0 }, { itemID = 3949, name = "Twill Pants", chance = 0.1087, quality = 0 }, { itemID = 3950, name = "Twill Shoulderpads", chance = 0.1087, quality = 0 }, { itemID = 3951, name = "Twill Vest", chance = 0.1087, quality = 0 }, { itemID = 3969, name = "Smooth Leather Belt", chance = 0.1087, quality = 0 }, { itemID = 3970, name = "Smooth Leather Boots", chance = 0.1087, quality = 0 }, { itemID = 3971, name = "Smooth Leather Bracers", chance = 0.1087, quality = 0 }, { itemID = 3972, name = "Smooth Cloak", chance = 0.1087, quality = 0 }, { itemID = 3973, name = "Smooth Leather Gloves", chance = 0.1087, quality = 0 }, { itemID = 3974, name = "Smooth Leather Pants", chance = 0.1087, quality = 0 }, { itemID = 3975, name = "Smooth Leather Shoulderpads", chance = 0.1087, quality = 0 }, { itemID = 3976, name = "Smooth Leather Armor", chance = 0.1087, quality = 0 }, { itemID = 3987, name = "Deflecting Tower", chance = 0.1087, quality = 0 }, { itemID = 3990, name = "Crested Buckler", chance = 0.1087, quality = 0 }, { itemID = 3992, name = "Laminated Scale Belt", chance = 0.1087, quality = 0 }, { itemID = 3993, name = "Laminated Scale Boots", chance = 0.1087, quality = 0 }, { itemID = 3994, name = "Laminated Scale Bracers", chance = 0.1087, quality = 0 }, { itemID = 3995, name = "Laminated Scale Cloak", chance = 0.1087, quality = 0 }, { itemID = 3996, name = "Laminated Scale Gloves", chance = 0.1087, quality = 0 }, { itemID = 3997, name = "Laminated Scale Pants", chance = 0.1087, quality = 0 }, { itemID = 3998, name = "Laminated Scale Shoulderpads", chance = 0.1087, quality = 0 }, { itemID = 3999, name = "Laminated Scale Armor", chance = 0.1087, quality = 0 }, { itemID = 8080, name = "Light Plate Chestpiece", chance = 0.1087, quality = 0 }, { itemID = 8081, name = "Light Plate Belt", chance = 0.1087, quality = 0 }, { itemID = 8082, name = "Light Plate Boots", chance = 0.1087, quality = 0 }, { itemID = 8083, name = "Light Plate Bracers", chance = 0.1087, quality = 0 }, { itemID = 8084, name = "Light Plate Gloves", chance = 0.1087, quality = 0 }, { itemID = 8085, name = "Light Plate Pants", chance = 0.1087, quality = 0 }, { itemID = 8086, name = "Light Plate Shoulderpads", chance = 0.1087, quality = 0 }, { itemID = 8752, name = "Laminated Scale Circlet", chance = 0.1087, quality = 0 }, { itemID = 8753, name = "Smooth Leather Helmet", chance = 0.1087, quality = 0 }, { itemID = 8754, name = "Twill Cover", chance = 0.1087, quality = 0 }, { itemID = 8755, name = "Light Plate Helmet", chance = 0.1087, quality = 0 }, { itemID = 13816, name = "Fine Longsword", chance = 0.1087, quality = 0 }, { itemID = 13817, name = "Tapered Greatsword", chance = 0.1087, quality = 0 }, { itemID = 13818, name = "Jagged Axe", chance = 0.1087, quality = 0 }, { itemID = 13819, name = "Balanced War Axe", chance = 0.1087, quality = 0 }, { itemID = 13820, name = "Clout Mace", chance = 0.1087, quality = 0 }, { itemID = 13821, name = "Bulky Maul", chance = 0.1087, quality = 0 }, { itemID = 13822, name = "Spiked Dagger", chance = 0.1087, quality = 0 }, { itemID = 13823, name = "Stout War Staff", chance = 0.1087, quality = 0 }, { itemID = 13825, name = "Primed Musket", chance = 0.1087, quality = 0 }, { itemID = 7517, name = "Gossamer Tunic", chance = 0.008772, quality = 2 }, { itemID = 7518, name = "Gossamer Robe", chance = 0.008772, quality = 2 }, { itemID = 7527, name = "Cabalist Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 7557, name = "Gossamer Rod", chance = 0.008772, quality = 2 }, { itemID = 8106, name = "Hibernal Armor", chance = 0.008772, quality = 2 }, { itemID = 8113, name = "Hibernal Robe", chance = 0.008772, quality = 2 }, { itemID = 8119, name = "Heraldic Breastplate", chance = 0.008772, quality = 2 }, { itemID = 8126, name = "Myrmidon's Breastplate", chance = 0.008772, quality = 2 }, { itemID = 8131, name = "Myrmidon's Helm", chance = 0.008772, quality = 2 }, { itemID = 8132, name = "Myrmidon's Leggings", chance = 0.008772, quality = 2 }, { itemID = 8133, name = "Myrmidon's Pauldrons", chance = 0.008772, quality = 2 }, { itemID = 8134, name = "Myrmidon's Defender", chance = 0.008772, quality = 2 }, { itemID = 8247, name = "Imperial Red Bracers", chance = 0.008772, quality = 2 }, { itemID = 8248, name = "Imperial Red Cloak", chance = 0.008772, quality = 2 }, { itemID = 8253, name = "Imperial Red Sash", chance = 0.008772, quality = 2 }, { itemID = 8255, name = "Serpentskin Girdle", chance = 0.008772, quality = 2 }, { itemID = 8257, name = "Serpentskin Bracers", chance = 0.008772, quality = 2 }, { itemID = 8259, name = "Serpentskin Cloak", chance = 0.008772, quality = 2 }, { itemID = 8266, name = "Ebonhold Cloak", chance = 0.008772, quality = 2 }, { itemID = 8274, name = "Valorous Chestguard", chance = 0.008772, quality = 2 }, { itemID = 8282, name = "Valorous Shield", chance = 0.008772, quality = 2 }, { itemID = 9940, name = "Abjurer's Hood", chance = 0.008772, quality = 2 }, { itemID = 9942, name = "Abjurer's Pants", chance = 0.008772, quality = 2 }, { itemID = 9953, name = "Chieftain's Headdress", chance = 0.008772, quality = 2 }, { itemID = 9954, name = "Chieftain's Leggings", chance = 0.008772, quality = 2 }, { itemID = 9955, name = "Chieftain's Shoulders", chance = 0.008772, quality = 2 }, { itemID = 9957, name = "Warmonger's Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 9958, name = "Warmonger's Buckler", chance = 0.008772, quality = 2 }, { itemID = 10058, name = "Duskwoven Sandals", chance = 0.008772, quality = 2 }, { itemID = 10059, name = "Duskwoven Bracers", chance = 0.008772, quality = 2 }, { itemID = 10061, name = "Duskwoven Turban", chance = 0.008772, quality = 2 }, { itemID = 10062, name = "Duskwoven Gloves", chance = 0.008772, quality = 2 }, { itemID = 10063, name = "Duskwoven Amice", chance = 0.008772, quality = 2 }, { itemID = 10068, name = "Righteous Boots", chance = 0.008772, quality = 2 }, { itemID = 10072, name = "Righteous Gloves", chance = 0.008772, quality = 2 }, { itemID = 10075, name = "Righteous Spaulders", chance = 0.008772, quality = 2 }, { itemID = 10080, name = "Lord's Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 10081, name = "Lord's Girdle", chance = 0.008772, quality = 2 }, { itemID = 10082, name = "Lord's Boots", chance = 0.008772, quality = 2 }, { itemID = 10083, name = "Lord's Crown", chance = 0.008772, quality = 2 }, { itemID = 10129, name = "Revenant Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 10130, name = "Revenant Girdle", chance = 0.008772, quality = 2 }, { itemID = 10131, name = "Revenant Boots", chance = 0.008772, quality = 2 }, { itemID = 10132, name = "Revenant Helmet", chance = 0.008772, quality = 2 }, { itemID = 10134, name = "Revenant Shoulders", chance = 0.008772, quality = 2 }, { itemID = 10185, name = "Swashbuckler's Cape", chance = 0.008772, quality = 2 }, { itemID = 10191, name = "Crusader's Armguards", chance = 0.008772, quality = 2 }, { itemID = 10194, name = "Crusader's Cloak", chance = 0.008772, quality = 2 }, { itemID = 10208, name = "Overlord's Legplates", chance = 0.008772, quality = 2 }, { itemID = 10209, name = "Overlord's Spaulders", chance = 0.008772, quality = 2 }, { itemID = 10239, name = "Heavy Lamellar Vambraces", chance = 0.008772, quality = 2 }, { itemID = 10243, name = "Heavy Lamellar Girdle", chance = 0.008772, quality = 2 }, { itemID = 11989, name = "Vanadium Loop", chance = 0.008772, quality = 2 }, { itemID = 12001, name = "Onyx Ring", chance = 0.008772, quality = 2 }, { itemID = 12024, name = "Vanadium Talisman", chance = 0.008772, quality = 2 }, { itemID = 12044, name = "Arctic Pendant", chance = 0.008772, quality = 2 }, { itemID = 14265, name = "Bloodwoven Wraps", chance = 0.008772, quality = 2 }, { itemID = 14267, name = "Bloodwoven Jerkin", chance = 0.008772, quality = 2 }, { itemID = 14274, name = "Gaea's Leggings", chance = 0.008772, quality = 2 }, { itemID = 14278, name = "Opulent Mantle", chance = 0.008772, quality = 2 }, { itemID = 14282, name = "Opulent Gloves", chance = 0.008772, quality = 2 }, { itemID = 14285, name = "Opulent Boots", chance = 0.008772, quality = 2 }, { itemID = 14286, name = "Opulent Belt", chance = 0.008772, quality = 2 }, { itemID = 14289, name = "Arachnidian Girdle", chance = 0.008772, quality = 2 }, { itemID = 14290, name = "Arachnidian Footpads", chance = 0.008772, quality = 2 }, { itemID = 14291, name = "Arachnidian Bracelets", chance = 0.008772, quality = 2 }, { itemID = 14294, name = "Arachnidian Gloves", chance = 0.008772, quality = 2 }, { itemID = 14441, name = "Venomshroud Mask", chance = 0.008772, quality = 2 }, { itemID = 14450, name = "Highborne Cloak", chance = 0.008772, quality = 2 }, { itemID = 14662, name = "Keeper's Hooves", chance = 0.008772, quality = 2 }, { itemID = 14666, name = "Keeper's Gloves", chance = 0.008772, quality = 2 }, { itemID = 14669, name = "Keeper's Mantle", chance = 0.008772, quality = 2 }, { itemID = 14792, name = "Protector Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 14793, name = "Protector Waistband", chance = 0.008772, quality = 2 }, { itemID = 14794, name = "Protector Ankleguards", chance = 0.008772, quality = 2 }, { itemID = 14797, name = "Protector Pads", chance = 0.008772, quality = 2 }, { itemID = 14846, name = "Sunscale Gauntlets", chance = 0.008772, quality = 2 }, { itemID = 14848, name = "Sunscale Sabatons", chance = 0.008772, quality = 2 }, { itemID = 14851, name = "Sunscale Spaulders", chance = 0.008772, quality = 2 }, { itemID = 14904, name = "Brutish Breastplate", chance = 0.008772, quality = 2 }, { itemID = 14912, name = "Brutish Shield", chance = 0.008772, quality = 2 }, { itemID = 14920, name = "Jade Legplates", chance = 0.008772, quality = 2 }, { itemID = 14923, name = "Lofty Armguards", chance = 0.008772, quality = 2 }, { itemID = 14948, name = "Bloodforged Chestpiece", chance = 0.008772, quality = 2 }, { itemID = 14952, name = "Bloodforged Helmet", chance = 0.008772, quality = 2 }, { itemID = 14954, name = "Bloodforged Shield", chance = 0.008772, quality = 2 }, { itemID = 14957, name = "High Chief's Sabatons", chance = 0.008772, quality = 2 }, { itemID = 14960, name = "High Chief's Belt", chance = 0.008772, quality = 2 }, { itemID = 15171, name = "Potent Boots", chance = 0.008772, quality = 2 }, { itemID = 15174, name = "Potent Gloves", chance = 0.008772, quality = 2 }, { itemID = 15175, name = "Potent Helmet", chance = 0.008772, quality = 2 }, { itemID = 15176, name = "Potent Pants", chance = 0.008772, quality = 2 }, { itemID = 15182, name = "Praetorian Wristbands", chance = 0.008772, quality = 2 }, { itemID = 15183, name = "Praetorian Cloak", chance = 0.008772, quality = 2 }, { itemID = 15216, name = "Rune Sword", chance = 0.008772, quality = 2 }, { itemID = 15245, name = "Vorpal Dagger", chance = 0.008772, quality = 2 }, { itemID = 15263, name = "Royal Mallet", chance = 0.008772, quality = 2 }, { itemID = 15279, name = "Ivory Wand", chance = 0.008772, quality = 2 }, { itemID = 15291, name = "Harpy Needler", chance = 0.008772, quality = 2 }, { itemID = 15323, name = "Percussion Shotgun", chance = 0.008772, quality = 2 }, { itemID = 15381, name = "Rageclaw Chestguard", chance = 0.008772, quality = 2 }, { itemID = 15384, name = "Rageclaw Helm", chance = 0.008772, quality = 2 }, { itemID = 15387, name = "Jadefire Bracelets", chance = 0.008772, quality = 2 }, { itemID = 15621, name = "Gryphon Mail Buckler", chance = 0.008772, quality = 2 }, { itemID = 15622, name = "Gryphon Mail Breastplate", chance = 0.008772, quality = 2 }, { itemID = 15623, name = "Gryphon Mail Crown", chance = 0.008772, quality = 2 }, { itemID = 15627, name = "Gryphon Mail Legguards", chance = 0.008772, quality = 2 }, { itemID = 15637, name = "Formidable Legguards", chance = 0.008772, quality = 2 }, { itemID = 15639, name = "Ironhide Bracers", chance = 0.008772, quality = 2 }, { itemID = 15641, name = "Ironhide Belt", chance = 0.008772, quality = 2 }, { itemID = 15649, name = "Merciless Bracers", chance = 0.008772, quality = 2 }, { itemID = 15652, name = "Merciless Cloak", chance = 0.008772, quality = 2 }, { itemID = 15937, name = "Hibernal Sphere", chance = 0.008772, quality = 2 }, { itemID = 15982, name = "Bloodwoven Rod", chance = 0.008772, quality = 2 }, { itemID = 8246, name = "Imperial Red Boots", chance = 0.0102, quality = 2 }, { itemID = 8249, name = "Imperial Red Gloves", chance = 0.0102, quality = 2 }, { itemID = 8250, name = "Imperial Red Mantle", chance = 0.0102, quality = 2 }, { itemID = 8254, name = "Imperial Red Circlet", chance = 0.0102, quality = 2 }, { itemID = 8256, name = "Serpentskin Boots", chance = 0.0102, quality = 2 }, { itemID = 8260, name = "Serpentskin Gloves", chance = 0.0102, quality = 2 }, { itemID = 8263, name = "Serpentskin Spaulders", chance = 0.0102, quality = 2 }, { itemID = 8264, name = "Ebonhold Wristguards", chance = 0.0102, quality = 2 }, { itemID = 8311, name = "Alabaster Plate Vambraces", chance = 0.0102, quality = 2 }, { itemID = 8314, name = "Alabaster Plate Gauntlets", chance = 0.0102, quality = 2 }, { itemID = 8315, name = "Alabaster Plate Girdle", chance = 0.0102, quality = 2 }, { itemID = 8316, name = "Alabaster Plate Greaves", chance = 0.0102, quality = 2 }, { itemID = 9943, name = "Abjurer's Robe", chance = 0.0102, quality = 2 }, { itemID = 9944, name = "Abjurer's Crystal", chance = 0.0102, quality = 2 }, { itemID = 9946, name = "Abjurer's Tunic", chance = 0.0102, quality = 2 }, { itemID = 9950, name = "Chieftain's Breastplate", chance = 0.0102, quality = 2 }, { itemID = 9974, name = "Overlord's Shield", chance = 0.0102, quality = 2 }, { itemID = 10064, name = "Duskwoven Pants", chance = 0.0102, quality = 2 }, { itemID = 10073, name = "Righteous Helmet", chance = 0.0102, quality = 2 }, { itemID = 10074, name = "Righteous Leggings", chance = 0.0102, quality = 2 }, { itemID = 10077, name = "Lord's Breastplate", chance = 0.0102, quality = 2 }, { itemID = 10078, name = "Lord's Crest", chance = 0.0102, quality = 2 }, { itemID = 10084, name = "Lord's Legguards", chance = 0.0102, quality = 2 }, { itemID = 10085, name = "Lord's Pauldrons", chance = 0.0102, quality = 2 }, { itemID = 10098, name = "Councillor's Cloak", chance = 0.0102, quality = 2 }, { itemID = 10108, name = "Wanderer's Cloak", chance = 0.0102, quality = 2 }, { itemID = 10120, name = "Ornate Cloak", chance = 0.0102, quality = 2 }, { itemID = 10133, name = "Revenant Leggings", chance = 0.0102, quality = 2 }, { itemID = 10173, name = "Mystical Bracers", chance = 0.0102, quality = 2 }, { itemID = 10174, name = "Mystical Cape", chance = 0.0102, quality = 2 }, { itemID = 10180, name = "Mystical Belt", chance = 0.0102, quality = 2 }, { itemID = 10184, name = "Swashbuckler's Bracers", chance = 0.0102, quality = 2 }, { itemID = 10186, name = "Swashbuckler's Gloves", chance = 0.0102, quality = 2 }, { itemID = 10190, name = "Swashbuckler's Belt", chance = 0.0102, quality = 2 }, { itemID = 10192, name = "Crusader's Boots", chance = 0.0102, quality = 2 }, { itemID = 10196, name = "Crusader's Gauntlets", chance = 0.0102, quality = 2 }, { itemID = 10197, name = "Crusader's Belt", chance = 0.0102, quality = 2 }, { itemID = 10198, name = "Crusader's Helm", chance = 0.0102, quality = 2 }, { itemID = 10200, name = "Crusader's Pauldrons", chance = 0.0102, quality = 2 }, { itemID = 10203, name = "Overlord's Chestplate", chance = 0.0102, quality = 2 }, { itemID = 10238, name = "Heavy Lamellar Boots", chance = 0.0102, quality = 2 }, { itemID = 10241, name = "Heavy Lamellar Helm", chance = 0.0102, quality = 2 }, { itemID = 10242, name = "Heavy Lamellar Gauntlets", chance = 0.0102, quality = 2 }, { itemID = 10245, name = "Heavy Lamellar Pauldrons", chance = 0.0102, quality = 2 }, { itemID = 11976, name = "Sardonyx Knuckle", chance = 0.0102, quality = 2 }, { itemID = 12014, name = "Arctic Ring", chance = 0.0102, quality = 2 }, { itemID = 12034, name = "Marble Necklace", chance = 0.0102, quality = 2 }, { itemID = 12055, name = "Stardust Band", chance = 0.0102, quality = 2 }, { itemID = 14275, name = "Gaea's Raiment", chance = 0.0102, quality = 2 }, { itemID = 14277, name = "Gaea's Tunic", chance = 0.0102, quality = 2 }, { itemID = 14281, name = "Opulent Crown", chance = 0.0102, quality = 2 }, { itemID = 14296, name = "Arachnidian Pauldrons", chance = 0.0102, quality = 2 }, { itemID = 14300, name = "Bonecaster's Cape", chance = 0.0102, quality = 2 }, { itemID = 14301, name = "Bonecaster's Bindings", chance = 0.0102, quality = 2 }, { itemID = 14444, name = "Venomshroud Leggings", chance = 0.0102, quality = 2 }, { itemID = 14447, name = "Highborne Footpads", chance = 0.0102, quality = 2 }, { itemID = 14448, name = "Highborne Bracelets", chance = 0.0102, quality = 2 }, { itemID = 14451, name = "Highborne Gloves", chance = 0.0102, quality = 2 }, { itemID = 14454, name = "Highborne Cord", chance = 0.0102, quality = 2 }, { itemID = 14667, name = "Keeper's Wreath", chance = 0.0102, quality = 2 }, { itemID = 14668, name = "Keeper's Woolies", chance = 0.0102, quality = 2 }, { itemID = 14672, name = "Pridelord Bands", chance = 0.0102, quality = 2 }, { itemID = 14673, name = "Pridelord Cape", chance = 0.0102, quality = 2 }, { itemID = 14795, name = "Protector Helm", chance = 0.0102, quality = 2 }, { itemID = 14796, name = "Protector Legguards", chance = 0.0102, quality = 2 }, { itemID = 14801, name = "Bloodlust Cape", chance = 0.0102, quality = 2 }, { itemID = 14807, name = "Bloodlust Bracelets", chance = 0.0102, quality = 2 }, { itemID = 14849, name = "Sunscale Helmet", chance = 0.0102, quality = 2 }, { itemID = 14850, name = "Sunscale Legplates", chance = 0.0102, quality = 2 }, { itemID = 14861, name = "Vanguard Vambraces", chance = 0.0102, quality = 2 }, { itemID = 14915, name = "Jade Breastplate", chance = 0.0102, quality = 2 }, { itemID = 14916, name = "Jade Deflector", chance = 0.0102, quality = 2 }, { itemID = 14919, name = "Jade Circlet", chance = 0.0102, quality = 2 }, { itemID = 14922, name = "Lofty Sabatons", chance = 0.0102, quality = 2 }, { itemID = 14926, name = "Lofty Gauntlets", chance = 0.0102, quality = 2 }, { itemID = 14927, name = "Lofty Belt", chance = 0.0102, quality = 2 }, { itemID = 14959, name = "High Chief's Gauntlets", chance = 0.0102, quality = 2 }, { itemID = 14963, name = "High Chief's Pauldrons", chance = 0.0102, quality = 2 }, { itemID = 15170, name = "Potent Armor", chance = 0.0102, quality = 2 }, { itemID = 15180, name = "Praetorian Girdle", chance = 0.0102, quality = 2 }, { itemID = 15228, name = "Smashing Star", chance = 0.0102, quality = 2 }, { itemID = 15236, name = "Moon Cleaver", chance = 0.0102, quality = 2 }, { itemID = 15253, name = "Beheading Blade", chance = 0.0102, quality = 2 }, { itemID = 15274, name = "Diviner Long Staff", chance = 0.0102, quality = 2 }, { itemID = 15280, name = "Wizard's Hand", chance = 0.0102, quality = 2 }, { itemID = 15294, name = "Siege Bow", chance = 0.0102, quality = 2 }, { itemID = 15388, name = "Jadefire Belt", chance = 0.0102, quality = 2 }, { itemID = 15389, name = "Jadefire Sabatons", chance = 0.0102, quality = 2 }, { itemID = 15393, name = "Jadefire Gloves", chance = 0.0102, quality = 2 }, { itemID = 15395, name = "Jadefire Epaulets", chance = 0.0102, quality = 2 }, { itemID = 15631, name = "Formidable Chestpiece", chance = 0.0102, quality = 2 }, { itemID = 15633, name = "Formidable Crest", chance = 0.0102, quality = 2 }, { itemID = 15634, name = "Formidable Circlet", chance = 0.0102, quality = 2 }, { itemID = 15642, name = "Ironhide Greaves", chance = 0.0102, quality = 2 }, { itemID = 15644, name = "Ironhide Gauntlets", chance = 0.0102, quality = 2 }, { itemID = 15647, name = "Ironhide Pauldrons", chance = 0.0102, quality = 2 }, { itemID = 15653, name = "Merciless Gauntlets", chance = 0.0102, quality = 2 }, { itemID = 15983, name = "Gaea's Scepter", chance = 0.0102, quality = 2 }, { itemID = 8251, name = "Imperial Red Pants", chance = 0.0101, quality = 2 }, { itemID = 8261, name = "Serpentskin Helm", chance = 0.0101, quality = 2 }, { itemID = 8262, name = "Serpentskin Leggings", chance = 0.0101, quality = 2 }, { itemID = 8267, name = "Ebonhold Gauntlets", chance = 0.0101, quality = 2 }, { itemID = 8268, name = "Ebonhold Girdle", chance = 0.0101, quality = 2 }, { itemID = 8269, name = "Ebonhold Boots", chance = 0.0101, quality = 2 }, { itemID = 8270, name = "Ebonhold Helmet", chance = 0.0101, quality = 2 }, { itemID = 8272, name = "Ebonhold Shoulderpads", chance = 0.0101, quality = 2 }, { itemID = 8286, name = "Arcane Cloak", chance = 0.0101, quality = 2 }, { itemID = 8297, name = "Traveler's Cloak", chance = 0.0101, quality = 2 }, { itemID = 8317, name = "Alabaster Plate Helmet", chance = 0.0101, quality = 2 }, { itemID = 8319, name = "Alabaster Plate Pauldrons", chance = 0.0101, quality = 2 }, { itemID = 10057, name = "Duskwoven Tunic", chance = 0.0101, quality = 2 }, { itemID = 10065, name = "Duskwoven Robe", chance = 0.0101, quality = 2 }, { itemID = 10070, name = "Righteous Armor", chance = 0.0101, quality = 2 }, { itemID = 10093, name = "Revenant Deflector", chance = 0.0101, quality = 2 }, { itemID = 10096, name = "Councillor's Cuffs", chance = 0.0101, quality = 2 }, { itemID = 10099, name = "Councillor's Gloves", chance = 0.0101, quality = 2 }, { itemID = 10103, name = "Councillor's Sash", chance = 0.0101, quality = 2 }, { itemID = 10107, name = "Wanderer's Bracers", chance = 0.0101, quality = 2 }, { itemID = 10109, name = "Wanderer's Belt", chance = 0.0101, quality = 2 }, { itemID = 10110, name = "Wanderer's Gloves", chance = 0.0101, quality = 2 }, { itemID = 10122, name = "Ornate Girdle", chance = 0.0101, quality = 2 }, { itemID = 10126, name = "Ornate Bracers", chance = 0.0101, quality = 2 }, { itemID = 10128, name = "Revenant Chestplate", chance = 0.0101, quality = 2 }, { itemID = 10165, name = "Templar Gauntlets", chance = 0.0101, quality = 2 }, { itemID = 10166, name = "Templar Girdle", chance = 0.0101, quality = 2 }, { itemID = 10167, name = "Templar Boots", chance = 0.0101, quality = 2 }, { itemID = 10171, name = "Templar Bracers", chance = 0.0101, quality = 2 }, { itemID = 10172, name = "Mystical Mantle", chance = 0.0101, quality = 2 }, { itemID = 10175, name = "Mystical Headwrap", chance = 0.0101, quality = 2 }, { itemID = 10176, name = "Mystical Gloves", chance = 0.0101, quality = 2 }, { itemID = 10179, name = "Mystical Boots", chance = 0.0101, quality = 2 }, { itemID = 10183, name = "Swashbuckler's Boots", chance = 0.0101, quality = 2 }, { itemID = 10187, name = "Swashbuckler's Eyepatch", chance = 0.0101, quality = 2 }, { itemID = 10189, name = "Swashbuckler's Shoulderpads", chance = 0.0101, quality = 2 }, { itemID = 10193, name = "Crusader's Armor", chance = 0.0101, quality = 2 }, { itemID = 10195, name = "Crusader's Shield", chance = 0.0101, quality = 2 }, { itemID = 10199, name = "Crusader's Leggings", chance = 0.0101, quality = 2 }, { itemID = 10204, name = "Heavy Lamellar Shield", chance = 0.0101, quality = 2 }, { itemID = 10231, name = "Engraved Cape", chance = 0.0101, quality = 2 }, { itemID = 10240, name = "Heavy Lamellar Chestpiece", chance = 0.0101, quality = 2 }, { itemID = 10244, name = "Heavy Lamellar Leggings", chance = 0.0101, quality = 2 }, { itemID = 10278, name = "Emerald Girdle", chance = 0.0101, quality = 2 }, { itemID = 11977, name = "Serpentine Loop", chance = 0.0101, quality = 2 }, { itemID = 11990, name = "Selenium Loop", chance = 0.0101, quality = 2 }, { itemID = 12002, name = "Marble Circle", chance = 0.0101, quality = 2 }, { itemID = 12025, name = "Selenium Chain", chance = 0.0101, quality = 2 }, { itemID = 14283, name = "Opulent Leggings", chance = 0.0101, quality = 2 }, { itemID = 14293, name = "Arachnidian Circlet", chance = 0.0101, quality = 2 }, { itemID = 14295, name = "Arachnidian Legguards", chance = 0.0101, quality = 2 }, { itemID = 14299, name = "Bonecaster's Boots", chance = 0.0101, quality = 2 }, { itemID = 14304, name = "Bonecaster's Belt", chance = 0.0101, quality = 2 }, { itemID = 14311, name = "Celestial Bindings", chance = 0.0101, quality = 2 }, { itemID = 14313, name = "Celestial Cape", chance = 0.0101, quality = 2 }, { itemID = 14321, name = "Resplendent Cloak", chance = 0.0101, quality = 2 }, { itemID = 14437, name = "Venomshroud Vest", chance = 0.0101, quality = 2 }, { itemID = 14445, name = "Venomshroud Silk Robes", chance = 0.0101, quality = 2 }, { itemID = 14452, name = "Highborne Pauldrons", chance = 0.0101, quality = 2 }, { itemID = 14664, name = "Keeper's Armor", chance = 0.0101, quality = 2 }, { itemID = 14674, name = "Pridelord Girdle", chance = 0.0101, quality = 2 }, { itemID = 14789, name = "Protector Breastplate", chance = 0.0101, quality = 2 }, { itemID = 14790, name = "Protector Buckler", chance = 0.0101, quality = 2 }, { itemID = 14802, name = "Bloodlust Gauntlets", chance = 0.0101, quality = 2 }, { itemID = 14803, name = "Bloodlust Belt", chance = 0.0101, quality = 2 }, { itemID = 14844, name = "Sunscale Chestguard", chance = 0.0101, quality = 2 }, { itemID = 14852, name = "Sunscale Shield", chance = 0.0101, quality = 2 }, { itemID = 14855, name = "Vanguard Gauntlets", chance = 0.0101, quality = 2 }, { itemID = 14856, name = "Vanguard Girdle", chance = 0.0101, quality = 2 }, { itemID = 14857, name = "Vanguard Sabatons", chance = 0.0101, quality = 2 }, { itemID = 14928, name = "Lofty Legguards", chance = 0.0101, quality = 2 }, { itemID = 14929, name = "Lofty Shoulder Pads", chance = 0.0101, quality = 2 }, { itemID = 14961, name = "High Chief's Crown", chance = 0.0101, quality = 2 }, { itemID = 14962, name = "High Chief's Legguards", chance = 0.0101, quality = 2 }, { itemID = 14968, name = "Glorious Belt", chance = 0.0101, quality = 2 }, { itemID = 14974, name = "Glorious Bindings", chance = 0.0101, quality = 2 }, { itemID = 15181, name = "Praetorian Boots", chance = 0.0101, quality = 2 }, { itemID = 15184, name = "Praetorian Gloves", chance = 0.0101, quality = 2 }, { itemID = 15186, name = "Praetorian Leggings", chance = 0.0101, quality = 2 }, { itemID = 15187, name = "Praetorian Pauldrons", chance = 0.0101, quality = 2 }, { itemID = 15190, name = "Grand Cloak", chance = 0.0101, quality = 2 }, { itemID = 15217, name = "Widow Blade", chance = 0.0101, quality = 2 }, { itemID = 15229, name = "Blesswind Hammer", chance = 0.0101, quality = 2 }, { itemID = 15237, name = "Corpse Harvester", chance = 0.0101, quality = 2 }, { itemID = 15254, name = "Dark Espadon", chance = 0.0101, quality = 2 }, { itemID = 15275, name = "Thaumaturgist Staff", chance = 0.0101, quality = 2 }, { itemID = 15295, name = "Quillfire Bow", chance = 0.0101, quality = 2 }, { itemID = 15394, name = "Jadefire Pants", chance = 0.0101, quality = 2 }, { itemID = 15425, name = "Peerless Bracers", chance = 0.0101, quality = 2 }, { itemID = 15427, name = "Peerless Cloak", chance = 0.0101, quality = 2 }, { itemID = 15645, name = "Ironhide Helmet", chance = 0.0101, quality = 2 }, { itemID = 15646, name = "Ironhide Legguards", chance = 0.0101, quality = 2 }, { itemID = 15654, name = "Merciless Belt", chance = 0.0101, quality = 2 }, { itemID = 15656, name = "Merciless Epaulets", chance = 0.0101, quality = 2 }, { itemID = 15659, name = "Impenetrable Bindings", chance = 0.0101, quality = 2 }, { itemID = 15661, name = "Impenetrable Cloak", chance = 0.0101, quality = 2 }, { itemID = 15694, name = "Merciless Greaves", chance = 0.0101, quality = 2 }, { itemID = 15936, name = "Duskwoven Branch", chance = 0.0101, quality = 2 }, { itemID = 15966, name = "Venomshroud Orb", chance = 0.0101, quality = 2 }, { itemID = 1203, name = "Aegis of Stormwind", chance = 0.0025, quality = 3 }, { itemID = 1607, name = "Soulkeeper", chance = 0.0025, quality = 3 }, { itemID = 1721, name = "Viking Warhammer", chance = 0.0025, quality = 3 }, { itemID = 6660, name = "Julie's Dagger", chance = 0.0025, quality = 3 }, { itemID = 8190, name = "Hanzo Sword", chance = 0.0025, quality = 3 }, { itemID = 13022, name = "Gryphonwing Long Bow", chance = 0.0025, quality = 3 }, { itemID = 13067, name = "Hydralick Armor", chance = 0.0025, quality = 3 }, { itemID = 13111, name = "Sandals of the Insurgent", chance = 0.0025, quality = 3 }, { itemID = 13120, name = "Deepfury Bracers", chance = 0.0025, quality = 3 }, { itemID = 13122, name = "Dark Phantom Cape", chance = 0.0025, quality = 3 }, { itemID = 3936, name = "Crochet Belt", chance = 0.125, quality = 0 }, { itemID = 3937, name = "Crochet Boots", chance = 0.125, quality = 0 }, { itemID = 3938, name = "Crochet Bracers", chance = 0.125, quality = 0 }, { itemID = 3939, name = "Crochet Cloak", chance = 0.125, quality = 0 }, { itemID = 3940, name = "Crochet Gloves", chance = 0.125, quality = 0 }, { itemID = 3941, name = "Crochet Pants", chance = 0.125, quality = 0 }, { itemID = 3942, name = "Crochet Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3943, name = "Crochet Vest", chance = 0.125, quality = 0 }, { itemID = 3961, name = "Thick Leather Belt", chance = 0.125, quality = 0 }, { itemID = 3962, name = "Thick Leather Boots", chance = 0.125, quality = 0 }, { itemID = 3963, name = "Thick Leather Bracers", chance = 0.125, quality = 0 }, { itemID = 3964, name = "Thick Cloak", chance = 0.125, quality = 0 }, { itemID = 3965, name = "Thick Leather Gloves", chance = 0.125, quality = 0 }, { itemID = 3966, name = "Thick Leather Pants", chance = 0.125, quality = 0 }, { itemID = 3967, name = "Thick Leather Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3968, name = "Thick Leather Tunic", chance = 0.125, quality = 0 }, { itemID = 3986, name = "Protective Pavise", chance = 0.125, quality = 0 }, { itemID = 3989, name = "Blocking Targe", chance = 0.125, quality = 0 }, { itemID = 4000, name = "Overlinked Chain Belt", chance = 0.125, quality = 0 }, { itemID = 4001, name = "Overlinked Chain Boots", chance = 0.125, quality = 0 }, { itemID = 4002, name = "Overlinked Chain Bracers", chance = 0.125, quality = 0 }, { itemID = 4003, name = "Overlinked Chain Cloak", chance = 0.125, quality = 0 }, { itemID = 4004, name = "Overlinked Chain Gloves", chance = 0.125, quality = 0 }, { itemID = 4005, name = "Overlinked Chain Pants", chance = 0.125, quality = 0 }, { itemID = 4006, name = "Overlinked Chain Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 4007, name = "Overlinked Chain Armor", chance = 0.125, quality = 0 }, { itemID = 4017, name = "Sharp Shortsword", chance = 0.125, quality = 0 }, { itemID = 4018, name = "Whetted Claymore", chance = 0.125, quality = 0 }, { itemID = 4019, name = "Heavy Flint Axe", chance = 0.125, quality = 0 }, { itemID = 4020, name = "Splintering Battle Axe", chance = 0.125, quality = 0 }, { itemID = 4021, name = "Blunting Mace", chance = 0.125, quality = 0 }, { itemID = 4022, name = "Crushing Maul", chance = 0.125, quality = 0 }, { itemID = 4023, name = "Fine Pointed Dagger", chance = 0.125, quality = 0 }, { itemID = 4024, name = "Heavy War Staff", chance = 0.125, quality = 0 }, { itemID = 4025, name = "Balanced Long Bow", chance = 0.125, quality = 0 }, { itemID = 4026, name = "Sentinel Musket", chance = 0.125, quality = 0 }, { itemID = 8749, name = "Crochet Hat", chance = 0.125, quality = 0 }, { itemID = 8750, name = "Thick Leather Hat", chance = 0.125, quality = 0 }, { itemID = 8751, name = "Overlinked Coif", chance = 0.125, quality = 0 }, { itemID = 13824, name = "Recurve Long Bow", chance = 0.125, quality = 0 }, { itemID = 1639, name = "Grinning Axe", chance = 0.009091, quality = 2 }, { itemID = 3208, name = "Conk Hammer", chance = 0.009091, quality = 2 }, { itemID = 4089, name = "Ricochet Blunderbuss", chance = 0.009091, quality = 2 }, { itemID = 7528, name = "Cabalist Leggings", chance = 0.009091, quality = 2 }, { itemID = 7536, name = "Champion's Wall Shield", chance = 0.009091, quality = 2 }, { itemID = 7537, name = "Gothic Shield", chance = 0.009091, quality = 2 }, { itemID = 7538, name = "Champion's Armor", chance = 0.009091, quality = 2 }, { itemID = 7539, name = "Champion's Leggings", chance = 0.009091, quality = 2 }, { itemID = 7553, name = "Band of the Unicorn", chance = 0.009091, quality = 2 }, { itemID = 8111, name = "Hibernal Mantle", chance = 0.009091, quality = 2 }, { itemID = 8112, name = "Hibernal Pants", chance = 0.009091, quality = 2 }, { itemID = 8115, name = "Hibernal Cowl", chance = 0.009091, quality = 2 }, { itemID = 8122, name = "Heraldic Headpiece", chance = 0.009091, quality = 2 }, { itemID = 8123, name = "Heraldic Leggings", chance = 0.009091, quality = 2 }, { itemID = 8124, name = "Heraldic Spaulders", chance = 0.009091, quality = 2 }, { itemID = 8125, name = "Myrmidon's Bracers", chance = 0.009091, quality = 2 }, { itemID = 8128, name = "Myrmidon's Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 8129, name = "Myrmidon's Girdle", chance = 0.009091, quality = 2 }, { itemID = 8130, name = "Myrmidon's Greaves", chance = 0.009091, quality = 2 }, { itemID = 8279, name = "Valorous Helm", chance = 0.009091, quality = 2 }, { itemID = 8280, name = "Valorous Legguards", chance = 0.009091, quality = 2 }, { itemID = 8281, name = "Valorous Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 9905, name = "Royal Blouse", chance = 0.009091, quality = 2 }, { itemID = 9913, name = "Royal Gown", chance = 0.009091, quality = 2 }, { itemID = 9914, name = "Royal Scepter", chance = 0.009091, quality = 2 }, { itemID = 9924, name = "Tracker's Tunic", chance = 0.009091, quality = 2 }, { itemID = 9936, name = "Abjurer's Boots", chance = 0.009091, quality = 2 }, { itemID = 9937, name = "Abjurer's Bands", chance = 0.009091, quality = 2 }, { itemID = 9938, name = "Abjurer's Cloak", chance = 0.009091, quality = 2 }, { itemID = 9939, name = "Abjurer's Gloves", chance = 0.009091, quality = 2 }, { itemID = 9941, name = "Abjurer's Mantle", chance = 0.009091, quality = 2 }, { itemID = 9945, name = "Abjurer's Sash", chance = 0.009091, quality = 2 }, { itemID = 9947, name = "Chieftain's Belt", chance = 0.009091, quality = 2 }, { itemID = 9948, name = "Chieftain's Boots", chance = 0.009091, quality = 2 }, { itemID = 9949, name = "Chieftain's Bracers", chance = 0.009091, quality = 2 }, { itemID = 9952, name = "Chieftain's Gloves", chance = 0.009091, quality = 2 }, { itemID = 9962, name = "Warmonger's Greaves", chance = 0.009091, quality = 2 }, { itemID = 9963, name = "Warmonger's Circlet", chance = 0.009091, quality = 2 }, { itemID = 9964, name = "Warmonger's Leggings", chance = 0.009091, quality = 2 }, { itemID = 9965, name = "Warmonger's Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 10060, name = "Duskwoven Cape", chance = 0.009091, quality = 2 }, { itemID = 10066, name = "Duskwoven Sash", chance = 0.009091, quality = 2 }, { itemID = 10067, name = "Righteous Waistguard", chance = 0.009091, quality = 2 }, { itemID = 10069, name = "Righteous Bracers", chance = 0.009091, quality = 2 }, { itemID = 10071, name = "Righteous Cloak", chance = 0.009091, quality = 2 }, { itemID = 10076, name = "Lord's Armguards", chance = 0.009091, quality = 2 }, { itemID = 10079, name = "Lord's Cape", chance = 0.009091, quality = 2 }, { itemID = 10086, name = "Gothic Plate Armor", chance = 0.009091, quality = 2 }, { itemID = 10127, name = "Revenant Bracers", chance = 0.009091, quality = 2 }, { itemID = 10201, name = "Overlord's Greaves", chance = 0.009091, quality = 2 }, { itemID = 10202, name = "Overlord's Vambraces", chance = 0.009091, quality = 2 }, { itemID = 10205, name = "Overlord's Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 10206, name = "Overlord's Girdle", chance = 0.009091, quality = 2 }, { itemID = 10207, name = "Overlord's Crown", chance = 0.009091, quality = 2 }, { itemID = 11975, name = "Topaz Ring", chance = 0.009091, quality = 2 }, { itemID = 12013, name = "Desert Ring", chance = 0.009091, quality = 2 }, { itemID = 12032, name = "Onyx Choker", chance = 0.009091, quality = 2 }, { itemID = 14263, name = "Bloodwoven Mask", chance = 0.009091, quality = 2 }, { itemID = 14264, name = "Bloodwoven Pants", chance = 0.009091, quality = 2 }, { itemID = 14271, name = "Gaea's Circlet", chance = 0.009091, quality = 2 }, { itemID = 14273, name = "Gaea's Amice", chance = 0.009091, quality = 2 }, { itemID = 14279, name = "Opulent Bracers", chance = 0.009091, quality = 2 }, { itemID = 14280, name = "Opulent Cape", chance = 0.009091, quality = 2 }, { itemID = 14292, name = "Arachnidian Cape", chance = 0.009091, quality = 2 }, { itemID = 14427, name = "Windchaser Wraps", chance = 0.009091, quality = 2 }, { itemID = 14434, name = "Windchaser Robes", chance = 0.009091, quality = 2 }, { itemID = 14438, name = "Venomshroud Boots", chance = 0.009091, quality = 2 }, { itemID = 14442, name = "Venomshroud Mitts", chance = 0.009091, quality = 2 }, { itemID = 14443, name = "Venomshroud Mantle", chance = 0.009091, quality = 2 }, { itemID = 14446, name = "Venomshroud Belt", chance = 0.009091, quality = 2 }, { itemID = 14655, name = "Scorpashi Breastplate", chance = 0.009091, quality = 2 }, { itemID = 14658, name = "Scorpashi Skullcap", chance = 0.009091, quality = 2 }, { itemID = 14661, name = "Keeper's Cord", chance = 0.009091, quality = 2 }, { itemID = 14663, name = "Keeper's Bindings", chance = 0.009091, quality = 2 }, { itemID = 14665, name = "Keeper's Cloak", chance = 0.009091, quality = 2 }, { itemID = 14779, name = "Khan's Chestpiece", chance = 0.009091, quality = 2 }, { itemID = 14780, name = "Khan's Buckler", chance = 0.009091, quality = 2 }, { itemID = 14785, name = "Khan's Helmet", chance = 0.009091, quality = 2 }, { itemID = 14788, name = "Protector Armguards", chance = 0.009091, quality = 2 }, { itemID = 14791, name = "Protector Cape", chance = 0.009091, quality = 2 }, { itemID = 14835, name = "Tyrant's Chestpiece", chance = 0.009091, quality = 2 }, { itemID = 14842, name = "Tyrant's Shield", chance = 0.009091, quality = 2 }, { itemID = 14847, name = "Sunscale Belt", chance = 0.009091, quality = 2 }, { itemID = 14853, name = "Sunscale Wristguards", chance = 0.009091, quality = 2 }, { itemID = 14907, name = "Brutish Helmet", chance = 0.009091, quality = 2 }, { itemID = 14908, name = "Brutish Legguards", chance = 0.009091, quality = 2 }, { itemID = 14913, name = "Jade Greaves", chance = 0.009091, quality = 2 }, { itemID = 14917, name = "Jade Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 14921, name = "Jade Epaulets", chance = 0.009091, quality = 2 }, { itemID = 14953, name = "Bloodforged Legplates", chance = 0.009091, quality = 2 }, { itemID = 14965, name = "High Chief's Bindings", chance = 0.009091, quality = 2 }, { itemID = 15167, name = "Imposing Bandana", chance = 0.009091, quality = 2 }, { itemID = 15177, name = "Potent Shoulders", chance = 0.009091, quality = 2 }, { itemID = 15227, name = "Diamond-Tip Bludgeon", chance = 0.009091, quality = 2 }, { itemID = 15235, name = "Crescent Edge", chance = 0.009091, quality = 2 }, { itemID = 15252, name = "Tusker Sword", chance = 0.009091, quality = 2 }, { itemID = 15379, name = "Rageclaw Boots", chance = 0.009091, quality = 2 }, { itemID = 15383, name = "Rageclaw Gloves", chance = 0.009091, quality = 2 }, { itemID = 15385, name = "Rageclaw Leggings", chance = 0.009091, quality = 2 }, { itemID = 15386, name = "Rageclaw Shoulder Pads", chance = 0.009091, quality = 2 }, { itemID = 15392, name = "Jadefire Cloak", chance = 0.009091, quality = 2 }, { itemID = 15619, name = "Gryphon Mail Belt", chance = 0.009091, quality = 2 }, { itemID = 15628, name = "Gryphon Mail Pauldrons", chance = 0.009091, quality = 2 }, { itemID = 15629, name = "Formidable Bracers", chance = 0.009091, quality = 2 }, { itemID = 15630, name = "Formidable Sabatons", chance = 0.009091, quality = 2 }, { itemID = 15635, name = "Formidable Gauntlets", chance = 0.009091, quality = 2 }, { itemID = 15636, name = "Formidable Belt", chance = 0.009091, quality = 2 }, { itemID = 15638, name = "Formidable Shoulder Pads", chance = 0.009091, quality = 2 }, { itemID = 15643, name = "Ironhide Cloak", chance = 0.009091, quality = 2 }, { itemID = 15965, name = "Windchaser Orb", chance = 0.009091, quality = 2 }, { itemID = 1608, name = "Skullcrusher Mace", chance = 0.00885, quality = 2 }, { itemID = 1994, name = "Ebonclaw Reaver", chance = 0.00885, quality = 2 }, { itemID = 4069, name = "Blackforge Buckler", chance = 0.00885, quality = 2 }, { itemID = 4082, name = "Blackforge Breastplate", chance = 0.00885, quality = 2 }, { itemID = 4084, name = "Blackforge Leggings", chance = 0.00885, quality = 2 }, { itemID = 4088, name = "Dreadblade", chance = 0.00885, quality = 2 }, { itemID = 4733, name = "Blackforge Pauldrons", chance = 0.00885, quality = 2 }, { itemID = 6427, name = "Mistscape Robe", chance = 0.00885, quality = 2 }, { itemID = 6430, name = "Imperial Leather Breastplate", chance = 0.00885, quality = 2 }, { itemID = 7113, name = "Mistscape Armor", chance = 0.00885, quality = 2 }, { itemID = 7519, name = "Gossamer Pants", chance = 0.00885, quality = 2 }, { itemID = 7520, name = "Gossamer Headpiece", chance = 0.00885, quality = 2 }, { itemID = 7521, name = "Gossamer Gloves", chance = 0.00885, quality = 2 }, { itemID = 7523, name = "Gossamer Shoulderpads", chance = 0.00885, quality = 2 }, { itemID = 7526, name = "Gossamer Belt", chance = 0.00885, quality = 2 }, { itemID = 7529, name = "Cabalist Helm", chance = 0.00885, quality = 2 }, { itemID = 7530, name = "Cabalist Gloves", chance = 0.00885, quality = 2 }, { itemID = 7531, name = "Cabalist Boots", chance = 0.00885, quality = 2 }, { itemID = 7532, name = "Cabalist Spaulders", chance = 0.00885, quality = 2 }, { itemID = 7535, name = "Cabalist Belt", chance = 0.00885, quality = 2 }, { itemID = 7540, name = "Champion's Helmet", chance = 0.00885, quality = 2 }, { itemID = 7541, name = "Champion's Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 7542, name = "Champion's Greaves", chance = 0.00885, quality = 2 }, { itemID = 7543, name = "Champion's Pauldrons", chance = 0.00885, quality = 2 }, { itemID = 7546, name = "Champion's Girdle", chance = 0.00885, quality = 2 }, { itemID = 7611, name = "Mistscape Stave", chance = 0.00885, quality = 2 }, { itemID = 8107, name = "Hibernal Boots", chance = 0.00885, quality = 2 }, { itemID = 8108, name = "Hibernal Bracers", chance = 0.00885, quality = 2 }, { itemID = 8109, name = "Hibernal Cloak", chance = 0.00885, quality = 2 }, { itemID = 8110, name = "Hibernal Gloves", chance = 0.00885, quality = 2 }, { itemID = 8114, name = "Hibernal Sash", chance = 0.00885, quality = 2 }, { itemID = 8116, name = "Heraldic Belt", chance = 0.00885, quality = 2 }, { itemID = 8117, name = "Heraldic Boots", chance = 0.00885, quality = 2 }, { itemID = 8118, name = "Heraldic Bracers", chance = 0.00885, quality = 2 }, { itemID = 8121, name = "Heraldic Gloves", chance = 0.00885, quality = 2 }, { itemID = 8127, name = "Myrmidon's Cape", chance = 0.00885, quality = 2 }, { itemID = 8135, name = "Chromite Shield", chance = 0.00885, quality = 2 }, { itemID = 8138, name = "Chromite Chestplate", chance = 0.00885, quality = 2 }, { itemID = 8143, name = "Chromite Legplates", chance = 0.00885, quality = 2 }, { itemID = 8199, name = "Battlefield Destroyer", chance = 0.00885, quality = 2 }, { itemID = 8273, name = "Valorous Wristguards", chance = 0.00885, quality = 2 }, { itemID = 8276, name = "Valorous Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 8277, name = "Valorous Girdle", chance = 0.00885, quality = 2 }, { itemID = 8278, name = "Valorous Greaves", chance = 0.00885, quality = 2 }, { itemID = 9911, name = "Royal Trousers", chance = 0.00885, quality = 2 }, { itemID = 9922, name = "Tracker's Leggings", chance = 0.00885, quality = 2 }, { itemID = 9951, name = "Chieftain's Cloak", chance = 0.00885, quality = 2 }, { itemID = 9956, name = "Warmonger's Bracers", chance = 0.00885, quality = 2 }, { itemID = 9960, name = "Warmonger's Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 9961, name = "Warmonger's Belt", chance = 0.00885, quality = 2 }, { itemID = 10087, name = "Gothic Plate Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 10090, name = "Gothic Plate Helmet", chance = 0.00885, quality = 2 }, { itemID = 10091, name = "Gothic Plate Leggings", chance = 0.00885, quality = 2 }, { itemID = 10092, name = "Gothic Plate Spaulders", chance = 0.00885, quality = 2 }, { itemID = 11974, name = "Aquamarine Ring", chance = 0.00885, quality = 2 }, { itemID = 11988, name = "Tellurium Band", chance = 0.00885, quality = 2 }, { itemID = 11999, name = "Lodestone Hoop", chance = 0.00885, quality = 2 }, { itemID = 12043, name = "Desert Choker", chance = 0.00885, quality = 2 }, { itemID = 14237, name = "Darkmist Armor", chance = 0.00885, quality = 2 }, { itemID = 14244, name = "Darkmist Wraps", chance = 0.00885, quality = 2 }, { itemID = 14249, name = "Lunar Vest", chance = 0.00885, quality = 2 }, { itemID = 14254, name = "Lunar Raiment", chance = 0.00885, quality = 2 }, { itemID = 14259, name = "Bloodwoven Boots", chance = 0.00885, quality = 2 }, { itemID = 14266, name = "Bloodwoven Pads", chance = 0.00885, quality = 2 }, { itemID = 14268, name = "Gaea's Cuffs", chance = 0.00885, quality = 2 }, { itemID = 14269, name = "Gaea's Slippers", chance = 0.00885, quality = 2 }, { itemID = 14272, name = "Gaea's Handwraps", chance = 0.00885, quality = 2 }, { itemID = 14276, name = "Gaea's Belt", chance = 0.00885, quality = 2 }, { itemID = 14433, name = "Windchaser Woolies", chance = 0.00885, quality = 2 }, { itemID = 14436, name = "Windchaser Coronet", chance = 0.00885, quality = 2 }, { itemID = 14439, name = "Venomshroud Armguards", chance = 0.00885, quality = 2 }, { itemID = 14440, name = "Venomshroud Cape", chance = 0.00885, quality = 2 }, { itemID = 14653, name = "Scorpashi Slippers", chance = 0.00885, quality = 2 }, { itemID = 14657, name = "Scorpashi Gloves", chance = 0.00885, quality = 2 }, { itemID = 14659, name = "Scorpashi Leggings", chance = 0.00885, quality = 2 }, { itemID = 14660, name = "Scorpashi Shoulder Pads", chance = 0.00885, quality = 2 }, { itemID = 14783, name = "Khan's Belt", chance = 0.00885, quality = 2 }, { itemID = 14784, name = "Khan's Greaves", chance = 0.00885, quality = 2 }, { itemID = 14786, name = "Khan's Legguards", chance = 0.00885, quality = 2 }, { itemID = 14787, name = "Khan's Mantle", chance = 0.00885, quality = 2 }, { itemID = 14840, name = "Tyrant's Legplates", chance = 0.00885, quality = 2 }, { itemID = 14843, name = "Tyrant's Helm", chance = 0.00885, quality = 2 }, { itemID = 14911, name = "Brutish Boots", chance = 0.00885, quality = 2 }, { itemID = 14914, name = "Jade Bracers", chance = 0.00885, quality = 2 }, { itemID = 14918, name = "Jade Belt", chance = 0.00885, quality = 2 }, { itemID = 14939, name = "Warbringer's Chestguard", chance = 0.00885, quality = 2 }, { itemID = 14947, name = "Warbringer's Shield", chance = 0.00885, quality = 2 }, { itemID = 14949, name = "Bloodforged Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 14950, name = "Bloodforged Belt", chance = 0.00885, quality = 2 }, { itemID = 14951, name = "Bloodforged Sabatons", chance = 0.00885, quality = 2 }, { itemID = 14955, name = "Bloodforged Shoulder Pads", chance = 0.00885, quality = 2 }, { itemID = 15164, name = "Imposing Vest", chance = 0.00885, quality = 2 }, { itemID = 15172, name = "Potent Bands", chance = 0.00885, quality = 2 }, { itemID = 15173, name = "Potent Cape", chance = 0.00885, quality = 2 }, { itemID = 15178, name = "Potent Belt", chance = 0.00885, quality = 2 }, { itemID = 15262, name = "Greater Maul", chance = 0.00885, quality = 2 }, { itemID = 15270, name = "Gigantic War Axe", chance = 0.00885, quality = 2 }, { itemID = 15373, name = "Wolf Rider's Headgear", chance = 0.00885, quality = 2 }, { itemID = 15376, name = "Wolf Rider's Padded Armor", chance = 0.00885, quality = 2 }, { itemID = 15378, name = "Rageclaw Belt", chance = 0.00885, quality = 2 }, { itemID = 15380, name = "Rageclaw Bracers", chance = 0.00885, quality = 2 }, { itemID = 15601, name = "Ancient Chestpiece", chance = 0.00885, quality = 2 }, { itemID = 15604, name = "Ancient Defender", chance = 0.00885, quality = 2 }, { itemID = 15609, name = "Bonelink Armor", chance = 0.00885, quality = 2 }, { itemID = 15615, name = "Bonelink Helmet", chance = 0.00885, quality = 2 }, { itemID = 15616, name = "Bonelink Legplates", chance = 0.00885, quality = 2 }, { itemID = 15618, name = "Bonelink Wall Shield", chance = 0.00885, quality = 2 }, { itemID = 15620, name = "Gryphon Mail Bracelets", chance = 0.00885, quality = 2 }, { itemID = 15625, name = "Gryphon Mail Gauntlets", chance = 0.00885, quality = 2 }, { itemID = 15626, name = "Gryphon Mail Greaves", chance = 0.00885, quality = 2 }, { itemID = 15632, name = "Formidable Cape", chance = 0.00885, quality = 2 }, { itemID = 15980, name = "Darkmist Orb", chance = 0.00885, quality = 2 }, { itemID = 15981, name = "Lunar Sphere", chance = 0.00885, quality = 2 }, { itemID = 8245, name = "Imperial Red Tunic", chance = 0.009804, quality = 2 }, { itemID = 8252, name = "Imperial Red Robe", chance = 0.009804, quality = 2 }, { itemID = 8258, name = "Serpentskin Armor", chance = 0.009804, quality = 2 }, { itemID = 8265, name = "Ebonhold Armor", chance = 0.009804, quality = 2 }, { itemID = 8271, name = "Ebonhold Leggings", chance = 0.009804, quality = 2 }, { itemID = 8275, name = "Ebonhold Buckler", chance = 0.009804, quality = 2 }, { itemID = 8284, name = "Arcane Boots", chance = 0.009804, quality = 2 }, { itemID = 8285, name = "Arcane Bands", chance = 0.009804, quality = 2 }, { itemID = 8287, name = "Arcane Gloves", chance = 0.009804, quality = 2 }, { itemID = 8291, name = "Arcane Sash", chance = 0.009804, quality = 2 }, { itemID = 8293, name = "Traveler's Belt", chance = 0.009804, quality = 2 }, { itemID = 8294, name = "Traveler's Boots", chance = 0.009804, quality = 2 }, { itemID = 8295, name = "Traveler's Bracers", chance = 0.009804, quality = 2 }, { itemID = 8298, name = "Traveler's Gloves", chance = 0.009804, quality = 2 }, { itemID = 8304, name = "Hero's Cape", chance = 0.009804, quality = 2 }, { itemID = 8312, name = "Alabaster Breastplate", chance = 0.009804, quality = 2 }, { itemID = 8318, name = "Alabaster Plate Leggings", chance = 0.009804, quality = 2 }, { itemID = 8320, name = "Alabaster Shield", chance = 0.009804, quality = 2 }, { itemID = 10095, name = "Councillor's Boots", chance = 0.009804, quality = 2 }, { itemID = 10097, name = "Councillor's Circlet", chance = 0.009804, quality = 2 }, { itemID = 10100, name = "Councillor's Shoulders", chance = 0.009804, quality = 2 }, { itemID = 10106, name = "Wanderer's Boots", chance = 0.009804, quality = 2 }, { itemID = 10111, name = "Wanderer's Hat", chance = 0.009804, quality = 2 }, { itemID = 10113, name = "Wanderer's Shoulders", chance = 0.009804, quality = 2 }, { itemID = 10119, name = "Ornate Greaves", chance = 0.009804, quality = 2 }, { itemID = 10121, name = "Ornate Gauntlets", chance = 0.009804, quality = 2 }, { itemID = 10123, name = "Ornate Circlet", chance = 0.009804, quality = 2 }, { itemID = 10124, name = "Ornate Legguards", chance = 0.009804, quality = 2 }, { itemID = 10125, name = "Ornate Pauldrons", chance = 0.009804, quality = 2 }, { itemID = 10168, name = "Templar Crown", chance = 0.009804, quality = 2 }, { itemID = 10169, name = "Templar Legplates", chance = 0.009804, quality = 2 }, { itemID = 10170, name = "Templar Pauldrons", chance = 0.009804, quality = 2 }, { itemID = 10177, name = "Mystical Leggings", chance = 0.009804, quality = 2 }, { itemID = 10188, name = "Swashbuckler's Leggings", chance = 0.009804, quality = 2 }, { itemID = 10212, name = "Elegant Cloak", chance = 0.009804, quality = 2 }, { itemID = 10224, name = "Nightshade Cloak", chance = 0.009804, quality = 2 }, { itemID = 10229, name = "Engraved Bracers", chance = 0.009804, quality = 2 }, { itemID = 10233, name = "Engraved Girdle", chance = 0.009804, quality = 2 }, { itemID = 10276, name = "Emerald Sabatons", chance = 0.009804, quality = 2 }, { itemID = 10277, name = "Emerald Gauntlets", chance = 0.009804, quality = 2 }, { itemID = 10282, name = "Emerald Vambraces", chance = 0.009804, quality = 2 }, { itemID = 10370, name = "Imbued Plate Girdle", chance = 0.009804, quality = 2 }, { itemID = 10375, name = "Imbued Plate Vambraces", chance = 0.009804, quality = 2 }, { itemID = 12015, name = "Swamp Ring", chance = 0.009804, quality = 2 }, { itemID = 12035, name = "Obsidian Pendant", chance = 0.009804, quality = 2 }, { itemID = 12045, name = "Swamp Pendant", chance = 0.009804, quality = 2 }, { itemID = 12056, name = "Ring of the Heavens", chance = 0.009804, quality = 2 }, { itemID = 14284, name = "Opulent Robes", chance = 0.009804, quality = 2 }, { itemID = 14287, name = "Opulent Tunic", chance = 0.009804, quality = 2 }, { itemID = 14288, name = "Arachnidian Armor", chance = 0.009804, quality = 2 }, { itemID = 14297, name = "Arachnidian Robes", chance = 0.009804, quality = 2 }, { itemID = 14298, name = "Bonecaster's Spaulders", chance = 0.009804, quality = 2 }, { itemID = 14302, name = "Bonecaster's Gloves", chance = 0.009804, quality = 2 }, { itemID = 14305, name = "Bonecaster's Sarong", chance = 0.009804, quality = 2 }, { itemID = 14309, name = "Celestial Belt", chance = 0.009804, quality = 2 }, { itemID = 14320, name = "Resplendent Bracelets", chance = 0.009804, quality = 2 }, { itemID = 14449, name = "Highborne Crown", chance = 0.009804, quality = 2 }, { itemID = 14459, name = "Elunarian Cloak", chance = 0.009804, quality = 2 }, { itemID = 14671, name = "Pridelord Boots", chance = 0.009804, quality = 2 }, { itemID = 14675, name = "Pridelord Gloves", chance = 0.009804, quality = 2 }, { itemID = 14678, name = "Pridelord Pauldrons", chance = 0.009804, quality = 2 }, { itemID = 14805, name = "Bloodlust Britches", chance = 0.009804, quality = 2 }, { itemID = 14806, name = "Bloodlust Epaulets", chance = 0.009804, quality = 2 }, { itemID = 14813, name = "Warstrike Cape", chance = 0.009804, quality = 2 }, { itemID = 14859, name = "Vanguard Legplates", chance = 0.009804, quality = 2 }, { itemID = 14860, name = "Vanguard Pauldrons", chance = 0.009804, quality = 2 }, { itemID = 14924, name = "Lofty Breastplate", chance = 0.009804, quality = 2 }, { itemID = 14925, name = "Lofty Helm", chance = 0.009804, quality = 2 }, { itemID = 14930, name = "Lofty Shield", chance = 0.009804, quality = 2 }, { itemID = 14934, name = "Heroic Girdle", chance = 0.009804, quality = 2 }, { itemID = 14938, name = "Heroic Bracers", chance = 0.009804, quality = 2 }, { itemID = 14958, name = "High Chief's Armor", chance = 0.009804, quality = 2 }, { itemID = 14964, name = "High Chief's Shield", chance = 0.009804, quality = 2 }, { itemID = 14967, name = "Glorious Gauntlets", chance = 0.009804, quality = 2 }, { itemID = 14971, name = "Glorious Shoulder Pads", chance = 0.009804, quality = 2 }, { itemID = 14972, name = "Glorious Sabatons", chance = 0.009804, quality = 2 }, { itemID = 15119, name = "Highborne Pants", chance = 0.009804, quality = 2 }, { itemID = 15179, name = "Praetorian Padded Armor", chance = 0.009804, quality = 2 }, { itemID = 15185, name = "Praetorian Coif", chance = 0.009804, quality = 2 }, { itemID = 15188, name = "Grand Armguards", chance = 0.009804, quality = 2 }, { itemID = 15191, name = "Grand Belt", chance = 0.009804, quality = 2 }, { itemID = 15218, name = "Crystal Sword", chance = 0.009804, quality = 2 }, { itemID = 15255, name = "Gallant Flamberge", chance = 0.009804, quality = 2 }, { itemID = 15264, name = "Backbreaker", chance = 0.009804, quality = 2 }, { itemID = 15271, name = "Colossal Great Axe", chance = 0.009804, quality = 2 }, { itemID = 15281, name = "Glowstar Rod", chance = 0.009804, quality = 2 }, { itemID = 15324, name = "Burnside Rifle", chance = 0.009804, quality = 2 }, { itemID = 15390, name = "Jadefire Chestguard", chance = 0.009804, quality = 2 }, { itemID = 15391, name = "Jadefire Cap", chance = 0.009804, quality = 2 }, { itemID = 15428, name = "Peerless Belt", chance = 0.009804, quality = 2 }, { itemID = 15640, name = "Ironhide Breastplate", chance = 0.009804, quality = 2 }, { itemID = 15648, name = "Ironhide Shield", chance = 0.009804, quality = 2 }, { itemID = 15650, name = "Merciless Surcoat", chance = 0.009804, quality = 2 }, { itemID = 15651, name = "Merciless Crown", chance = 0.009804, quality = 2 }, { itemID = 15655, name = "Merciless Legguards", chance = 0.009804, quality = 2 }, { itemID = 15657, name = "Merciless Shield", chance = 0.009804, quality = 2 }, { itemID = 15662, name = "Impenetrable Gauntlets", chance = 0.009804, quality = 2 }, { itemID = 15663, name = "Impenetrable Belt", chance = 0.009804, quality = 2 }, { itemID = 15671, name = "Magnificent Cloak", chance = 0.009804, quality = 2 }, { itemID = 15930, name = "Imperial Red Scepter", chance = 0.009804, quality = 2 }, { itemID = 15984, name = "Opulent Scepter", chance = 0.009804, quality = 2 }, { itemID = 15985, name = "Arachnidian Branch", chance = 0.009804, quality = 2 }, { itemID = 8288, name = "Arcane Pads", chance = 0.009901, quality = 2 }, { itemID = 8292, name = "Arcane Cover", chance = 0.009901, quality = 2 }, { itemID = 8299, name = "Traveler's Helm", chance = 0.009901, quality = 2 }, { itemID = 8301, name = "Traveler's Spaulders", chance = 0.009901, quality = 2 }, { itemID = 8302, name = "Hero's Bracers", chance = 0.009901, quality = 2 }, { itemID = 8305, name = "Hero's Gauntlets", chance = 0.009901, quality = 2 }, { itemID = 8306, name = "Hero's Belt", chance = 0.009901, quality = 2 }, { itemID = 10101, name = "Councillor's Pants", chance = 0.009901, quality = 2 }, { itemID = 10102, name = "Councillor's Robes", chance = 0.009901, quality = 2 }, { itemID = 10104, name = "Councillor's Tunic", chance = 0.009901, quality = 2 }, { itemID = 10112, name = "Wanderer's Leggings", chance = 0.009901, quality = 2 }, { itemID = 10118, name = "Ornate Breastplate", chance = 0.009901, quality = 2 }, { itemID = 10138, name = "High Councillor's Cloak", chance = 0.009901, quality = 2 }, { itemID = 10145, name = "Mighty Girdle", chance = 0.009901, quality = 2 }, { itemID = 10148, name = "Mighty Cloak", chance = 0.009901, quality = 2 }, { itemID = 10159, name = "Mercurial Cloak", chance = 0.009901, quality = 2 }, { itemID = 10164, name = "Templar Chestplate", chance = 0.009901, quality = 2 }, { itemID = 10178, name = "Mystical Robe", chance = 0.009901, quality = 2 }, { itemID = 10181, name = "Mystical Armor", chance = 0.009901, quality = 2 }, { itemID = 10182, name = "Swashbuckler's Breastplate", chance = 0.009901, quality = 2 }, { itemID = 10211, name = "Elegant Boots", chance = 0.009901, quality = 2 }, { itemID = 10213, name = "Elegant Bracers", chance = 0.009901, quality = 2 }, { itemID = 10214, name = "Elegant Gloves", chance = 0.009901, quality = 2 }, { itemID = 10216, name = "Elegant Belt", chance = 0.009901, quality = 2 }, { itemID = 10221, name = "Nightshade Girdle", chance = 0.009901, quality = 2 }, { itemID = 10222, name = "Nightshade Boots", chance = 0.009901, quality = 2 }, { itemID = 10223, name = "Nightshade Armguards", chance = 0.009901, quality = 2 }, { itemID = 10225, name = "Nightshade Gloves", chance = 0.009901, quality = 2 }, { itemID = 10232, name = "Engraved Gauntlets", chance = 0.009901, quality = 2 }, { itemID = 10234, name = "Engraved Boots", chance = 0.009901, quality = 2 }, { itemID = 10235, name = "Engraved Helm", chance = 0.009901, quality = 2 }, { itemID = 10236, name = "Engraved Leggings", chance = 0.009901, quality = 2 }, { itemID = 10237, name = "Engraved Pauldrons", chance = 0.009901, quality = 2 }, { itemID = 10279, name = "Emerald Helm", chance = 0.009901, quality = 2 }, { itemID = 10280, name = "Emerald Legplates", chance = 0.009901, quality = 2 }, { itemID = 10281, name = "Emerald Pauldrons", chance = 0.009901, quality = 2 }, { itemID = 10362, name = "Ornate Shield", chance = 0.009901, quality = 2 }, { itemID = 10364, name = "Templar Shield", chance = 0.009901, quality = 2 }, { itemID = 10365, name = "Emerald Shield", chance = 0.009901, quality = 2 }, { itemID = 10369, name = "Imbued Plate Gauntlets", chance = 0.009901, quality = 2 }, { itemID = 10371, name = "Imbued Plate Greaves", chance = 0.009901, quality = 2 }, { itemID = 10372, name = "Imbued Plate Helmet", chance = 0.009901, quality = 2 }, { itemID = 10374, name = "Imbued Plate Pauldrons", chance = 0.009901, quality = 2 }, { itemID = 10377, name = "Commander's Vambraces", chance = 0.009901, quality = 2 }, { itemID = 10381, name = "Commander's Girdle", chance = 0.009901, quality = 2 }, { itemID = 11978, name = "Jasper Link", chance = 0.009901, quality = 2 }, { itemID = 11991, name = "Quicksilver Ring", chance = 0.009901, quality = 2 }, { itemID = 12004, name = "Obsidian Band", chance = 0.009901, quality = 2 }, { itemID = 12026, name = "Quicksilver Pendant", chance = 0.009901, quality = 2 }, { itemID = 14307, name = "Bonecaster's Crown", chance = 0.009901, quality = 2 }, { itemID = 14310, name = "Celestial Slippers", chance = 0.009901, quality = 2 }, { itemID = 14314, name = "Celestial Handwraps", chance = 0.009901, quality = 2 }, { itemID = 14315, name = "Celestial Kilt", chance = 0.009901, quality = 2 }, { itemID = 14316, name = "Celestial Pauldrons", chance = 0.009901, quality = 2 }, { itemID = 14319, name = "Resplendent Boots", chance = 0.009901, quality = 2 }, { itemID = 14327, name = "Resplendent Belt", chance = 0.009901, quality = 2 }, { itemID = 14331, name = "Eternal Cloak", chance = 0.009901, quality = 2 }, { itemID = 14453, name = "Highborne Robes", chance = 0.009901, quality = 2 }, { itemID = 14455, name = "Highborne Padded Armor", chance = 0.009901, quality = 2 }, { itemID = 14457, name = "Elunarian Cuffs", chance = 0.009901, quality = 2 }, { itemID = 14670, name = "Pridelord Armor", chance = 0.009901, quality = 2 }, { itemID = 14676, name = "Pridelord Halo", chance = 0.009901, quality = 2 }, { itemID = 14677, name = "Pridelord Pants", chance = 0.009901, quality = 2 }, { itemID = 14682, name = "Indomitable Armguards", chance = 0.009901, quality = 2 }, { itemID = 14683, name = "Indomitable Cloak", chance = 0.009901, quality = 2 }, { itemID = 14798, name = "Bloodlust Breastplate", chance = 0.009901, quality = 2 }, { itemID = 14799, name = "Bloodlust Boots", chance = 0.009901, quality = 2 }, { itemID = 14800, name = "Bloodlust Buckler", chance = 0.009901, quality = 2 }, { itemID = 14804, name = "Bloodlust Helm", chance = 0.009901, quality = 2 }, { itemID = 14808, name = "Warstrike Belt", chance = 0.009901, quality = 2 }, { itemID = 14810, name = "Warstrike Armsplints", chance = 0.009901, quality = 2 }, { itemID = 14854, name = "Vanguard Breastplate", chance = 0.009901, quality = 2 }, { itemID = 14858, name = "Vanguard Headdress", chance = 0.009901, quality = 2 }, { itemID = 14864, name = "Warleader's Belt", chance = 0.009901, quality = 2 }, { itemID = 14869, name = "Warleader's Bracers", chance = 0.009901, quality = 2 }, { itemID = 14932, name = "Heroic Greaves", chance = 0.009901, quality = 2 }, { itemID = 14933, name = "Heroic Gauntlets", chance = 0.009901, quality = 2 }, { itemID = 14937, name = "Heroic Pauldrons", chance = 0.009901, quality = 2 }, { itemID = 14969, name = "Glorious Headdress", chance = 0.009901, quality = 2 }, { itemID = 14970, name = "Glorious Legplates", chance = 0.009901, quality = 2 }, { itemID = 14983, name = "Exalted Armsplints", chance = 0.009901, quality = 2 }, { itemID = 15219, name = "Dimensional Blade", chance = 0.009901, quality = 2 }, { itemID = 15238, name = "Warlord's Axe", chance = 0.009901, quality = 2 }, { itemID = 15256, name = "Massacre Sword", chance = 0.009901, quality = 2 }, { itemID = 15265, name = "Painbringer", chance = 0.009901, quality = 2 }, { itemID = 15272, name = "Razor Axe", chance = 0.009901, quality = 2 }, { itemID = 15276, name = "Magus Long Staff", chance = 0.009901, quality = 2 }, { itemID = 15426, name = "Peerless Boots", chance = 0.009901, quality = 2 }, { itemID = 15429, name = "Peerless Gloves", chance = 0.009901, quality = 2 }, { itemID = 15431, name = "Peerless Leggings", chance = 0.009901, quality = 2 }, { itemID = 15432, name = "Peerless Shoulders", chance = 0.009901, quality = 2 }, { itemID = 15658, name = "Impenetrable Sabatons", chance = 0.009901, quality = 2 }, { itemID = 15666, name = "Impenetrable Pauldrons", chance = 0.009901, quality = 2 }, { itemID = 15668, name = "Magnificent Bracers", chance = 0.009901, quality = 2 }, { itemID = 15673, name = "Magnificent Belt", chance = 0.009901, quality = 2 }, { itemID = 15681, name = "Triumphant Cloak", chance = 0.009901, quality = 2 }, { itemID = 15693, name = "Grand Shoulders", chance = 0.009901, quality = 2 }, { itemID = 15890, name = "Vanguard Shield", chance = 0.009901, quality = 2 }, { itemID = 15938, name = "Mystical Orb", chance = 0.009901, quality = 2 }, { itemID = 15939, name = "Councillor's Scepter", chance = 0.009901, quality = 2 }, { itemID = 15967, name = "Highborne Star", chance = 0.009901, quality = 2 }, { itemID = 810, name = "Hammer of the Northern Wind", chance = 0.00125, quality = 4 }, { itemID = 812, name = "Glowing Brightwood Staff", chance = 0.00125, quality = 4 }, { itemID = 3075, name = "Eye of Flame", chance = 0.00125, quality = 4 }, { itemID = 14552, name = "Stockade Pauldrons", chance = 0.00125, quality = 4 }, { itemID = 55249, name = "Crystal Quartz", chance = 0.5, quality = 2 }, { itemID = 55250, name = "Emberstone", chance = 0.88, quality = 2 }, { itemID = 55251, name = "Pure Moonstone", chance = 0.4454, quality = 2 }, { itemID = 81094, name = "Amber Topaz", chance = 0.25, quality = 2 }, { itemID = 70162, name = "Plans: Flawless Black Gemstone", chance = 0.08, quality = 3 } }
BossLoot[10393] = { { itemID = 12843, name = "Corruptor's Scourgestone", chance = 100, quality = 2 }, { itemID = 14047, name = "Runecloth", chance = 22, quality = 1 }, { itemID = 22526, name = "Bone Fragments", chance = 57, quality = 1 }, { itemID = 13394, name = "Skul's Cold Embrace", chance = 33.33, quality = 3 }, { itemID = 13395, name = "Skul's Fingerbone Claws", chance = 33.33, quality = 3 }, { itemID = 13396, name = "Skul's Ghastly Touch", chance = 33.33, quality = 3 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 1.2, quality = 3 } }
BossLoot[10436] = { { itemID = 12843, name = "Corruptor's Scourgestone", chance = 100, quality = 2 }, { itemID = 13174, name = "Plagued Flesh Sample", quality = 1 }, { itemID = 14047, name = "Runecloth", chance = 18, quality = 1 }, { itemID = 13514, name = "Wail of the Banshee", chance = 20, quality = 2 }, { itemID = 13535, name = "Coldtouch Phantom Wraps", chance = 20, quality = 2 }, { itemID = 13537, name = "Chillhide Bracers", chance = 20, quality = 2 }, { itemID = 13538, name = "Windshrieker Pauldrons", chance = 20, quality = 2 }, { itemID = 13539, name = "Banshee's Touch", chance = 20, quality = 2 }, { itemID = 13534, name = "Banshee Finger", chance = 20, quality = 3 }, { itemID = 16704, name = "Dreadmist Sandals", chance = 20, quality = 3 }, { itemID = 18728, name = "Anastari Heirloom", chance = 20, quality = 3 }, { itemID = 18729, name = "Screeching Bow", chance = 20, quality = 3 }, { itemID = 18730, name = "Shadowy Laced Handwraps", chance = 20, quality = 3 }, { itemID = 51217, name = "Fashion Coin", chance = 5, quality = 2 }, { itemID = 61791, name = "Plans: Arcanite Belt Buckle", chance = 0.25, quality = 2 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 1.2, quality = 3 } }
BossLoot[10440] = { { itemID = 6708, name = "Proof of Companionship", quality = 1 }, { itemID = 12843, name = "Corruptor's Scourgestone", chance = 100, quality = 2 }, { itemID = 13174, name = "Plagued Flesh Sample", quality = 1 }, { itemID = 13251, name = "Head of Baron Rivendare", quality = 1 }, { itemID = 13335, name = "Rivendare's Deathcharger", chance = 0.02, quality = 4 }, { itemID = 14047, name = "Runecloth", chance = 16, quality = 1 }, { itemID = 16668, name = "Kilt of Elements", chance = 11.11, quality = 3 }, { itemID = 16678, name = "Beaststalker's Pants", chance = 11.11, quality = 3 }, { itemID = 16687, name = "Magister's Leggings", chance = 11.11, quality = 3 }, { itemID = 16694, name = "Devout Skirt", chance = 11.11, quality = 3 }, { itemID = 16699, name = "Dreadmist Leggings", chance = 11.11, quality = 3 }, { itemID = 16709, name = "Shadowcraft Pants", chance = 11.11, quality = 3 }, { itemID = 16719, name = "Wildheart Kilt", chance = 11.11, quality = 3 }, { itemID = 16728, name = "Lightforge Legplates", chance = 11.11, quality = 3 }, { itemID = 16732, name = "Legplates of Valor", chance = 11.11, quality = 3 }, { itemID = 13340, name = "Cape of the Black Baron", chance = 14.14, quality = 3 }, { itemID = 13344, name = "Dracorian Gauntlets", chance = 14.14, quality = 3 }, { itemID = 13345, name = "Seal of Rivendare", chance = 14.14, quality = 3 }, { itemID = 13346, name = "Robes of the Exalted", chance = 14.14, quality = 3 }, { itemID = 13349, name = "Scepter of the Unholy", chance = 14.14, quality = 3 }, { itemID = 13361, name = "Skullforge Reaver", chance = 14.14, quality = 3 }, { itemID = 13368, name = "Bonescraper", chance = 14.14, quality = 3 }, { itemID = 13505, name = "Runeblade of Baron Rivendare", chance = 1, quality = 4 }, { itemID = 22408, name = "Ritssyn's Wand of Bad Mojo", chance = 20, quality = 3 }, { itemID = 22409, name = "Tunic of the Crescent Moon", chance = 20, quality = 3 }, { itemID = 22410, name = "Gauntlets of Deftness", chance = 20, quality = 3 }, { itemID = 22411, name = "Helm of the Executioner", chance = 20, quality = 3 }, { itemID = 22412, name = "Thuzadin Mantle", chance = 20, quality = 3 }, { itemID = 41700, name = "Lunar Token", quality = 1 }, { itemID = 47413, name = "Recipe: Concoction of the Arcane Giant", chance = 10, quality = 3 }, { itemID = 47415, name = "Recipe: Concoction of the Dreamwater", chance = 10, quality = 3 }, { itemID = 51217, name = "Fashion Coin", chance = 100, quality = 2 }, { itemID = 61791, name = "Plans: Arcanite Belt Buckle", chance = 0.25, quality = 2 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 3, quality = 3 } }
BossLoot[10509] = { { itemID = 14047, name = "Runecloth", chance = 4, quality = 1 }, { itemID = 22138, name = "Blackrock Bracer", quality = 1 }, { itemID = 12604, name = "Starfire Tiara", chance = 33.33, quality = 3 }, { itemID = 12605, name = "Serpentine Skuller", chance = 33.33, quality = 3 }, { itemID = 12930, name = "Briarwood Reed", chance = 33.33, quality = 3 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 1.2, quality = 3 } }
BossLoot[11520] = { { itemID = 1179, name = "Ice Cold Milk", chance = 4, quality = 1 }, { itemID = 2589, name = "Linen Cloth", chance = 25, quality = 1 }, { itemID = 4605, name = "Red-speckled Mushroom", chance = 4, quality = 1 }, { itemID = 5235, name = "Cultist's Firestick", chance = 100, quality = 1, note = "Level One Lunatic Challenge" }, { itemID = 6706, name = "Proof of Vindication", quality = 1 }, { itemID = 14540, name = "Taragaman the Hungerer's Heart", quality = 1 }, { itemID = 14145, name = "Cursed Felblade", chance = 33.33, quality = 2 }, { itemID = 14148, name = "Crystalline Cuffs", chance = 33.33, quality = 2 }, { itemID = 14149, name = "Subterranean Cape", chance = 33.33, quality = 2 } }
BossLoot[11981] = { { itemID = 19357, name = "Herald of Woe", chance = 16.6666667, quality = 4 }, { itemID = 19367, name = "Dragon's Touch", chance = 16.6666667, quality = 4 }, { itemID = 19430, name = "Shroud of Pure Thought", chance = 16.6666667, quality = 4 }, { itemID = 19431, name = "Styleen's Impeding Scarab", chance = 16.6666667, quality = 4 }, { itemID = 19432, name = "Circle of Applied Force", chance = 16.6666667, quality = 4 }, { itemID = 19433, name = "Emberweave Leggings", chance = 16.6666667, quality = 4 }, { itemID = 16899, name = "Stormrage Gloves", chance = 6.66666667, quality = 4 }, { itemID = 16907, name = "Bloodfang Gloves", chance = 6.66666667, quality = 4 }, { itemID = 16913, name = "Netherwind Gloves", chance = 6.66666667, quality = 4 }, { itemID = 16920, name = "Handguards of Transcendence", chance = 6.66666667, quality = 4 }, { itemID = 16928, name = "Nemesis Gloves", chance = 6.66666667, quality = 4 }, { itemID = 16940, name = "Dragonstalker's Gauntlets", chance = 6.66666667, quality = 4 }, { itemID = 16948, name = "Gauntlets of Ten Storms", chance = 6.66666667, quality = 4 }, { itemID = 16956, name = "Judgement Gloves", chance = 6.66666667, quality = 4 }, { itemID = 16964, name = "Gauntlets of Wrath", chance = 6.66666667, quality = 4 }, { itemID = 19353, name = "Drake Talon Cleaver", chance = 6.66666667, quality = 4 }, { itemID = 19355, name = "Shadow Wing Focus Staff", chance = 6.66666667, quality = 4 }, { itemID = 19394, name = "Drake Talon Pauldrons", chance = 6.66666667, quality = 4 }, { itemID = 19395, name = "Rejuvenating Gem", chance = 6.66666667, quality = 4 }, { itemID = 19396, name = "Taut Dragonhide Belt", chance = 6.66666667, quality = 4 }, { itemID = 19397, name = "Ring of Blackrock", chance = 6.66666667, quality = 4 } }
BossLoot[12098] = { { itemID = 7068, name = "Elemental Fire", chance = 30, quality = 1 }, { itemID = 7077, name = "Heart of Fire", chance = 30, quality = 1 }, { itemID = 7078, name = "Essence of Fire", chance = 40, quality = 2 }, { itemID = 17330, name = "Hand of Sulfuron", quality = 1 }, { itemID = 20951, name = "Narain's Scrying Goggles", quality = 1 }, { itemID = 16823, name = "Nightslayer Shoulder Pads", chance = 30, quality = 4 }, { itemID = 16868, name = "Pauldrons of Might", chance = 30, quality = 4 }, { itemID = 17077, name = "Crimson Shocker", chance = 4, quality = 4 }, { itemID = 18861, name = "Flamewaker Legplates", chance = 4, quality = 4 }, { itemID = 18870, name = "Helm of the Lifegiver", chance = 4, quality = 4 }, { itemID = 18872, name = "Manastorm Leggings", chance = 4, quality = 4 }, { itemID = 18875, name = "Salamander Scale Pants", chance = 4, quality = 4 }, { itemID = 18878, name = "Sorcerous Dagger", chance = 4, quality = 4 }, { itemID = 18879, name = "Heavy Dark Iron Ring", chance = 4, quality = 4 }, { itemID = 19145, name = "Robe of Volatile Power", chance = 4, quality = 4 }, { itemID = 19146, name = "Wristguards of Stability", chance = 4, quality = 4 }, { itemID = 19147, name = "Ring of Spell Power", chance = 4, quality = 4 }, { itemID = 16816, name = "Mantle of Prophecy", chance = 33.33, quality = 4 }, { itemID = 16848, name = "Giantstalker's Epaulets", chance = 33.33, quality = 4 }, { itemID = 17074, name = "Shadowstrike", chance = 33.33, quality = 4 } }
BossLoot[12118] = { { itemID = 7068, name = "Elemental Fire", chance = 30, quality = 1 }, { itemID = 7077, name = "Heart of Fire", chance = 30, quality = 1 }, { itemID = 7078, name = "Essence of Fire", chance = 40, quality = 2 }, { itemID = 16665, name = "Tome of Tranquilizing Shot", chance = 100, quality = 2 }, { itemID = 17329, name = "Hand of Lucifron", quality = 1 }, { itemID = 20951, name = "Narain's Scrying Goggles", quality = 1 }, { itemID = 18252, name = "Pattern: Core Armor Kit", chance = 1, quality = 3 }, { itemID = 18257, name = "Recipe: Major Rejuvenation Potion", chance = 1, quality = 3 }, { itemID = 18259, name = "Formula: Enchant Weapon - Spell Power", chance = 1, quality = 3 }, { itemID = 18260, name = "Formula: Enchant Weapon - Healing Power", chance = 1, quality = 3 }, { itemID = 18264, name = "Plans: Elemental Sharpening Stone", chance = 1, quality = 3 }, { itemID = 18265, name = "Pattern: Flarecore Wraps", chance = 1, quality = 3 }, { itemID = 18290, name = "Schematic: Biznicks 247x128 Accurascope", chance = 1, quality = 3 }, { itemID = 18291, name = "Schematic: Force Reactive Disk", chance = 1, quality = 3 }, { itemID = 18292, name = "Schematic: Core Marksman Rifle", chance = 1, quality = 3 }, { itemID = 21371, name = "Pattern: Core Felcloth Bag", chance = 1, quality = 3 }, { itemID = 16805, name = "Felheart Gloves", chance = 30, quality = 4 }, { itemID = 16863, name = "Gauntlets of Might", chance = 30, quality = 4 }, { itemID = 17077, name = "Crimson Shocker", chance = 4, quality = 4 }, { itemID = 18861, name = "Flamewaker Legplates", chance = 4, quality = 4 }, { itemID = 18870, name = "Helm of the Lifegiver", chance = 4, quality = 4 }, { itemID = 18872, name = "Manastorm Leggings", chance = 4, quality = 4 }, { itemID = 18875, name = "Salamander Scale Pants", chance = 4, quality = 4 }, { itemID = 18878, name = "Sorcerous Dagger", chance = 4, quality = 4 }, { itemID = 18879, name = "Heavy Dark Iron Ring", chance = 4, quality = 4 }, { itemID = 19145, name = "Robe of Volatile Power", chance = 4, quality = 4 }, { itemID = 19146, name = "Wristguards of Stability", chance = 4, quality = 4 }, { itemID = 19147, name = "Ring of Spell Power", chance = 4, quality = 4 }, { itemID = 16800, name = "Arcanist Boots", chance = 20, quality = 4 }, { itemID = 16829, name = "Cenarion Boots", chance = 20, quality = 4 }, { itemID = 16837, name = "Earthfury Boots", chance = 20, quality = 4 }, { itemID = 16859, name = "Lawbringer Boots", chance = 20, quality = 4 }, { itemID = 17109, name = "Choker of Enlightenment", chance = 20, quality = 4 } }
BossLoot[12159] = { { itemID = 7909, name = "Aquamarine", chance = 0.72, quality = 2 }, { itemID = 7910, name = "Star Ruby", chance = 0.5, quality = 2 }, { itemID = 8766, name = "Morning Glory Dew", chance = 2.24, quality = 1 }, { itemID = 8952, name = "Roasted Quail", chance = 2.74, quality = 1 }, { itemID = 10305, name = "Scroll of Protection IV", chance = 0.1, quality = 1 }, { itemID = 10306, name = "Scroll of Spirit IV", chance = 0.4, quality = 1 }, { itemID = 10307, name = "Scroll of Stamina IV", chance = 0.1, quality = 1 }, { itemID = 10308, name = "Scroll of Intellect IV", chance = 0.1, quality = 1 }, { itemID = 12468, name = "Chilton Wand", chance = 5, quality = 0 }, { itemID = 12695, name = "Plans: Radiant Gloves", chance = 0.1, quality = 2 }, { itemID = 12804, name = "Powerful Mojo", chance = 100, quality = 1 }, { itemID = 13446, name = "Major Healing Potion", chance = 1.02, quality = 1 }, { itemID = 13463, name = "Dreamfoil", chance = 0.1, quality = 1 }, { itemID = 13464, name = "Golden Sansam", chance = 0.1, quality = 1 }, { itemID = 13467, name = "Icecap", chance = 0.1, quality = 1 }, { itemID = 13492, name = "Recipe: Purification Potion", chance = 0.1, quality = 2 }, { itemID = 14047, name = "Runecloth", chance = 23.94, quality = 1 }, { itemID = 14504, name = "Pattern: Runecloth Shoulders", chance = 0.2, quality = 2 }, { itemID = 14506, name = "Pattern: Felcloth Robe", chance = 0.1, quality = 2 }, { itemID = 15743, name = "Pattern: Heavy Scorpid Belt", chance = 0.1, quality = 2 }, { itemID = 16051, name = "Schematic: Thorium Shells", chance = 0.1, quality = 2 }, { itemID = 18148, name = "Skull of Korrak", quality = 1 }, { itemID = 19235, name = "Seven of Beasts", chance = 0.1, quality = 3 }, { itemID = 19275, name = "Eight of Elementals", chance = 0.3, quality = 3 }, { itemID = 8283, name = "Arcane Armor", chance = 0.5208, quality = 2 }, { itemID = 8289, name = "Arcane Leggings", chance = 0.5208, quality = 2 }, { itemID = 8290, name = "Arcane Robe", chance = 0.5208, quality = 2 }, { itemID = 8296, name = "Traveler's Jerkin", chance = 0.5208, quality = 2 }, { itemID = 8300, name = "Traveler's Leggings", chance = 0.5208, quality = 2 }, { itemID = 8307, name = "Hero's Boots", chance = 0.5208, quality = 2 }, { itemID = 8308, name = "Hero's Band", chance = 0.5208, quality = 2 }, { itemID = 8309, name = "Hero's Leggings", chance = 0.5208, quality = 2 }, { itemID = 8310, name = "Hero's Pauldrons", chance = 0.5208, quality = 2 }, { itemID = 10105, name = "Wanderer's Armor", chance = 0.5208, quality = 2 }, { itemID = 10136, name = "High Councillor's Bracers", chance = 0.5208, quality = 2 }, { itemID = 10137, name = "High Councillor's Boots", chance = 0.5208, quality = 2 }, { itemID = 10140, name = "High Councillor's Gloves", chance = 0.5208, quality = 2 }, { itemID = 10144, name = "High Councillor's Sash", chance = 0.5208, quality = 2 }, { itemID = 10146, name = "Mighty Boots", chance = 0.5208, quality = 2 }, { itemID = 10147, name = "Mighty Armsplints", chance = 0.5208, quality = 2 }, { itemID = 10149, name = "Mighty Gauntlets", chance = 0.5208, quality = 2 }, { itemID = 10154, name = "Mercurial Girdle", chance = 0.5208, quality = 2 }, { itemID = 10155, name = "Mercurial Greaves", chance = 0.5208, quality = 2 }, { itemID = 10156, name = "Mercurial Bracers", chance = 0.5208, quality = 2 }, { itemID = 10161, name = "Mercurial Gauntlets", chance = 0.5208, quality = 2 }, { itemID = 10210, name = "Elegant Mantle", chance = 0.5208, quality = 2 }, { itemID = 10217, name = "Elegant Leggings", chance = 0.5208, quality = 2 }, { itemID = 10219, name = "Elegant Circlet", chance = 0.5208, quality = 2 }, { itemID = 10226, name = "Nightshade Helmet", chance = 0.5208, quality = 2 }, { itemID = 10228, name = "Nightshade Spaulders", chance = 0.5208, quality = 2 }, { itemID = 10230, name = "Engraved Breastplate", chance = 0.5208, quality = 2 }, { itemID = 10249, name = "Master's Cloak", chance = 0.5208, quality = 2 }, { itemID = 10256, name = "Adventurer's Bracers", chance = 0.5208, quality = 2 }, { itemID = 10258, name = "Adventurer's Cape", chance = 0.5208, quality = 2 }, { itemID = 10267, name = "Masterwork Cape", chance = 0.5208, quality = 2 }, { itemID = 10275, name = "Emerald Breastplate", chance = 0.5208, quality = 2 }, { itemID = 10363, name = "Engraved Wall", chance = 0.5208, quality = 2 }, { itemID = 10373, name = "Imbued Plate Leggings", chance = 0.5208, quality = 2 }, { itemID = 10376, name = "Commander's Boots", chance = 0.5208, quality = 2 }, { itemID = 10379, name = "Commander's Helm", chance = 0.5208, quality = 2 }, { itemID = 10380, name = "Commander's Gauntlets", chance = 0.5208, quality = 2 }, { itemID = 10383, name = "Commander's Pauldrons", chance = 0.5208, quality = 2 }, { itemID = 10387, name = "Hyperion Girdle", chance = 0.5208, quality = 2 }, { itemID = 10391, name = "Hyperion Vambraces", chance = 0.5208, quality = 2 }, { itemID = 11979, name = "Peridot Circle", chance = 0.5208, quality = 2 }, { itemID = 12016, name = "Jungle Ring", chance = 0.5208, quality = 2 }, { itemID = 12046, name = "Jungle Necklace", chance = 0.5208, quality = 2 }, { itemID = 12057, name = "Dragonscale Band", chance = 0.5208, quality = 2 }, { itemID = 14303, name = "Bonecaster's Shroud", chance = 0.5208, quality = 2 }, { itemID = 14306, name = "Bonecaster's Vest", chance = 0.5208, quality = 2 }, { itemID = 14308, name = "Celestial Tunic", chance = 0.5208, quality = 2 }, { itemID = 14312, name = "Celestial Crown", chance = 0.5208, quality = 2 }, { itemID = 14317, name = "Celestial Silk Robes", chance = 0.5208, quality = 2 }, { itemID = 14323, name = "Resplendent Gauntlets", chance = 0.5208, quality = 2 }, { itemID = 14324, name = "Resplendent Sarong", chance = 0.5208, quality = 2 }, { itemID = 14325, name = "Resplendent Epaulets", chance = 0.5208, quality = 2 }, { itemID = 14330, name = "Eternal Bindings", chance = 0.5208, quality = 2 }, { itemID = 14337, name = "Eternal Cord", chance = 0.5208, quality = 2 }, { itemID = 14458, name = "Elunarian Boots", chance = 0.5208, quality = 2 }, { itemID = 14465, name = "Elunarian Belt", chance = 0.5208, quality = 2 }, { itemID = 14684, name = "Indomitable Belt", chance = 0.5208, quality = 2 }, { itemID = 14688, name = "Indomitable Epaulets", chance = 0.5208, quality = 2 }, { itemID = 14863, name = "Warleader's Gauntlets", chance = 0.5208, quality = 2 }, { itemID = 14865, name = "Warleader's Greaves", chance = 0.5208, quality = 2 }, { itemID = 14868, name = "Warleader's Shoulders", chance = 0.5208, quality = 2 }, { itemID = 14935, name = "Heroic Skullcap", chance = 0.5208, quality = 2 }, { itemID = 14936, name = "Heroic Legplates", chance = 0.5208, quality = 2 }, { itemID = 14966, name = "Glorious Breastplate", chance = 0.5208, quality = 2 }, { itemID = 14973, name = "Glorious Shield", chance = 0.5208, quality = 2 }, { itemID = 14976, name = "Exalted Gauntlets", chance = 0.5208, quality = 2 }, { itemID = 14977, name = "Exalted Girdle", chance = 0.5208, quality = 2 }, { itemID = 15189, name = "Grand Boots", chance = 0.5208, quality = 2 }, { itemID = 15192, name = "Grand Gauntlets", chance = 0.5208, quality = 2 }, { itemID = 15194, name = "Grand Legguards", chance = 0.5208, quality = 2 }, { itemID = 15239, name = "Felstone Reaver", chance = 0.5208, quality = 2 }, { itemID = 15266, name = "Fierce Mauler", chance = 0.5208, quality = 2 }, { itemID = 15278, name = "Solstice Staff", chance = 0.5208, quality = 2 }, { itemID = 15282, name = "Dragon Finger", chance = 0.5208, quality = 2 }, { itemID = 15288, name = "Blasthorn Bow", chance = 0.5208, quality = 2 }, { itemID = 15325, name = "Sharpshooter Harquebus", chance = 0.5208, quality = 2 }, { itemID = 15430, name = "Peerless Headband", chance = 0.5208, quality = 2 }, { itemID = 15433, name = "Peerless Armor", chance = 0.5208, quality = 2 }, { itemID = 15434, name = "Supreme Sash", chance = 0.5208, quality = 2 }, { itemID = 15436, name = "Supreme Bracers", chance = 0.5208, quality = 2 }, { itemID = 15437, name = "Supreme Cape", chance = 0.5208, quality = 2 }, { itemID = 15660, name = "Impenetrable Breastplate", chance = 0.5208, quality = 2 }, { itemID = 15664, name = "Impenetrable Helmet", chance = 0.5208, quality = 2 }, { itemID = 15665, name = "Impenetrable Legguards", chance = 0.5208, quality = 2 }, { itemID = 15667, name = "Impenetrable Wall", chance = 0.5208, quality = 2 }, { itemID = 15670, name = "Magnificent Helmet", chance = 0.5208, quality = 2 }, { itemID = 15672, name = "Magnificent Gauntlets", chance = 0.5208, quality = 2 }, { itemID = 15674, name = "Magnificent Greaves", chance = 0.5208, quality = 2 }, { itemID = 15676, name = "Magnificent Leggings", chance = 0.5208, quality = 2 }, { itemID = 15677, name = "Magnificent Shoulders", chance = 0.5208, quality = 2 }, { itemID = 15679, name = "Triumphant Bracers", chance = 0.5208, quality = 2 }, { itemID = 15683, name = "Triumphant Girdle", chance = 0.5208, quality = 2 }, { itemID = 15931, name = "Arcane Star", chance = 0.5208, quality = 2 }, { itemID = 15943, name = "Imbued Shield", chance = 0.5208, quality = 2 }, { itemID = 15986, name = "Bonecaster's Star", chance = 0.5208, quality = 2 }, { itemID = 15987, name = "Astral Orb", chance = 0.5208, quality = 2 }, { itemID = 3944, name = "Twill Belt", chance = 0.1087, quality = 0 }, { itemID = 3945, name = "Twill Boots", chance = 0.1087, quality = 0 }, { itemID = 3946, name = "Twill Bracers", chance = 0.1087, quality = 0 }, { itemID = 3947, name = "Twill Cloak", chance = 0.1087, quality = 0 }, { itemID = 3948, name = "Twill Gloves", chance = 0.1087, quality = 0 }, { itemID = 3949, name = "Twill Pants", chance = 0.1087, quality = 0 }, { itemID = 3950, name = "Twill Shoulderpads", chance = 0.1087, quality = 0 }, { itemID = 3951, name = "Twill Vest", chance = 0.1087, quality = 0 }, { itemID = 3969, name = "Smooth Leather Belt", chance = 0.1087, quality = 0 }, { itemID = 3970, name = "Smooth Leather Boots", chance = 0.1087, quality = 0 }, { itemID = 3971, name = "Smooth Leather Bracers", chance = 0.1087, quality = 0 }, { itemID = 3972, name = "Smooth Cloak", chance = 0.1087, quality = 0 }, { itemID = 3973, name = "Smooth Leather Gloves", chance = 0.1087, quality = 0 }, { itemID = 3974, name = "Smooth Leather Pants", chance = 0.1087, quality = 0 }, { itemID = 3975, name = "Smooth Leather Shoulderpads", chance = 0.1087, quality = 0 }, { itemID = 3976, name = "Smooth Leather Armor", chance = 0.1087, quality = 0 }, { itemID = 3987, name = "Deflecting Tower", chance = 0.1087, quality = 0 }, { itemID = 3990, name = "Crested Buckler", chance = 0.1087, quality = 0 }, { itemID = 3992, name = "Laminated Scale Belt", chance = 0.1087, quality = 0 }, { itemID = 3993, name = "Laminated Scale Boots", chance = 0.1087, quality = 0 }, { itemID = 3994, name = "Laminated Scale Bracers", chance = 0.1087, quality = 0 }, { itemID = 3995, name = "Laminated Scale Cloak", chance = 0.1087, quality = 0 }, { itemID = 3996, name = "Laminated Scale Gloves", chance = 0.1087, quality = 0 }, { itemID = 3997, name = "Laminated Scale Pants", chance = 0.1087, quality = 0 }, { itemID = 3998, name = "Laminated Scale Shoulderpads", chance = 0.1087, quality = 0 }, { itemID = 3999, name = "Laminated Scale Armor", chance = 0.1087, quality = 0 }, { itemID = 8080, name = "Light Plate Chestpiece", chance = 0.1087, quality = 0 }, { itemID = 8081, name = "Light Plate Belt", chance = 0.1087, quality = 0 }, { itemID = 8082, name = "Light Plate Boots", chance = 0.1087, quality = 0 }, { itemID = 8083, name = "Light Plate Bracers", chance = 0.1087, quality = 0 }, { itemID = 8084, name = "Light Plate Gloves", chance = 0.1087, quality = 0 }, { itemID = 8085, name = "Light Plate Pants", chance = 0.1087, quality = 0 }, { itemID = 8086, name = "Light Plate Shoulderpads", chance = 0.1087, quality = 0 }, { itemID = 8752, name = "Laminated Scale Circlet", chance = 0.1087, quality = 0 }, { itemID = 8753, name = "Smooth Leather Helmet", chance = 0.1087, quality = 0 }, { itemID = 8754, name = "Twill Cover", chance = 0.1087, quality = 0 }, { itemID = 8755, name = "Light Plate Helmet", chance = 0.1087, quality = 0 }, { itemID = 13816, name = "Fine Longsword", chance = 0.1087, quality = 0 }, { itemID = 13817, name = "Tapered Greatsword", chance = 0.1087, quality = 0 }, { itemID = 13818, name = "Jagged Axe", chance = 0.1087, quality = 0 }, { itemID = 13819, name = "Balanced War Axe", chance = 0.1087, quality = 0 }, { itemID = 13820, name = "Clout Mace", chance = 0.1087, quality = 0 }, { itemID = 13821, name = "Bulky Maul", chance = 0.1087, quality = 0 }, { itemID = 13822, name = "Spiked Dagger", chance = 0.1087, quality = 0 }, { itemID = 13823, name = "Stout War Staff", chance = 0.1087, quality = 0 }, { itemID = 13825, name = "Primed Musket", chance = 0.1087, quality = 0 }, { itemID = 3936, name = "Crochet Belt", chance = 0.125, quality = 0 }, { itemID = 3937, name = "Crochet Boots", chance = 0.125, quality = 0 }, { itemID = 3938, name = "Crochet Bracers", chance = 0.125, quality = 0 }, { itemID = 3939, name = "Crochet Cloak", chance = 0.125, quality = 0 }, { itemID = 3940, name = "Crochet Gloves", chance = 0.125, quality = 0 }, { itemID = 3941, name = "Crochet Pants", chance = 0.125, quality = 0 }, { itemID = 3942, name = "Crochet Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3943, name = "Crochet Vest", chance = 0.125, quality = 0 }, { itemID = 3961, name = "Thick Leather Belt", chance = 0.125, quality = 0 }, { itemID = 3962, name = "Thick Leather Boots", chance = 0.125, quality = 0 }, { itemID = 3963, name = "Thick Leather Bracers", chance = 0.125, quality = 0 }, { itemID = 3964, name = "Thick Cloak", chance = 0.125, quality = 0 }, { itemID = 3965, name = "Thick Leather Gloves", chance = 0.125, quality = 0 }, { itemID = 3966, name = "Thick Leather Pants", chance = 0.125, quality = 0 }, { itemID = 3967, name = "Thick Leather Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 3968, name = "Thick Leather Tunic", chance = 0.125, quality = 0 }, { itemID = 3986, name = "Protective Pavise", chance = 0.125, quality = 0 }, { itemID = 3989, name = "Blocking Targe", chance = 0.125, quality = 0 }, { itemID = 4000, name = "Overlinked Chain Belt", chance = 0.125, quality = 0 }, { itemID = 4001, name = "Overlinked Chain Boots", chance = 0.125, quality = 0 }, { itemID = 4002, name = "Overlinked Chain Bracers", chance = 0.125, quality = 0 }, { itemID = 4003, name = "Overlinked Chain Cloak", chance = 0.125, quality = 0 }, { itemID = 4004, name = "Overlinked Chain Gloves", chance = 0.125, quality = 0 }, { itemID = 4005, name = "Overlinked Chain Pants", chance = 0.125, quality = 0 }, { itemID = 4006, name = "Overlinked Chain Shoulderpads", chance = 0.125, quality = 0 }, { itemID = 4007, name = "Overlinked Chain Armor", chance = 0.125, quality = 0 }, { itemID = 4017, name = "Sharp Shortsword", chance = 0.125, quality = 0 }, { itemID = 4018, name = "Whetted Claymore", chance = 0.125, quality = 0 }, { itemID = 4019, name = "Heavy Flint Axe", chance = 0.125, quality = 0 }, { itemID = 4020, name = "Splintering Battle Axe", chance = 0.125, quality = 0 }, { itemID = 4021, name = "Blunting Mace", chance = 0.125, quality = 0 }, { itemID = 4022, name = "Crushing Maul", chance = 0.125, quality = 0 }, { itemID = 4023, name = "Fine Pointed Dagger", chance = 0.125, quality = 0 }, { itemID = 4024, name = "Heavy War Staff", chance = 0.125, quality = 0 }, { itemID = 4025, name = "Balanced Long Bow", chance = 0.125, quality = 0 }, { itemID = 4026, name = "Sentinel Musket", chance = 0.125, quality = 0 }, { itemID = 8749, name = "Crochet Hat", chance = 0.125, quality = 0 }, { itemID = 8750, name = "Thick Leather Hat", chance = 0.125, quality = 0 }, { itemID = 8751, name = "Overlinked Coif", chance = 0.125, quality = 0 }, { itemID = 13824, name = "Recurve Long Bow", chance = 0.125, quality = 0 }, { itemID = 944, name = "Elemental Mage Staff", chance = 0.001, quality = 4 }, { itemID = 1263, name = "Brain Hacker", chance = 0.001, quality = 4 }, { itemID = 1443, name = "Jeweled Amulet of Cainwyn", chance = 0.001, quality = 4 }, { itemID = 14553, name = "Sash of Mercy", chance = 0.001, quality = 4 }, { itemID = 60782, name = "Shieldbreaker Arbalest", chance = 0.001, quality = 4 }, { itemID = 9297, name = "Recipe: Elixir of Dream Vision", chance = 0.9524, quality = 2 }, { itemID = 10246, name = "Master's Vest", chance = 0.9524, quality = 2 }, { itemID = 10247, name = "Master's Boots", chance = 0.9524, quality = 2 }, { itemID = 10248, name = "Master's Bracers", chance = 0.9524, quality = 2 }, { itemID = 10249, name = "Master's Cloak", chance = 0.9524, quality = 2 }, { itemID = 10250, name = "Master's Hat", chance = 0.9524, quality = 2 }, { itemID = 10251, name = "Master's Gloves", chance = 0.9524, quality = 2 }, { itemID = 10252, name = "Master's Leggings", chance = 0.9524, quality = 2 }, { itemID = 10253, name = "Master's Mantle", chance = 0.9524, quality = 2 }, { itemID = 10254, name = "Master's Robe", chance = 0.9524, quality = 2 }, { itemID = 10255, name = "Master's Belt", chance = 0.9524, quality = 2 }, { itemID = 10256, name = "Adventurer's Bracers", chance = 0.9524, quality = 2 }, { itemID = 10257, name = "Adventurer's Boots", chance = 0.9524, quality = 2 }, { itemID = 10258, name = "Adventurer's Cape", chance = 0.9524, quality = 2 }, { itemID = 10259, name = "Adventurer's Belt", chance = 0.9524, quality = 2 }, { itemID = 10260, name = "Adventurer's Gloves", chance = 0.9524, quality = 2 }, { itemID = 10261, name = "Adventurer's Bandana", chance = 0.9524, quality = 2 }, { itemID = 10262, name = "Adventurer's Legguards", chance = 0.9524, quality = 2 }, { itemID = 10263, name = "Adventurer's Shoulders", chance = 0.9524, quality = 2 }, { itemID = 10264, name = "Adventurer's Tunic", chance = 0.9524, quality = 2 }, { itemID = 10265, name = "Masterwork Bracers", chance = 0.9524, quality = 2 }, { itemID = 10266, name = "Masterwork Breastplate", chance = 0.9524, quality = 2 }, { itemID = 10267, name = "Masterwork Cape", chance = 0.9524, quality = 2 }, { itemID = 10268, name = "Masterwork Gauntlets", chance = 0.9524, quality = 2 }, { itemID = 10269, name = "Masterwork Girdle", chance = 0.9524, quality = 2 }, { itemID = 10270, name = "Masterwork Boots", chance = 0.9524, quality = 2 }, { itemID = 10272, name = "Masterwork Circlet", chance = 0.9524, quality = 2 }, { itemID = 10273, name = "Masterwork Legplates", chance = 0.9524, quality = 2 }, { itemID = 10274, name = "Masterwork Pauldrons", chance = 0.9524, quality = 2 }, { itemID = 10367, name = "Hyperion Shield", chance = 0.9524, quality = 2 }, { itemID = 10384, name = "Hyperion Armor", chance = 0.9524, quality = 2 }, { itemID = 10385, name = "Hyperion Greaves", chance = 0.9524, quality = 2 }, { itemID = 10386, name = "Hyperion Gauntlets", chance = 0.9524, quality = 2 }, { itemID = 10387, name = "Hyperion Girdle", chance = 0.9524, quality = 2 }, { itemID = 10388, name = "Hyperion Helm", chance = 0.9524, quality = 2 }, { itemID = 10389, name = "Hyperion Legplates", chance = 0.9524, quality = 2 }, { itemID = 10390, name = "Hyperion Pauldrons", chance = 0.9524, quality = 2 }, { itemID = 10391, name = "Hyperion Vambraces", chance = 0.9524, quality = 2 }, { itemID = 11224, name = "Formula: Enchant Shield - Frost Resistance", chance = 0.9524, quality = 2 }, { itemID = 11226, name = "Formula: Enchant Gloves - Riding Skill", chance = 0.9524, quality = 2 }, { itemID = 12017, name = "Prismatic Band", chance = 0.9524, quality = 2 }, { itemID = 12048, name = "Prismatic Pendant", chance = 0.9524, quality = 2 }, { itemID = 12682, name = "Plans: Thorium Armor", chance = 0.9524, quality = 2 }, { itemID = 12683, name = "Plans: Thorium Belt", chance = 0.9524, quality = 2 }, { itemID = 12684, name = "Plans: Thorium Bracers", chance = 0.9524, quality = 2 }, { itemID = 12685, name = "Plans: Radiant Belt", chance = 0.9524, quality = 2 }, { itemID = 12689, name = "Plans: Radiant Breastplate", chance = 0.9524, quality = 2 }, { itemID = 12702, name = "Plans: Radiant Circlet", chance = 0.9524, quality = 2 }, { itemID = 13486, name = "Recipe: Transmute Undeath to Water", chance = 0.9524, quality = 2 }, { itemID = 13487, name = "Recipe: Transmute Water to Undeath", chance = 0.9524, quality = 2 }, { itemID = 13488, name = "Recipe: Transmute Life to Earth", chance = 0.9524, quality = 2 }, { itemID = 13489, name = "Recipe: Transmute Earth to Life", chance = 0.9524, quality = 2 }, { itemID = 14328, name = "Eternal Chestguard", chance = 0.9524, quality = 2 }, { itemID = 14329, name = "Eternal Boots", chance = 0.9524, quality = 2 }, { itemID = 14330, name = "Eternal Bindings", chance = 0.9524, quality = 2 }, { itemID = 14331, name = "Eternal Cloak", chance = 0.9524, quality = 2 }, { itemID = 14332, name = "Eternal Crown", chance = 0.9524, quality = 2 }, { itemID = 14333, name = "Eternal Gloves", chance = 0.9524, quality = 2 }, { itemID = 14334, name = "Eternal Sarong", chance = 0.9524, quality = 2 }, { itemID = 14335, name = "Eternal Spaulders", chance = 0.9524, quality = 2 }, { itemID = 14336, name = "Eternal Wraps", chance = 0.9524, quality = 2 }, { itemID = 14337, name = "Eternal Cord", chance = 0.9524, quality = 2 }, { itemID = 14975, name = "Exalted Harness", chance = 0.9524, quality = 2 }, { itemID = 14976, name = "Exalted Gauntlets", chance = 0.9524, quality = 2 }, { itemID = 14977, name = "Exalted Girdle", chance = 0.9524, quality = 2 }, { itemID = 14978, name = "Exalted Sabatons", chance = 0.9524, quality = 2 }, { itemID = 14979, name = "Exalted Helmet", chance = 0.9524, quality = 2 }, { itemID = 14980, name = "Exalted Legplates", chance = 0.9524, quality = 2 }, { itemID = 14981, name = "Exalted Epaulets", chance = 0.9524, quality = 2 }, { itemID = 14982, name = "Exalted Shield", chance = 0.9524, quality = 2 }, { itemID = 14983, name = "Exalted Armsplints", chance = 0.9524, quality = 2 }, { itemID = 15221, name = "Holy War Sword", chance = 0.9524, quality = 2 }, { itemID = 15229, name = "Blesswind Hammer", chance = 0.9524, quality = 2 }, { itemID = 15240, name = "Demon's Claw", chance = 0.9524, quality = 2 }, { itemID = 15247, name = "Bloodstrike Dagger", chance = 0.9524, quality = 2 }, { itemID = 15258, name = "Divine Warblade", chance = 0.9524, quality = 2 }, { itemID = 15267, name = "Brutehammer", chance = 0.9524, quality = 2 }, { itemID = 15273, name = "Death Striker", chance = 0.9524, quality = 2 }, { itemID = 15278, name = "Solstice Staff", chance = 0.9524, quality = 2 }, { itemID = 15283, name = "Lunar Wand", chance = 0.9524, quality = 2 }, { itemID = 15289, name = "Archstrike Bow", chance = 0.9524, quality = 2 }, { itemID = 15325, name = "Sharpshooter Harquebus", chance = 0.9524, quality = 2 }, { itemID = 15434, name = "Supreme Sash", chance = 0.9524, quality = 2 }, { itemID = 15435, name = "Supreme Shoes", chance = 0.9524, quality = 2 }, { itemID = 15436, name = "Supreme Bracers", chance = 0.9524, quality = 2 }, { itemID = 15437, name = "Supreme Cape", chance = 0.9524, quality = 2 }, { itemID = 15438, name = "Supreme Gloves", chance = 0.9524, quality = 2 }, { itemID = 15439, name = "Supreme Crown", chance = 0.9524, quality = 2 }, { itemID = 15440, name = "Supreme Leggings", chance = 0.9524, quality = 2 }, { itemID = 15441, name = "Supreme Shoulders", chance = 0.9524, quality = 2 }, { itemID = 15442, name = "Supreme Breastplate", chance = 0.9524, quality = 2 }, { itemID = 15678, name = "Triumphant Sabatons", chance = 0.9524, quality = 2 }, { itemID = 15679, name = "Triumphant Bracers", chance = 0.9524, quality = 2 }, { itemID = 15680, name = "Triumphant Chestpiece", chance = 0.9524, quality = 2 }, { itemID = 15681, name = "Triumphant Cloak", chance = 0.9524, quality = 2 }, { itemID = 15682, name = "Triumphant Gauntlets", chance = 0.9524, quality = 2 }, { itemID = 15683, name = "Triumphant Girdle", chance = 0.9524, quality = 2 }, { itemID = 15684, name = "Triumphant Skullcap", chance = 0.9524, quality = 2 }, { itemID = 15685, name = "Triumphant Legplates", chance = 0.9524, quality = 2 }, { itemID = 15686, name = "Triumphant Shoulder Pads", chance = 0.9524, quality = 2 }, { itemID = 15687, name = "Triumphant Shield", chance = 0.9524, quality = 2 }, { itemID = 15942, name = "Master's Rod", chance = 0.9524, quality = 2 }, { itemID = 16044, name = "Schematic: Lifelike Mechanical Toad", chance = 0.9524, quality = 2 }, { itemID = 16055, name = "Schematic: Arcane Bomb", chance = 0.9524, quality = 2 }, { itemID = 16253, name = "Formula: Enchant Chest - Greater Stats", chance = 0.9524, quality = 2 }, { itemID = 1203, name = "Aegis of Stormwind", chance = 0.9434, quality = 3 }, { itemID = 1973, name = "Orb of Deception", chance = 0.9434, quality = 3 }, { itemID = 2564, name = "Elven Spirit Claws", chance = 0.9434, quality = 3 }, { itemID = 4696, name = "Lapidis Tankard of Tidesippe", chance = 0.9434, quality = 3 }, { itemID = 5266, name = "Eye of Adaegus", chance = 0.9434, quality = 3 }, { itemID = 5267, name = "Scarlet Kris", chance = 0.9434, quality = 3 }, { itemID = 6622, name = "Sword of Zeal", chance = 0.9434, quality = 3 }, { itemID = 7734, name = "Six Demon Bag", chance = 0.9434, quality = 3 }, { itemID = 9402, name = "Earthborn Kilt", chance = 0.9434, quality = 3 }, { itemID = 11302, name = "Uther's Strength", chance = 0.9434, quality = 3 }, { itemID = 12691, name = "Plans: Wildthorn Mail", chance = 0.9434, quality = 2 }, { itemID = 13000, name = "Staff of Hale Magefire", chance = 0.9434, quality = 3 }, { itemID = 13001, name = "Maiden's Circle", chance = 0.9434, quality = 3 }, { itemID = 13002, name = "Lady Alizabeth's Pendant", chance = 0.9434, quality = 3 }, { itemID = 13003, name = "Lord Alexander's Battle Axe", chance = 0.9434, quality = 3 }, { itemID = 13004, name = "Torch of Austen", chance = 0.9434, quality = 3 }, { itemID = 13006, name = "Mass of McGowan", chance = 0.9434, quality = 3 }, { itemID = 13007, name = "Mageflame Cloak", chance = 0.9434, quality = 3 }, { itemID = 13008, name = "Dalewind Trousers", chance = 0.9434, quality = 3 }, { itemID = 13009, name = "Cow King's Hide", chance = 0.9434, quality = 3 }, { itemID = 13013, name = "Elder Wizard's Mantle", chance = 0.9434, quality = 3 }, { itemID = 13015, name = "Serathil", chance = 0.9434, quality = 3 }, { itemID = 13030, name = "Basilisk Bone", chance = 0.9434, quality = 3 }, { itemID = 13036, name = "Assassination Blade", chance = 0.9434, quality = 3 }, { itemID = 13040, name = "Heartseeking Crossbow", chance = 0.9434, quality = 3 }, { itemID = 13047, name = "Twig of the World Tree", chance = 0.9434, quality = 3 }, { itemID = 13053, name = "Doombringer", chance = 0.9434, quality = 3 }, { itemID = 13060, name = "The Needler", chance = 0.9434, quality = 3 }, { itemID = 13066, name = "Wyrmslayer Spaulders", chance = 0.9434, quality = 3 }, { itemID = 13067, name = "Hydralick Armor", chance = 0.9434, quality = 3 }, { itemID = 13070, name = "Sapphiron's Scale Boots", chance = 0.9434, quality = 3 }, { itemID = 13072, name = "Stonegrip Gauntlets", chance = 0.9434, quality = 3 }, { itemID = 13073, name = "Mugthol's Helm", chance = 0.9434, quality = 3 }, { itemID = 13075, name = "Direwing Legguards", chance = 0.9434, quality = 3 }, { itemID = 13077, name = "Girdle of Uther", chance = 0.9434, quality = 3 }, { itemID = 13083, name = "Garrett Family Crest", chance = 0.9434, quality = 3 }, { itemID = 13085, name = "Horizon Choker", chance = 0.9434, quality = 3 }, { itemID = 13091, name = "Medallion of Grand Marshal Morris", chance = 0.9434, quality = 3 }, { itemID = 13096, name = "Band of the Hierophant", chance = 0.9434, quality = 3 }, { itemID = 13107, name = "Magiskull Cuffs", chance = 0.9434, quality = 3 }, { itemID = 13111, name = "Sandals of the Insurgent", chance = 0.9434, quality = 3 }, { itemID = 13113, name = "Feathermoon Headdress", chance = 0.9434, quality = 3 }, { itemID = 13116, name = "Spaulders of the Unseen", chance = 0.9434, quality = 3 }, { itemID = 13118, name = "Serpentine Sash", chance = 0.9434, quality = 3 }, { itemID = 13120, name = "Deepfury Bracers", chance = 0.9434, quality = 3 }, { itemID = 13123, name = "Dreamwalker Armor", chance = 0.9434, quality = 3 }, { itemID = 13125, name = "Elven Chain Boots", chance = 0.9434, quality = 3 }, { itemID = 13126, name = "Battlecaller Gauntlets", chance = 0.9434, quality = 3 }, { itemID = 13130, name = "Windrunner Legguards", chance = 0.9434, quality = 3 }, { itemID = 13133, name = "Drakesfire Epaulets", chance = 0.9434, quality = 3 }, { itemID = 13135, name = "Lordly Armguards", chance = 0.9434, quality = 3 }, { itemID = 13144, name = "Serenity Belt", chance = 0.9434, quality = 3 }, { itemID = 13146, name = "Shell Launcher Shotgun", chance = 0.9434, quality = 3 }, { itemID = 12686, name = "Einhorn's Skinner", chance = 20, quality = 3 }, { itemID = 12970, name = "General's Ceremonial Plate", chance = 20, quality = 3 }, { itemID = 13080, name = "Widow's Clutch", chance = 20, quality = 3 }, { itemID = 17108, name = "Mark of Deflection", chance = 20, quality = 4 }, { itemID = 21135, name = "Assassin's Throwing Axe", chance = 20, quality = 3 }, { itemID = 55250, name = "Emberstone", chance = 0.72, quality = 2 }, { itemID = 55251, name = "Pure Moonstone", chance = 0.5, quality = 2 }, { itemID = 70172, name = "Plans: Embergem Cuffs", chance = 0.005, quality = 4 }, { itemID = 70214, name = "Plans: Ring of Unleashed Potential", chance = 0.005, quality = 4 } }
BossLoot[12264] = { { itemID = 7068, name = "Elemental Fire", chance = 30, quality = 1 }, { itemID = 7077, name = "Heart of Fire", chance = 30, quality = 1 }, { itemID = 7078, name = "Essence of Fire", chance = 40, quality = 2 }, { itemID = 17332, name = "Hand of Shazzrah", quality = 1 }, { itemID = 20951, name = "Narain's Scrying Goggles", quality = 1 }, { itemID = 18252, name = "Pattern: Core Armor Kit", chance = 1, quality = 3 }, { itemID = 18257, name = "Recipe: Major Rejuvenation Potion", chance = 1, quality = 3 }, { itemID = 18259, name = "Formula: Enchant Weapon - Spell Power", chance = 1, quality = 3 }, { itemID = 18260, name = "Formula: Enchant Weapon - Healing Power", chance = 1, quality = 3 }, { itemID = 18264, name = "Plans: Elemental Sharpening Stone", chance = 1, quality = 3 }, { itemID = 18265, name = "Pattern: Flarecore Wraps", chance = 1, quality = 3 }, { itemID = 18290, name = "Schematic: Biznicks 247x128 Accurascope", chance = 1, quality = 3 }, { itemID = 18291, name = "Schematic: Force Reactive Disk", chance = 1, quality = 3 }, { itemID = 18292, name = "Schematic: Core Marksman Rifle", chance = 1, quality = 3 }, { itemID = 21371, name = "Pattern: Core Felcloth Bag", chance = 1, quality = 3 }, { itemID = 16803, name = "Felheart Slippers", chance = 25, quality = 4 }, { itemID = 16811, name = "Boots of Prophecy", chance = 25, quality = 4 }, { itemID = 16824, name = "Nightslayer Boots", chance = 25, quality = 4 }, { itemID = 17077, name = "Crimson Shocker", chance = 2.5, quality = 4 }, { itemID = 18861, name = "Flamewaker Legplates", chance = 2.5, quality = 4 }, { itemID = 18870, name = "Helm of the Lifegiver", chance = 2.5, quality = 4 }, { itemID = 18872, name = "Manastorm Leggings", chance = 2.5, quality = 4 }, { itemID = 18875, name = "Salamander Scale Pants", chance = 2.5, quality = 4 }, { itemID = 18878, name = "Sorcerous Dagger", chance = 2.5, quality = 4 }, { itemID = 18879, name = "Heavy Dark Iron Ring", chance = 2.5, quality = 4 }, { itemID = 19145, name = "Robe of Volatile Power", chance = 2.5, quality = 4 }, { itemID = 19146, name = "Wristguards of Stability", chance = 2.5, quality = 4 }, { itemID = 19147, name = "Ring of Spell Power", chance = 2.5, quality = 4 }, { itemID = 16801, name = "Arcanist Gloves", chance = 33.33, quality = 4 }, { itemID = 16831, name = "Cenarion Gloves", chance = 33.33, quality = 4 }, { itemID = 16852, name = "Giantstalker's Gloves", chance = 33.33, quality = 4 } }
BossLoot[14324] = { { itemID = 14047, name = "Runecloth", chance = 25, quality = 1 }, { itemID = 18640, name = "Happy Fun Rock", chance = 2, quality = 1 }, { itemID = 21982, name = "Ogre Warbeads", quality = 1 }, { itemID = 18332, name = "Libram of Rapidity", chance = 2, quality = 2 }, { itemID = 18333, name = "Libram of Focus", chance = 2, quality = 2 }, { itemID = 18334, name = "Libram of Protection", chance = 2, quality = 2 }, { itemID = 18332, name = "Libram of Rapidity", chance = 1, quality = 2 }, { itemID = 18333, name = "Libram of Focus", chance = 1, quality = 2 }, { itemID = 18356, name = "Garona: A Study on Stealth and Treachery", chance = 0.2, quality = 3 }, { itemID = 18357, name = "Codex of Defense", chance = 0.2, quality = 3 }, { itemID = 18358, name = "The Arcanist's Cookbook", chance = 0.2, quality = 3 }, { itemID = 18359, name = "The Light and How to Swing It", chance = 0.2, quality = 3 }, { itemID = 18360, name = "Harnessing Shadows", chance = 0.2, quality = 3 }, { itemID = 18361, name = "The Greatest Race of Hunters", chance = 0.2, quality = 3 }, { itemID = 18362, name = "Holy Bologna: What the Light Won't Tell You", chance = 0.2, quality = 3 }, { itemID = 18363, name = "Frost Shock and You", chance = 0.2, quality = 3 }, { itemID = 18364, name = "The Emerald Dream", chance = 0.2, quality = 3 }, { itemID = 18401, name = "Foror's Compendium of Dragon Slaying", chance = 0.2, quality = 4 }, { itemID = 18483, name = "Mana Channeling Wand", chance = 25, quality = 3 }, { itemID = 18484, name = "Cho'Rush's Blade", chance = 25, quality = 3 }, { itemID = 18485, name = "Observer's Shield", chance = 25, quality = 3 }, { itemID = 18490, name = "Insightful Hood", chance = 25, quality = 3 }, { itemID = 41878, name = "Trashed Book", chance = 100, quality = 0 }, { itemID = 51217, name = "Fashion Coin", chance = 5, quality = 2 } }
BossLoot[14327] = { { itemID = 8948, name = "Dried King Bolete", chance = 8, quality = 1 }, { itemID = 14047, name = "Runecloth", chance = 23, quality = 1 }, { itemID = 18426, name = "Lethtendris's Web", quality = 1 }, { itemID = 18332, name = "Libram of Rapidity", chance = 1, quality = 2 }, { itemID = 18333, name = "Libram of Focus", chance = 1, quality = 2 }, { itemID = 18356, name = "Garona: A Study on Stealth and Treachery", chance = 0.2, quality = 3 }, { itemID = 18357, name = "Codex of Defense", chance = 0.2, quality = 3 }, { itemID = 18358, name = "The Arcanist's Cookbook", chance = 0.2, quality = 3 }, { itemID = 18359, name = "The Light and How to Swing It", chance = 0.2, quality = 3 }, { itemID = 18360, name = "Harnessing Shadows", chance = 0.2, quality = 3 }, { itemID = 18361, name = "The Greatest Race of Hunters", chance = 0.2, quality = 3 }, { itemID = 18362, name = "Holy Bologna: What the Light Won't Tell You", chance = 0.2, quality = 3 }, { itemID = 18363, name = "Frost Shock and You", chance = 0.2, quality = 3 }, { itemID = 18364, name = "The Emerald Dream", chance = 0.2, quality = 3 }, { itemID = 18401, name = "Foror's Compendium of Dragon Slaying", chance = 0.2, quality = 4 }, { itemID = 18301, name = "Lethtendris's Wand", chance = 25, quality = 2 }, { itemID = 18302, name = "Band of Vigor", chance = 25, quality = 2 }, { itemID = 18311, name = "Quel'dorei Channeling Rod", chance = 25, quality = 3 }, { itemID = 18325, name = "Felhide Cap", chance = 25, quality = 3 }, { itemID = 51217, name = "Fashion Coin", chance = 5, quality = 2 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 1.2, quality = 3 } }
BossLoot[14510] = { { itemID = 12804, name = "Powerful Mojo", chance = 24, quality = 1 }, { itemID = 19881, name = "Channeler's Head", quality = 1 }, { itemID = 19943, name = "Massive Mojo", chance = 9, quality = 1 }, { itemID = 19716, name = "Primal Hakkari Bindings", chance = 11.11, quality = 4 }, { itemID = 19717, name = "Primal Hakkari Armsplint", chance = 11.11, quality = 4 }, { itemID = 19718, name = "Primal Hakkari Stanchion", chance = 11.11, quality = 4 }, { itemID = 19719, name = "Primal Hakkari Girdle", chance = 11.11, quality = 4 }, { itemID = 19720, name = "Primal Hakkari Sash", chance = 11.11, quality = 4 }, { itemID = 19721, name = "Primal Hakkari Shawl", chance = 11.11, quality = 4 }, { itemID = 19722, name = "Primal Hakkari Tabard", chance = 11.11, quality = 4 }, { itemID = 19723, name = "Primal Hakkari Kossack", chance = 11.11, quality = 4 }, { itemID = 19724, name = "Primal Hakkari Aegis", chance = 11.11, quality = 4 }, { itemID = 19871, name = "Talisman of Protection", chance = 16.67, quality = 3 }, { itemID = 19919, name = "Bloodstained Greaves", chance = 16.67, quality = 3 }, { itemID = 19925, name = "Band of Jin", chance = 16.67, quality = 3 }, { itemID = 19927, name = "Mar'li's Touch", chance = 16.67, quality = 4 }, { itemID = 19930, name = "Mar'li's Eye", chance = 16.67, quality = 3 }, { itemID = 20032, name = "Flowing Ritual Robes", chance = 16.67, quality = 4 }, { itemID = 22711, name = "Cloak of the Hakkari Worshipers", chance = 10, quality = 3 }, { itemID = 22712, name = "Might of the Tribe", chance = 10, quality = 3 }, { itemID = 22713, name = "Zulian Scepter of Rites", chance = 10, quality = 3 }, { itemID = 22714, name = "Sacrificial Gauntlets", chance = 10, quality = 3 }, { itemID = 22715, name = "Gloves of the Tormented", chance = 10, quality = 3 }, { itemID = 22716, name = "Belt of Untapped Power", chance = 10, quality = 3 }, { itemID = 22718, name = "Blooddrenched Mask", chance = 10, quality = 3 }, { itemID = 22720, name = "Zulian Headdress", chance = 10, quality = 3 }, { itemID = 22721, name = "Band of Servitude", chance = 10, quality = 4 }, { itemID = 22722, name = "Seal of the Gurubashi Berserker", chance = 10, quality = 4 }, { itemID = 81003, name = "Ancient Hakkari Flayer", chance = 10, quality = 3 } }
BossLoot[14516] = { { itemID = 12843, name = "Corruptor's Scourgestone", chance = 100, quality = 2 }, { itemID = 14047, name = "Runecloth", chance = 10, quality = 1 }, { itemID = 18749, name = "Charger's Lost Soul", quality = 1 }, { itemID = 18880, name = "Darkreaver's Head", quality = 1 }, { itemID = 18758, name = "Specter's Blade", chance = 25, quality = 3 }, { itemID = 18759, name = "Malicious Axe", chance = 25, quality = 3 }, { itemID = 18760, name = "Necromantic Band", chance = 25, quality = 3 }, { itemID = 18761, name = "Oblivion's Touch", chance = 25, quality = 3 } }
BossLoot[14686] = { { itemID = 4306, name = "Silk Cloth", chance = 20, quality = 1 }, { itemID = 4338, name = "Mageweave Cloth", chance = 4, quality = 1 }, { itemID = 23177, name = "Lady Falther'ess' Finger", chance = 50, quality = 3 }, { itemID = 23178, name = "Mantle of Lady Falther'ess", chance = 50, quality = 3 } }
BossLoot[14834] = { { itemID = 12804, name = "Powerful Mojo", chance = 25, quality = 1 }, { itemID = 19802, name = "Heart of Hakkar", chance = 100, quality = 4 }, { itemID = 19943, name = "Massive Mojo", chance = 100, quality = 1 }, { itemID = 19852, name = "Ancient Hakkari Manslayer", chance = 14.29, quality = 4 }, { itemID = 19853, name = "Gurubashi Dwarf Destroyer", chance = 14.29, quality = 4 }, { itemID = 19856, name = "The Eye of Hakkar", chance = 14.29, quality = 4 }, { itemID = 19857, name = "Cloak of Consumption", chance = 14.29, quality = 4 }, { itemID = 19864, name = "Bloodcaller", chance = 14.29, quality = 4 }, { itemID = 20257, name = "Seafury Gauntlets", chance = 14.29, quality = 4 }, { itemID = 20264, name = "Peacekeeper Gauntlets", chance = 14.29, quality = 4 }, { itemID = 19854, name = "Zin'rokh, Destroyer of Worlds", chance = 14.29, quality = 4 }, { itemID = 19855, name = "Bloodsoaked Legplates", chance = 14.29, quality = 4 }, { itemID = 19859, name = "Fang of the Faceless", chance = 14.29, quality = 4 }, { itemID = 19861, name = "Touch of Chaos", chance = 14.29, quality = 4 }, { itemID = 19862, name = "Aegis of the Blood God", chance = 14.29, quality = 4 }, { itemID = 19865, name = "Warblade of the Hakkari", chance = 14.29, quality = 4 }, { itemID = 19876, name = "Soul Corrupter's Necklace", chance = 14.29, quality = 4 }, { itemID = 83006, name = "Well Essence", quality = 2 } }
BossLoot[15083] = { { itemID = 19942, name = "Hazza'rah's Dream Thread", chance = 100, quality = 2 }, { itemID = 19967, name = "Thoughtblighter", chance = 45, quality = 3 }, { itemID = 19968, name = "Fiery Retributer", chance = 40, quality = 3 }, { itemID = 19942, name = "Hazza'rah's Dream Thread", chance = 20, quality = 2 }, { itemID = 19942, name = "Hazza'rah's Dream Thread", chance = 20, quality = 2 } }
BossLoot[15511] = { { itemID = 21229, name = "Qiraji Lord's Insignia", chance = 100, quality = 1 }, { itemID = 20727, name = "Formula: Enchant Gloves - Shadow Power", chance = 1, quality = 3 }, { itemID = 20728, name = "Formula: Enchant Gloves - Frost Power", chance = 1, quality = 3 }, { itemID = 20729, name = "Formula: Enchant Gloves - Fire Power", chance = 1, quality = 3 }, { itemID = 20730, name = "Formula: Enchant Gloves - Healing Power", chance = 1, quality = 3 }, { itemID = 20731, name = "Formula: Enchant Gloves - Superior Agility", chance = 1, quality = 3 }, { itemID = 20734, name = "Formula: Enchant Cloak - Stealth", chance = 1, quality = 3 }, { itemID = 20736, name = "Formula: Enchant Cloak - Dodge", chance = 1, quality = 3 }, { itemID = 21232, name = "Imperial Qiraji Armaments", chance = 4, quality = 4 }, { itemID = 21237, name = "Imperial Qiraji Regalia", chance = 4, quality = 4 }, { itemID = 21603, name = "Wand of Qiraji Nobility", chance = 25, quality = 4 }, { itemID = 21680, name = "Vest of Swift Execution", chance = 25, quality = 4 }, { itemID = 21681, name = "Ring of the Devoured", chance = 25, quality = 4 }, { itemID = 21685, name = "Petrified Scarab", chance = 25, quality = 4 }, { itemID = 21692, name = "Triad Girdle", chance = 16.67, quality = 4 }, { itemID = 21693, name = "Guise of the Devourer", chance = 16.67, quality = 4 }, { itemID = 21694, name = "Ternary Mantle", chance = 16.67, quality = 4 }, { itemID = 21695, name = "Angelista's Touch", chance = 16.67, quality = 4 }, { itemID = 21696, name = "Robes of the Triumvirate", chance = 16.67, quality = 4 }, { itemID = 21697, name = "Cape of the Trinity", chance = 16.67, quality = 4 } }
BossLoot[15990] = { { itemID = 22520, name = "The Phylactery of Kel'Thuzad", chance = 100, quality = 4 }, { itemID = 22733, name = "Staff Head of Atiesh", quality = 5 }, { itemID = 22798, name = "Might of Menethil", chance = 9.091, quality = 4 }, { itemID = 22799, name = "Soulseeker", chance = 9.091, quality = 4 }, { itemID = 22802, name = "Kingsfall", chance = 9.091, quality = 4 }, { itemID = 22812, name = "Nerubian Slavemaker", chance = 9.091, quality = 4 }, { itemID = 22819, name = "Shield of Condemnation", chance = 9.091, quality = 4 }, { itemID = 22821, name = "Doomfinger", chance = 9.091, quality = 4 }, { itemID = 23053, name = "Stormrage's Talisman of Seething", chance = 9.091, quality = 4 }, { itemID = 23054, name = "Gressil, Dawn of Ruin", chance = 9.091, quality = 4 }, { itemID = 23056, name = "Hammer of the Twisting Nether", chance = 9.091, quality = 4 }, { itemID = 23057, name = "Gem of Trapped Innocents", chance = 9.091, quality = 4 }, { itemID = 23577, name = "The Hungering Cold", chance = 9.091, quality = 4 }, { itemID = 22798, name = "Might of Menethil", chance = 9.091, quality = 4 }, { itemID = 22799, name = "Soulseeker", chance = 9.091, quality = 4 }, { itemID = 22802, name = "Kingsfall", chance = 9.091, quality = 4 }, { itemID = 22812, name = "Nerubian Slavemaker", chance = 9.091, quality = 4 }, { itemID = 22819, name = "Shield of Condemnation", chance = 9.091, quality = 4 }, { itemID = 22821, name = "Doomfinger", chance = 9.091, quality = 4 }, { itemID = 23053, name = "Stormrage's Talisman of Seething", chance = 9.091, quality = 4 }, { itemID = 23054, name = "Gressil, Dawn of Ruin", chance = 9.091, quality = 4 }, { itemID = 23056, name = "Hammer of the Twisting Nether", chance = 9.091, quality = 4 }, { itemID = 23057, name = "Gem of Trapped Innocents", chance = 9.091, quality = 4 }, { itemID = 23577, name = "The Hungering Cold", chance = 9.091, quality = 4 }, { itemID = 81283, name = "Mr. Bigglesworth", chance = 100, quality = 2 } }
BossLoot[16028] = { { itemID = 22726, name = "Splinter of Atiesh", chance = 30, quality = 5 }, { itemID = 22354, name = "Desecrated Pauldrons", chance = 33.3333333, quality = 4 }, { itemID = 22361, name = "Desecrated Spaulders", chance = 33.3333333, quality = 4 }, { itemID = 22368, name = "Desecrated Shoulderpads", chance = 33.3333333, quality = 4 }, { itemID = 22815, name = "Severance", chance = 20, quality = 4 }, { itemID = 22818, name = "The Plague Bearer", chance = 20, quality = 4 }, { itemID = 22820, name = "Wand of Fates", chance = 20, quality = 4 }, { itemID = 22960, name = "Cloak of Suturing", chance = 20, quality = 4 }, { itemID = 22961, name = "Band of Reanimation", chance = 20, quality = 4 } }
BossLoot[16061] = { { itemID = 22726, name = "Splinter of Atiesh", chance = 30, quality = 5 }, { itemID = 22358, name = "Desecrated Sabatons", chance = 33.33, quality = 4 }, { itemID = 22365, name = "Desecrated Boots", chance = 33.33, quality = 4 }, { itemID = 22372, name = "Desecrated Sandals", chance = 33.33, quality = 4 }, { itemID = 23004, name = "Idol of Longevity", chance = 16.67, quality = 4 }, { itemID = 23009, name = "Wand of the Whispering Dead", chance = 16.67, quality = 4 }, { itemID = 23014, name = "Iblis, Blade of the Fallen Seraph", chance = 16.67, quality = 4 }, { itemID = 23017, name = "Veil of Eclipse", chance = 16.67, quality = 4 }, { itemID = 23018, name = "Signet of the Fallen Defender", chance = 16.67, quality = 4 }, { itemID = 23219, name = "Girdle of the Mentor", chance = 16.67, quality = 4 }, { itemID = 41395, name = "Immaculate Diamond Necklace", quality = 1 } }
BossLoot[16184] = { { itemID = 1203, name = "Aegis of Stormwind", chance = 1.316, quality = 3 }, { itemID = 1973, name = "Orb of Deception", chance = 1.316, quality = 3 }, { itemID = 2564, name = "Elven Spirit Claws", chance = 1.316, quality = 3 }, { itemID = 4696, name = "Lapidis Tankard of Tidesippe", chance = 1.316, quality = 3 }, { itemID = 5266, name = "Eye of Adaegus", chance = 1.316, quality = 3 }, { itemID = 5267, name = "Scarlet Kris", chance = 1.316, quality = 3 }, { itemID = 6622, name = "Sword of Zeal", chance = 1.316, quality = 3 }, { itemID = 7734, name = "Six Demon Bag", chance = 1.316, quality = 3 }, { itemID = 7976, name = "Plans: Mithril Shield Spike", chance = 1.316, quality = 3 }, { itemID = 7991, name = "Plans: Mithril Scale Shoulders", chance = 1.316, quality = 3 }, { itemID = 8028, name = "Plans: Runed Mithril Hammer", chance = 1.316, quality = 3 }, { itemID = 9402, name = "Earthborn Kilt", chance = 1.316, quality = 3 }, { itemID = 10605, name = "Schematic: Spellpower Goggles Xtreme", chance = 1.316, quality = 2 }, { itemID = 10608, name = "Schematic: Sniper Scope", chance = 1.316, quality = 3 }, { itemID = 11302, name = "Uther's Strength", chance = 1.316, quality = 3 }, { itemID = 12698, name = "Plans: Dawnbringer Shoulders", chance = 1.316, quality = 3 }, { itemID = 12711, name = "Plans: Whitesoul Helm", chance = 1.316, quality = 3 }, { itemID = 12717, name = "Plans: Lionheart Helm", chance = 1.316, quality = 4 }, { itemID = 12720, name = "Plans: Stronghold Gauntlets", chance = 1.316, quality = 4 }, { itemID = 12728, name = "Plans: Invulnerable Mail", chance = 1.316, quality = 4 }, { itemID = 13000, name = "Staff of Hale Magefire", chance = 1.316, quality = 3 }, { itemID = 13001, name = "Maiden's Circle", chance = 1.316, quality = 3 }, { itemID = 13002, name = "Lady Alizabeth's Pendant", chance = 1.316, quality = 3 }, { itemID = 13003, name = "Lord Alexander's Battle Axe", chance = 1.316, quality = 3 }, { itemID = 13004, name = "Torch of Austen", chance = 1.316, quality = 3 }, { itemID = 13006, name = "Mass of McGowan", chance = 1.316, quality = 3 }, { itemID = 13007, name = "Mageflame Cloak", chance = 1.316, quality = 3 }, { itemID = 13008, name = "Dalewind Trousers", chance = 1.316, quality = 3 }, { itemID = 13009, name = "Cow King's Hide", chance = 1.316, quality = 3 }, { itemID = 13013, name = "Elder Wizard's Mantle", chance = 1.316, quality = 3 }, { itemID = 13015, name = "Serathil", chance = 1.316, quality = 3 }, { itemID = 13030, name = "Basilisk Bone", chance = 1.316, quality = 3 }, { itemID = 13036, name = "Assassination Blade", chance = 1.316, quality = 3 }, { itemID = 13040, name = "Heartseeking Crossbow", chance = 1.316, quality = 3 }, { itemID = 13047, name = "Twig of the World Tree", chance = 1.316, quality = 3 }, { itemID = 13053, name = "Doombringer", chance = 1.316, quality = 3 }, { itemID = 13060, name = "The Needler", chance = 1.316, quality = 3 }, { itemID = 13066, name = "Wyrmslayer Spaulders", chance = 1.316, quality = 3 }, { itemID = 13067, name = "Hydralick Armor", chance = 1.316, quality = 3 }, { itemID = 13070, name = "Sapphiron's Scale Boots", chance = 1.316, quality = 3 }, { itemID = 13072, name = "Stonegrip Gauntlets", chance = 1.316, quality = 3 }, { itemID = 13073, name = "Mugthol's Helm", chance = 1.316, quality = 3 }, { itemID = 13075, name = "Direwing Legguards", chance = 1.316, quality = 3 }, { itemID = 13077, name = "Girdle of Uther", chance = 1.316, quality = 3 }, { itemID = 13083, name = "Garrett Family Crest", chance = 1.316, quality = 3 }, { itemID = 13085, name = "Horizon Choker", chance = 1.316, quality = 3 }, { itemID = 13091, name = "Medallion of Grand Marshal Morris", chance = 1.316, quality = 3 }, { itemID = 13096, name = "Band of the Hierophant", chance = 1.316, quality = 3 }, { itemID = 13107, name = "Magiskull Cuffs", chance = 1.316, quality = 3 }, { itemID = 13111, name = "Sandals of the Insurgent", chance = 1.316, quality = 3 }, { itemID = 13113, name = "Feathermoon Headdress", chance = 1.316, quality = 3 }, { itemID = 13116, name = "Spaulders of the Unseen", chance = 1.316, quality = 3 }, { itemID = 13118, name = "Serpentine Sash", chance = 1.316, quality = 3 }, { itemID = 13120, name = "Deepfury Bracers", chance = 1.316, quality = 3 }, { itemID = 13123, name = "Dreamwalker Armor", chance = 1.316, quality = 3 }, { itemID = 13125, name = "Elven Chain Boots", chance = 1.316, quality = 3 }, { itemID = 13126, name = "Battlecaller Gauntlets", chance = 1.316, quality = 3 }, { itemID = 13130, name = "Windrunner Legguards", chance = 1.316, quality = 3 }, { itemID = 13133, name = "Drakesfire Epaulets", chance = 1.316, quality = 3 }, { itemID = 13135, name = "Lordly Armguards", chance = 1.316, quality = 3 }, { itemID = 13144, name = "Serenity Belt", chance = 1.316, quality = 3 }, { itemID = 13146, name = "Shell Launcher Shotgun", chance = 1.316, quality = 3 }, { itemID = 14501, name = "Pattern: Mooncloth Vest", chance = 1.316, quality = 3 }, { itemID = 14509, name = "Pattern: Mooncloth Circlet", chance = 1.316, quality = 3 }, { itemID = 14511, name = "Pattern: Gloves of Spell Mastery", chance = 1.316, quality = 4 }, { itemID = 17413, name = "Codex: Prayer of Fortitude", chance = 1.316, quality = 3 }, { itemID = 17414, name = "Codex: Prayer of Fortitude II", chance = 1.316, quality = 3 }, { itemID = 17682, name = "Book: Gift of the Wild", chance = 1.316, quality = 3 }, { itemID = 17683, name = "Book: Gift of the Wild II", chance = 1.316, quality = 3 }, { itemID = 18600, name = "Tome of Arcane Brilliance", chance = 1.316, quality = 3 }, { itemID = 22388, name = "Plans: Titanic Leggings", chance = 1.316, quality = 4 }, { itemID = 22389, name = "Plans: Sageblade", chance = 1.316, quality = 4 }, { itemID = 22390, name = "Plans: Persuader", chance = 1.316, quality = 4 }, { itemID = 22393, name = "Codex: Prayer of Shadow Protection", chance = 1.316, quality = 3 }, { itemID = 22890, name = "Tome of Frost Ward V", chance = 1.316, quality = 3 }, { itemID = 22891, name = "Grimoire of Shadow Ward IV", chance = 1.316, quality = 3 }, { itemID = 1203, name = "Aegis of Stormwind", chance = 1.316, quality = 3 }, { itemID = 1973, name = "Orb of Deception", chance = 1.316, quality = 3 }, { itemID = 2564, name = "Elven Spirit Claws", chance = 1.316, quality = 3 }, { itemID = 4696, name = "Lapidis Tankard of Tidesippe", chance = 1.316, quality = 3 }, { itemID = 5266, name = "Eye of Adaegus", chance = 1.316, quality = 3 }, { itemID = 5267, name = "Scarlet Kris", chance = 1.316, quality = 3 }, { itemID = 6622, name = "Sword of Zeal", chance = 1.316, quality = 3 }, { itemID = 7734, name = "Six Demon Bag", chance = 1.316, quality = 3 }, { itemID = 7976, name = "Plans: Mithril Shield Spike", chance = 1.316, quality = 3 }, { itemID = 7991, name = "Plans: Mithril Scale Shoulders", chance = 1.316, quality = 3 }, { itemID = 8028, name = "Plans: Runed Mithril Hammer", chance = 1.316, quality = 3 }, { itemID = 9402, name = "Earthborn Kilt", chance = 1.316, quality = 3 }, { itemID = 10605, name = "Schematic: Spellpower Goggles Xtreme", chance = 1.316, quality = 2 }, { itemID = 10608, name = "Schematic: Sniper Scope", chance = 1.316, quality = 3 }, { itemID = 11302, name = "Uther's Strength", chance = 1.316, quality = 3 }, { itemID = 12698, name = "Plans: Dawnbringer Shoulders", chance = 1.316, quality = 3 }, { itemID = 12711, name = "Plans: Whitesoul Helm", chance = 1.316, quality = 3 }, { itemID = 12717, name = "Plans: Lionheart Helm", chance = 1.316, quality = 4 }, { itemID = 12720, name = "Plans: Stronghold Gauntlets", chance = 1.316, quality = 4 }, { itemID = 12728, name = "Plans: Invulnerable Mail", chance = 1.316, quality = 4 }, { itemID = 13000, name = "Staff of Hale Magefire", chance = 1.316, quality = 3 }, { itemID = 13001, name = "Maiden's Circle", chance = 1.316, quality = 3 }, { itemID = 13002, name = "Lady Alizabeth's Pendant", chance = 1.316, quality = 3 }, { itemID = 13003, name = "Lord Alexander's Battle Axe", chance = 1.316, quality = 3 }, { itemID = 13004, name = "Torch of Austen", chance = 1.316, quality = 3 }, { itemID = 13006, name = "Mass of McGowan", chance = 1.316, quality = 3 }, { itemID = 13007, name = "Mageflame Cloak", chance = 1.316, quality = 3 }, { itemID = 13008, name = "Dalewind Trousers", chance = 1.316, quality = 3 }, { itemID = 13009, name = "Cow King's Hide", chance = 1.316, quality = 3 }, { itemID = 13013, name = "Elder Wizard's Mantle", chance = 1.316, quality = 3 }, { itemID = 13015, name = "Serathil", chance = 1.316, quality = 3 }, { itemID = 13030, name = "Basilisk Bone", chance = 1.316, quality = 3 }, { itemID = 13036, name = "Assassination Blade", chance = 1.316, quality = 3 }, { itemID = 13040, name = "Heartseeking Crossbow", chance = 1.316, quality = 3 }, { itemID = 13047, name = "Twig of the World Tree", chance = 1.316, quality = 3 }, { itemID = 13053, name = "Doombringer", chance = 1.316, quality = 3 }, { itemID = 13060, name = "The Needler", chance = 1.316, quality = 3 }, { itemID = 13066, name = "Wyrmslayer Spaulders", chance = 1.316, quality = 3 }, { itemID = 13067, name = "Hydralick Armor", chance = 1.316, quality = 3 }, { itemID = 13070, name = "Sapphiron's Scale Boots", chance = 1.316, quality = 3 }, { itemID = 13072, name = "Stonegrip Gauntlets", chance = 1.316, quality = 3 }, { itemID = 13073, name = "Mugthol's Helm", chance = 1.316, quality = 3 }, { itemID = 13075, name = "Direwing Legguards", chance = 1.316, quality = 3 }, { itemID = 13077, name = "Girdle of Uther", chance = 1.316, quality = 3 }, { itemID = 13083, name = "Garrett Family Crest", chance = 1.316, quality = 3 }, { itemID = 13085, name = "Horizon Choker", chance = 1.316, quality = 3 }, { itemID = 13091, name = "Medallion of Grand Marshal Morris", chance = 1.316, quality = 3 }, { itemID = 13096, name = "Band of the Hierophant", chance = 1.316, quality = 3 }, { itemID = 13107, name = "Magiskull Cuffs", chance = 1.316, quality = 3 }, { itemID = 13111, name = "Sandals of the Insurgent", chance = 1.316, quality = 3 }, { itemID = 13113, name = "Feathermoon Headdress", chance = 1.316, quality = 3 }, { itemID = 13116, name = "Spaulders of the Unseen", chance = 1.316, quality = 3 }, { itemID = 13118, name = "Serpentine Sash", chance = 1.316, quality = 3 }, { itemID = 13120, name = "Deepfury Bracers", chance = 1.316, quality = 3 }, { itemID = 13123, name = "Dreamwalker Armor", chance = 1.316, quality = 3 }, { itemID = 13125, name = "Elven Chain Boots", chance = 1.316, quality = 3 }, { itemID = 13126, name = "Battlecaller Gauntlets", chance = 1.316, quality = 3 }, { itemID = 13130, name = "Windrunner Legguards", chance = 1.316, quality = 3 }, { itemID = 13133, name = "Drakesfire Epaulets", chance = 1.316, quality = 3 }, { itemID = 13135, name = "Lordly Armguards", chance = 1.316, quality = 3 }, { itemID = 13144, name = "Serenity Belt", chance = 1.316, quality = 3 }, { itemID = 13146, name = "Shell Launcher Shotgun", chance = 1.316, quality = 3 }, { itemID = 14501, name = "Pattern: Mooncloth Vest", chance = 1.316, quality = 3 }, { itemID = 14509, name = "Pattern: Mooncloth Circlet", chance = 1.316, quality = 3 }, { itemID = 14511, name = "Pattern: Gloves of Spell Mastery", chance = 1.316, quality = 4 }, { itemID = 17413, name = "Codex: Prayer of Fortitude", chance = 1.316, quality = 3 }, { itemID = 17414, name = "Codex: Prayer of Fortitude II", chance = 1.316, quality = 3 }, { itemID = 17682, name = "Book: Gift of the Wild", chance = 1.316, quality = 3 }, { itemID = 17683, name = "Book: Gift of the Wild II", chance = 1.316, quality = 3 }, { itemID = 18600, name = "Tome of Arcane Brilliance", chance = 1.316, quality = 3 }, { itemID = 22388, name = "Plans: Titanic Leggings", chance = 1.316, quality = 4 }, { itemID = 22389, name = "Plans: Sageblade", chance = 1.316, quality = 4 }, { itemID = 22390, name = "Plans: Persuader", chance = 1.316, quality = 4 }, { itemID = 22393, name = "Codex: Prayer of Shadow Protection", chance = 1.316, quality = 3 }, { itemID = 22890, name = "Tome of Frost Ward V", chance = 1.316, quality = 3 }, { itemID = 22891, name = "Grimoire of Shadow Ward IV", chance = 1.316, quality = 3 }, { itemID = 12717, name = "Plans: Lionheart Helm", chance = 5, quality = 4 }, { itemID = 22388, name = "Plans: Titanic Leggings", chance = 5, quality = 4 }, { itemID = 83547, name = "Plans: Pauldron of Deflection", chance = 5, quality = 4 }, { itemID = 51730, name = "Shawl of Nerubian Silk", chance = 20, quality = 4 }, { itemID = 51731, name = "Venom Covered Cloak", chance = 20, quality = 4 }, { itemID = 51732, name = "Silken Mantle of Dying Hope", chance = 20, quality = 4 }, { itemID = 51733, name = "Shadow-Weaver's Cape", chance = 20, quality = 4 }, { itemID = 51734, name = "Shawl of Haunted Memories", chance = 20, quality = 4 }, { itemID = 51735, name = "Scourgelord's Fang", chance = 20, quality = 4 }, { itemID = 51736, name = "Plague-Infected Robe", chance = 20, quality = 4 }, { itemID = 51737, name = "Vestments of Eternal Autumn", chance = 20, quality = 4 }, { itemID = 51738, name = "Tunnel Fiend Carapace", chance = 20, quality = 4 }, { itemID = 51740, name = "Crown of Skittering Shadows", chance = 20, quality = 4 }, { itemID = 51739, name = "Little Ball of Spider Web", chance = 100, quality = 2 } }
BossLoot[52145] = { { itemID = 41988, name = "Molten Scale", quality = 1 }, { itemID = 7076, name = "Essence of Earth", chance = 30, quality = 2 }, { itemID = 7077, name = "Heart of Fire", chance = 30, quality = 1 }, { itemID = 7078, name = "Essence of Fire", chance = 40, quality = 2 }, { itemID = 16812, name = "Gloves of Prophecy", chance = 25, quality = 4 }, { itemID = 16826, name = "Nightslayer Gloves", chance = 25, quality = 4 }, { itemID = 16839, name = "Earthfury Gloves", chance = 25, quality = 4 }, { itemID = 16860, name = "Lawbringer Gloves", chance = 25, quality = 4 }, { itemID = 16849, name = "Giantstalker's Boots", chance = 25, quality = 4 }, { itemID = 16862, name = "Sabatons of Might", chance = 25, quality = 4 }, { itemID = 17077, name = "Crimson Shocker", chance = 5, quality = 4 }, { itemID = 18861, name = "Flamewaker Legplates", chance = 5, quality = 4 }, { itemID = 18870, name = "Helm of the Lifegiver", chance = 5, quality = 4 }, { itemID = 18872, name = "Manastorm Leggings", chance = 5, quality = 4 }, { itemID = 18875, name = "Salamander Scale Pants", chance = 5, quality = 4 }, { itemID = 18878, name = "Sorcerous Dagger", chance = 5, quality = 4 }, { itemID = 18879, name = "Heavy Dark Iron Ring", chance = 5, quality = 4 }, { itemID = 19145, name = "Robe of Volatile Power", chance = 5, quality = 4 }, { itemID = 19146, name = "Wristguards of Stability", chance = 5, quality = 4 }, { itemID = 19147, name = "Ring of Spell Power", chance = 5, quality = 4 }, { itemID = 18252, name = "Pattern: Core Armor Kit", chance = 1, quality = 3 }, { itemID = 18257, name = "Recipe: Major Rejuvenation Potion", chance = 1, quality = 3 }, { itemID = 18259, name = "Formula: Enchant Weapon - Spell Power", chance = 1, quality = 3 }, { itemID = 18260, name = "Formula: Enchant Weapon - Healing Power", chance = 1, quality = 3 }, { itemID = 18264, name = "Plans: Elemental Sharpening Stone", chance = 1, quality = 3 }, { itemID = 18265, name = "Pattern: Flarecore Wraps", chance = 1, quality = 3 }, { itemID = 18290, name = "Schematic: Biznicks 247x128 Accurascope", chance = 1, quality = 3 }, { itemID = 18291, name = "Schematic: Force Reactive Disk", chance = 1, quality = 3 }, { itemID = 18292, name = "Schematic: Core Marksman Rifle", chance = 1, quality = 3 }, { itemID = 21371, name = "Pattern: Core Felcloth Bag", chance = 1, quality = 3 }, { itemID = 20951, name = "Narain's Scrying Goggles", chance = 1, quality = 1 }, { itemID = 58205, name = "Primal Flameslinger", chance = 20, quality = 4 }, { itemID = 58206, name = "Idol of the Forgotten Wilds", chance = 20, quality = 4 }, { itemID = 58207, name = "Fist of the Flamewaker", chance = 20, quality = 4 }, { itemID = 58208, name = "Shroud of Flowing Magma", chance = 20, quality = 4 }, { itemID = 58209, name = "Sizzling Pyrestone Aureole", chance = 20, quality = 4 } }
BossLoot[59991] = { { itemID = 55127, name = "Shar'tateth, the Shattered Edge", chance = 5.55, quality = 4 }, { itemID = 55128, name = "Comet Signaller", chance = 5.55, quality = 4 }, { itemID = 55129, name = "Desecration", chance = 5.55, quality = 4 }, { itemID = 55130, name = "Wristwraps of Exiled Radiance", chance = 5.55, quality = 4 }, { itemID = 55131, name = "Shieldrender Talisman", chance = 5.56, quality = 4 }, { itemID = 55132, name = "Pendant of Purified Demon's Blood", chance = 5.56, quality = 4 }, { itemID = 55489, name = "Brutal Leggings of Conquest", chance = 25, quality = 4 }, { itemID = 55490, name = "Brutal Leggings of Ascendancy", chance = 25, quality = 4 }, { itemID = 55506, name = "Worldbreaker Girdle", chance = 5.56, quality = 4 }, { itemID = 55510, name = "Fragments of Aldrach", chance = 5.56, quality = 4 }, { itemID = 55511, name = "Hellflame", chance = 5.56, quality = 4 }, { itemID = 55127, name = "Shar'tateth, the Shattered Edge", chance = 11.1, quality = 4 }, { itemID = 55128, name = "Comet Signaller", chance = 11.1, quality = 4 }, { itemID = 55129, name = "Desecration", chance = 11.1, quality = 4 }, { itemID = 55130, name = "Wristwraps of Exiled Radiance", chance = 11.1, quality = 4 }, { itemID = 55131, name = "Shieldrender Talisman", chance = 11.1, quality = 4 }, { itemID = 55132, name = "Pendant of Purified Demon's Blood", chance = 11.1, quality = 4 }, { itemID = 55506, name = "Worldbreaker Girdle", chance = 11.1, quality = 4 }, { itemID = 55510, name = "Fragments of Aldrach", chance = 11.1, quality = 4 }, { itemID = 55511, name = "Hellflame", chance = 11.2, quality = 4 }, { itemID = 55482, name = "Ephemeral Pendant", chance = 20, quality = 4 }, { itemID = 55489, name = "Brutal Leggings of Conquest", chance = 50, quality = 4 }, { itemID = 55490, name = "Brutal Leggings of Ascendancy", chance = 50, quality = 4 } }
BossLoot[61222] = { { itemID = 51217, name = "Fashion Coin", chance = 100, quality = 2 }, { itemID = 61184, name = "The Scythe of Elune", chance = 2, quality = 5 }, { itemID = 8547, name = "Formula: Powerful Smelling Salts", chance = 1.2, quality = 3 }, { itemID = 13517, name = "Recipe: Alchemist's Stone", chance = 0.9, quality = 4 }, { itemID = 58401, name = "Schematic: Giga-Charged Arcane Reflector", chance = 1.2, quality = 3 }, { itemID = 61177, name = "Recipe: Potion of Quickness", chance = 1.2, quality = 3 }, { itemID = 61178, name = "Plans: Thorium Spurs", chance = 1.2, quality = 3 }, { itemID = 61180, name = "Formula: Enchant Cloak - Greater Arcane Resistance", chance = 1.2, quality = 3 }, { itemID = 61189, name = "Plans: Dawnstone Hammer", chance = 0.9, quality = 4 }, { itemID = 61190, name = "Pattern: Gloves of Unwinding Mystery", chance = 0.9, quality = 4 }, { itemID = 61191, name = "Schematic: Intricate Gyroscope Goggles", chance = 0.9, quality = 4 }, { itemID = 61192, name = "Pattern: Inscribed Runic Bracers", chance = 0.9, quality = 4 }, { itemID = 61219, name = "Formula: Enchant Boots - Superior Stamina", chance = 0.9, quality = 3 }, { itemID = 61739, name = "Formula: Enchant Boots - Vampirism", chance = 1.3, quality = 3 }, { itemID = 70001, name = "Formula: Enchant Gloves - Arcane Power", chance = 0.9, quality = 3 }, { itemID = 61246, name = "Sabatons of the Endless March", chance = 20, quality = 4 }, { itemID = 61247, name = "Shadowbringer", chance = 20, quality = 4 }, { itemID = 61262, name = "Royal Signet of Blackwald II", chance = 20, quality = 4 }, { itemID = 61266, name = "Rune Infused Gauntlets", chance = 20, quality = 4 }, { itemID = 61443, name = "Libram of the Faithful", chance = 20, quality = 4 }, { itemID = 61255, name = "Tuning Fork of Charged Lightning", chance = 14.29, quality = 3 }, { itemID = 61279, name = "Slateplate Leggings", chance = 14.29, quality = 3 }, { itemID = 61282, name = "Deepshadow Bracers", chance = 14.29, quality = 3 }, { itemID = 61286, name = "Bloodfang Effigy", chance = 14, quality = 3 }, { itemID = 61287, name = "Gusthewn Chestplate", chance = 14.29, quality = 3 }, { itemID = 61294, name = "Dark Rider's Signet", chance = 14.29, quality = 3 }, { itemID = 61449, name = "Searhide Bracers", chance = 14.29, quality = 3 }, { itemID = 70102, name = "Plans: Encrusted Gemstone Ring", chance = 0.9, quality = 4 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 3, quality = 3 } }
BossLoot[62503] = { { itemID = 41853, name = "Tainted Brambleheart", quality = 1 }, { itemID = 50800, name = "Bramblethorn Girdle", chance = 25, quality = 3 }, { itemID = 58089, name = "Thornlash Branch", chance = 25, quality = 3 }, { itemID = 58090, name = "Seed of Writhing Growth", chance = 25, quality = 3 }, { itemID = 58091, name = "Idol of the Thorned Grove", chance = 25, quality = 3 } }
BossLoot[63107] = { { itemID = 18704, name = "Mature Blue Dragon Sinew", chance = 100, quality = 4 }, { itemID = 10135, name = "High Councillor's Tunic", chance = 2.17391304, quality = 2 }, { itemID = 10143, name = "High Councillor's Robe", chance = 2.17391304, quality = 2 }, { itemID = 10151, name = "Mighty Tunic", chance = 2.17391304, quality = 2 }, { itemID = 10157, name = "Mercurial Breastplate", chance = 2.17391304, quality = 2 }, { itemID = 10158, name = "Mercurial Guard", chance = 2.17391304, quality = 2 }, { itemID = 10246, name = "Master's Vest", chance = 2.17391304, quality = 2 }, { itemID = 10252, name = "Master's Leggings", chance = 2.17391304, quality = 2 }, { itemID = 10254, name = "Master's Robe", chance = 2.17391304, quality = 2 }, { itemID = 10262, name = "Adventurer's Legguards", chance = 2.17391304, quality = 2 }, { itemID = 10264, name = "Adventurer's Tunic", chance = 2.17391304, quality = 2 }, { itemID = 10266, name = "Masterwork Breastplate", chance = 2.17391304, quality = 2 }, { itemID = 10271, name = "Masterwork Shield", chance = 2.17391304, quality = 2 }, { itemID = 10273, name = "Masterwork Legplates", chance = 2.17391304, quality = 2 }, { itemID = 10367, name = "Hyperion Shield", chance = 2.17391304, quality = 2 }, { itemID = 10384, name = "Hyperion Armor", chance = 2.17391304, quality = 2 }, { itemID = 10389, name = "Hyperion Legplates", chance = 2.17391304, quality = 2 }, { itemID = 11980, name = "Opal Ring", chance = 2.17391304, quality = 2 }, { itemID = 12017, name = "Prismatic Band", chance = 2.17391304, quality = 2 }, { itemID = 12048, name = "Prismatic Pendant", chance = 2.17391304, quality = 2 }, { itemID = 12058, name = "Demonic Bone Ring", chance = 2.17391304, quality = 2 }, { itemID = 14328, name = "Eternal Chestguard", chance = 2.17391304, quality = 2 }, { itemID = 14332, name = "Eternal Crown", chance = 2.17391304, quality = 2 }, { itemID = 14336, name = "Eternal Wraps", chance = 2.17391304, quality = 2 }, { itemID = 14456, name = "Elunarian Vest", chance = 2.17391304, quality = 2 }, { itemID = 14464, name = "Elunarian Silk Robes", chance = 2.17391304, quality = 2 }, { itemID = 14680, name = "Indomitable Vest", chance = 2.17391304, quality = 2 }, { itemID = 14811, name = "Warstrike Chestguard", chance = 2.17391304, quality = 2 }, { itemID = 14812, name = "Warstrike Buckler", chance = 2.17391304, quality = 2 }, { itemID = 14975, name = "Exalted Harness", chance = 2.17391304, quality = 2 }, { itemID = 14979, name = "Exalted Helmet", chance = 2.17391304, quality = 2 }, { itemID = 14982, name = "Exalted Shield", chance = 2.17391304, quality = 2 }, { itemID = 15221, name = "Holy War Sword", chance = 2.17391304, quality = 2 }, { itemID = 15240, name = "Demon's Claw", chance = 2.17391304, quality = 2 }, { itemID = 15247, name = "Bloodstrike Dagger", chance = 2.17391304, quality = 2 }, { itemID = 15258, name = "Divine Warblade", chance = 2.17391304, quality = 2 }, { itemID = 15283, name = "Lunar Wand", chance = 2.17391304, quality = 2 }, { itemID = 15289, name = "Archstrike Bow", chance = 2.17391304, quality = 2 }, { itemID = 15439, name = "Supreme Crown", chance = 2.17391304, quality = 2 }, { itemID = 15442, name = "Supreme Breastplate", chance = 2.17391304, quality = 2 }, { itemID = 15680, name = "Triumphant Chestpiece", chance = 2.17391304, quality = 2 }, { itemID = 15684, name = "Triumphant Skullcap", chance = 2.17391304, quality = 2 }, { itemID = 15687, name = "Triumphant Shield", chance = 2.17391304, quality = 2 }, { itemID = 15941, name = "High Councillor's Scepter", chance = 2.17391304, quality = 2 }, { itemID = 15942, name = "Master's Rod", chance = 2.17391304, quality = 2 }, { itemID = 15968, name = "Elunarian Sphere", chance = 2.17391304, quality = 2 }, { itemID = 15989, name = "Eternal Rod", chance = 2.17391304, quality = 2 }, { itemID = 2564, name = "Elven Spirit Claws", chance = 10, quality = 3 }, { itemID = 7734, name = "Six Demon Bag", chance = 10, quality = 3 }, { itemID = 13009, name = "Cow King's Hide", chance = 10, quality = 3 }, { itemID = 13030, name = "Basilisk Bone", chance = 10, quality = 3 }, { itemID = 13046, name = "Blanchard's Stout", chance = 10, quality = 3 }, { itemID = 13065, name = "Wand of Allistarj", chance = 10, quality = 3 }, { itemID = 13066, name = "Wyrmslayer Spaulders", chance = 10, quality = 3 }, { itemID = 13085, name = "Horizon Choker", chance = 10, quality = 3 }, { itemID = 13125, name = "Elven Chain Boots", chance = 10, quality = 3 }, { itemID = 13139, name = "Guttbuster", chance = 10, quality = 3 }, { itemID = 1203, name = "Aegis of Stormwind", chance = 1.31578947, quality = 3 }, { itemID = 1973, name = "Orb of Deception", chance = 1.31578947, quality = 3 }, { itemID = 2564, name = "Elven Spirit Claws", chance = 1.31578947, quality = 3 }, { itemID = 4696, name = "Lapidis Tankard of Tidesippe", chance = 1.31578947, quality = 3 }, { itemID = 5266, name = "Eye of Adaegus", chance = 1.31578947, quality = 3 }, { itemID = 5267, name = "Scarlet Kris", chance = 1.31578947, quality = 3 }, { itemID = 6622, name = "Sword of Zeal", chance = 1.31578947, quality = 3 }, { itemID = 7734, name = "Six Demon Bag", chance = 1.31578947, quality = 3 }, { itemID = 7976, name = "Plans: Mithril Shield Spike", chance = 1.31578947, quality = 3 }, { itemID = 7991, name = "Plans: Mithril Scale Shoulders", chance = 1.31578947, quality = 3 }, { itemID = 8028, name = "Plans: Runed Mithril Hammer", chance = 1.31578947, quality = 3 }, { itemID = 9402, name = "Earthborn Kilt", chance = 1.31578947, quality = 3 }, { itemID = 10605, name = "Schematic: Spellpower Goggles Xtreme", chance = 1.31578947, quality = 2 }, { itemID = 10608, name = "Schematic: Sniper Scope", chance = 1.31578947, quality = 3 }, { itemID = 11302, name = "Uther's Strength", chance = 1.31578947, quality = 3 }, { itemID = 12698, name = "Plans: Dawnbringer Shoulders", chance = 1.31578947, quality = 3 }, { itemID = 12711, name = "Plans: Whitesoul Helm", chance = 1.31578947, quality = 3 }, { itemID = 12717, name = "Plans: Lionheart Helm", chance = 1.31578947, quality = 4 }, { itemID = 12720, name = "Plans: Stronghold Gauntlets", chance = 1.31578947, quality = 4 }, { itemID = 12728, name = "Plans: Invulnerable Mail", chance = 1.31578947, quality = 4 }, { itemID = 13000, name = "Staff of Hale Magefire", chance = 1.31578947, quality = 3 }, { itemID = 13001, name = "Maiden's Circle", chance = 1.31578947, quality = 3 }, { itemID = 13002, name = "Lady Alizabeth's Pendant", chance = 1.31578947, quality = 3 }, { itemID = 13003, name = "Lord Alexander's Battle Axe", chance = 1.31578947, quality = 3 }, { itemID = 13004, name = "Torch of Austen", chance = 1.31578947, quality = 3 }, { itemID = 13006, name = "Mass of McGowan", chance = 1.31578947, quality = 3 }, { itemID = 13007, name = "Mageflame Cloak", chance = 1.31578947, quality = 3 }, { itemID = 13008, name = "Dalewind Trousers", chance = 1.31578947, quality = 3 }, { itemID = 13009, name = "Cow King's Hide", chance = 1.31578947, quality = 3 }, { itemID = 13013, name = "Elder Wizard's Mantle", chance = 1.31578947, quality = 3 }, { itemID = 13015, name = "Serathil", chance = 1.31578947, quality = 3 }, { itemID = 13030, name = "Basilisk Bone", chance = 1.31578947, quality = 3 }, { itemID = 13036, name = "Assassination Blade", chance = 1.31578947, quality = 3 }, { itemID = 13040, name = "Heartseeking Crossbow", chance = 1.31578947, quality = 3 }, { itemID = 13047, name = "Twig of the World Tree", chance = 1.31578947, quality = 3 }, { itemID = 13053, name = "Doombringer", chance = 1.31578947, quality = 3 }, { itemID = 13060, name = "The Needler", chance = 1.31578947, quality = 3 }, { itemID = 13066, name = "Wyrmslayer Spaulders", chance = 1.31578947, quality = 3 }, { itemID = 13067, name = "Hydralick Armor", chance = 1.31578947, quality = 3 }, { itemID = 13070, name = "Sapphiron's Scale Boots", chance = 1.31578947, quality = 3 }, { itemID = 13072, name = "Stonegrip Gauntlets", chance = 1.31578947, quality = 3 }, { itemID = 13073, name = "Mugthol's Helm", chance = 1.31578947, quality = 3 }, { itemID = 13075, name = "Direwing Legguards", chance = 1.31578947, quality = 3 }, { itemID = 13077, name = "Girdle of Uther", chance = 1.31578947, quality = 3 }, { itemID = 13083, name = "Garrett Family Crest", chance = 1.31578947, quality = 3 }, { itemID = 13085, name = "Horizon Choker", chance = 1.31578947, quality = 3 }, { itemID = 13091, name = "Medallion of Grand Marshal Morris", chance = 1.31578947, quality = 3 }, { itemID = 13096, name = "Band of the Hierophant", chance = 1.31578947, quality = 3 }, { itemID = 13107, name = "Magiskull Cuffs", chance = 1.31578947, quality = 3 }, { itemID = 13111, name = "Sandals of the Insurgent", chance = 1.31578947, quality = 3 }, { itemID = 13113, name = "Feathermoon Headdress", chance = 1.31578947, quality = 3 }, { itemID = 13116, name = "Spaulders of the Unseen", chance = 1.31578947, quality = 3 }, { itemID = 13118, name = "Serpentine Sash", chance = 1.31578947, quality = 3 }, { itemID = 13120, name = "Deepfury Bracers", chance = 1.31578947, quality = 3 }, { itemID = 13123, name = "Dreamwalker Armor", chance = 1.31578947, quality = 3 }, { itemID = 13125, name = "Elven Chain Boots", chance = 1.31578947, quality = 3 }, { itemID = 13126, name = "Battlecaller Gauntlets", chance = 1.31578947, quality = 3 }, { itemID = 13130, name = "Windrunner Legguards", chance = 1.31578947, quality = 3 }, { itemID = 13133, name = "Drakesfire Epaulets", chance = 1.31578947, quality = 3 }, { itemID = 13135, name = "Lordly Armguards", chance = 1.31578947, quality = 3 }, { itemID = 13144, name = "Serenity Belt", chance = 1.31578947, quality = 3 }, { itemID = 13146, name = "Shell Launcher Shotgun", chance = 1.31578947, quality = 3 }, { itemID = 14501, name = "Pattern: Mooncloth Vest", chance = 1.31578947, quality = 3 }, { itemID = 14509, name = "Pattern: Mooncloth Circlet", chance = 1.31578947, quality = 3 }, { itemID = 14511, name = "Pattern: Gloves of Spell Mastery", chance = 1.31578947, quality = 4 }, { itemID = 17413, name = "Codex: Prayer of Fortitude", chance = 1.31578947, quality = 3 }, { itemID = 17414, name = "Codex: Prayer of Fortitude II", chance = 1.31578947, quality = 3 }, { itemID = 17682, name = "Book: Gift of the Wild", chance = 1.31578947, quality = 3 }, { itemID = 17683, name = "Book: Gift of the Wild II", chance = 1.31578947, quality = 3 }, { itemID = 18600, name = "Tome of Arcane Brilliance", chance = 1.31578947, quality = 3 }, { itemID = 22388, name = "Plans: Titanic Leggings", chance = 1.31578947, quality = 4 }, { itemID = 22389, name = "Plans: Sageblade", chance = 1.31578947, quality = 4 }, { itemID = 22390, name = "Plans: Persuader", chance = 1.31578947, quality = 4 }, { itemID = 22393, name = "Codex: Prayer of Shadow Protection", chance = 1.31578947, quality = 3 }, { itemID = 22890, name = "Tome of Frost Ward V", chance = 1.31578947, quality = 3 }, { itemID = 22891, name = "Grimoire of Shadow Ward IV", chance = 1.31578947, quality = 3 }, { itemID = 9297, name = "Recipe: Elixir of Dream Vision", chance = 0.952380952, quality = 2 }, { itemID = 10246, name = "Master's Vest", chance = 0.952380952, quality = 2 }, { itemID = 10247, name = "Master's Boots", chance = 0.952380952, quality = 2 }, { itemID = 10248, name = "Master's Bracers", chance = 0.952380952, quality = 2 }, { itemID = 10249, name = "Master's Cloak", chance = 0.952380952, quality = 2 }, { itemID = 10250, name = "Master's Hat", chance = 0.952380952, quality = 2 }, { itemID = 10251, name = "Master's Gloves", chance = 0.952380952, quality = 2 }, { itemID = 10252, name = "Master's Leggings", chance = 0.952380952, quality = 2 }, { itemID = 10253, name = "Master's Mantle", chance = 0.952380952, quality = 2 }, { itemID = 10254, name = "Master's Robe", chance = 0.952380952, quality = 2 }, { itemID = 10255, name = "Master's Belt", chance = 0.952380952, quality = 2 }, { itemID = 10256, name = "Adventurer's Bracers", chance = 0.952380952, quality = 2 }, { itemID = 10257, name = "Adventurer's Boots", chance = 0.952380952, quality = 2 }, { itemID = 10258, name = "Adventurer's Cape", chance = 0.952380952, quality = 2 }, { itemID = 10259, name = "Adventurer's Belt", chance = 0.952380952, quality = 2 }, { itemID = 10260, name = "Adventurer's Gloves", chance = 0.952380952, quality = 2 }, { itemID = 10261, name = "Adventurer's Bandana", chance = 0.952380952, quality = 2 }, { itemID = 10262, name = "Adventurer's Legguards", chance = 0.952380952, quality = 2 }, { itemID = 10263, name = "Adventurer's Shoulders", chance = 0.952380952, quality = 2 }, { itemID = 10264, name = "Adventurer's Tunic", chance = 0.952380952, quality = 2 }, { itemID = 10265, name = "Masterwork Bracers", chance = 0.952380952, quality = 2 }, { itemID = 10266, name = "Masterwork Breastplate", chance = 0.952380952, quality = 2 }, { itemID = 10267, name = "Masterwork Cape", chance = 0.952380952, quality = 2 }, { itemID = 10268, name = "Masterwork Gauntlets", chance = 0.952380952, quality = 2 }, { itemID = 10269, name = "Masterwork Girdle", chance = 0.952380952, quality = 2 }, { itemID = 10270, name = "Masterwork Boots", chance = 0.952380952, quality = 2 }, { itemID = 10272, name = "Masterwork Circlet", chance = 0.952380952, quality = 2 }, { itemID = 10273, name = "Masterwork Legplates", chance = 0.952380952, quality = 2 }, { itemID = 10274, name = "Masterwork Pauldrons", chance = 0.952380952, quality = 2 }, { itemID = 10367, name = "Hyperion Shield", chance = 0.952380952, quality = 2 }, { itemID = 10384, name = "Hyperion Armor", chance = 0.952380952, quality = 2 }, { itemID = 10385, name = "Hyperion Greaves", chance = 0.952380952, quality = 2 }, { itemID = 10386, name = "Hyperion Gauntlets", chance = 0.952380952, quality = 2 }, { itemID = 10387, name = "Hyperion Girdle", chance = 0.952380952, quality = 2 }, { itemID = 10388, name = "Hyperion Helm", chance = 0.952380952, quality = 2 }, { itemID = 10389, name = "Hyperion Legplates", chance = 0.952380952, quality = 2 }, { itemID = 10390, name = "Hyperion Pauldrons", chance = 0.952380952, quality = 2 }, { itemID = 10391, name = "Hyperion Vambraces", chance = 0.952380952, quality = 2 }, { itemID = 11224, name = "Formula: Enchant Shield - Frost Resistance", chance = 0.952380952, quality = 2 }, { itemID = 11226, name = "Formula: Enchant Gloves - Riding Skill", chance = 0.952380952, quality = 2 }, { itemID = 12017, name = "Prismatic Band", chance = 0.952380952, quality = 2 }, { itemID = 12048, name = "Prismatic Pendant", chance = 0.952380952, quality = 2 }, { itemID = 12682, name = "Plans: Thorium Armor", chance = 0.952380952, quality = 2 }, { itemID = 12683, name = "Plans: Thorium Belt", chance = 0.952380952, quality = 2 }, { itemID = 12684, name = "Plans: Thorium Bracers", chance = 0.952380952, quality = 2 }, { itemID = 12685, name = "Plans: Radiant Belt", chance = 0.952380952, quality = 2 }, { itemID = 12689, name = "Plans: Radiant Breastplate", chance = 0.952380952, quality = 2 }, { itemID = 12702, name = "Plans: Radiant Circlet", chance = 0.952380952, quality = 2 }, { itemID = 13486, name = "Recipe: Transmute Undeath to Water", chance = 0.952380952, quality = 2 }, { itemID = 13487, name = "Recipe: Transmute Water to Undeath", chance = 0.952380952, quality = 2 }, { itemID = 13488, name = "Recipe: Transmute Life to Earth", chance = 0.952380952, quality = 2 }, { itemID = 13489, name = "Recipe: Transmute Earth to Life", chance = 0.952380952, quality = 2 }, { itemID = 14328, name = "Eternal Chestguard", chance = 0.952380952, quality = 2 }, { itemID = 14329, name = "Eternal Boots", chance = 0.952380952, quality = 2 }, { itemID = 14330, name = "Eternal Bindings", chance = 0.952380952, quality = 2 }, { itemID = 14331, name = "Eternal Cloak", chance = 0.952380952, quality = 2 }, { itemID = 14332, name = "Eternal Crown", chance = 0.952380952, quality = 2 }, { itemID = 14333, name = "Eternal Gloves", chance = 0.952380952, quality = 2 }, { itemID = 14334, name = "Eternal Sarong", chance = 0.952380952, quality = 2 }, { itemID = 14335, name = "Eternal Spaulders", chance = 0.952380952, quality = 2 }, { itemID = 14336, name = "Eternal Wraps", chance = 0.952380952, quality = 2 }, { itemID = 14337, name = "Eternal Cord", chance = 0.952380952, quality = 2 }, { itemID = 14975, name = "Exalted Harness", chance = 0.952380952, quality = 2 }, { itemID = 14976, name = "Exalted Gauntlets", chance = 0.952380952, quality = 2 }, { itemID = 14977, name = "Exalted Girdle", chance = 0.952380952, quality = 2 }, { itemID = 14978, name = "Exalted Sabatons", chance = 0.952380952, quality = 2 }, { itemID = 14979, name = "Exalted Helmet", chance = 0.952380952, quality = 2 }, { itemID = 14980, name = "Exalted Legplates", chance = 0.952380952, quality = 2 }, { itemID = 14981, name = "Exalted Epaulets", chance = 0.952380952, quality = 2 }, { itemID = 14982, name = "Exalted Shield", chance = 0.952380952, quality = 2 }, { itemID = 14983, name = "Exalted Armsplints", chance = 0.952380952, quality = 2 }, { itemID = 15221, name = "Holy War Sword", chance = 0.952380952, quality = 2 }, { itemID = 15229, name = "Blesswind Hammer", chance = 0.952380952, quality = 2 }, { itemID = 15240, name = "Demon's Claw", chance = 0.952380952, quality = 2 }, { itemID = 15247, name = "Bloodstrike Dagger", chance = 0.952380952, quality = 2 }, { itemID = 15258, name = "Divine Warblade", chance = 0.952380952, quality = 2 }, { itemID = 15267, name = "Brutehammer", chance = 0.952380952, quality = 2 }, { itemID = 15273, name = "Death Striker", chance = 0.952380952, quality = 2 }, { itemID = 15278, name = "Solstice Staff", chance = 0.952380952, quality = 2 }, { itemID = 15283, name = "Lunar Wand", chance = 0.952380952, quality = 2 }, { itemID = 15289, name = "Archstrike Bow", chance = 0.952380952, quality = 2 }, { itemID = 15325, name = "Sharpshooter Harquebus", chance = 0.952380952, quality = 2 }, { itemID = 15434, name = "Supreme Sash", chance = 0.952380952, quality = 2 }, { itemID = 15435, name = "Supreme Shoes", chance = 0.952380952, quality = 2 }, { itemID = 15436, name = "Supreme Bracers", chance = 0.952380952, quality = 2 }, { itemID = 15437, name = "Supreme Cape", chance = 0.952380952, quality = 2 }, { itemID = 15438, name = "Supreme Gloves", chance = 0.952380952, quality = 2 }, { itemID = 15439, name = "Supreme Crown", chance = 0.952380952, quality = 2 }, { itemID = 15440, name = "Supreme Leggings", chance = 0.952380952, quality = 2 }, { itemID = 15441, name = "Supreme Shoulders", chance = 0.952380952, quality = 2 }, { itemID = 15442, name = "Supreme Breastplate", chance = 0.952380952, quality = 2 }, { itemID = 15678, name = "Triumphant Sabatons", chance = 0.952380952, quality = 2 }, { itemID = 15679, name = "Triumphant Bracers", chance = 0.952380952, quality = 2 }, { itemID = 15680, name = "Triumphant Chestpiece", chance = 0.952380952, quality = 2 }, { itemID = 15681, name = "Triumphant Cloak", chance = 0.952380952, quality = 2 }, { itemID = 15682, name = "Triumphant Gauntlets", chance = 0.952380952, quality = 2 }, { itemID = 15683, name = "Triumphant Girdle", chance = 0.952380952, quality = 2 }, { itemID = 15684, name = "Triumphant Skullcap", chance = 0.952380952, quality = 2 }, { itemID = 15685, name = "Triumphant Legplates", chance = 0.952380952, quality = 2 }, { itemID = 15686, name = "Triumphant Shoulder Pads", chance = 0.952380952, quality = 2 }, { itemID = 15687, name = "Triumphant Shield", chance = 0.952380952, quality = 2 }, { itemID = 15942, name = "Master's Rod", chance = 0.952380952, quality = 2 }, { itemID = 16044, name = "Schematic: Lifelike Mechanical Toad", chance = 0.952380952, quality = 2 }, { itemID = 16055, name = "Schematic: Arcane Bomb", chance = 0.952380952, quality = 2 }, { itemID = 16253, name = "Formula: Enchant Chest - Greater Stats", chance = 0.952380952, quality = 2 }, { itemID = 17962, name = "Blue Sack of Gems", chance = 20, quality = 2 }, { itemID = 17963, name = "Green Sack of Gems", chance = 20, quality = 2 }, { itemID = 17964, name = "Gray Sack of Gems", chance = 20, quality = 2 }, { itemID = 17965, name = "Yellow Sack of Gems", chance = 20, quality = 2 }, { itemID = 17969, name = "Red Sack of Gems", chance = 20, quality = 2 }, { itemID = 17070, name = "Fang of the Mystics", chance = 10, quality = 4 }, { itemID = 18202, name = "Eskhandar's Left Claw", chance = 10, quality = 4 }, { itemID = 18208, name = "Drape of Benediction", chance = 10, quality = 4 }, { itemID = 18541, name = "Puissant Cape", chance = 10, quality = 4 }, { itemID = 18542, name = "Typhoon", chance = 10, quality = 4 }, { itemID = 18545, name = "Leggings of Arcane Supremacy", chance = 10, quality = 4 }, { itemID = 18547, name = "Unmelting Ice Girdle", chance = 10, quality = 4 }, { itemID = 19130, name = "Cold Snap", chance = 10, quality = 4 }, { itemID = 19131, name = "Snowblind Shoes", chance = 10, quality = 4 }, { itemID = 19132, name = "Crystal Adorned Crown", chance = 10, quality = 4 }, { itemID = 17070, name = "Fang of the Mystics", chance = 10, quality = 4 }, { itemID = 18202, name = "Eskhandar's Left Claw", chance = 10, quality = 4 }, { itemID = 18208, name = "Drape of Benediction", chance = 10, quality = 4 }, { itemID = 18541, name = "Puissant Cape", chance = 10, quality = 4 }, { itemID = 18542, name = "Typhoon", chance = 10, quality = 4 }, { itemID = 18545, name = "Leggings of Arcane Supremacy", chance = 10, quality = 4 }, { itemID = 18547, name = "Unmelting Ice Girdle", chance = 10, quality = 4 }, { itemID = 19130, name = "Cold Snap", chance = 10, quality = 4 }, { itemID = 19131, name = "Snowblind Shoes", chance = 10, quality = 4 }, { itemID = 19132, name = "Crystal Adorned Crown", chance = 10, quality = 4 }, { itemID = 83544, name = "Pattern: Stormscale Leggings", chance = 40, quality = 4 } }
BossLoot[65113] = { { itemID = 41458, name = "Time-Worn Spear", quality = 1 }, { itemID = 50203, name = "Corrupted Sand", chance = 100, quality = 2 }, { itemID = 60496, name = "Head of Chronar", quality = 1 }, { itemID = 61016, name = "Time-Lost Claymore", chance = 16.7, quality = 3 }, { itemID = 61018, name = "Cloak of Elemental Warding", chance = 16.7, quality = 3 }, { itemID = 61019, name = "Wand of the Eclipse", chance = 16.7, quality = 3 }, { itemID = 61036, name = "Boots of the Riftwalker", chance = 16.7, quality = 3 }, { itemID = 61047, name = "Monolith Headguard", chance = 16.7, quality = 3 }, { itemID = 61048, name = "Girdle of Distant Stars", chance = 16.7, quality = 3 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 1.2, quality = 3 } }
BossLoot[80830] = { { itemID = 60424, name = "Grellskin Gloves", chance = 20, quality = 3 }, { itemID = 60425, name = "Shadowguard Robe", chance = 20, quality = 3 }, { itemID = 60426, name = "Guard-Captain's Chestplate", chance = 20, quality = 3 }, { itemID = 60427, name = "Skullrattler", chance = 20, quality = 3 }, { itemID = 60428, name = "Felguard's Visage", chance = 20, quality = 3 }, { itemID = 60429, name = "Arcanite Shackles", chance = 12.5, quality = 3 }, { itemID = 60430, name = "Runewarder's Boots", chance = 12.5, quality = 3 }, { itemID = 60431, name = "Almanac of Savagery", chance = 12.5, quality = 3 }, { itemID = 60432, name = "Gauntlets of the Elite Guard", chance = 12.5, quality = 3 }, { itemID = 60433, name = "Pauldrons of the Elite Guard", chance = 12.5, quality = 3 }, { itemID = 60434, name = "Greaves of the Elite Guard", chance = 12.5, quality = 3 }, { itemID = 60435, name = "Sabatons of the Elite Guard", chance = 12.5, quality = 3 }, { itemID = 60436, name = "Sightless Leather Hood", chance = 12.5, quality = 3 } }
BossLoot[80854] = { { itemID = 41463, name = "Pouch of Surgical Daggers", quality = 1 }, { itemID = 51217, name = "Fashion Coin", chance = 5, quality = 2 }, { itemID = 60421, name = "Damien's Sorrow", chance = 20, quality = 3 }, { itemID = 60423, name = "Bracers of Lost Souls", chance = 20, quality = 3 }, { itemID = 60427, name = "Skullrattler", chance = 20, quality = 3 }, { itemID = 60433, name = "Pauldrons of the Elite Guard", chance = 20, quality = 3 }, { itemID = 60500, name = "Cloak of Atonement", chance = 20, quality = 3 }, { itemID = 60422, name = "The Ripper", chance = 1, quality = 4 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 1.2, quality = 3 } }
BossLoot[91928] = { { itemID = 51217, name = "Fashion Coin", chance = 100, quality = 2 }, { itemID = 70226, name = "Ancient Warfare Text", chance = 3, quality = 3 }, { itemID = 83464, name = "Mantle of Twisted Damnation", chance = 1, quality = 4 }, { itemID = 83465, name = "Shroud of Haunted Torment", chance = 25, quality = 3 }, { itemID = 83466, name = "Baneforged Leggings", chance = 25, quality = 3 }, { itemID = 83467, name = "Cryptwatcher's Call", chance = 25, quality = 3 }, { itemID = 83468, name = "Corpsekeeper's Charge", chance = 25, quality = 3 }, { itemID = 83469, name = "Cryptstone Circlet", chance = 21.15, quality = 3 }, { itemID = 83470, name = "Wraithscale Leggings", chance = 21.15, quality = 3 }, { itemID = 83471, name = "Staff of Alarus", chance = 21.15, quality = 3 }, { itemID = 83472, name = "Cover of the Necromancer", chance = 21.15, quality = 3 }, { itemID = 83571, name = "Codex: Shadow Mend", chance = 15, quality = 3 } }
BossLoot[92111] = { { itemID = 51217, name = "Fashion Coin", chance = 1, quality = 2 }, { itemID = 83212, name = "Felflame Shard", chance = 25, quality = 3 }, { itemID = 83213, name = "Trickster's Wraps", chance = 25, quality = 3 }, { itemID = 83214, name = "Betrayer", chance = 25, quality = 3 }, { itemID = 83215, name = "Blackflame Wand", chance = 25, quality = 3 } }
