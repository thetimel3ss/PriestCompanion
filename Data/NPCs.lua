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
-- 
--------------------------------------------------

NPCs[4786] = {
    id = 4786,
    name = "Dawnwatcher Shaedlass",
    zone = "Darnassus",
    map = {
        zone = "Darnassus",
        x = 55.0,
        y = 23.0 }
}

NPCs[4787] = {
    id = 4787,
    name = "Argent Guard Thaelrid",
    zone = "Blackfathom Deeps",
    map = {
        instanceID = 719,
        zone = "Blackfathom Deeps",
        x = 13.3,
        y = 51.2 }
}

NPCs[4783] = {
    id = 4783,
    name = "Dawnwatcher Selgorm",
    zone = "Darnassus",
    map = {
        zone = "Darnassus",
        x = 56.0,
        y = 24.0 }
}

NPCs[9087] = {
    id = 9087,
    name = "Bashana Runetotem",
    zone = "Thunder Bluff",
    map = {
        zone = "Thunder Bluff",
        x = 71.0,
        y = 35.0 }
}

NPCs[3439] = {
    id = 3439,
    name = "Wizzlecrank's Shredder",
    zone = "The Barrens",
    locations = {
        {
            zone = "The Barrens",
            x = 56.52,
            y = 7.452
        } }
}

NPCs[3442] = {
    id = 3442,
    name = "Sputtervalve",
    zone = "The Barrens",
    locations = {
        {
            zone = "The Barrens",
            x = 62.98,
            y = 37.22
        } }
}

NPCs[3458] = {
    id = 3458,
    name = "Razormane Seer",
    zone = "The Barrens",
    locations = {
        {
            zone = "The Barrens",
            x = 40.45,
            y = 80.78
        } }
}

NPCs[645] = {
    id = 645,
    name = "Cookie",
    zone = "The Deadmines",
    locations = { {
        instanceID = 1581,
        zone = "The Deadmines",
        x = 81.0,
        y = 24.5,
        label = "Cookie"
        } }
}

NPCs[13282] = {
    id = 13282,
    name = "Noxxion",
    zone = "Maraudon",
    locations = {
        {
            instanceID = 349,
            zone = "Maraudon",
            x = 32.3,
            y = 4.7,
            label = "Noxxion"
        } }
}

NPCs[5709] = {
    id = 5709,
    name = "Shade of Eranikus",
    zone = "Sunken Temple",
    locations = {
        {
            instanceID = 109,
            zone = "Sunken Temple",
            x = 66.5,
            y = 87.7,
            label = "Shade of Eranikus"
        } }
}

NPCs[234] = {
    id = 234,
    name = "Gryan Stoutmantle",
    zone = "Westfall",
    map = { 
        zone = "Westfall", 
        x = 56.33, 
        y = 47.49 }
}

NPCs[392] = {
    id = 392,
    name = "Captain Grayson",
    zone = "Westfall",
    map = { 
        zone = "Westfall", 
        x = 30.02, 
        y = 86.02 }
}

NPCs[661] = {
    id = 661,
    name = "Jonathan Carevin",
    zone = "Duskwood",
    map = { 
        zone = "Duskwood", 
        x = 75.31, 
        y = 49.02 }
}

NPCs[663] = {
    id = 663,
    name = "Calor",
    zone = "Duskwood",
    map = { 
        zone = "Duskwood", 
        x = 75.31, 
        y = 48.02 }
}

NPCs[1078] = {
    id = 1078,
    name = "Ormer Ironbraid",
    zone = "Wetlands",
    map = { 
        zone = "Wetlands", 
        x = 38.17, 
        y = 50.87 }
}

NPCs[2121] = {
    id = 2121,
    name = "Shadow Priest Allister",
    zone = "Silverpine Forest",
    map = { 
        zone = "Silverpine Forest", 
        x = 44, 
        y = 40.9525 }
}

NPCs[2215] = {
    id = 2215,
    name = "High Executor Darthalia",
    zone = "Alterac Mountains",
    map = { 
        zone = "Alterac Mountains", 
        x = 61.08, 
        y = 82.29 }
}

NPCs[2263] = {
    id = 2263,
    name = "Marshal Redpath",
    zone = "Hillsbrad Foothills",
    map = { 
        zone = "Hillsbrad Foothills", 
        x = 49.4584, 
        y = 58.6876 }
}

NPCs[2498] = {
    id = 2498,
    name = "Crank Fizzlebub",
    zone = "Stranglethorn Vale",
    map = { 
        zone = "Stranglethorn Vale", 
        x = 27.12, 
        y = 77.2 }
}

NPCs[2700] = {
    id = 2700,
    name = "Captain Nials",
    zone = "Arathi Highlands",
    map = { 
        zone = "Arathi Highlands", 
        x = 45.81, 
        y = 47.53 }
}

NPCs[2774] = {
    id = 2774,
    name = "Doctor Draxlegauge",
    zone = "Arathi Highlands",
    map = { 
        zone = "Arathi Highlands", 
        x = 33.84, 
        y = 80.44 }
}

NPCs[2817] = {
    id = 2817,
    name = "Rigglefuzz",
    zone = "Badlands",
    map = { 
        zone = "Badlands", 
        x = 42.37, 
        y = 52.91 }
}

NPCs[2986] = {
    id = 2986,
    name = "Dorn Plainstalker",
    zone = "Thousand Needles",
    map = { 
        zone = "Thousand Needles", 
        x = 53.92, 
        y = 41.47 }
}

NPCs[3338] = {
    id = 3338,
    name = "Sergra Darkthorn",
    zone = "The Barrens",
    map = { 
        zone = "The Barrens", 
        x = 52.0, 
        y = 31.0 }
}

NPCs[3387] = {
    id = 3387,
    name = "Jorn Skyseer",
    zone = "The Barrens",
    map = { 
        zone = "The Barrens", 
        x = 45.0, 
        y = 59.0 }
}

NPCs[3388] = {
    id = 3388,
    name = "Mahren Skyseer",
    zone = "The Barrens",
    map = { 
        zone = "The Barrens", 
        x = 65.83, 
        y = 43.85 }
}

NPCs[3441] = {
    id = 3441,
    name = "Melor Stonehoof",
    zone = "Thunder Bluff",
    map = { 
        zone = "Thunder Bluff", 
        x = 61.0, 
        y = 80.0 }
}

NPCs[3649] = {
    id = 3649,
    name = "Thundris Windweaver",
    zone = "Darkshore",
    map = { 
        zone = "Darkshore", 
        x = 37.4, 
        y = 40.15 }
}

NPCs[4078] = {
    id = 4078,
    name = "Collin Mauren",
    zone = "Stormwind City",
    map = { 
        zone = "Stormwind City", 
        x = 43.1439, 
        y = 80.3416 }
}

NPCs[4488] = {
    id = 4488,
    name = "Parqual Fintallas",
    zone = "Undercity",
    map = { 
        zone = "Undercity", 
        x = 57.8703, 
        y = 65.4497 }
}

NPCs[4489] = {
    id = 4489,
    name = "Braug Dimspirit",
    zone = "Stonetalon Mountains",
    map = { 
        zone = "Stonetalon Mountains", 
        x = 78.0, 
        y = 45.0 }
}

NPCs[4926] = {
    id = 4926,
    name = "Krog",
    zone = "Dustwallow Marsh",
    map = { 
        zone = "Dustwallow Marsh", 
        x = 36.42, 
        y = 31.88 }
}

NPCs[4983] = {
    id = 4983,
    name = "Ogron",
    zone = "Dustwallow Marsh",
    map = { 
        zone = "Dustwallow Marsh", 
        x = 40.95, 
        y = 36.68 }
}

NPCs[5411] = {
    id = 5411,
    name = "Krinkle Goodsteel",
    zone = "Tanaris",
    map = { 
        zone = "Tanaris", 
        x = 51.45, 
        y = 28.8 }
}

NPCs[5768] = {
    id = 5768,
    name = "Ebru",
    zone = "The Barrens",
    map = { 
        zone = "The Barrens", 
        x = 46.01, 
        y = 35.74 }
}

NPCs[6579] = {
    id = 6579,
    name = "Shoni the Shilent",
    zone = "Stormwind City",
    map = { 
        zone = "Stormwind City", 
        x = 62.5, 
        y = 33.9 }
}

NPCs[7764] = {
    id = 7764,
    name = "Troyas Moonbreeze",
    zone = "Feralas",
    map = { 
        zone = "Feralas", 
        x = 31.79, 
        y = 45.48 }
}

NPCs[8026] = {
    id = 8026,
    name = "Thyn'tel Bladeweaver",
    zone = "Teldrassil",
    map = { 
        zone = "Teldrassil", 
        x = 30.06, 
        y = 55.11 }
}

NPCs[11033] = {
    id = 11033,
    name = "Smokey LaRue",
    zone = "Eastern Plaguelands",
    map = { 
        zone = "Eastern Plaguelands", 
        x = 80.592, 
        y = 57.9952 }
}

NPCs[11596] = {
    id = 11596,
    name = "Smeed Scrabblescrew",
    zone = "Desolace",
    map = { 
        zone = "Desolace", 
        x = 60.86, 
        y = 61.85 }
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
    map = { 
        zone = "Hinterlands", 
        x = 78.18, 
        y = 81.14 }
}

NPCs[3693] = {
    id = 3693,
    name = "Terenthis",
    zone = "Darkshore",
    map = { 
        zone = "Darkshore", 
        x = 39.3843, 
        y = 43.4962 }
}

NPCs[6569] = {
    id = 6569,
    name = "Gnoarn",
    zone = "Dun Morogh",
    map = { 
        zone = "Dun Morogh", 
        x = 24.47, 
        y = 30.39 }
}

NPCs[267] = {
    id = 267,
    name = "Clerk Daltry",
    zone = "Duskwood",
    map = { 
        zone = "Duskwood", 
        x = 72.49, 
        y = 46.85 }
}

NPCs[2487] = {
    id = 2487,
    name = "Fleet Master Seahorn",
    zone = "Stranglethorn Vale",
    map = { 
        zone = "Stranglethorn Vale", 
        x = 27.19, 
        y = 76.99 }
}

NPCs[2610] = {
    id = 2610,
    name = "Shakes O'Breen",
    zone = "Arathi Highlands",
    map = { 
        zone = "Arathi Highlands", 
        x = 32.26, 
        y = 81.36 }
}

NPCs[2768] = {
    id = 2768,
    name = "Professor Phizzlethorpe",
    zone = "Arathi Highlands",
    map = { 
        zone = "Arathi Highlands", 
        x = 33.84, 
        y = 80.53 }
}

NPCs[3453] = {
    id = 3453,
    name = "Wharfmaster Dizzywig",
    zone = "The Barrens",
    map = { 
        zone = "The Barrens", 
        x = 63.34, 
        y = 38.45 }
}

NPCs[3880] = {
    id = 3880,
    name = "Sentinel Melyria Frostshadow",
    zone = "Ashenvale",
    map = { 
        zone = "Ashenvale", 
        x = 22.25, 
        y = 52.99 }
}

NPCs[3945] = {
    id = 3945,
    name = "Caravaneer Ruzzgot",
    zone = "Stranglethorn Vale",
    map = { 
        zone = "Stranglethorn Vale", 
        x = 27.37, 
        y = 74.07 }
}

NPCs[7763] = {
    id = 7763,
    name = "Curgle Cranklehop",
    zone = "Tanaris",
    map = { 
        zone = "Tanaris", 
        x = 52.35, 
        y = 26.89 }
}

NPCs[7907] = {
    id = 7907,
    name = "Daryn Lightwind",
    zone = "Teldrassil",
    map = { 
        zone = "Teldrassil", 
        x = 55.42, 
        y = 92.24 }
}

NPCs[332] = { 
    id = 332, 
    name = "Master Mathias Shaw", 
    zone = "Stormwind City", 
    map = { 
        zone = "Stormwind City", 
        x = 75.8, 
        y = 59.81 } 
}

NPCs[1105] = { 
    id = 1105, 
    name = "Jern Hornhelm", 
    zone = "Loch Modan", 
    map = { 
        zone = "Loch Modan", 
        x = 37.21, 
        y = 47.37 } 
}

NPCs[1345] = { 
    id = 1345, 
    name = "Magmar Fellhew", 
    zone = "Loch Modan", 
    map = { 
        zone = "Loch Modan", 
        x = 64.87, 
        y = 66.62 } 
}

NPCs[1661] = { 
    id = 1661, 
    name = "Novice Elreth", 
    zone = "Tirisfal Glades", 
    map = { 
        zone = "Tirisfal Glades", 
        x = 30.88, 
        y = 66.07 } 
}

NPCs[1748] = { 
    id = 1748, 
    name = "Highlord Bolvar Fordragon", 
    zone = "Stormwind City", 
    map = { 
        zone = "Stormwind City", 
        x = 78.26, 
        y = 17.87 } 
}

NPCs[1853] = { 
    id = 1853, 
    name = "Darkmaster Gandling" 
}

NPCs[1938] = { 
    id = 1938, 
    name = "Dalar Dawnweaver", 
    zone = "Silverpine Forest", 
    map = { 
        zone = "Silverpine Forest", 
        x = 44.21, 
        y = 39.81 
        } 
}

NPCs[2082] = { 
    id = 2082, 
    name = "Gilshalan Windwalker", 
    zone = "Teldrassil", 
    map = { 
        zone = "Teldrassil", 
        x = 57.81, 
        y = 41.67 } 
}

NPCs[2358] = { 
    id = 2358, 
    name = "Dalaran Summoner", 
    zone = "Alterac Mountains", 
    map = { 
        zone = "Alterac Mountains", 
        x = 10.98, 
        y = 78.7 } 
}

NPCs[2410] = { 
    id = 2410, 
    name = "Magus Wordeen Voidglare", 
    zone = "Alterac Mountains", 
    map = { 
        zone = "Alterac Mountains", 
        x = 60.26, 
        y = 82.71 } 
}

NPCs[2425] = { 
    id = 2425, 
    name = "Varimathras", 
    zone = "Silverpine Forrest", 
    map = { 
        zone = "Silverpine Forrest", 
        x = 74.21, 
        y = 13.56 } 
}

NPCs[3052] = { 
    id = 3052, 
    name = "Skorn Whitecloud", 
    zone = "Mulgore", 
    map = { 
        zone = "Mulgore", 
        x = 46.75, 
        y = 60.21 } 
}

NPCs[3650] = { 
    id = 3650, 
    name = "Asterion", 
    zone = "Darkshore", 
    map = { 
        zone = "Darkshore", 
        x = 44.18, 
        y = 36.31 } 
}

NPCs[3995] = { 
    id = 3995, 
    name = "Witch Doctor Jin'Zil", 
    zone = "Stonetalon Mountains", 
    map = { 
        zone = "Stonetalon Mountains", 
        x = 74.54, 
        y = 97.92 } 
}

NPCs[4046] = { 
    id = 4046, 
    name = "Magatha Grimtotem", 
    zone = "Mulgore", 
    map = { 
        zone = "Mulgore", 
        x = 43.9887, 
        y = 23.1264 } 
}

NPCs[4066] = { 
    id = 4066, 
    name = "Nal'taszar", 
    zone = "Stonetalon Mountains", 
    map = { 
        zone = "Stonetalon Mountains", 
        x = 25.57, 
        y = 11.51 } 
}

NPCs[4454] = { 
    id = 4454, 
    name = "Fizzle Brassbolts", 
    zone = "Thousand Needles", 
    map = { 
        zone = "Thousand Needles", 
        x = 78.06, 
        y = 77.12 } 
}

NPCs[4500] = { 
    id = 4500, 
    name = "Overlord Mok'Morokk", 
    zone = "Dustwallow Marsh", 
    map = { 
        zone = "Dustwallow Marsh", 
        x = 36.29, 
        y = 31.39 } 
}

NPCs[4501] = { 
    id = 4501, 
    name = "Draz'Zilb", 
    zone = "Dustwallow Marsh", 
    map = { 
        zone = "Dustwallow Marsh", 
        x = 37.14, 
        y = 33.08 } 
}

NPCs[4568] = { 
    id = 4568, 
    name = "Anastasia Hartwell", 
    zone = "Tirisfal Glades", 
    map = { 
        zone = "Tirisfal Glades", 
        x = 65.89, 
        y = 67.2 } 
}

NPCs[4618] = { 
    id = 4618, 
    name = "Martek the Exiled", 
    zone = "Badlands", 
    map = { 
        zone = "Badlands", 
        x = 42.2, 
        y = 52.67 } 
}

NPCs[5489] = { 
    id = 5489, 
    name = "Brother Joshua", 
    zone = "Stormwind City", 
    map = { 
        zone = "Stormwind City", 
        x = 38.53, 
        y = 26.79 } 
}

NPCs[5497] = {
    id = 5497,
    name = "Jennea Cannon",
    zone = "Stormwind City",
    map = {
        zone = "Stormwind City",
        x = 49.6,
        y = 85.8
    }
}

NPCs[5912] = {
    id = 5912,
    name = "Deviate Faerie Dragon",
    zone = "Wailing Caverns",
    locations = {
        {
            instanceID = 43,
            x = 73.8,
            y = 29.9,
            label = "Deviate Faerie Dragon"
        }
    }
}

NPCs[6109] = { 
    id = 6109, 
    name = "Azuregos", 
    zone = "Aszhara", 
    map = { 
        zone = "Aszhara", 
        x = 56.83, 
        y = 78.72 
    } 
}

NPCs[6490] = { 
    id = 6490, 
    name = "Azshir the Sleepless", 
    zone = "Scarlet Monastery", 
    locations = { {
        instanceID = 796,
        instanceZoneID = 3,
        zone = "Scarlet Monastery",
        x = 40.8, 
        y = 46.7,
        label = "Azshir the Sleepless"
    } }
}

NPCs[6546] = { 
    id = 6546, 
    name = "Tabetha", 
    zone = "Dustwallow Marsh", 
    map = { 
        zone = "Dustwallow Marsh", 
        x = 46.02, 
        y = 57.1 
    } 
}

NPCs[6548] = { 
    id = 6548, 
    name = "Magus Tirth", 
    zone = "Thousand Needles", 
    map = { 
        zone = "Thousand Needles", 
        x = 78.27, 
        y = 76.07 
    } 
}

NPCs[7272] = { 
    id = 7272, 
    name = "Theka the Martyr", 
    zone = "Zul'Farrak",
    locations = { 
        {
            instanceID = 209,
            zone = "Zul'Farrak",
            x = 52.8,
            y = 25.9,
            label = "Theka the Martyr",
        }
    }
}

NPCs[7274] = { 
    id = 7274, 
    name = "Sandfury Executioner", 
    zone = "Zul'Farrak",
    locations = { 
        {
            instanceID = 209,
            zone = "Zul'Farrak",
            x = 23.6,
            y = 17.6,
            label = "Sandfury Executioner",
        }
    }
}

NPCs[7356] = { 
    id = 7356, 
    name = "Plaguemaw the Rotting" ,
    zone = "Razorfen Downs",
    locations = { 
        {
        instanceID = 129,
        zone = "Razorfen Downs",
        x = 36.3,
        y = 17.4,
        label = "Plaguemaw the Rotting"
        } 
    }
}

NPCs[7795] = { 
    id = 7795, 
    name = "Hydromancer Velratha", 
    zone = "Zul'Farrak",
    locations = { 
        {
        instanceID = 209,
        zone = "Zul'Farrak",
        x = 34,
        y = 41.4,
        label = "Hydromancer Velratha",
        }
    }
}

NPCs[8405] = { 
    id = 8405, 
    name = "Ogtinc", 
    zone = "Aszhara", 
    map = { 
        zone = "Aszhara", 
        x = 42.4, 
        y = 42.64 
    } 
}

NPCs[8583] = { 
    id = 8583, 
    name = "Dirania Silvershine", 
    zone = "Teldrassil", 
    map = { 
        zone = "Teldrassil", 
        x = 60.91, 
        y = 41.97 
    } 
}

NPCs[8584] = { 
    id = 8584, 
    name = "Iverron", 
    zone = "Teldrassil", 
    map = { 
        zone = "Teldrassil", 
        x = 54.61, 
        y = 33.01 
    } 
}

NPCs[8905] = { 
    id = 8905, 
    name = "Warbringer Construct", 
    zone = "BRD (Dungeon)", 
    map = { 
        zone = "BRD (Dungeon)", 
        x = 30.8182, 
        y = 35.5333 
    } 
}

NPCs[9024] = { 
    id = 9024, 
    name = "Pyromancer Loregrain", 
    zone = "Blackrock Depths", 
    locations = { {
        instanceID = 1584,
        zone = "Blackroch Depths", 
        x = 57.2, 
        y = 75.9,
        label = "Pyromancer Loregrain"
        } 
    }
}

NPCs[9476] = { 
    id = 9476, 
    name = "Watchman Doomgrip" 
}

NPCs[10181] = { 
    id = 10181, 
    name = "Lady Sylvanas Windrunner", 
    zone = "Silverpine Forrest", 
    map = { 
        zone = "Silverpine Forrest", 
        x = 74.62, 
        y = 13.45 
    } 
}

NPCs[10393] = { 
    id = 10393, 
    name = "Skul", 
    zone = "Stratholme (Dungeon)", 
    map = { 
        zone = "Stratholme (Dungeon)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[10428] = { 
    id = 10428, 
    name = "Motega Firemane", 
    zone = "Thousand Needles", 
    map = { 
        zone = "Thousand Needles", 
        x = 21.54, 
        y = 32.33 
    } 
}

NPCs[10436] = { 
    id = 10436, 
    name = "Baroness Anastari", 
    zone = "Stratholme (Dungeon)", 
    map = { 
        zone = "Stratholme (Dungeon)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[10440] = { 
    id = 10440, 
    name = "Baron Rivendare", 
    zone = "Stratholme (Dungeon)", 
    map = { 
        zone = "Stratholme (Dungeon)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[10509] = { 
    id = 10509, 
    name = "Jed Runewatcher", 
    zone = "Blackrock Spire",
    locations ={
        {
            instanceID = 229,
            zone = "Blackrock Spire",
            x = 0,
            y = 0,
            label = "Jed Runewatcher"
        }
    }
}

NPCs[10539] = { 
    id = 10539, 
    name = "Hagar Lightninghoof", 
    zone = "Thousand Needles", 
    map = { 
        zone = "Thousand Needles", 
        x = 44.63, 
        y = 50.26 
    } 
}

NPCs[10922] = { 
    id = 10922, 
    name = "Greta Mosshoof", 
    zone = "Felwood", 
    map = { 
        zone = "Felwood", 
        x = 51.21, 
        y = 82.13 
    } 
}

NPCs[10929] = { 
    id = 10929, 
    name = "Haleh", 
    zone = "Winterspring", 
    map = { 
        zone = "Winterspring", 
        x = 54.5399, 
        y = 51.2183 
    } 
}

NPCs[11480] = { 
    id = 11480, 
    name = "Arcane Aberration" 
}

NPCs[11483] = { 
    id = 11483, 
    name = "Mana Remnant", 
    zone = "Dire Maul (Dungeon)", 
    map = { 
        zone = "Dire Maul (Dungeon)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[11484] = { 
    id = 11484, 
    name = "Residual Monstrosity", 
    zone = "Dire Maul (Dungeon)", 
    map = { 
        zone = "Dire Maul (Dungeon)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[11520] = { 
    id = 11520, 
    name = "Taragaman the Hungerer", 
    zone = "Ragefire Chasm" 
}

NPCs[11720] = { 
    id = 11720, 
    name = "Loruk Foreststrider", 
    zone = "Ashenvale", 
    map = { 
        zone = "Ashenvale", 
        x = 73.27, 
        y = 59.31 
    } 
}

NPCs[11878] = { 
    id = 11878, 
    name = "Nathanos Blightcaller", 
    zone = "Eastern Plaguelands", 
    map = { 
        zone = "Eastern Plaguelands", 
        x = 26.52, 
        y = 74.77 
    } 
}

NPCs[11898] = { 
    id = 11898, 
    name = "Crusader Lord Valdelmar", 
    zone = "Eastern Plaguelands", 
    map = { 
        zone = "Eastern Plaguelands", 
        x = 85.11, 
        y = 87.24 
    } 
}

NPCs[11981] = { 
    id = 11981, 
    name = "Flamegor", 
    zone = "Blackwing Lair (Raid)", 
    map = { 
        zone = "Blackwing Lair (Raid)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[12098] = { 
    id = 12098, 
    name = "Sulfuron Harbinger", 
    zone = "Molten Core (Raid)", 
    map = { 
        zone = "Molten Core (Raid)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[12118] = { 
    id = 12118, 
    name = "Lucifron", 
    zone = "Molten Core (Raid)", 
    map = { 
        zone = "Molten Core (Raid)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[12159] = { 
    id = 12159, 
    name = "Korrak the Bloodrager", 
    zone = "Alterac Valley", 
    map = { 
        zone = "Alterac Valley", 
        x = 44.51, 
        y = 45.89 
    } 
}

NPCs[12259] = { 
    id = 12259, 
    name = "Gehennas" 
}

NPCs[12264] = { 
    id = 12264, 
    name = "Shazzrah", 
    zone = "Molten Core (Raid)", 
    map = { 
        zone = "Molten Core (Raid)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[12425] = { 
    id = 12425, 
    name = "Flint Shadowmore", 
    zone = "Western Plaguelands", 
    map = { 
        zone = "Western Plaguelands", 
        x = 43.6, 
        y = 84.51 
    } 
}

NPCs[12457] = { 
    id = 12457, 
    name = "Blackwing Spellbinder", 
    zone = "Blackwing Lair (Raid)", 
    map = { 
        zone = "Blackwing Lair (Raid)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[12459] = { 
    id = 12459, 
    name = "Blackwing Warlock", 
    zone = "Blackwing Lair (Raid)", 
    map = { 
        zone = "Blackwing Lair (Raid)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[12461] = { 
    id = 12461, 
    name = "Death Talon Overseer", 
    zone = "Blackwing Lair (Raid)", 
    map = { 
        zone = "Blackwing Lair (Raid)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[13456] = { 
    id = 13456, 
    name = "Noxxion's Spawn" 
}

NPCs[13816] = { 
    id = 13816, 
    name = "Prospector Stonehewer", 
    zone = "Alterac Mountains", 
    map = { 
        zone = "Alterac Mountains", 
        x = 40.62, 
        y = 79.61 
    } 
}

NPCs[13817] = { 
    id = 13817, 
    name = "Voggah Deathgrip", 
    zone = "Alterac Mountains", 
    map = { 
        zone = "Alterac Mountains", 
        x = 63.83, 
        y = 60.48 
    } 
}

NPCs[13840] = { 
    id = 13840, 
    name = "Warmaster Laggrond", 
    zone = "Alterac Mountains", 
    map = { 
        zone = "Alterac Mountains", 
        x = 62.2618, 
        y = 58.9285 
    } 
}

NPCs[13841] = { 
    id = 13841, 
    name = "Lieutenant Haggerdin", 
    zone = "Alterac Mountains", 
    map = { 
        zone = "Alterac Mountains", 
        x = 39.44, 
        y = 81.21 
    } 
}

NPCs[14324] = { 
    id = 14324, 
    name = "Cho'Rush the Observer", 
    zone = "Dire Maul (Dungeon)", 
    map = { 
        zone = "Dire Maul (Dungeon)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[14327] = { 
    id = 14327, 
    name = "Lethtendris", 
    zone = "Dire Maul (Dungeon)", 
    map = { 
        zone = "Dire Maul (Dungeon)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[14399] = { 
    id = 14399, 
    name = "Arcane Torrent", 
    zone = "Dire Maul (Dungeon)", 
    map = { 
        zone = "Dire Maul (Dungeon)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[14510] = { 
    id = 14510, 
    name = "High Priestess Mar'li", 
    zone = "Zul'Gurub" 
}

NPCs[14516] = { 
    id = 14516, 
    name = "Death Knight Darkreaver" 
}

NPCs[14686] = { 
    id = 14686, 
    name = "Lady Falther'ess", 
    zone = "Razorfen Downs" 
}

NPCs[14834] = { 
    id = 14834, 
    name = "Hakkar", 
    zone = "Zul'Gurub" 
}

NPCs[15083] = { 
    id = 15083, 
    name = "Hazza'rah" 
}

NPCs[15208] = { 
    id = 15208, 
    name = "The Duke of Shards" 
}

NPCs[15511] = { 
    id = 15511, 
    name = "Lord Kri", 
    zone = "Ahn'Qiraj Temple" 
}

NPCs[15990] = { 
    id = 15990, 
    name = "Kel'Thuzad", 
    zone = "Naxxramas" 
}

NPCs[16028] = { 
    id = 16028, 
    name = "Patchwerk", 
    zone = "Naxxramas" 
}

NPCs[16061] = { 
    id = 16061, 
    name = "Instructor Razuvious", 
    zone = "Naxxramas" 
}

NPCs[16184] = { 
    id = 16184, 
    name = "Nerubian Overseer", 
    zone = "Western Plaguelands", 
    map = { 
        zone = "Western Plaguelands", 
        x = 67.18, 
        y = 21.65 
    } 
}

NPCs[52145] = { 
    id = 52145, 
    name = "Incindis", 
    zone = "Molten Core (Raid)", 
    map = { 
        zone = "Molten Core (Raid)", 
        x = 0, 
        y = 0 
    } 
}

NPCs[59991] = { 
    id = 59991, 
    name = "Kruul", 
    zone = "Tower of Karazhan" 
}

NPCs[61222] = { 
    id = 61222, 
    name = "Lord Blackwald II", 
    zone = "Lower Karazhan Halls" 
}

NPCs[61316] = { 
    id = 61316, 
    name = "Drifting Avatar of Sand", 
    zone = "Caverns of Time" 
}

NPCs[61517] = { 
    id = 61517, 
    name = "Ruk'thok the Pyromancer", 
    zone = "Azeroth", 
    map = { 
        zone = "Azeroth", 
        x = 35, 
        y = 81.22 
    } 
}

NPCs[61850] = { 
    id = 61850, 
    name = "Ranathir", 
    zone = "Thalassian Highlands", 
    map = { 
        zone = "Thalassian Highlands", 
        continent = 2, 
        zoneIndex = 31, 
        x = 46.5, 
        y = 87.2 
    } 
}
NPCs[61946] = { 
    id = 61946, 
    name = "Ley-Watcher Incantagos", 
    zone = "Tower of Karazhan" 
}

NPCs[62007] = { 
    id = 62007, 
    name = "Al'Dorel", 
    zone = "Winterspring", 
    map = { 
        zone = "Winterspring", 
        x = 56.19, 
        y = 44.61 
    } 
}

NPCs[62069] = { 
    id = 62069, 
    name = "Halgan Redbrand", 
    zone = "Dragonmaw Retreat" 
}

NPCs[62193] = { 
    id = 62193, 
    name = "Quistis the Malign", 
    zone = "Dun Morogh", 
    map = { 
        zone = "Dun Morogh", 
        x = 15.53, 
        y = 99.01 
    } 
}

NPCs[62477] = { 
    id = 62477, 
    name = "Commander Leder", 
    zone = "Azeroth", 
    map = { 
        zone = "Azeroth", 
        x = 42.68, 
        y = 63.68 
    } 
}

NPCs[62503] = { 
    id = 62503, 
    name = "Rotthorn", 
    zone = "Razorfen Kraul" 
}

NPCs[62548] = { 
    id = 62548, 
    name = "Oronok Torn-Heart", 
    zone = "Stormwrought Ruins" 
}

NPCs[62671] = { 
    id = 62671, 
    name = "Ighal'for", 
    zone = "Stormwrought Ruins" 
}

NPCs[62976] = { 
    id = 62976, 
    name = "Mhulf Nighthorn", 
    zone = "Winterspring", 
    map = { 
        zone = "Winterspring", 
        x = 89.06, 
        y = 10.89 
    } 
}

NPCs[63032] = { 
    id = 63032, 
    name = "Glurgill", 
    zone = "Kalimdor", 
    map = { 
        zone = "Kalimdor", 
        x = 59.76, 
        y = 13.98 
    } 
}

NPCs[63107] = { 
    id = 63107, 
    name = "Azuregos" 
}

NPCs[65113] = { 
    id = 65113, 
    name = "Chronar", 
    zone = "Caverns of Time" 
}

NPCs[65114] = { 
    id = 65114, 
    name = "Harbinger Aph'ygth" 
}

NPCs[70020] = { 
    id = 70020, 
    name = "Taupo Foreststrider", 
    zone = "Ashenvale", 
    map = { 
        zone = "Ashenvale", 
        x = 78.3641, 
        y = 68.2386 
    } 
}

NPCs[70022] = { 
    id = 70022, 
    name = "Norvok Hawkspear", 
    zone = "Ashenvale", 
    map = { 
        zone = "Ashenvale", 
        x = 78.3815, 
        y = 68.3426 
    } 
}

NPCs[70023] = { 
    id = 70023, 
    name = "Commander Grushak", 
    zone = "Ashenvale", 
    map = { 
        zone = "Ashenvale", 
        x = 87.23, 
        y = 64.7 
    } 
}

NPCs[70027] = { 
    id = 70027, 
    name = "Farseer Grimeye", 
    zone = "Ashenvale", 
    map = { 
        zone = "Ashenvale", 
        x = 90.68, 
        y = 58.14 
    } 
}

NPCs[80116] = { 
    id = 80116, 
    name = "Risen Oilblaze" 
}

NPCs[80854] = { 
    id = 80854, 
    name = "Damian",
    zone = "Stormwind Vault",
    map = {
        zone = "Stormwind Vault",
        instanceID = 35,
        x = 46.4, y = 43.1
    }

}

NPCs[91214] = { 
    id = 91214, 
    name = "" 
}

NPCs[91234] = { 
    id = 91234, 
    name = "" 
}

NPCs[91350] = { 
    id = 91350, 
    name = "Magus Bromley", 
    zone = "Azshara", 
    map = { 
        zone = "Azshara", 
        x = 37.507, 
        y = 65.6169 } 
}

NPCs[91928] = { 
    id = 91928, 
    name = "Alarus" 
}

NPCs[92111] = { 
    id = 92111, 
    name = "Fenektis the Deceiver", 
    zone = "Crescent Grove" 
}
