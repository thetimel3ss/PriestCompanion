-- Priest Companion
-- Native World Map helper
-- Vanilla 1.12 compatible
--
-- Provides a lightweight, pfQuest-independent way to open the world map
-- and highlight quest or drop locations with pulsing markers.

local PC = PriestCompanion

PC.Map = PC.Map or {}

local Map = PC.Map

--------------------------------------------------
-- Constants
--------------------------------------------------

local MARKER_BASE_SIZE = 28
local MARKER_PULSE_SIZE = 5
local MARKER_PULSE_SPEED = 4

local START_ICON =
    "Interface\\GossipFrame\\AvailableQuestIcon"

local END_ICON =
    "Interface\\GossipFrame\\ActiveQuestIcon"

local UNKNOWN_ICON =
    "Interface\\Icons\\INV_Misc_QuestionMark"

local DROP_ICON =
    "Interface\\TargetingFrame\\UI-TargetingFrame-Skull"

--------------------------------------------------
-- Instance Map Metadata
--------------------------------------------------
--
-- Native dungeon WorldMap indices live in Data/Instances.lua.
-- Core/Map.lua only resolves and renders them.
--
-- Example instance record:
--
-- worldMap = {
--     mapID = 7,
--     zoneID = 1
-- }
--
-- These values are the indices accepted by Vanilla SetMapZoom(),
-- not AreaTable IDs or Map.dbc IDs.

--------------------------------------------------
-- Runtime State
--------------------------------------------------

local markers = {}
local zoneCache = nil

--------------------------------------------------
-- Helpers
--------------------------------------------------

local function NormalizeText(text)
    if not text then
        return nil
    end

    text = string.lower(
        tostring(text)
    )

    text = string.gsub(
        text,
        "%s+",
        " "
    )

    text = string.gsub(
        text,
        "^%s+",
        ""
    )

    text = string.gsub(
        text,
        "%s+$",
        ""
    )

    return text
end

local function Print(text)
    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff66ccffPriest Companion:|r " ..
        tostring(text)
    )
end

--------------------------------------------------
-- Zone Resolution
--------------------------------------------------

local function BuildZoneCache()
    zoneCache = {}

    if type(GetMapContinents) ~= "function"
    or type(GetMapZones) ~= "function" then
        return
    end

    local continents = {
        GetMapContinents()
    }

    local continentIndex

    for continentIndex = 1,
        table.getn(continents)
    do
        local continentName =
            continents[
                continentIndex
            ]

        if continentName then
            zoneCache[
                NormalizeText(
                    continentName
                )
            ] = {
                continent =
                    continentIndex,
                zone = 0,
                name =
                    continentName
            }
        end

        local zones = {
            GetMapZones(
                continentIndex
            )
        }

        local zoneIndex

        for zoneIndex = 1,
            table.getn(zones)
        do
            local zoneName =
                zones[zoneIndex]

            if zoneName then
                zoneCache[
                    NormalizeText(
                        zoneName
                    )
                ] = {
                    continent =
                        continentIndex,
                    zone =
                        zoneIndex,
                    name =
                        zoneName
                }
            end
        end
    end
end

function Map.ResolveZone(zoneName)
    if not zoneName then
        return nil
    end

    if not zoneCache then
        BuildZoneCache()
    end

    local key =
        NormalizeText(zoneName)

    if not key then
        return nil
    end

    local result =
        zoneCache[key]

    if result then
        return
            result.continent,
            result.zone,
            result.name
    end

    return nil
end

function Map.RefreshZoneCache()
    BuildZoneCache()
end

--------------------------------------------------
-- Native Instance Map Resolution
--------------------------------------------------

local function FindInstanceIDByZoneName(zoneName)
    if not zoneName
    or not PC.Data
    or not PC.Data.Instances then
        return nil
    end

    local wanted =
        NormalizeText(zoneName)

    if not wanted then
        return nil
    end

    local instanceID
    local instance

    for instanceID, instance in
        pairs(PC.Data.Instances)
    do
        if instance then
            local instanceName =
                NormalizeText(
                    instance.name
                )

            local shortName =
                NormalizeText(
                    instance.shortName
                )

            if wanted == instanceName
            or wanted == shortName then
                return instanceID
            end
        end
    end

    return nil
end

local function ResolveInstanceWorldMap(location)
    if not location then
        return nil
    end

    local instanceID =
        location.instanceID

    if not instanceID then
        instanceID =
            FindInstanceIDByZoneName(
                location.zone
            )
    end

    if not instanceID then
        return nil
    end

    local instance = nil

    if PC.Data
    and PC.Data.Instances then
        instance =
            PC.Data.Instances[
                instanceID
            ]
    end

    if not instance
    or not instance.worldMap
    or not instance.worldMap.mapID then
        return nil
    end

    local worldMap =
        instance.worldMap

    return {
        continent = worldMap.mapID,
        zone =
            location.instanceZoneID
            or worldMap.zoneID
            or 1,
        zoneName =
            instance.name
            or location.zone,
        x = location.x,
        y = location.y,
        label = location.label,
        instanceID = instanceID,
        isInstanceMap = true,
        fallbackUsed = false
    }
end

--------------------------------------------------
-- Marker
--------------------------------------------------

local function GetMarkerIcon(markerType)
    if markerType == "questEnd" then
        return END_ICON
    end

    if markerType == "questStart" then
        return START_ICON
    end

    if markerType == "drop" then
        return DROP_ICON
    end

    return UNKNOWN_ICON
end

local function CreateMarker()
    if not WorldMapButton then
        return nil
    end

    local i

    for i = 1,
        table.getn(markers)
    do
        if not markers[i]:IsShown() then
            return markers[i]
        end
    end

    local marker =
        CreateFrame(
            "Button",
            nil,
            WorldMapButton
        )

    marker:SetWidth(
        MARKER_BASE_SIZE
    )

    marker:SetHeight(
        MARKER_BASE_SIZE
    )

    marker:SetFrameLevel(
        WorldMapButton:GetFrameLevel() +
        8
    )

    marker.icon =
        marker:CreateTexture(
            nil,
            "ARTWORK"
        )

    marker.icon:SetAllPoints(
        marker
    )

    marker.elapsed = 0
    marker.mapCheckElapsed = 0

    marker:SetScript(
        "OnEnter",
        function()
            GameTooltip:SetOwner(
                this,
                "ANCHOR_RIGHT"
            )

            GameTooltip:SetText(
                this.label or
                "Location"
            )

            if this.zoneName then
                GameTooltip:AddLine(
                    tostring(
                        this.zoneName
                    ),
                    0.85,
                    0.85,
                    0.85
                )
            end

            if this.x
            and this.y then
                GameTooltip:AddLine(
                    string.format(
                        "%.1f, %.1f",
                        this.x,
                        this.y
                    ),
                    0.65,
                    0.85,
                    1.00
                )
            end

            if this.fallbackUsed then
                GameTooltip:AddLine(
                    "Showing fallback location",
                    1.00,
                    0.82,
                    0.00
                )
            end

            GameTooltip:Show()
        end
    )

    marker:SetScript(
        "OnLeave",
        function()
            GameTooltip:Hide()
        end
    )

    marker:SetScript(
        "OnUpdate",
        function()
            if not this:IsShown() then
                return
            end

            if not WorldMapFrame
            or not WorldMapFrame:IsShown() then
                this:Hide()
                return
            end

            local delta =
                arg1 or 0

            this.elapsed =
                (this.elapsed or 0) +
                delta

            this.mapCheckElapsed =
                (this.mapCheckElapsed or 0) +
                delta

            --------------------------------------------------
            -- Pulse
            --------------------------------------------------

            local pulse =
                math.sin(
                    this.elapsed *
                    MARKER_PULSE_SPEED
                )

            local size =
                MARKER_BASE_SIZE +
                (
                    pulse *
                    MARKER_PULSE_SIZE
                )

            if size < 20 then
                size = 20
            end

            this:SetWidth(size)
            this:SetHeight(size)

            --------------------------------------------------
            -- Position
            --------------------------------------------------

            local mapWidth =
                WorldMapButton:GetWidth()
                or 0

            local mapHeight =
                WorldMapButton:GetHeight()
                or 0

            if mapWidth > 0
            and mapHeight > 0
            and this.x
            and this.y then
                local x =
                    (this.x / 100) *
                    mapWidth

                local y =
                    (this.y / 100) *
                    mapHeight

                this:ClearAllPoints()

                this:SetPoint(
                    "CENTER",
                    WorldMapButton,
                    "TOPLEFT",
                    x,
                    -y
                )
            end

            --------------------------------------------------
            -- Hide if player changes map manually
            --------------------------------------------------

            if this.mapCheckElapsed >= 0.25 then
                this.mapCheckElapsed = 0

                if type(
                    GetCurrentMapContinent
                ) == "function"
                and type(
                    GetCurrentMapZone
                ) == "function" then

                    local currentContinent =
                        GetCurrentMapContinent()

                    local currentZone =
                        GetCurrentMapZone()

                    if this.targetContinent
                    and this.targetZone
                    and (
                        currentContinent ~= this.targetContinent
                        or currentZone ~= this.targetZone
                    ) then
                        this:Hide()
                    end
                end
            end
        end
    )

    marker:Hide()

    table.insert(
        markers,
        marker
    )

    return marker
end

--------------------------------------------------
-- Public Marker Control
--------------------------------------------------

function Map.HideMarker()
    local i

    for i = 1,
        table.getn(markers)
    do
        markers[i]:Hide()
    end
end

--------------------------------------------------
-- Location Resolution
--------------------------------------------------

local function GetInstanceEntranceFallback(location)
    if not location
    or not location.instanceID
    or not PC.Data
    or not PC.Data.Instances then
        return nil
    end

    local instance =
        PC.Data.Instances[
            location.instanceID
        ]

    if not instance
    or not instance.entrance then
        return nil
    end

    return instance.entrance
end

local function ResolveLocation(location)
    if not location then
        return nil
    end

    --------------------------------------------------
    -- Dungeon/instance maps first
    --
    -- These maps can be valid SetMapZoom targets even though
    -- GetMapZones() does not enumerate them.
    --------------------------------------------------

    local instanceMap =
        ResolveInstanceWorldMap(
            location
        )

    if instanceMap then
        return instanceMap
    end

    --------------------------------------------------
    -- Normal world/city zones
    --------------------------------------------------

    local continent =
        location.continent

    local zone =
        location.zoneIndex

    local zoneName =
        location.zone

    if not continent
    or zone == nil then
        continent,
        zone =
            Map.ResolveZone(
                zoneName
            )
    end

    if continent
    and zone ~= nil then
        return {
            continent = continent,
            zone = zone,
            zoneName = zoneName,
            x = location.x,
            y = location.y,
            label = location.label,
            isInstanceMap = false,
            fallbackUsed = false
        }
    end

    local fallbackLocation =
        location.fallback

    if not fallbackLocation then
        fallbackLocation =
            GetInstanceEntranceFallback(
                location
            )
    end

    if fallbackLocation then
        local fallback =
            ResolveLocation(
                fallbackLocation
            )

        if fallback then
            fallback.fallbackUsed =
                true

            return fallback
        end
    end

    return nil
end

--------------------------------------------------
-- Show Location
--------------------------------------------------

function Map.ShowLocation(
    location,
    markerType,
    label,
    appendMarkers
)
    if not location then
        return false
    end

    if not appendMarkers then
        Map.HideMarker()
    end

    if not WorldMapFrame
    or not WorldMapButton
    or type(SetMapZoom) ~= "function" then
        Print(
            "World map API is not available."
        )

        return false
    end

    local resolved =
        ResolveLocation(
            location
        )

    if not resolved then
        Print(
            "Map location is not available for " ..
            tostring(
                label or
                location.label or
                "this NPC"
            ) ..
            "."
        )

        return false
    end

    if not resolved.x
    or not resolved.y then
        Print(
            "Coordinates are not available for " ..
            tostring(
                label or
                resolved.label or
                "this NPC"
            ) ..
            "."
        )

        return false
    end

    if not WorldMapFrame:IsShown() then
        WorldMapFrame:Show()
    end

    SetMapZoom(
        resolved.continent,
        resolved.zone
    )

    local pin =
        CreateMarker()

    if not pin then
        return false
    end

    pin.targetContinent =
        resolved.continent

    pin.targetZone =
        resolved.zone

    pin.zoneName =
        resolved.zoneName

    pin.x = resolved.x
    pin.y = resolved.y

    pin.label =
        label or
        resolved.label or
        "Location"

    pin.fallbackUsed =
        resolved.fallbackUsed

    pin.elapsed = 0
    pin.mapCheckElapsed = 0

    pin.icon:SetTexture(
        GetMarkerIcon(
            markerType
        )
    )

    pin:Show()

    return true
end

--------------------------------------------------
-- NPC Convenience Wrapper
--------------------------------------------------

function Map.ShowNPC(
    npc,
    markerType,
    questName
)
    if not npc then
        return false
    end

    local label =
        tostring(
            npc.name or
            "Unknown NPC"
        )

    if questName then
        label =
            label ..
            " - " ..
            tostring(
                questName
            )
    end

    if npc.locations
    and table.getn(npc.locations) > 0 then
        local shown = false
        local i

        Map.HideMarker()

        for i = 1,
            table.getn(npc.locations)
        do
            if Map.ShowLocation(
                npc.locations[i],
                markerType,
                label,
                true
            ) then
                shown = true
            end
        end

        if shown then
            return true
        end
    end

    if npc.map then
        return
            Map.ShowLocation(
                npc.map,
                markerType,
                label
            )
    end

    --------------------------------------------------
    -- Optional pfQuest fallback for records that do not
    -- yet have native Priest Companion coordinates.
    --------------------------------------------------

    if pfDatabase
    and pfMap
    and type(
        pfMap.ShowMapID
    ) == "function" then

        local meta = {
            addon =
                "PRIESTCOMPANION",
            quest =
                questName
        }

        local maps = nil

        if npc.id
        and type(
            pfDatabase.SearchMobID
        ) == "function" then
            maps =
                pfDatabase:SearchMobID(
                    npc.id,
                    meta
                )

        elseif npc.name
        and type(
            pfDatabase.SearchMob
        ) == "function" then
            maps =
                pfDatabase:SearchMob(
                    npc.name,
                    meta,
                    "LOWER"
                )
        end

        if maps
        and type(
            pfDatabase.GetBestMap
        ) == "function" then
            local mapID =
                pfDatabase:GetBestMap(
                    maps
                )

            if mapID then
                if type(
                    pfMap.UpdateNodes
                ) == "function" then
                    pfMap:UpdateNodes()
                end

                pfMap:ShowMapID(
                    mapID
                )

                return true
            end
        end
    end

    local text =
        label

    if npc.zone then
        text =
            text ..
            " - " ..
            tostring(
                npc.zone
            )
    end

    Print(text)

    return false
end
