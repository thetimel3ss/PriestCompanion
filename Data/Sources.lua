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
        }
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
        }
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
        quality = 2
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
