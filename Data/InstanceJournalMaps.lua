-- Priest Companion | InstanceJournal map overlays
--
-- Instance Journal keeps two identifiers for an instance location:
--   * the instance map ID accepted by SetMapZoom()
--   * an optional sub-map/zone ID for multi-floor dungeons and raids
--
-- The OctoWoW catalog uses AreaID/ZoneOrSort IDs as its instance keys, so
-- this file deliberately overlays the generated catalog instead of putting
-- WorldMap values in generated files.  Regenerating the catalog therefore
-- cannot remove the map data used by "Show Boss on Map".
--
-- Source: Arthur-Helias/InstanceJournal (map enum and boss map coordinates).

local PC = PriestCompanion
local Data = PC.Data
local Instances = Data.Instances
local NPCs = Data.NPCs

local function SetWorldMap(instanceID, mapID, zoneID)
    local instance = Instances and Instances[instanceID]

    if not instance or not mapID then
        return
    end

    instance.worldMap = {
        mapID = mapID,
        zoneID = zoneID or 1
    }
end

--------------------------------------------------
-- Instance Journal native map IDs
--------------------------------------------------

SetWorldMap(35, 37, 1)       -- Stormwind Vault
SetWorldMap(43, 18, 1)       -- Wailing Caverns
SetWorldMap(47, 23, 1)       -- Razorfen Kraul
SetWorldMap(48, 7, 1)        -- Blackfathom Deeps alias
SetWorldMap(109, 6, 1)       -- Temple of Atal'Hakkar
SetWorldMap(129, 22, 1)      -- Razorfen Downs
SetWorldMap(209, 5, 1)       -- Zul'Farrak
SetWorldMap(229, 17, 1)       -- Blackrock Spire
SetWorldMap(269, 31, 1)      -- Black Morass (BM1)
SetWorldMap(309, 12, 1)      -- Zul'Gurub
SetWorldMap(349, 19, 1)      -- Maraudon
SetWorldMap(389, 4, 1)       -- Ragefire Chasm
SetWorldMap(509, 15, 1)      -- Ruins of Ahn'Qiraj (AQ401)
SetWorldMap(531, 28, 1)      -- Temple of Ahn'Qiraj (AQ401)
SetWorldMap(532, 29, 1)      -- Lower Karazhan Halls
SetWorldMap(533, 33, 1)      -- Naxxramas (NAXX1)
SetWorldMap(718, 18, 1)      -- Wailing Caverns alias
SetWorldMap(719, 7, 1)       -- Blackfathom Deeps
SetWorldMap(721, 9, 1)       -- Gnomeregan
SetWorldMap(796, 24, 1)      -- Scarlet Monastery (SMArm)
SetWorldMap(800, 36, 1)      -- Karazhan Crypt
SetWorldMap(802, 34, 1)      -- Crescent Grove
SetWorldMap(814, 40, 1)      -- Tower of Karazhan (KARA401)
SetWorldMap(1581, 21, 1)     -- The Deadmines
SetWorldMap(1584, 14, 1)     -- Blackrock Depths
SetWorldMap(2017, 27, 1)     -- Stratholme
SetWorldMap(2057, 25, 1)     -- Scholomance
SetWorldMap(2557, 13, 1)     -- Dire Maul
SetWorldMap(2677, 20, 1)     -- Blackwing Lair
SetWorldMap(2717, 11, 1)     -- Molten Core

--------------------------------------------------
-- Verified Instance Journal boss coordinates
--------------------------------------------------

local function SetBossMap(npcID, instanceID, x, y, zoneID)
    if not npcID or not instanceID or x == nil or y == nil then
        return
    end

    local npc = NPCs and NPCs[npcID]

    if not npc then
        npc = {
            id = npcID
        }
    end

    npc.map = {
        instanceID = instanceID,
        zoneID = zoneID,
        x = x,
        y = y
    }

    NPCs[npcID] = npc
end

SetBossMap(645, 1581, 81.0, 24.5)         -- Cookie, The Deadmines
SetBossMap(5709, 109, 66.5, 87.7)         -- Shade of Eranikus, Sunken Temple
SetBossMap(5912, 43, 73.7, 29.8)          -- Deviate Faerie Dragon, Wailing Caverns
SetBossMap(6490, 796, 41.1, 46.6, 3)      -- Azshir, SMGy
SetBossMap(7272, 209, 52.9, 26.2)         -- Theka, Zul'Farrak
SetBossMap(7356, 129, 36.3, 17.8)         -- Plaguemaw, Razorfen Downs
SetBossMap(9024, 1584, 57.1, 76.0)        -- Pyromancer Loregrain, BRD
SetBossMap(9476, 1584, 61.8, 54.6)        -- Watchman Doomgrip, BRD
SetBossMap(10393, 2017, 56.4, 84.9)       -- Skul, Stratholme
SetBossMap(10436, 2017, 90.2, 39.0)       -- Baroness Anastari, Stratholme
SetBossMap(10440, 2017, 60.2, 16.6)       -- Baron Rivendare, Stratholme
SetBossMap(11520, 389, 40.9, 57.9)        -- Taragaman, Ragefire Chasm
SetBossMap(11981, 2677, 45.7, 22.2)       -- Flamegor, Blackwing Lair
SetBossMap(12098, 2717, 77.9, 84.9)       -- Sulfuron, Molten Core
SetBossMap(12118, 2717, 63.6, 44.9)       -- Lucifron, Molten Core
SetBossMap(12264, 2717, 54.1, 85.2)       -- Shazzrah, Molten Core
SetBossMap(13282, 349, 32.3, 4.7)         -- Noxxion, Maraudon
SetBossMap(14327, 2557, 74.3, 76.9)       -- Lethtendris, Dire Maul
SetBossMap(14510, 309, 48.8, 78.8)        -- High Priestess Mar'li, Zul'Gurub
SetBossMap(14834, 309, 49.9, 39.8)        -- Hakkar, Zul'Gurub
SetBossMap(15990, 533, 36.4, 22.6, 2)    -- Kel'Thuzad, NAXX2
SetBossMap(16028, 533, 38.3, 45.7, 1)    -- Patchwerk, NAXX1
SetBossMap(16061, 533, 36.3, 66.9, 1)    -- Instructor Razuvious, NAXX1
SetBossMap(52145, 2717, 55.1, 11.1)       -- Incindis, Molten Core
SetBossMap(59991, 814, 48.9, 75.6, 1)    -- Kruul, KARA401
SetBossMap(61222, 532, 69.1, 74.3)        -- Lord Blackwald II, Lower Karazhan
SetBossMap(62503, 47, 31.0, 75.7)         -- Rotthorn, Razorfen Kraul
SetBossMap(65113, 269, 32.0, 27.4, 2)    -- Chronar, BM2
SetBossMap(80854, 35, 46.5, 43.4)         -- Damian, Stormwind Vault
SetBossMap(91928, 800, 85.4, 43.9)        -- Alarus, Karazhan Crypt
SetBossMap(92111, 802, 44.0, 78.9)        -- Fenektis, Crescent Grove
