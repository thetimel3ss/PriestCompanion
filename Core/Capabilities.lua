-- Priest Companion
-- Client Capabilities

local PC = PriestCompanion

--------------------------------------------------
-- ClassicAPI
--------------------------------------------------

PC.Capabilities.classicAPI = false

if PC.Environment.classicAPI then
    PC.Capabilities.classicAPI = true
elseif CLASSIC_API_VERSION then
    PC.Capabilities.classicAPI = true
end

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