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
        npcID = 1312,
        faction = "Alliance",
        priceText = "33s 40c"
    }, {
        type = "vendor",
        npcID = 5133,
        faction = "Alliance",
        priceText = "33s 40c"
    }, {
        type = "vendor",
        npcID = 5816,
        faction = "Horde",
        priceText = "33s 40c"
    }, {
        type = "vendor",
        npcID = 5754,
        faction = "Horde",
        priceText = "33s 40c"
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
        npcID = 1312,
        faction = "Alliance",
        priceText = "58s 30c"
    }, {
        type = "vendor",
        npcID = 5133,
        faction = "Alliance",
        priceText = "58s 30c"
    }, {
        type = "vendor",
        npcID = 5816,
        faction = "Horde",
        priceText = "58s 30c"
    }, {
        type = "vendor",
        npcID = 5754,
        faction = "Horde",
        priceText = "58s 30c"
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
-- Blackbone Wand
--------------------------------------------------

Sources[5239] = {
    { 
        type = "vendor",
        npcID = 1312,
        faction = "Alliance",
        priceText = "3g 87s 31c"
    }, {
        type = "vendor",
        npcID = 5133,
        faction = "Alliance",
        priceText = "3g 87s 31c"
    }, {
        type = "vendor",
        npcID = 5816,
        faction = "Horde",
        priceText = "3g 87s 31c"
    }, {
        type = "vendor",
        npcID = 5754,
        faction = "Horde",
        priceText = "3g 87s 31c"
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
        npcID = 1312,
        faction = "Alliance",
        priceText = "38s 55c"
    }, {
        type = "vendor",
        npcID = 5133,
        faction = "Alliance",
        priceText = "38s 55c"
    }, {
        type = "vendor",
        npcID = 5816,
        faction = "Horde",
        priceText = "38s 55c"
    }, {
        type = "vendor",
        npcID = 5754,
        faction = "Horde",
        priceText = "38s 55c"
    }
}

--------------------------------------------------
-- Burning Wand
--------------------------------------------------

Sources[5210] = { 
    { 
        type = "vendor",
        npcID = 1312,
        faction = "Alliance",
        priceText = "58s 8c"
    }, {
        type = "vendor",
        npcID = 5133,
        faction = "Alliance",
        priceText = "58s 8c"
    }, {
        type = "vendor",
        npcID = 5816,
        faction = "Horde",
        priceText = "58s 8c"
    }, {
        type = "vendor",
        npcID = 5754,
        faction = "Horde",
        priceText = "58s 8c"
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
        npcID = 1312,
        faction = "Alliance",
        priceText = "1g 43s 94c"
    }, {
        type = "vendor",
        npcID = 5133,
        faction = "Alliance",
        priceText = "1g 43s 94c"
    }, {
        type = "vendor",
        npcID = 5816,
        faction = "Horde",
        priceText = "1g 43s 94c"
    }, {
        type = "vendor",
        npcID = 5754,
        faction = "Horde",
        priceText = "1g 43s 94c"
    }
} 

--------------------------------------------------
-- Pitchwood Wand
--------------------------------------------------

Sources[5238] = { 
    { 
        type = "vendor",
        npcID = 1312,
        faction = "Alliance",
        priceText = "3g 57s 27c"
    }, {
        type = "vendor",
        npcID = 5133,
        faction = "Alliance",
        priceText = "3g 57s 27c"
    }, {
        type = "vendor",
        npcID = 5816,
        faction = "Horde",
        priceText = "3g 57s 27c"
    }, {
        type = "vendor",
        npcID = 5754,
        faction = "Horde",
        priceText = "3g 57s 27c"
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
        npcID = 1312,
        faction = "Alliance",
        priceText = "1g 57s 13c"
    }, {
        type = "vendor",
        npcID = 5133,
        faction = "Alliance",
        priceText = "1g 57s 13c"
    }, {
        type = "vendor",
        npcID = 5816,
        faction = "Horde",
        priceText = "1g 57s 13c"
    }, {
        type = "vendor",
        npcID = 5754,
        faction = "Horde",
        priceText = "1g 57s 13c"
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

--------------------------------------------------
-- Wand of Biting Cold
--------------------------------------------------

Sources[19108] = { 
    { 
        type = "quest", 
        questID = 7181, 
        questName = "The Legend of Korrak", 
        faction = "Horde", 
        requiredLevel = 51, 
        zone = "Alterac Mountains", 
        details = true 
    }, { 
        type = "quest", 
        questID = 7202, 
        questName = "Korrak the Bloodrager", 
        faction = "Alliance", 
        requiredLevel = 51, 
        zone = "Alterac Mountains", 
        details = true 
    }, { 
        type = "quest", 
        questID = 8271, 
        questName = "Hero of the Stormpike", 
        faction = "Alliance", 
        requiredLevel = 51, 
        zone = "Alterac Mountains", 
        details = true 
    }, { 
        type = "quest", 
        questID = 8272, 
        questName = "Hero of the Frostwolf", 
        faction = "Horde", 
        requiredLevel = 51, 
        zone = "Alterac Mountains", 
        details = true 
    } 
}

--------------------------------------------------
-- Cold Snap
--------------------------------------------------

Sources[19130] = { 
    { 
        type = "drop", 
        npcID = 6109, 
        npcName = "Azuregos", 
        npcType = "Boss", 
        zone = "Azshara", 
        dropChance = 10, 
        mobs = { 
            { 
                id = 6109, 
                chance = 10 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 6109 
    },
}

--------------------------------------------------
-- Dragon's Touch
--------------------------------------------------

Sources[19367] = { 
    { 
        type = "drop", 
        npcID = 11981, 
        npcName = "Flamegor", 
        npcType = "Boss", 
        instanceID = 2677, 
        zone = "Blackwing Lair", 
        dropChance = 16.6666667, 
        mobs = { 
            { 
                id = 11981, 
                chance = 16.6666667 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 11981 
    } 
}

--------------------------------------------------
-- Essence Gatherer
--------------------------------------------------

Sources[19435] = { 
    { 
        type = "drop", 
        npcID = 12457, 
        npcName = "Blackwing Spellbinder", 
        npcType = "Named creature", 
        instanceID = 2677, 
        zone = "Blackwing Lair", 
        dropChance = 2, 
        mobs = { 
            { 
                id = 12457, 
                chance = 2 
            } 
        }, 
        mobCount = 1, 
        details = true 
    }, { 
        type = "drop", 
        npcID = 12459, 
        npcName = "Blackwing Warlock", 
        npcType = "Named creature", 
        instanceID = 2677, 
        zone = "Blackwing Lair", 
        dropChance = 2, 
        mobs = { 
            { 
                id = 12459, 
                chance = 2 
            } 
        }, 
        mobCount = 1, 
        details = true 
    }, { 
        type = "drop", 
        npcID = 12461, 
        npcName = "Death Talon Overseer", 
        npcType = "Named creature", 
        instanceID = 2677, 
        zone = "Blackwing Lair", 
        dropChance = 2, 
        mobs = { 
            { 
                id = 12461, 
                chance = 2 
            } 
        }, 
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Touch of Chaos
--------------------------------------------------

Sources[19861] = { 
    { 
        type = "drop", 
        npcID = 14834, 
        npcName = "Hakkar", 
        npcType = "Boss", 
        instanceID = 309, 
        zone = "Zul'Gurub", 
        dropChance = 14.29, 
        mobs = { 
            { 
                id = 14834, 
                chance = 14.29 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 14834 
    } 
}

--------------------------------------------------
-- Mar'li's Touce
--------------------------------------------------

Sources[19927] = { 
    { 
        type = "drop", 
        npcID = 14510, 
        npcName = "High Priestess Mar'li", 
        npcType = "Boss", 
        instanceID = 309, 
        zone = "Zul'Gurub", 
        dropChance = 16.67, 
        mobs = { 
            { 
                id = 14510, 
                chance = 16.67 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 14510 
    } 
}

--------------------------------------------------
-- Thoughtblighter
--------------------------------------------------

Sources[19967] = { 
    { 
        type = "drop", 
        npcID = 15083, 
        npcName = "Hazza'rah", 
        npcType = "Boss", 
        instanceID = 309, 
        dropChance = 45, 
        mobs = { 
            { 
                id = 15083, 
                chance = 45 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 15083 
    } 
}

--------------------------------------------------
-- Woestave
--------------------------------------------------

Sources[20082] = { 
    { 
        type = "quest", 
        questID = 8257, 
        questName = "Blood of Morphaz", 
        faction = "Both", 
        requiredLevel = 50, 
        zone = "Azshara", 
        instanceID = 109, 
        chainID = "woestave", 
        details = true 
    } 
}

--------------------------------------------------
-- Sparkling Crystal Wand
--------------------------------------------------

Sources[20672] = { 
    { 
        type = "drop", 
        npcID = 15208, 
        npcName = "The Duke of Shards", 
        npcType = "Named creature",
        note = "Summoned at multiple locations in Silithus. The summon result is random, so The Duke of Shards is not guaranteed to appear. Show on Map opens Silithus without a fixed NPC marker.",
        dropChance = 30, 
        mobs = { 
            { 
                id = 15208, 
                chance = 30 
            } 
        }, 
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Wand of Qiraji Nobility
--------------------------------------------------

Sources[21603] = { 
    { 
        type = "drop", 
        npcID = 15511, 
        npcName = "Lord Kri", 
        npcType = "Boss", 
        instanceID = 531, 
        zone = "Ahn'Qiraj Temple", 
        dropChance = 25, 
        mobs = { 
            { 
                id = 15511, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 15511 
    } 
}

--------------------------------------------------
-- Antenna of Invigoration
--------------------------------------------------

Sources[21801] = { 
    { 
        type = "drop", 
        npcID = 15319, 
        npcName = "Multiple creatures", 
        npcType = "Raid creatures", 
        instanceID = 509,
        dropChance = 0.06,
        mobCount = 21, 
        details = true 
    } 
}

--------------------------------------------------
-- Wand of Eternal Light
--------------------------------------------------

Sources[22254] = { 
    { 
        type = "drop", 
        npcID = 8905, 
        npcName = "Warbringer Construct", 
        npcType = "Named creature", 
        instanceID = 1584, 
        zone = "Blackrock Depths", 
        dropChance = 0.09, 
        mobs = { 
            { 
                id = 8905, 
                chance = 0.09 
            } 
        }, 
        mobCount = 1, 
        details = true 
    }, { 
        type = "drop", 
        npcID = 9476, 
        npcName = "Watchman Doomgrip", 
        npcType = "Named creature", 
        instanceID = 1584, 
        dropChance = 0.75, 
        mobs = { 
            { 
                id = 9476, 
                chance = 0.75 
            } 
        }, 
        mobCount = 1, 
        details = true, 
    } 
}

--------------------------------------------------
-- Ritssyn's Wand of Bad Mojo
--------------------------------------------------

Sources[22408] = { 
    { 
        type = "drop", 
        npcID = 10440, 
        npcName = "Baron Rivendare", 
        npcType = "Boss", 
        instanceID = 2017, 
        zone = "Stratholme", 
        dropChance = 20, 
        mobs = { 
            { 
                id = 10440, 
                chance = 20 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 10440 
    } 
}

--------------------------------------------------
-- Wand of Fates
--------------------------------------------------

Sources[22820] = { 
    { 
        type = "drop", 
        npcID = 16028, 
        npcName = "Patchwerk", 
        npcType = "Boss", 
        instanceID = 533, 
        zone = "Naxxramas", 
        dropChance = 20, 
        mobs = { 
            { 
                id = 16028, 
                chance = 20 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 16028 
    } 
}

--------------------------------------------------
-- Doomfinger
--------------------------------------------------

Sources[22821] = { 
    { 
        type = "drop", 
        npcID = 15990, 
        npcName = "Kel'Thuzad", 
        npcType = "Boss", 
        instanceID = 533, 
        zone = "Naxxramas", 
        dropChance = 9.091, 
        mobs = { 
            { 
                id = 15990, 
                chance = 9.091 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 15990 
    } 
}

--------------------------------------------------
-- Wand of the Whispering Dead
--------------------------------------------------

Sources[23009] = { 
    { 
        type = "drop", 
        npcID = 16061, 
        npcName = "Instructor Razuvious", 
        npcType = "Boss", 
        instanceID = 533, 
        zone = "Naxxramas", 
        dropChance = 16.67, 
        mobs = { 
            { 
                id = 16061, 
                chance = 16.67 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 16061 
    } 
}

--------------------------------------------------
-- Lady Falther'ess' Finger
--------------------------------------------------

Sources[23177] = { 
    { 
        type = "drop", 
        npcID = 14686, 
        npcName = "Lady Falther'ess", 
        npcType = "Boss", 
        instanceID = 129, 
        zone = "Razorfen Downs", 
        dropChance = 50, 
        mobs = { 
            { 
                id = 14686, 
                chance = 50 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 14686,
        note = "This NPC only spawns during the Scourge Invasion (Naxxramas opening event)"
    } 
}

--------------------------------------------------
-- Spine of a Shipwrecked Pirate
--------------------------------------------------

Sources[33200] = { 
    { 
        type = "drop", 
        npcID = 63032, 
        npcName = "Glurgill", 
        npcType = "Rare creature", 
        zone = "Moonwhisper Coast", 
        dropChance = 50, 
        mobs = { 
            { 
                id = 63032, 
                chance = 50 
            } 
        }, 
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Elder Wand
--------------------------------------------------

Sources[33352] = { 
    { 
        type = "quest", 
        questID = 41945, 
        questName = "Respect the Elderly", 
        faction = "Both", 
        requiredLevel = 49, 
        details = true 
    } 
}

--------------------------------------------------
-- Withered Wand
--------------------------------------------------

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

--------------------------------------------------
-- Star of Maras'ethil
--------------------------------------------------

Sources[42365] = { 
    { 
        type = "quest", 
        questID = 42000, 
        questName = "Highborne Burden", 
        faction = "Horde", 
        requiredLevel = 48, 
        zone = "Winterspring", 
        details = true 
    } 
}

--------------------------------------------------
-- Scourgelord's Fang
--------------------------------------------------

Sources[51735] = { 
    { 
        type = "drop", 
        npcID = 16184, 
        npcName = "Nerubian Overseer", 
        npcType = "Boss", 
        zone = "Western Plaguelands", 
        dropChance = 20, 
        mobs = { 
            { 
                id = 16184, 
                chance = 20 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 16184 
    } 
}

--------------------------------------------------
-- Webwood Branch
--------------------------------------------------

Sources[51816] = { 
    { 
        type = "quest", 
        questID = 60110, 
        questName = "Githyiss the Vile", 
        faction = "Alliance", 
        requiredLevel = 3, 
        zone = "Teldrassil", 
        chainID = "webwood_branch", 
        details = true 
    } 
}

--------------------------------------------------
-- Bhartec's Lost Wand
--------------------------------------------------

Sources[51820] = { 
    { 
        type = "quest", 
        questID = 60112, 
        questName = "Fallen Adventurers", 
        faction = "Horde", 
        requiredLevel = 3, 
        zone = "Tirisfal Glades", 
        chainID = "bhartecs_lost_wand", 
        details = true 
    } 
}

--------------------------------------------------
-- Rod of Permafrost
--------------------------------------------------

Sources[55134] = { 
    { 
        type = "quest", 
        questID = 41360, 
        questName = "Warm is the Day", 
        faction = "Both", 
        requiredLevel = 60, 
        zone = "Winterspring", 
        chainID = "rod_of_permafrost", 
        details = true 
    } 
}

--------------------------------------------------
-- Hellflame
--------------------------------------------------

Sources[55511] = { 
    { 
        type = "drop", 
        npcID = 59991, 
        npcName = "Kruul", 
        npcType = "Boss", 
        instanceID = 814, 
        zone = "Tower of Karazhan", 
        dropChance = 11.2, 
        mobs = { 
            { 
                id = 59991, 
                chance = 11.2 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 59991 
    } 
}

--------------------------------------------------
-- Quistis' Wand
--------------------------------------------------

Sources[58009] = { 
    { 
        type = "drop", 
        npcID = 62193, 
        npcName = "Quistis the Malign", 
        npcType = "Rare creature", 
        zone = "Northwind", 
        dropChance = 50, 
        mobs = { 
            { 
                id = 62193, 
                chance = 50 
            } 
        }, 
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Rod of Stromgarde
--------------------------------------------------

Sources[58026] = { 
    { 
        type = "quest", 
        questID = 41667, 
        questName = "In Need of Shoes", 
        faction = "Alliance", 
        requiredLevel = 25, 
        zone = "Azeroth", 
        details = true 
    } 
}

--------------------------------------------------
-- Grasp of Ancestors
--------------------------------------------------

Sources[58047] = { 
    { 
        type = "drop", 
        npcID = 62069, 
        npcName = "Halgan Redbrand", 
        npcType = "Boss",
        instanceID = 5601, 
        zone = "Dragonmaw Retreat", 
        dropChance = 25, 
        mobs = { 
            { 
                id = 62069, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true,
        lootNPCID = 62069
    } 
}

--------------------------------------------------
-- Thornlash Branch
--------------------------------------------------

Sources[58089] = { 
    { 
        type = "drop", 
        npcID = 62503, 
        npcName = "Rotthorn", 
        npcType = "Boss", 
        instanceID = 47, 
        zone = "Razorfen Kraul", 
        dropChance = 25, 
        mobs = { 
            { 
                id = 62503, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 62503 
    } 
}

--------------------------------------------------
-- Netherbranch
--------------------------------------------------

Sources[58137] = { 
    { 
        type = "drop", 
        npcID = 62548, 
        npcName = "Oronok Torn-Heart", 
        npcType = "Boss",
        instanceID = 5628,
        zone = "Stormwrought Ruins", 
        dropChance = 25, 
        mobs = { 
            { 
                id = 62548, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true,
        lootNPCID = 62548
    } 
}

--------------------------------------------------
-- Primal Flameslinger
--------------------------------------------------

Sources[58205] = { 
    { 
        type = "drop", 
        npcID = 52145, 
        npcName = "Incindis", 
        npcType = "Boss", 
        instanceID = 2717, 
        zone = "Molten Core", 
        dropChance = 20, 
        mobs = { 
            { 
                id = 52145, 
                chance = 20 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 52145 
    } 
}

--------------------------------------------------
-- Lector's Baton
--------------------------------------------------

Sources[58253] = { 
    { 
        type = "vendor", 
        npcID = 80945, 
        faction = "Both",
        priceText = "9g 36s 19c",
        note = "Requires Honored reputation with Shen'dralar to purchase."
    } 
}

--------------------------------------------------
-- Lady Winter's Touch
--------------------------------------------------

Sources[58277] = { 
    { 
        type = "quest", 
        questID = 41841, 
        questName = "Artifact of the Dark Lady", 
        faction = "Horde", 
        requiredLevel = 32, 
        zone = "Silverpine Forest", 
        chainID = "lady_winter_touch", 
        details = true 
    } 
}

--------------------------------------------------
-- Skullrattler
--------------------------------------------------

Sources[60427] = { 
    { 
        type = "drop", 
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
    }

}

--------------------------------------------------
-- Clutch of the Damned
--------------------------------------------------

Sources[60805] = { 
    { 
        type = "drop", 
        npcID = 91910, 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        instanceID = 800, 
        mobCount = 15, 
        details = true 
    } 
}

--------------------------------------------------
-- Wand of the Eclipse
--------------------------------------------------

Sources[61019] = { 
    { 
        type = "drop", 
        npcID = 65113, 
        npcName = "Chronar", 
        npcType = "Boss", 
        instanceID = 269, 
        zone = "The Black Morass", 
        dropChance = 16.7, 
        mobs = { 
            { 
                id = 65113, 
                chance = 16.7 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 65113 
    } 
}

--------------------------------------------------
-- Lodestone
--------------------------------------------------

Sources[61020] = { 
    { 
        type = "drop", 
        npcID = 61316, 
        npcName = "Drifting Avatar of Sand", 
        npcType = "Boss", 
        instanceID = 269, 
        zone = "The Black Morass", 
        dropChance = 2, 
        mobs = { 
            { 
                id = 61316, 
                chance = 2 
            } 
        }, 
        mobCount = 1, 
        details = true 
    }
}

--------------------------------------------------
-- Bloodfang Effigy
--------------------------------------------------

Sources[61286] = { 
    { 
        type = "drop", 
        npcID = 61222, 
        npcName = "Lord Blackwald II", 
        npcType = "Boss", 
        instanceID = 532, 
        zone = "Lower Karazhan Halls", 
        dropChance = 14, 
        mobs = { 
            { 
                id = 61222, 
                chance = 14 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 61222 
    } 
}

--------------------------------------------------
-- Grungy Firestick
--------------------------------------------------
-- Grungy Firestick (61374) is kept in Data/Items.lua and Data/Sources.lua
-- for reference, but is omitted from the in-game wand list because its
-- acquisition source could not be confirmed.

Sources[61374] = { 
    { 
        type = "drop", 
        npcID = 80116, 
        npcName = "Risen Oilblaze", 
        npcType = "Named creature", 
        dropChance = 0.2, 
        mobs = { 
            { 
                id = 80116, 
                chance = 0.2 
            } 
        }, 
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Burning Torch
--------------------------------------------------

Sources[61615] = { 
    { 
        type = "drop", 
        npcID = 61517, 
        npcName = "Ruk'thok the Pyromancer", 
        npcType = "Rare creature", 
        zone = "Lapidis Isle", 
        dropChance = 33.33, 
        mobs = { 
            { 
                id = 61517, 
                chance = 33.33 
            } 
        }, 
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Quel'dorei Magister's Spellflinger
--------------------------------------------------

Sources[80544] = { 
    { 
        type = "vendor", 
        npcID = 80266, 
        npcName = "Soalara Dawnstar",
        priceText = "7g 54s 85c", 
        faction = "Alliance", 
        details = true,
        note = "Requires Revered reputation with Silvermoon Remnant to purchase."
    } 
}

--------------------------------------------------
-- Quel'dorei Cleric's Wand
--------------------------------------------------

Sources[80545] = { 
    { 
        type = "vendor", 
        npcID = 80266, 
        npcName = "Soalara Dawnstar",
        priceText = "7g 54s 53c", 
        faction = "Alliance", 
        details = true,
        note = "Requires Revered reputation with Silvermoon Remnant to purchase."
    } 
}

--------------------------------------------------
-- Revantusk Mystic's Mojobender
--------------------------------------------------

Sources[80644] = { 
    { 
        type = "vendor", 
        npcID = 80807, 
        npcName = "Reolis Riptusk",
        priceText = "7g 54s 85c",
        faction = "Horde", 
        details = true,
        note = "Requires Revered reputation with Revantusk Trolls to purchase."
    } 
}

--------------------------------------------------
-- Revantusk Mender's Wand
--------------------------------------------------

Sources[80645] = { 
    { 
        type = "vendor", 
        npcID = 80807, 
        npcName = "Reolis Riptusk",
        priceText = "7g 54s 53c", 
        faction = "Horde", 
        details = true,
        note = "Requires Revered reputation with Revantusk Trolls to purchase."
    } 
}

--------------------------------------------------
-- Corrupter's Focus
--------------------------------------------------

Sources[80748] = { 
    { 
        type = "drop",
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        instanceID = 349,
        dropChance = 0.01,
        mobCount = 19, 
        details = true 
    }
}

--------------------------------------------------
-- Wand of Divine Justice
--------------------------------------------------

Sources[80799] = { 
    { 
        type = "drop", 
        npcName = "Multiple creatures", 
        npcType = "Creatures", 
        instanceID = 796,
        instanceZoneID = 4,
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Moonbeam
--------------------------------------------------

Sources[80829] = { 
    { 
        type = "drop", 
        npcID = 4066, 
        npcName = "Nal'taszar", 
        npcType = "Rare creature", 
        zone = "Stonetalon Mountains", 
        dropChance = 35, 
        mobs = { 
            { 
                id = 4066, 
                chance = 35 
            } 
        }, 
        mobCount = 1, 
        details = true 
    } 
}

--------------------------------------------------
-- Diathorus' Claw
--------------------------------------------------

Sources[81290] = { 
    { 
        type = "quest", 
        questID = 70033, 
        questName = "The Seeker's Demise", 
        faction = "Horde", 
        requiredLevel = 27, 
        zone = "Ashenvale", 
        chainID = "diathorus_claw", 
        details = true 
    } 
}

--------------------------------------------------
-- Crackling Zapper
--------------------------------------------------

Sources[81320] = { 
    { 
        type = "quest", 
        questID = 55006, 
        questName = "Backup Capacitor", 
        faction = "Horde", 
        requiredLevel = 29, 
        instanceID = 721, 
        chainID = "crackling_zapper", 
        details = true 
    } 
}

--------------------------------------------------
-- Blackflame Wand
--------------------------------------------------

Sources[83215] = { 
    { 
        type = "drop", 
        npcID = 92111, 
        npcName = "Fenektis the Deceiver", 
        npcType = "Boss", 
        instanceID = 802, 
        zone = "Crescent Grove", 
        dropChance = 25, 
        mobs = { 
            { 
                id = 92111, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 92111 
    } 
}

--------------------------------------------------
-- Cryptwatcher's Call
--------------------------------------------------

Sources[83467] = { 
    { 
        type = "drop", 
        npcID = 91928, 
        npcName = "Alarus", 
        npcType = "Boss", 
        instanceID = 800, 
        dropChance = 25, 
        mobs = { 
            { 
                id = 91928, 
                chance = 25 
            } 
        }, 
        mobCount = 1, 
        details = true, 
        lootNPCID = 91928 
    } 
}

--------------------------------------------------
-- Consecrated Caduceus
--------------------------------------------------

Sources[84602] = { 
    { 
        type = "vendor", 
        npcID = 80943,
        priceText = "21g 16s 25c"
    } 
}

