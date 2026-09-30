-- Priest Companion
-- Quest Database
--
-- Quest records contain only quest-specific data.
-- NPC identity and locations are stored separately
-- in Data/NPCs.lua.
--
-- Full quest text is read from the player's quest
-- log when possible; otherwise the summary stored
-- here is used.

local PC = PriestCompanion

PC.Data.Quests =
    PC.Data.Quests or {}

local Quests =
    PC.Data.Quests

--------------------------------------------------
-- In Search of Thaelrid
--------------------------------------------------

Quests[1198] = {
    name =
        "In Search of Thaelrid",

    questLevel = 24,
    requiredLevel = 18,

    faction =
        "Alliance",

    instanceID = 719,

    startNPC = 4786,
    endNPC = 4787,

    objectiveText =
        "Find Argent Guard Thaelrid inside Blackfathom Deeps.",

    summary =
        "Dawnwatcher Shaedlass asks you to locate the missing Argent Dawn scout Thaelrid inside Blackfathom Deeps and assist him.",

    gains = {
        experience = 240,

        reputation = {
            {
                name =
                    "Argent Dawn",

                amount = 150
            },

            {
                name =
                    "Darnassus",

                amount = 150
            }
        }
    }
}

--------------------------------------------------
-- Ignition
--------------------------------------------------

Quests[858] = {
    name =
        "Ignition",

    questLevel = 18,
    requiredLevel = 13,

    faction =
        "Both",

    startNPC = 3439,
    endNPC = 3439,

    objectiveText =
        "Get the Ignition Key and bring it to Wizzlecrank.",

    description =
        "I don't suppose Sputtervalve sent you? I'm in a bind here. I hopped in without realizing that I need a key to unlock the shredder's movement column. One of the other shredder operators asked me if everything was okay, and I panicked! Instead of telling him that I was missing my key, I told him there was some sort of mechanical problem. We need to get out of here on the double. Go up to the control room at the top of the derrick, the supervisor should have a key for this shredder. Help me out here!",

    gains = {
        experience = 140,

        reputation = {
            {
                name =
                    "Ratchet",

                amount = 100
            }
        }
    }
}

--------------------------------------------------
-- The Escape
--------------------------------------------------

Quests[863] = {
    name =
        "The Escape",

    questLevel = 18,
    requiredLevel = 13,

    faction =
        "Both",

    startNPC = 3439,
    endNPC = 3442,

    requires = {
        858
    },

    objectiveText =
        "Protect Wizzlecrank and the stolen goblin shredder on the way to Sputtervalve in Ratchet.",

    description =
        "I suppose I'll learn as we go... Couldn't be too hard. Just some buttons here, and a lever or two... Well, are you ready to go?",

    rewards = {
        type =
            "choice",

        items = {
            5326, -- Flaring Baton
            5327  -- Greasy Tinker's Pants
        }
    },

    gains = {
        experience = 170,

        reputation = {
            {
                name =
                    "Ratchet",

                amount = 150
            }
        }
    }
}

--------------------------------------------------
-- Blackfathom Villainy - Alliance
--------------------------------------------------

Quests[1200] = {
    name =
        "Blackfathom Villainy",

    questLevel = 27,
    requiredLevel = 18,

    faction =
        "Alliance",

    instanceID = 719,

    startNPC = 4787,
    endNPC = 4783,

    objectiveText =
        "Defeat Twilight Lord Kelris and bring his head to Dawnwatcher Selgorm in Darnassus.",

    summary =
        "Thaelrid explains that Twilight's Hammer cultists in Blackfathom Deeps serve Aku'Mai and asks you to end Twilight Lord Kelris' activities.",

    objectives = {
        {
            type =
                "item",

            itemID = 5881,
            amount = 1
        }
    },

    rewards = {
        type =
            "choice",

        items = {
            7001, -- Gravestone Scepter
            7002  -- Arctic Buckler
        }
    },

    gains = {
        experience = 330,

        reputation = {
            {
                name =
                    "Argent Dawn",

                amount = 200
            },

            {
                name =
                    "Darnassus",

                amount = 200
            }
        }
    }
}

--------------------------------------------------
-- Blackfathom Villainy - Horde
--------------------------------------------------

Quests[6561] = {
    name =
        "Blackfathom Villainy",

    questLevel = 27,
    requiredLevel = 18,

    faction =
        "Horde",

    instanceID = 719,

    startNPC = 4787,
    endNPC = 9087,

    objectiveText =
        "Defeat Twilight Lord Kelris and bring his head to Bashana Runetotem in Thunder Bluff.",

    summary =
        "Thaelrid asks you to stop Twilight Lord Kelris and the Twilight's Hammer activity surrounding Aku'Mai in Blackfathom Deeps.",

    objectives = {
        {
            type =
                "item",

            itemID = 5881,
            amount = 1
        }
    },

    rewards = {
        type =
            "choice",

        items = {
            7001, -- Gravestone Scepter
            7002  -- Arctic Buckler
        }
    },

    gains = {
        experience = 330,

        reputation = {
            {
                name =
                    "Argent Dawn",

                amount = 200
            },

            {
                name =
                    "Thunder Bluff",

                amount = 200
            }
        }
    }
}
