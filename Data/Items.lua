-- Priest Companion
-- Item Database

local PC = PriestCompanion

PC.Data.Items = PC.Data.Items or {}

local Items = PC.Data.Items

--------------------------------------------------
-- Lesser Magic Wand
--------------------------------------------------

Items[11287] = {
    name = "Lesser Magic Wand",

    quality = 2,
    itemLevel = 15,
    requiredLevel = 5,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 12,
        max = 22,
        school = "Arcane",
        speed = 1.50
    }
}

--------------------------------------------------
-- Greater Magic Wand
--------------------------------------------------

Items[11288] = {
    name = "Greater Magic Wand",

    quality = 2,
    itemLevel = 23,
    requiredLevel = 13,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 22,
        max = 41,
        school = "Arcane",
        speed = 1.80
    }
}

--------------------------------------------------
-- Smoldering Wand
--------------------------------------------------

Items[5208] = {
    name = "Smoldering Wand",

    quality = 1,
    itemLevel = 20,
    requiredLevel = 15,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 15,
        max = 28,
        school = "Fire",
        speed = 1.60
    }
}

--------------------------------------------------
-- Gravestone Scepter
--------------------------------------------------

Items[7001] = {
    name = "Gravestone Scepter",

    quality = 3,
    itemLevel = 29,
    requiredLevel = 18,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 30,
        max = 57,
        school = "Shadow",
        speed = 1.50
    }
}

--------------------------------------------------
-- Charred Razormane Wand
--------------------------------------------------

Items[5092] = {
    name = "Charred Razormane Wand",

    quality = 1,
    itemLevel = 23,
    requiredLevel = 18,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 16,
        max = 31,
        school = "Fire",
        speed = 1.50
    }
}

--------------------------------------------------
-- Cookie's Stirring Rod
--------------------------------------------------

Items[5198] = {
    name = "Cookie's Stirring Rod",

    quality = 3,
    itemLevel = 22,
    requiredLevel = 17,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 20,
        max = 38,
        school = "Arcane",
        speed = 1.30
    }
}
