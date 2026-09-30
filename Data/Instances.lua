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
-- Blackfathom Deeps
--------------------------------------------------

Instances[719] = {
    name =
        "Blackfathom Deeps",

    shortName =
        "BFD",

    type =
        "dungeon",

    icon =
        "Interface\\Icons\\INV_Misc_Map_01",

    --------------------------------------------------
    -- Vanilla World Map
    --------------------------------------------------
    --
    -- Confirmed in-game:
    --   SetMapZoom(7, 1)
    --   GetCurrentMapContinent() -> 7
    --   GetCurrentMapZone()      -> 1
    --------------------------------------------------

    worldMap = {
        mapID = 7,
        zoneID = 1
    },

    --------------------------------------------------
    -- Physical entrance fallback
    --------------------------------------------------
    -- Used only when an internal WorldMap entry is unavailable.

    entrance = {
        zone =
            "Ashenvale",

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
    name =
        "The Deadmines",

    shortName =
        "DM",

    type =
        "dungeon",

    description =
        "Dungeon encounter in The Deadmines.",

    icon =
        "Interface\\Icons\\INV_Misc_Map_01",

    --------------------------------------------------
    -- Vanilla World Map
    --------------------------------------------------
    --
    -- Confirmed in the Instance Journal map catalog:
    --   SetMapZoom(21, 1)
    --

    worldMap = {
        mapID = 21,
        zoneID = 1
    }
}

--------------------------------------------------
-- Maraudon
--------------------------------------------------

Instances[349] = {
    name =
        "Maraudon",

    shortName =
        "Mara",

    type =
        "dungeon",

    icon =
        "Interface\\Icons\\INV_Misc_Map_01",

    -- Instance Journal native map pair:
    --   SetMapZoom(19, 1)
    worldMap = {
        mapID = 19,
        zoneID = 1
    },

    -- Physical entrance fallback when the internal map is unavailable.
    entrance = {
        zone =
            "Desolace",

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
    name =
        "Sunken Temple",

    shortName =
        "ST",

    type =
        "dungeon",

    icon =
        "Interface\\Icons\\INV_Misc_Map_01",

    -- Instance Journal native map pair:
    --   SetMapZoom(6, 1)
    worldMap = {
        mapID = 6,
        zoneID = 1
    },

    -- Physical entrance fallback when the internal map is unavailable.
    entrance = {
        zone =
            "Swamp of Sorrows",

        x = 69.4,
        y = 53.2,

        label =
            "Sunken Temple entrance"
    }
}
