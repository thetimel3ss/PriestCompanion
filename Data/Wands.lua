-- Priest Companion
-- Wand Progression Database

local PC = PriestCompanion

PC.Data.Wands = PC.Data.Wands or {}

local Wands = PC.Data.Wands

--------------------------------------------------
-- Lesser Magic Wand
--------------------------------------------------

Wands[11287] = {
    order = 1,

    recommended = true,

    recommendedLevel = {
        min = 5,
        max = 12
    }
}

--------------------------------------------------
-- Greater Magic Wand
--------------------------------------------------

Wands[11288] = {
    order = 2,

    recommended = true,

    recommendedLevel = {
        min = 13,
        max = 17
    }
}

--------------------------------------------------
-- Gravestone Scepter
--------------------------------------------------

Wands[7001] = {
    order = 3,

    recommended = true,

    recommendedLevel = {
        min = 18,
        max = 29
    }
}

--------------------------------------------------
-- Charred Razormane Wand
--------------------------------------------------

Wands[5092] = {
    order = 4,

    recommended = true,

    recommendedLevel = {
        min = 18,
        max = 20
    }
}
