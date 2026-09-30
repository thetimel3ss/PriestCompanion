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

--------------------------------------------------
-- Additional quest reward wands
--------------------------------------------------

Items[12296] = {
    name = "Spark of the People's Militia",

    quality = 2,
    itemLevel = 17,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 16,
        max = 30,
        school = "Arcane",
        speed = 1.80
    }
}

Items[15204] = {
    name = "Moonstone Wand",

    quality = 2,
    itemLevel = 18,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 17,
        max = 32,
        school = "Arcane",
        speed = 1.80
    }
}

Items[5240] = {
    name = "Torchlight Wand",

    quality = 2,
    itemLevel = 21,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 14,
        max = 27,
        school = "Fire",
        speed = 1.30
    }
}

Items[7607] = {
    name = "Sable Wand",

    quality = 2,
    itemLevel = 22,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 21,
        max = 40,
        school = "Shadow",
        speed = 1.80
    }
}

Items[5252] = {
    name = "Wand of Decay",

    quality = 2,
    itemLevel = 21,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 16,
        max = 31,
        school = "Shadow",
        speed = 1.50
    }
}

Items[8071] = {
    name = "Sizzle Stick",

    quality = 2,
    itemLevel = 23,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 21,
        max = 39,
        school = "Fire",
        speed = 1.70
    }
}

Items[6677] = {
    name = "Spellcrafter Wand",

    quality = 2,
    itemLevel = 26,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 24,
        max = 45,
        school = "Arcane",
        speed = 1.70
    }
}

Items[5356] = {
    name = "Branding Rod",

    quality = 2,
    itemLevel = 27,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 24,
        max = 45,
        school = "Fire",
        speed = 1.60
    }
}

Items[5246] = {
    name = "Excavation Rod",

    quality = 2,
    itemLevel = 30,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 32,
        max = 60,
        school = "Fire",
        speed = 1.90
    }
}

Items[5244] = {
    name = "Consecrated Wand",

    quality = 2,
    itemLevel = 30,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 20,
        max = 38,
        school = "Nature",
        speed = 1.20
    }
}

Items[5818] = {
    name = "Moonbeam Wand",

    quality = 2,
    itemLevel = 30,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 30,
        max = 57,
        school = "Nature",
        speed = 1.80
    }
}

Items[5250] = {
    name = "Charred Wand",

    quality = 2,
    itemLevel = 28,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 28,
        max = 52,
        school = "Fire",
        speed = 1.80
    }
}

Items[6806] = {
    name = "Dancing Flame",

    quality = 3,
    itemLevel = 40,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 36,
        max = 68,
        school = "Fire",
        speed = 1.40
    }
}

Items[16789] = {
    name = "Captain Rackmore's Tiller",

    quality = 2,
    itemLevel = 36,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 31,
        max = 58,
        school = "Frost",
        speed = 1.50
    }
}

Items[5247] = {
    name = "Rod of Sorrow",

    quality = 2,
    itemLevel = 39,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 42,
        max = 79,
        school = "Shadow",
        speed = 1.90
    }
}

Items[5249] = {
    name = "Burning Sliver",

    quality = 2,
    itemLevel = 40,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 29,
        max = 56,
        school = "Fire",
        speed = 1.30
    }
}

Items[5248] = {
    name = "Flash Wand",

    quality = 2,
    itemLevel = 37,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 27,
        max = 52,
        school = "Nature",
        speed = 1.30
    }
}

Items[6797] = {
    name = "Eyepoker",

    quality = 2,
    itemLevel = 37,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 36,
        max = 68,
        school = "Arcane",
        speed = 1.70
    }
}

Items[15692] = {
    name = "Kodo Brander",

    quality = 2,
    itemLevel = 38,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 41,
        max = 77,
        school = "Arcane",
        speed = 1.90
    }
}

Items[4547] = {
    name = "Gnomish Zapper",

    quality = 2,
    itemLevel = 40,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 29,
        max = 56,
        school = "Arcane",
        speed = 1.30
    }
}

Items[5253] = {
    name = "Goblin Igniter",

    quality = 2,
    itemLevel = 40,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 46,
        max = 85,
        school = "Fire",
        speed = 2.00
    }
}

Items[9654] = {
    name = "Cairnstone Sliver",

    quality = 2,
    itemLevel = 50,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 52,
        max = 97,
        school = "Arcane",
        speed = 1.80
    }
}

Items[11860] = {
    name = "Charged Lightning Rod",

    quality = 2,
    itemLevel = 46,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 39,
        max = 73,
        school = "Nature",
        speed = 1.50
    }
}

Items[19118] = {
    name = "Nature's Breath",

    quality = 2,
    itemLevel = 50,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 40,
        max = 75,
        school = "Nature",
        speed = 1.40
    }
}

Items[16993] = {
    name = "Smokey's Fireshooter",

    quality = 2,
    itemLevel = 60,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 70,
        max = 132,
        school = "Fire",
        speed = 1.90
    }
}

--------------------------------------------------
-- Lesser Mystic Wand
--------------------------------------------------

Items[11289] = {
    name = "Lesser Mystic Wand",

    quality = 2,
    itemLevel = 31,
    requiredLevel = 26,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 23,
        max = 43,
        school = "Arcane",
        speed = 1.30
    }
}

--------------------------------------------------
-- Greater Mystic Wand
--------------------------------------------------

Items[11290] = {
    name = "Greater Mystic Wand",

    quality = 2,
    itemLevel = 35,
    requiredLevel = 30,

    itemType = "Wand",
    equipSlot = "Ranged",

    damage = {
        min = 40,
        max = 76,
        school = "Arcane",
        speed = 2.00
    }
}
