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

--------------------------------------------------
-- SuperWoW
--------------------------------------------------

PC.Capabilities.superWoW = false

if SUPERWOW_VERSION then
    PC.Capabilities.superWoW = true
end

--------------------------------------------------
-- Nampower
--------------------------------------------------

PC.Capabilities.nampower = false

if type(GetNampowerVersion) == "function" then
    PC.Capabilities.nampower = true
end

--------------------------------------------------
-- UnitXP SP3
--------------------------------------------------

PC.Capabilities.unitXP = false

-- Some loaders expose Vanilla1121mod globals.
if Vanilla1121mod
and Vanilla1121mod.UnitXP_SP3 then

    PC.Capabilities.unitXP = true

-- VanillaFixes may not expose those globals.
-- In that case test the UnitXP dispatcher itself.
elseif type(UnitXP) == "function" then

    local success =
        pcall(
            UnitXP,
            "nop",
            "nop"
        )

    if success then
        PC.Capabilities.unitXP = true
    end
end