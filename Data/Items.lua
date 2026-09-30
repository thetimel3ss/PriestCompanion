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
-- Flaring Baton
--------------------------------------------------

Items[5326] = {
    name = "Flaring Baton",

    quality = 2,
    itemLevel = 18,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 18,
        max = 34,
        school = "Fire",
        speed = 1.90
    }
}

--------------------------------------------------
-- Dusk Wand
--------------------------------------------------

Items[5211] = {
    name = "Dusk Wand",

    quality = 1,
    itemLevel = 25,
    requiredLevel = 20,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 21,
        max = 39,
        school = "Shadow",
        speed = 1.70
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

--------------------------------------------------
-- Blackbone Wand
--------------------------------------------------

Items[5239] = {
    name = "Blackbone Wand",

    quality = 1,
    itemLevel = 46,
    requiredLevel = 41,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 39,
        max = 74,
        school = "Shadow",
        speed = 1.60
    }
}

--------------------------------------------------
-- Noxious Shooter
--------------------------------------------------

Items[17745] = {
    name = "Noxious Shooter",

    quality = 3,
    itemLevel = 51,
    requiredLevel = 46,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 56,
        max = 104,
        school = "Nature",
        speed = 1.60
    }
}

--------------------------------------------------
-- Rod of Corrosion
--------------------------------------------------

Items[10836] = {
    name = "Rod of Corrosion",

    quality = 3,
    itemLevel = 56,
    requiredLevel = 51,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 50,
        max = 93,
        school = "Nature",
        speed = 1.30
    }
}

--------------------------------------------------
-- Glowstar Rod
--------------------------------------------------

Items[15281] = {
    name = "Glowstar Rod",

    quality = 2,
    itemLevel = 57,
    requiredLevel = 52,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 52,
        max = 98,
        school = "Arcane",
        speed = 1.50
    }
}

--------------------------------------------------
-- Dragon Finger
--------------------------------------------------

Items[15282] = {
    name = "Dragon Finger",

    quality = 2,
    itemLevel = 60,
    requiredLevel = 55,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 52,
        max = 97,
        school = "Fire",
        speed = 1.40
    }
}
