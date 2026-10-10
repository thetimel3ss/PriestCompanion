-- Priest Companion
-- Instance Database
--
-- Central reference for dungeon and raid metadata.
--
-- IMPORTANT:
-- The table key is the Area/ZoneOrSort ID used by Priest Companion data.
-- worldMap.mapID/worldMap.zoneID are separate Vanilla WorldMap indices
-- accepted directly by SetMapZoom().

local PC = PriestCompanion

PC.Data.Instances =
    PC.Data.Instances or {}

local Instances =
    PC.Data.Instances


--------------------------------------------------
-- Easy: /script DEFAULT_CHAT_FRAME:AddMessage("Continent="..GetCurrentMapContinent().." Zone="..GetCurrentMapZone())
    -- /run DEFAULT_CHAT_FRAME:AddMessage("mapID="..tostring(GetCurrentMapContinent()).." zoneID="..tostring(GetCurrentMapZone()))
--------------------------------------------------

--------------------------------------------------
-- Blackfathom Deeps
--------------------------------------------------

Instances[719] = {
    name = "Blackfathom Deeps",
    shortName = "BFD",
    type = "dungeon",
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 7,
        zoneID = 1
    },

    --------------------------------------------------
    -- Physical entrance fallback
    --------------------------------------------------
    -- Used only when an internal WorldMap entry is unavailable.

    entrance = {
        zone = "Ashenvale",
        x = 13.9,
        y = 14.3,

        label =
            "Blackfathom Deeps entrance"
    }
}

--------------------------------------------------
-- The Deadmines
--------------------------------------------------

Instances[1581] = {
    name = "The Deadmines",
    shortName = "DM",
    type = "dungeon",
    description = "Dungeon encounter in The Deadmines.",
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 21,
        zoneID = 1
    }
}

--------------------------------------------------
-- Maraudon
--------------------------------------------------

Instances[349] = {
    name = "Maraudon",
    shortName = "Mara",
    type = "dungeon",
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 19,
        zoneID = 1
    },

    -- Physical entrance fallback when the internal map is unavailable.
    entrance = {
        zone = "Desolace",
        x = 29.3,
        y = 62.5,

        label =
            "Maraudon entrance"
    }
}

--------------------------------------------------
-- Uldaman
--------------------------------------------------

Instances[70] = {
    name = "Uldaman",
    shortName = "Ulda",
    type = "dungeon",
    description = "Dungeon encounter in Uldaman.",
    entranceZone = "Badlands",
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 10,
        zoneID = 1
    }
}

--------------------------------------------------
-- Sunken Temple
--------------------------------------------------

Instances[109] = {
    name = "Sunken Temple",
    shortName = "ST",
    type = "dungeon",
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 6,
        zoneID = 1
    },

    -- Physical entrance fallback when the internal map is unavailable.
    entrance = {
        zone = "Swamp of Sorrows",
        x = 69.4,
        y = 53.2,

        label = "Sunken Temple entrance"
    }
}

--------------------------------------------------
-- Stormwind Vault
--------------------------------------------------

Instances[35] = { 
    name = "Stormwind Vault", 
    shortName = "SWV", 
    type = "dungeon",
    description = "Dungeon encounter in Stormwind Vault.",  
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 37,
        zoneID = 1
    },
}

--------------------------------------------------
-- Wailing Caverns
--------------------------------------------------

Instances[43] = {
    name = "Wailing Caverns",
    shortName = "WC",
    type = "dungeon",
    description = "Dungeon encounter in Wailing Caverns.",
    entranceZone = "The Barrens",
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 18,
        zoneID = 1
    }
}

--------------------------------------------------
-- Razorfen Kraul
--------------------------------------------------

Instances[47] = { 
    name = "Razorfen Kraul", 
    shortName = "RFK", 
    type = "dungeon", 
    description = "Dungeon encounter in Razorfen Kraul.", 
    entranceZone = "The Barrens", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Blackfathom Deeps
--------------------------------------------------

Instances[48] = { 
    name = "Blackfathom Deeps", 
    shortName = "Blackfathom Deeps", 
    type = "dungeon", 
    description = "Dungeon encounter in Blackfathom Deeps.", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Razorfen Downs
--------------------------------------------------

Instances[129] = { 
    name = "Razorfen Downs", 
    shortName = "RFD", 
    type = "dungeon", 
    description = "Dungeon encounter in Razorfen Downs.", 
    entranceZone = "The Barrens", 
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap ={
        mapID = 22,
        zoneID = 1
    }
}

--------------------------------------------------
-- Zul'Farrak
--------------------------------------------------

Instances[209] = { 
    name = "Zul'Farrak", 
    shortName = "ZF", 
    type = "dungeon", 
    description = "Dungeon encounter in Zul'Farrak.", 
    entranceZone = "Tanaris", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Blackrock Spire
--------------------------------------------------

Instances[229] = { 
    name = "Blackrock Spire", 
    shortName = "BRS", 
    type = "dungeon", 
    description = "Dungeon encounter in Blackrock Spire.", 
    entranceZone = "Burning Steppes", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Black Morass
--------------------------------------------------

Instances[269] = { 
    name = "Caverns of Time: Black Morass", 
    shortName = "BM", 
    type = "dungeon", 
    description = "Dungeon encounter in Caverns of Time: Black Morass.", 
    entranceZone = "Tanaris", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Zul'Gurub
--------------------------------------------------

Instances[309] = { 
    name = "Zul'Gurub", 
    shortName = "ZG", 
    type = "raid", 
    description = "Raid encounter in Zul'Gurub.", 
    entranceZone = "Stranglethorn Vale", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Ragefire Chasm
--------------------------------------------------

Instances[389] = { 
    name = "Ragefire Chasm", 
    shortName = "RFC", 
    type = "dungeon", 
    description = "Dungeon encounter in Ragefire Chasm.", 
    entranceZone = "Orgrimmar", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Ruins of Ahn'Qiraj
--------------------------------------------------

Instances[509] = { 
    name = "Ruins of Ahn'Qiraj", 
    shortName = "AQ20", 
    type = "raid", 
    description = "Raid encounter in Ruins of Ahn'Qiraj.", 
    entranceZone = "Silithus", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Temple of Ahn'Qiraj
--------------------------------------------------

Instances[531] = { 
    name = "Temple of Ahn'Qiraj", 
    shortName = "AQ40", 
    type = "raid", 
    description = "Raid encounter in Temple of Ahn'Qiraj.", 
    entranceZone = "Silithus", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Lower Karazhan Halls
--------------------------------------------------

Instances[532] = { 
    name = "Lower Karazhan Halls", 
    shortName = "Kara10", 
    type = "raid", 
    description = "Raid encounter in Lower Karazhan Halls.", 
    entranceZone = "Deadwind Pass", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Naxxramas
--------------------------------------------------

Instances[533] = { 
    name = "Naxxramas", 
    shortName = "Naxx", 
    type = "raid", 
    description = "Raid encounter in Naxxramas.", 
    entranceZone = "Eastern Plaguelands", 
    entrance = { 
        zone = "Eastern Plaguelands", 
        x = 39, 
        y = 26, 
        label = "Naxxramas entrance" 
    }, 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Gnomeregan
--------------------------------------------------

Instances[721] = { 
    name = "Gnomeregan", 
    shortName = "Gnomer", 
    type = "dungeon", 
    description = "Dungeon encounter in Gnomeregan.", 
    entranceZone = "Dun Morogh", 
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 9,
        zoneID = 1,
    }
}

--------------------------------------------------
-- Scarlet Monastery
--------------------------------------------------

Instances[796] = {
    name = "Scarlet Monastery",
    shortName = "SM",
    type = "dungeon",
    entranceZone = "Tirisfal Glades",
    icon = "Interface\\Icons\\INV_Misc_Map_01",

    worldMap = {
        mapID = 24,
        zoneID = 1
    }
}

--------------------------------------------------
-- Karazhan Crypt
--------------------------------------------------

Instances[800] = { 
    name = "Karazhan Crypt", 
    shortName = "Kara5", 
    type = "dungeon", 
    description = "Dungeon encounter in Karazhan Crypt.", 
    entranceZone = "Deadwind Pass", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Crescent Grove
--------------------------------------------------

Instances[802] = { 
    name = "Crescent Grove", 
    shortName = "CG", 
    type = "dungeon", 
    description = "Dungeon encounter in Crescent Grove.", 
    entranceZone = "Ashenvale", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Tower of Karazhan
--------------------------------------------------

Instances[814] = { 
    name = "Tower of Karazhan", 
    shortName = "Kara40", 
    type = "raid", 
    description = "Raid encounter in Tower of Karazhan.", 
    entranceZone = "Deadwind Pass", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Blackrock Depths
--------------------------------------------------

Instances[1584] = { 
    name = "Blackrock Depths", 
    shortName = "BRD", 
    type = "dungeon", 
    description = "Dungeon encounter in Blackrock Depths.", 
    entranceZone = "Searing Gorge", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Stratholme
--------------------------------------------------

Instances[2017] = { 
    name = "Stratholme", 
    shortName = "Strat", 
    type = "dungeon", 
    description = "Dungeon encounter in Stratholme.", 
    entranceZone = "Eastern Plaguelands", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Scholomance
--------------------------------------------------

Instances[2057] = { 
    name = "Scholomance", 
    shortName = "Scholo", 
    type = "dungeon", 
    description = "Dungeon encounter in Scholomance.", 
    entranceZone = "Western Plaguelands", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Dire Maul
--------------------------------------------------

Instances[2557] = { 
    name = "Dire Maul", 
    shortName = "DM", 
    type = "dungeon", 
    description = "Dungeon encounter in Dire Maul.", 
    entranceZone = "Feralas", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Blackwing Lair
--------------------------------------------------

Instances[2677] = { 
    name = "Blackwing Lair", 
    shortName = "BWL", 
    type = "raid", 
    description = "Raid encounter in Blackwing Lair.", 
    entranceZone = "Burning Steppes", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

--------------------------------------------------
-- Molten Core
--------------------------------------------------

Instances[2717] = { 
    name = "Molten Core", 
    shortName = "MC", 
    type = "raid", 
    description = "Raid encounter in Molten Core.", 
    entranceZone = "Burning Steppes", 
    icon = "Interface\\Icons\\INV_Misc_Map_01" 
}

