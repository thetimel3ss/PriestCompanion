-- Priest Companion
-- Client Capabilities

local PC = PriestCompanion

--------------------------------------------------
-- ClassicAPI
--------------------------------------------------

-- ClassicAPI v1.11.0 introduced automatic _ClassicAPI.toc selection.
-- This is the minimum integration baseline, not a requirement for Vanilla.
-- Test each future API independently before increasing this minimum.
local CLASSIC_API_MIN_VERSION = 11100

local classicAPIVersion =
    tonumber(CLASSIC_API_VERSION)

local classicAPIPresent =
    classicAPIVersion ~= nil
    and classicAPIVersion > 0

PC.Capabilities.classicAPI =
    classicAPIPresent and true or false

PC.Capabilities.classicAPIVersion =
    classicAPIVersion

PC.Capabilities.classicAPIMinVersion =
    CLASSIC_API_MIN_VERSION

PC.Capabilities.classicAPISupported =
    classicAPIPresent
    and classicAPIVersion >= CLASSIC_API_MIN_VERSION
    or false

-- The DLL can be detected under the standard TOC too.
-- Adapter loaded and DLL present are distinct capabilities.
PC.Capabilities.classicAPIAdapter =
    PC.Capabilities.classicAPISupported
    and PC.Environment.classicAPI == true
    or false

-- QUEST_TURNED_IN is emitted by ClassicAPI itself, independently of
-- which TOC selected the Priest Companion's item API adapters.
PC.Capabilities.questTurnInEvent =
    PC.Capabilities.classicAPISupported

-- Prefer the event catalog over registration success: Vanilla accepts some
-- unknown names without ever delivering them. Version is a compatibility
-- fallback only when the catalog is absent.
function PC.Capabilities.SupportsEvent(name, introducedVersion)
    if type(C_EventUtils) == "table" and type(C_EventUtils.IsEventValid) == "function" then
        local ok, valid = pcall(C_EventUtils.IsEventValid, name)
        if ok then return valid == true or valid == 1 end
    end
    return PC.Capabilities.classicAPISupported
        and (PC.Capabilities.classicAPIVersion or 0) >= introducedVersion or false
end

function PC.Capabilities.ConfigureManaEvents(frame, active)
    local names = {"UNIT_MANA", "UNIT_MAXMANA", "UNIT_POWER_UPDATE", "UNIT_MAXPOWER"}
    for _, name in ipairs(names) do pcall(frame.UnregisterEvent, frame, name) end
    if not active then return false end
    if PC.Capabilities.SupportsEvent("UNIT_POWER_UPDATE", 11810)
    and PC.Capabilities.SupportsEvent("UNIT_MAXPOWER", 11810) then
        local ok1, ok2
        if type(frame.RegisterUnitEvent) == "function" then
            ok1 = pcall(frame.RegisterUnitEvent, frame, "UNIT_POWER_UPDATE", "player")
            ok2 = pcall(frame.RegisterUnitEvent, frame, "UNIT_MAXPOWER", "player")
        else
            ok1 = pcall(frame.RegisterEvent, frame, "UNIT_POWER_UPDATE")
            ok2 = pcall(frame.RegisterEvent, frame, "UNIT_MAXPOWER")
        end
        if ok1 and ok2 then return true end
        pcall(frame.UnregisterEvent, frame, "UNIT_POWER_UPDATE")
        pcall(frame.UnregisterEvent, frame, "UNIT_MAXPOWER")
    end
    frame:RegisterEvent("UNIT_MANA")
    frame:RegisterEvent("UNIT_MAXMANA")
    return false
end

--------------------------------------------------
-- SuperWoW
--------------------------------------------------

PC.Capabilities.superWoW = false
PC.Capabilities.superWoWVersion = nil
PC.Capabilities.superWoWDetection = "unavailable"

if SUPERWOW_VERSION then
    PC.Capabilities.superWoW = true
    PC.Capabilities.superWoWVersion =
        tostring(SUPERWOW_VERSION)
    PC.Capabilities.superWoWDetection = "version"

-- Older SuperWoW builds may lack SUPERWOW_VERSION.
-- Require both characteristic APIs to avoid marking an unrelated
-- SpellInfo or SetAutoloot implementation as SuperWoW.
elseif type(SpellInfo) == "function"
and type(SetAutoloot) == "function" then
    PC.Capabilities.superWoW = true
    PC.Capabilities.superWoWDetection = "legacy"
end

--------------------------------------------------
-- Nampower
--------------------------------------------------

PC.Capabilities.nampower = false
PC.Capabilities.nampowerVersion = nil
PC.Capabilities.nampowerDetection = "unavailable"

if type(GetNampowerVersion) == "function" then
    local success
    local version

    success, version = pcall(GetNampowerVersion)

    if success
    and version ~= nil
    and version ~= false
    and tostring(version) ~= "" then
        PC.Capabilities.nampower = true
        PC.Capabilities.nampowerVersion =
            tostring(version)
        PC.Capabilities.nampowerDetection = "version"
    elseif not success then
        PC.Capabilities.nampowerDetection = "probe_failed"
    end
end

--------------------------------------------------
-- UnitXP SP3
--------------------------------------------------

PC.Capabilities.unitXP = false
PC.Capabilities.unitXPDetection = "unavailable"

-- Some loaders expose Vanilla1121mod globals.
if type(Vanilla1121mod) == "table"
and Vanilla1121mod.UnitXP_SP3 then
    PC.Capabilities.unitXP = true
    PC.Capabilities.unitXPDetection = "loader"

-- VanillaFixes may not expose those globals.
-- In that case test the UnitXP dispatcher itself.
elseif type(UnitXP) == "function" then
    local success = pcall(
        UnitXP,
        "nop",
        "nop"
    )

    if success then
        PC.Capabilities.unitXP = true
        PC.Capabilities.unitXPDetection = "dispatcher"
    else
        PC.Capabilities.unitXPDetection = "probe_failed"
    end
end