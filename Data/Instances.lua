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
