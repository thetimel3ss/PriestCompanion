-- Priest Companion
-- Bootstrap

PriestCompanion = PriestCompanion or {}

local PC = PriestCompanion

PC.name = "PriestCompanion"

PC.UI = PC.UI or {}
PC.Data = PC.Data or {}
PC.Modules = PC.Modules or {}
PC.Integrations = PC.Integrations or {}

PC.API = PC.API or {}
PC.Capabilities = PC.Capabilities or {}
PC.Environment = PC.Environment or {}

--------------------------------------------------
-- Default Environment
--------------------------------------------------

PC.Environment.flavor = "Vanilla"
PC.Environment.classicAPI = false
PC.Environment.classicAPIVersion = nil