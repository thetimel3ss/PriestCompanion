-- Priest Companion
-- NPC Database
--
-- Centralized NPC information used by quests,
-- vendors, drops and map navigation.
--
-- Quest records should reference NPC IDs instead
-- of duplicating names and coordinates.

local PC = PriestCompanion

PC.Data.NPCs =
    PC.Data.NPCs or {}

local NPCs =
    PC.Data.NPCs

--------------------------------------------------
-- Dawnwatcher Shaedlass
--------------------------------------------------

NPCs[4786] = {
    id = 4786,

    name =
        "Dawnwatcher Shaedlass",

    zone =
        "Darnassus",

    map = {
        zone =
            "Darnassus",

        x = 55.0,
        y = 23.0
    }
}

--------------------------------------------------
-- Argent Guard Thaelrid
--------------------------------------------------

NPCs[4787] = {
    id = 4787,

    name =
        "Argent Guard Thaelrid",

    zone =
        "Blackfathom Deeps",

    map = {
        instanceID = 719,

        zone =
            "Blackfathom Deeps",

        x = 13.3,
        y = 51.2
    }
}

--------------------------------------------------
-- Dawnwatcher Selgorm
--------------------------------------------------

NPCs[4783] = {
    id = 4783,

    name =
        "Dawnwatcher Selgorm",

    zone =
        "Darnassus",

    map = {
        zone =
            "Darnassus",

        x = 56.0,
        y = 24.0
    }
}

--------------------------------------------------
-- Bashana Runetotem
--------------------------------------------------

NPCs[9087] = {
    id = 9087,

    name =
        "Bashana Runetotem",

    zone =
        "Thunder Bluff",

    map = {
        zone =
            "Thunder Bluff",

        x = 71.0,
        y = 35.0
    }
}

--------------------------------------------------
-- Razormane Seer
--------------------------------------------------

NPCs[3458] = {
    id = 3458,

    name =
        "Razormane Seer",

    zone =
        "The Barrens",

    locations = {
        {
            zone =
                "The Barrens",

            x = 40.45,
            y = 80.78
        }
    }
}

--------------------------------------------------
-- Cookie
--------------------------------------------------

NPCs[645] = {
    id = 645,

    name =
        "Cookie",

    zone =
        "The Deadmines",

    locations = {
        {
            instanceID = 1581,

            zone =
                "The Deadmines",

            x = 81.0,
            y = 24.5,

            label =
                "Cookie"
        }
    }
}
