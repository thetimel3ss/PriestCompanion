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
-- Wizzlecrank's Shredder
--------------------------------------------------

NPCs[3439] = {
    id = 3439,

    name =
        "Wizzlecrank's Shredder",

    zone =
        "The Barrens",

    locations = {
        {
            zone =
                "The Barrens",

            x = 56.52,
            y = 7.452
        }
    }
}

--------------------------------------------------
-- Sputtervalve
--------------------------------------------------

NPCs[3442] = {
    id = 3442,

    name =
        "Sputtervalve",

    zone =
        "The Barrens",

    locations = {
        {
            zone =
                "The Barrens",

            x = 62.98,
            y = 37.22
        }
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

--------------------------------------------------
-- Noxxion
--------------------------------------------------

NPCs[13282] = {
    id = 13282,

    name =
        "Noxxion",

    zone =
        "Maraudon",

    -- Instance Journal internal-map coordinates.
    locations = {
        {
            instanceID = 349,

            zone =
                "Maraudon",

            x = 32.3,
            y = 4.7,

            label =
                "Noxxion"
        }
    }
}

--------------------------------------------------
-- Shade of Eranikus
--------------------------------------------------

NPCs[5709] = {
    id = 5709,

    name =
        "Shade of Eranikus",

    zone =
        "Sunken Temple",

    -- Instance Journal internal-map coordinates.
    locations = {
        {
            instanceID = 109,

            zone =
                "Sunken Temple",

            x = 66.5,
            y = 87.7,

            label =
                "Shade of Eranikus"
        }
    }
}

--------------------------------------------------
-- Quest NPCs for the additional wand catalog
--------------------------------------------------

NPCs[234] = {
    id = 234,
    name = "Gryan Stoutmantle",
    zone = "Westfall",
    map = { zone = "Westfall", x = 56.33, y = 47.49 }
}

NPCs[392] = {
    id = 392,
    name = "Captain Grayson",
    zone = "Westfall",
    map = { zone = "Westfall", x = 30.02, y = 86.02 }
}

NPCs[661] = {
    id = 661,
    name = "Jonathan Carevin",
    zone = "Duskwood",
    map = { zone = "Duskwood", x = 75.31, y = 49.02 }
}

NPCs[663] = {
    id = 663,
    name = "Calor",
    zone = "Duskwood",
    map = { zone = "Duskwood", x = 75.31, y = 48.02 }
}

NPCs[1078] = {
    id = 1078,
    name = "Ormer Ironbraid",
    zone = "Wetlands",
    map = { zone = "Wetlands", x = 38.17, y = 50.87 }
}

NPCs[2121] = {
    id = 2121,
    name = "Shadow Priest Allister",
    zone = "Silverpine Forest",
    map = { zone = "Silverpine Forest", x = 44, y = 40.9525 }
}

NPCs[2215] = {
    id = 2215,
    name = "High Executor Darthalia",
    zone = "Alterac Mountains",
    map = { zone = "Alterac Mountains", x = 61.08, y = 82.29 }
}

NPCs[2263] = {
    id = 2263,
    name = "Marshal Redpath",
    zone = "Hillsbrad Foothills",
    map = { zone = "Hillsbrad Foothills", x = 49.4584, y = 58.6876 }
}

NPCs[2498] = {
    id = 2498,
    name = "Crank Fizzlebub",
    zone = "Stranglethorn Vale",
    map = { zone = "Stranglethorn Vale", x = 27.12, y = 77.2 }
}

NPCs[2700] = {
    id = 2700,
    name = "Captain Nials",
    zone = "Arathi Highlands",
    map = { zone = "Arathi Highlands", x = 45.81, y = 47.53 }
}

NPCs[2774] = {
    id = 2774,
    name = "Doctor Draxlegauge",
    zone = "Arathi Highlands",
    map = { zone = "Arathi Highlands", x = 33.84, y = 80.44 }
}

NPCs[2817] = {
    id = 2817,
    name = "Rigglefuzz",
    zone = "Badlands",
    map = { zone = "Badlands", x = 42.37, y = 52.91 }
}

NPCs[2986] = {
    id = 2986,
    name = "Dorn Plainstalker",
    zone = "Thousand Needles",
    map = { zone = "Thousand Needles", x = 53.92, y = 41.47 }
}

NPCs[3338] = {
    id = 3338,
    name = "Sergra Darkthorn",
    zone = "The Barrens",
    map = { zone = "The Barrens", x = 52.0, y = 31.0 }
}

NPCs[3387] = {
    id = 3387,
    name = "Jorn Skyseer",
    zone = "The Barrens",
    map = { zone = "The Barrens", x = 45.0, y = 59.0 }
}

NPCs[3388] = {
    id = 3388,
    name = "Mahren Skyseer",
    zone = "The Barrens",
    map = { zone = "The Barrens", x = 65.83, y = 43.85 }
}

NPCs[3441] = {
    id = 3441,
    name = "Melor Stonehoof",
    zone = "Thunder Bluff",
    map = { zone = "Thunder Bluff", x = 61.0, y = 80.0 }
}

NPCs[3649] = {
    id = 3649,
    name = "Thundris Windweaver",
    zone = "Darkshore",
    map = { zone = "Darkshore", x = 37.4, y = 40.15 }
}

NPCs[4078] = {
    id = 4078,
    name = "Collin Mauren",
    zone = "Stormwind City",
    map = { zone = "Stormwind City", x = 43.1439, y = 80.3416 }
}

NPCs[4488] = {
    id = 4488,
    name = "Parqual Fintallas",
    zone = "Undercity",
    map = { zone = "Undercity", x = 57.8703, y = 65.4497 }
}

NPCs[4489] = {
    id = 4489,
    name = "Braug Dimspirit",
    zone = "Stonetalon Mountains",
    map = { zone = "Stonetalon Mountains", x = 78.0, y = 45.0 }
}

NPCs[4926] = {
    id = 4926,
    name = "Krog",
    zone = "Dustwallow Marsh",
    map = { zone = "Dustwallow Marsh", x = 36.42, y = 31.88 }
}

NPCs[4983] = {
    id = 4983,
    name = "Ogron",
    zone = "Dustwallow Marsh",
    map = { zone = "Dustwallow Marsh", x = 40.95, y = 36.68 }
}

NPCs[5411] = {
    id = 5411,
    name = "Krinkle Goodsteel",
    zone = "Tanaris",
    map = { zone = "Tanaris", x = 51.45, y = 28.8 }
}

NPCs[5768] = {
    id = 5768,
    name = "Ebru",
    zone = "The Barrens",
    map = { zone = "The Barrens", x = 46.01, y = 35.74 }
}

NPCs[6579] = {
    id = 6579,
    name = "Shoni the Shilent",
    zone = "Stormwind City",
    map = { zone = "Stormwind City", x = 55.57, y = 12.51 }
}

NPCs[7764] = {
    id = 7764,
    name = "Troyas Moonbreeze",
    zone = "Feralas",
    map = { zone = "Feralas", x = 31.79, y = 45.48 }
}

NPCs[8026] = {
    id = 8026,
    name = "Thyn'tel Bladeweaver",
    zone = "Teldrassil",
    map = { zone = "Teldrassil", x = 30.06, y = 55.11 }
}

NPCs[11033] = {
    id = 11033,
    name = "Smokey LaRue",
    zone = "Eastern Plaguelands",
    map = { zone = "Eastern Plaguelands", x = 80.592, y = 57.9952 }
}

NPCs[11596] = {
    id = 11596,
    name = "Smeed Scrabblescrew",
    zone = "Desolace",
    map = { zone = "Desolace", x = 60.86, y = 61.85 }
}

NPCs[11626] = {
    id = 11626,
    name = "Rigger Gizelton",
    zone = "Desolace"
}

NPCs[14736] = {
    id = 14736,
    name = "Primal Torntusk",
    zone = "Hinterlands",
    map = { zone = "Hinterlands", x = 78.18, y = 81.14 }
}

--------------------------------------------------
-- Terenthis
--------------------------------------------------

NPCs[3693] = {
    id = 3693,
    name = "Terenthis",
    zone = "Darkshore",
    map = { zone = "Darkshore", x = 39.3843, y = 43.4962 }
}

--------------------------------------------------
-- Gnoarn
--------------------------------------------------

NPCs[6569] = {
    id = 6569,
    name = "Gnoarn",
    zone = "Dun Morogh",
    map = { zone = "Dun Morogh", x = 24.47, y = 30.39 }
}

--------------------------------------------------
-- Additional quest-chain NPCs
--------------------------------------------------

NPCs[267] = {
    id = 267,
    name = "Clerk Daltry",
    zone = "Duskwood",
    map = { zone = "Duskwood", x = 72.49, y = 46.85 }
}

NPCs[2487] = {
    id = 2487,
    name = "Fleet Master Seahorn",
    zone = "Stranglethorn Vale",
    map = { zone = "Stranglethorn Vale", x = 27.19, y = 76.99 }
}

NPCs[2610] = {
    id = 2610,
    name = "Shakes O'Breen",
    zone = "Arathi Highlands",
    map = { zone = "Arathi Highlands", x = 32.26, y = 81.36 }
}

NPCs[2768] = {
    id = 2768,
    name = "Professor Phizzlethorpe",
    zone = "Arathi Highlands",
    map = { zone = "Arathi Highlands", x = 33.84, y = 80.53 }
}

NPCs[3453] = {
    id = 3453,
    name = "Wharfmaster Dizzywig",
    zone = "The Barrens",
    map = { zone = "The Barrens", x = 63.34, y = 38.45 }
}

NPCs[3880] = {
    id = 3880,
    name = "Sentinel Melyria Frostshadow",
    zone = "Ashenvale",
    map = { zone = "Ashenvale", x = 22.25, y = 52.99 }
}

NPCs[3945] = {
    id = 3945,
    name = "Caravaneer Ruzzgot",
    zone = "Stranglethorn Vale",
    map = { zone = "Stranglethorn Vale", x = 27.37, y = 74.07 }
}

NPCs[7763] = {
    id = 7763,
    name = "Curgle Cranklehop",
    zone = "Tanaris",
    map = { zone = "Tanaris", x = 52.35, y = 26.89 }
}

NPCs[7907] = {
    id = 7907,
    name = "Daryn Lightwind",
    zone = "Teldrassil",
    map = { zone = "Teldrassil", x = 55.42, y = 92.24 }
}
