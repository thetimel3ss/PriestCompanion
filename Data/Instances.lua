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

    worldMap - {
        mapID = 37,
        zoneID = 1
    },
}

Instances[43] = { name = "Wailing Caverns", shortName = "WC", type = "dungeon", description = "Dungeon encounter in Wailing Caverns.", entranceZone = "The Barrens", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[47] = { name = "Razorfen Kraul", shortName = "RFK", type = "dungeon", description = "Dungeon encounter in Razorfen Kraul.", entranceZone = "The Barrens", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[48] = { name = "Blackfathom Deeps", shortName = "Blackfathom Deeps", type = "dungeon", description = "Dungeon encounter in Blackfathom Deeps.", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[129] = { name = "Razorfen Downs", shortName = "RFD", type = "dungeon", description = "Dungeon encounter in Razorfen Downs.", entranceZone = "The Barrens", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[209] = { name = "Zul'Farrak", shortName = "ZF", type = "dungeon", description = "Dungeon encounter in Zul'Farrak.", entranceZone = "Tanaris", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[229] = { name = "Blackrock Spire", shortName = "BRS", type = "dungeon", description = "Dungeon encounter in Blackrock Spire.", entranceZone = "Burning Steppes", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[269] = { name = "Caverns of Time: Black Morass", shortName = "CoT", type = "dungeon", description = "Dungeon encounter in Caverns of Time: Black Morass.", entranceZone = "Tanaris", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[309] = { name = "Zul'Gurub", shortName = "ZG", type = "raid", description = "Raid encounter in Zul'Gurub.", entranceZone = "Stranglethorn Vale", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[389] = { name = "Ragefire Chasm", shortName = "RFC", type = "dungeon", description = "Dungeon encounter in Ragefire Chasm.", entranceZone = "Orgrimmar", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[509] = { name = "Ruins of Ahn'Qiraj", shortName = "AQ20", type = "raid", description = "Raid encounter in Ruins of Ahn'Qiraj.", entranceZone = "Silithus", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[531] = { name = "Temple of Ahn'Qiraj", shortName = "AQ40", type = "raid", description = "Raid encounter in Temple of Ahn'Qiraj.", entranceZone = "Silithus", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[532] = { name = "Lower Karazhan Halls", shortName = "LK", type = "raid", description = "Raid encounter in Lower Karazhan Halls.", entranceZone = "Deadwind Pass", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[533] = { name = "Naxxramas", shortName = "Naxx", type = "raid", description = "Raid encounter in Naxxramas.", entranceZone = "Eastern Plaguelands", entrance = { zone = "Eastern Plaguelands", x = 39, y = 26, label = "Naxxramas entrance" }, icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[718] = { name = "Wailing Caverns", shortName = "WC", type = "dungeon", description = "Dungeon encounter in Wailing Caverns.", entranceZone = "The Barrens", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[721] = { name = "Gnomeregan", shortName = "Gnomer", type = "dungeon", description = "Dungeon encounter in Gnomeregan.", entranceZone = "Dun Morogh", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[796] = { name = "Scarlet Monastery", shortName = "SM", type = "dungeon", description = "Dungeon encounter in Scarlet Monastery.", entranceZone = "Tirisfal Glades", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[800] = { name = "Karazhan Crypt", shortName = "KC", type = "dungeon", description = "Dungeon encounter in Karazhan Crypt.", entranceZone = "Deadwind Pass", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[802] = { name = "Crescent Grove", shortName = "CG", type = "dungeon", description = "Dungeon encounter in Crescent Grove.", entranceZone = "Ashenvale", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[814] = { name = "Tower of Karazhan", shortName = "ToK", type = "raid", description = "Raid encounter in Tower of Karazhan.", entranceZone = "Deadwind Pass", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[1584] = { name = "Blackrock Depths", shortName = "BRD", type = "dungeon", description = "Dungeon encounter in Blackrock Depths.", entranceZone = "Searing Gorge", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[2017] = { name = "Stratholme", shortName = "Strat", type = "dungeon", description = "Dungeon encounter in Stratholme.", entranceZone = "Eastern Plaguelands", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[2057] = { name = "Scholomance", shortName = "Scholo", type = "dungeon", description = "Dungeon encounter in Scholomance.", entranceZone = "Western Plaguelands", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[2557] = { name = "Dire Maul", shortName = "DM", type = "dungeon", description = "Dungeon encounter in Dire Maul.", entranceZone = "Feralas", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[2677] = { name = "Blackwing Lair", shortName = "BWL", type = "raid", description = "Raid encounter in Blackwing Lair.", entranceZone = "Burning Steppes", icon = "Interface\\Icons\\INV_Misc_Map_01" }
Instances[2717] = { name = "Molten Core", shortName = "MC", type = "raid", description = "Raid encounter in Molten Core.", entranceZone = "Burning Steppes", icon = "Interface\\Icons\\INV_Misc_Map_01" }
