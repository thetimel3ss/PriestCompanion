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
Items[5069] = { name = "Fire Wand", quality = 2, itemLevel = 12, requiredLevel = 7, itemType = "Wand", equipSlot = "Ranged", damage = { min = 9, max = 17, school = "Fire", speed = 1.5 } }
Items[5071] = { name = "Shadow Wand", quality = 2, itemLevel = 14, requiredLevel = 9, itemType = "Wand", equipSlot = "Ranged", damage = { min = 10, max = 19, school = "Shadow", speed = 1.4 } }
Items[5207] = { name = "Opaque Wand", quality = 2, itemLevel = 20, requiredLevel = 15, itemType = "Wand", equipSlot = "Ranged", damage = { min = 14, max = 28, school = "Shadow", speed = 1.4 } }
Items[5209] = { name = "Gloom Wand", quality = 1, itemLevel = 21, requiredLevel = 16, itemType = "Wand", equipSlot = "Ranged", damage = { min = 18, max = 34, school = "Shadow", speed = 1.8 } }
Items[5210] = { name = "Burning Wand", quality = 1, itemLevel = 25, requiredLevel = 20, itemType = "Wand", equipSlot = "Ranged", damage = { min = 17, max = 32, school = "Fire", speed = 1.4 } }
Items[5212] = { name = "Blazing Wand", quality = 2, itemLevel = 17, requiredLevel = 12, itemType = "Wand", equipSlot = "Ranged", damage = { min = 13, max = 25, school = "Fire", speed = 1.5 } }
Items[5213] = { name = "Scorching Wand", quality = 2, itemLevel = 35, requiredLevel = 30, itemType = "Wand", equipSlot = "Ranged", damage = { min = 26, max = 49, school = "Fire", speed = 1.3 } }
Items[5214] = { name = "Wand of Eventide", quality = 2, itemLevel = 32, requiredLevel = 27, itemType = "Wand", equipSlot = "Ranged", damage = { min = 23, max = 44, school = "Arcane", speed = 1.3 } }
Items[5215] = { name = "Ember Wand", quality = 2, itemLevel = 41, requiredLevel = 36, itemType = "Wand", equipSlot = "Ranged", damage = { min = 35, max = 66, school = "Fire", speed = 1.5 } }
Items[5216] = { name = "Umbral Wand", quality = 2, itemLevel = 45, requiredLevel = 40, itemType = "Wand", equipSlot = "Ranged", damage = { min = 37, max = 70, school = "Shadow", speed = 1.5 } }
Items[5235] = { name = "Cultist's Firestick", quality = 1, itemLevel = 7, requiredLevel = 1, itemType = "Wand", equipSlot = "Ranged", damage = { min = 5, max = 11, school = "Fire", speed = 1.8 } }
Items[5236] = { name = "Combustible Wand", quality = 1, itemLevel = 34, requiredLevel = 29, itemType = "Wand", equipSlot = "Ranged", damage = { min = 29, max = 54, school = "Fire", speed = 1.6 } }
Items[5238] = { name = "Pitchwood Wand", quality = 1, itemLevel = 45, requiredLevel = 40, itemType = "Wand", equipSlot = "Ranged", damage = { min = 41, max = 77, school = "Fire", speed = 1.7 } }
Items[5241] = { name = "Dwarven Flamestick", quality = 2, itemLevel = 18, itemType = "Wand", equipSlot = "Ranged", damage = { min = 17, max = 32, school = "Fire", speed = 1.8 } }
Items[5242] = { name = "Cinder Wand", quality = 2, itemLevel = 16, itemType = "Wand", equipSlot = "Ranged", damage = { min = 11, max = 22, school = "Fire", speed = 1.4 } }
Items[5243] = { name = "Firebelcher", quality = 3, itemLevel = 20, requiredLevel = 15, itemType = "Wand", equipSlot = "Ranged", damage = { min = 24, max = 45, school = "Fire", speed = 1.7 } }
Items[5245] = { name = "Summoner's Wand", quality = 2, itemLevel = 34, requiredLevel = 29, itemType = "Wand", equipSlot = "Ranged", damage = { min = 35, max = 66, school = "Arcane", speed = 1.8 } }
Items[5347] = { name = "Pestilent Wand", quality = 1, itemLevel = 35, requiredLevel = 30, itemType = "Wand", equipSlot = "Ranged", damage = { min = 28, max = 53, school = "Nature", speed = 1.5 } }
Items[5604] = { name = "Elven Wand", quality = 2, itemLevel = 13, itemType = "Wand", equipSlot = "Ranged", damage = { min = 10, max = 20, school = "Arcane", speed = 1.6 } }
Items[6729] = { name = "Fizzle's Zippy Lighter", quality = 2, itemLevel = 38, itemType = "Wand", equipSlot = "Ranged", damage = { min = 32, max = 61, school = "Fire", speed = 1.5 } }
Items[7513] = { name = "Ragefire Wand", quality = 3, itemLevel = 40, itemType = "Wand", equipSlot = "Ranged", damage = { min = 36, max = 68, school = "Fire", speed = 1.4 } }
Items[7514] = { name = "Icefury Wand", quality = 3, itemLevel = 40, itemType = "Wand", equipSlot = "Ranged", damage = { min = 41, max = 78, school = "Frost", speed = 1.6 } }
Items[7708] = { name = "Necrotic Wand", quality = 3, itemLevel = 35, requiredLevel = 30, itemType = "Wand", equipSlot = "Ranged", damage = { min = 32, max = 61, school = "Shadow", speed = 1.4 } }
Items[8184] = { name = "Firestarter", quality = 2, itemLevel = 29, requiredLevel = 24, itemType = "Wand", equipSlot = "Ranged", damage = { min = 24, max = 46, school = "Fire", speed = 1.5 } }
Items[8186] = { name = "Dire Wand", quality = 2, itemLevel = 26, requiredLevel = 21, itemType = "Wand", equipSlot = "Ranged", damage = { min = 24, max = 45, school = "Shadow", speed = 1.7 } }
Items[9381] = { name = "Earthen Rod", quality = 3, itemLevel = 38, requiredLevel = 33, itemType = "Wand", equipSlot = "Ranged", damage = { min = 42, max = 79, school = "Nature", speed = 1.7 } }
Items[9483] = { name = "Flaming Incinerator", quality = 3, itemLevel = 49, requiredLevel = 44, itemType = "Wand", equipSlot = "Ranged", damage = { min = 59, max = 111, school = "Fire", speed = 1.8 } }
Items[9489] = { name = "Gyromatic Icemaker", quality = 2, itemLevel = 31, requiredLevel = 26, itemType = "Wand", equipSlot = "Ranged", damage = { min = 24, max = 46, school = "Frost", speed = 1.4 } }
Items[10572] = { name = "Freezing Shard", quality = 3, itemLevel = 39, requiredLevel = 34, itemType = "Wand", equipSlot = "Ranged", damage = { min = 32, max = 61, school = "Frost", speed = 1.3 } }
Items[10704] = { name = "Chillnail Splinter", quality = 2, itemLevel = 46, itemType = "Wand", equipSlot = "Ranged", damage = { min = 36, max = 68, school = "Frost", speed = 1.4 } }
Items[10766] = { name = "Plaguerot Sprig", quality = 3, itemLevel = 40, requiredLevel = 35, itemType = "Wand", equipSlot = "Ranged", damage = { min = 41, max = 78, school = "Nature", speed = 1.6 } }
Items[11263] = { name = "Nether Force Wand", quality = 3, itemLevel = 40, itemType = "Wand", equipSlot = "Ranged", damage = { min = 39, max = 73, school = "Arcane", speed = 1.5 } }
Items[11748] = { name = "Pyric Caduceus", quality = 3, itemLevel = 53, requiredLevel = 48, itemType = "Wand", equipSlot = "Ranged", damage = { min = 66, max = 123, school = "Fire", speed = 1.8 } }
Items[12468] = { name = "Chilton Wand", quality = 0, itemLevel = 53, requiredLevel = 48, itemType = "Wand", equipSlot = "Ranged", damage = { min = 39, max = 73, school = "Fire", speed = 1.5 } }
Items[12605] = { name = "Serpentine Skuller", quality = 3, itemLevel = 56, requiredLevel = 51, itemType = "Wand", equipSlot = "Ranged", damage = { min = 53, max = 100, school = "Shadow", speed = 1.4 } }
Items[12984] = { name = "Skycaller", quality = 3, itemLevel = 21, requiredLevel = 16, itemType = "Wand", equipSlot = "Ranged", damage = { min = 24, max = 45, school = "Arcane", speed = 1.6 } }
Items[13004] = { name = "Torch of Austen", quality = 3, itemLevel = 58, requiredLevel = 53, itemType = "Wand", equipSlot = "Ranged", damage = { min = 55, max = 104, school = "Fire", speed = 1.4 } }
Items[13062] = { name = "Thunderwood", quality = 3, itemLevel = 27, requiredLevel = 22, itemType = "Wand", equipSlot = "Ranged", damage = { min = 36, max = 67, school = "Nature", speed = 1.9 } }
Items[13063] = { name = "Starfaller", quality = 3, itemLevel = 34, requiredLevel = 29, itemType = "Wand", equipSlot = "Ranged", damage = { min = 32, max = 60, school = "Arcane", speed = 1.4 } }
Items[13064] = { name = "Jaina's Firestarter", quality = 3, itemLevel = 42, requiredLevel = 37, itemType = "Wand", equipSlot = "Ranged", damage = { min = 44, max = 82, school = "Fire", speed = 1.6 } }
Items[13065] = { name = "Wand of Allistarj", quality = 3, itemLevel = 50, requiredLevel = 45, itemType = "Wand", equipSlot = "Ranged", damage = { min = 64, max = 120, school = "Arcane", speed = 1.9 } }
Items[13396] = { name = "Skul's Ghastly Touch", quality = 3, itemLevel = 57, requiredLevel = 52, itemType = "Wand", equipSlot = "Ranged", damage = { min = 70, max = 131, school = "Shadow", speed = 1.8 } }
Items[13534] = { name = "Banshee Finger", quality = 3, itemLevel = 60, requiredLevel = 55, itemType = "Wand", equipSlot = "Ranged", damage = { min = 79, max = 148, school = "Frost", speed = 1.9 } }
Items[13938] = { name = "Bonecreeper Stylus", quality = 3, itemLevel = 62, requiredLevel = 57, itemType = "Wand", equipSlot = "Ranged", damage = { min = 83, max = 155, school = "Arcane", speed = 1.9 } }
Items[15279] = { name = "Ivory Wand", quality = 2, itemLevel = 51, requiredLevel = 46, itemType = "Wand", equipSlot = "Ranged", damage = { min = 41, max = 77, school = "Arcane", speed = 1.4 } }
Items[15280] = { name = "Wizard's Hand", quality = 2, itemLevel = 53, requiredLevel = 48, itemType = "Wand", equipSlot = "Ranged", damage = { min = 56, max = 104, school = "Arcane", speed = 1.8 } }
Items[15283] = { name = "Lunar Wand", quality = 2, itemLevel = 64, requiredLevel = 59, itemType = "Wand", equipSlot = "Ranged", damage = { min = 67, max = 126, school = "Arcane", speed = 1.7 } }
Items[15465] = { name = "Stingshot Wand", quality = 2, itemLevel = 28, itemType = "Wand", equipSlot = "Ranged", damage = { min = 28, max = 52, school = "Nature", speed = 1.8 } }
Items[16997] = { name = "Stormrager", quality = 3, itemLevel = 62, itemType = "Wand", equipSlot = "Ranged", damage = { min = 57, max = 106, school = "Nature", speed = 1.3 } }
Items[17077] = { name = "Crimson Shocker", quality = 4, itemLevel = 66, requiredLevel = 58, itemType = "Wand", equipSlot = "Ranged", damage = { min = 111, max = 200, school = "Fire", speed = 2 } }
Items[18301] = { name = "Lethtendris's Wand", quality = 2, itemLevel = 58, requiredLevel = 53, itemType = "Wand", equipSlot = "Ranged", damage = { min = 60, max = 113, school = "Shadow", speed = 1.7 } }
Items[18338] = { name = "Wand of Arcane Potency", quality = 3, itemLevel = 59, requiredLevel = 54, itemType = "Wand", equipSlot = "Ranged", damage = { min = 65, max = 122, school = "Arcane", speed = 1.6 } }
Items[18483] = { name = "Mana Channeling Wand", quality = 3, itemLevel = 61, requiredLevel = 56, itemType = "Wand", equipSlot = "Ranged", damage = { min = 68, max = 127, school = "Frost", speed = 1.6 } }
Items[18761] = { name = "Oblivion's Touch", quality = 3, itemLevel = 62, requiredLevel = 57, itemType = "Wand", equipSlot = "Ranged", damage = { min = 78, max = 147, school = "Shadow", speed = 1.8 } }
Items[19108] = { name = "Wand of Biting Cold", quality = 3, itemLevel = 63, itemType = "Wand", equipSlot = "Ranged", damage = { min = 67, max = 125, school = "Frost", speed = 1.5 } }
Items[19130] = { name = "Cold Snap", quality = 4, itemLevel = 70, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 101, max = 189, school = "Frost", speed = 1.7 } }
Items[19367] = { name = "Dragon's Touch", quality = 4, itemLevel = 76, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 110, max = 199, school = "Fire", speed = 1.6 } }
Items[19435] = { name = "Essence Gatherer", quality = 4, itemLevel = 70, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 83, max = 156, school = "Arcane", speed = 1.4 } }
Items[19861] = { name = "Touch of Chaos", quality = 4, itemLevel = 68, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 86, max = 160, school = "Shadow", speed = 1.5 } }
Items[19927] = { name = "Mar'li's Touch", quality = 4, itemLevel = 65, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 91, max = 170, school = "Nature", speed = 1.7 } }
Items[19967] = { name = "Thoughtblighter", quality = 3, itemLevel = 68, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 90, max = 168, school = "Shadow", speed = 1.8 } }
Items[20082] = { name = "Woestave", quality = 3, itemLevel = 52, itemType = "Wand", equipSlot = "Ranged", damage = { min = 68, max = 127, school = "Shadow", speed = 1.9 } }
Items[20672] = { name = "Sparkling Crystal Wand", quality = 3, itemLevel = 62, requiredLevel = 57, itemType = "Wand", equipSlot = "Ranged", damage = { min = 65, max = 122, school = "Nature", speed = 1.5 } }
Items[21603] = { name = "Wand of Qiraji Nobility", quality = 4, itemLevel = 78, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 114, max = 213, school = "Shadow", speed = 1.6 } }
Items[21801] = { name = "Antenna of Invigoration", quality = 3, itemLevel = 68, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 80, max = 149, school = "Nature", speed = 1.6 } }
Items[22254] = { name = "Wand of Eternal Light", quality = 3, itemLevel = 57, requiredLevel = 52, itemType = "Wand", equipSlot = "Ranged", damage = { min = 58, max = 109, school = "Holy", speed = 1.5 } }
Items[22408] = { name = "Ritssyn's Wand of Bad Mojo", quality = 3, itemLevel = 63, requiredLevel = 58, itemType = "Wand", equipSlot = "Ranged", damage = { min = 58, max = 108, school = "Shadow", speed = 1.3 } }
Items[22820] = { name = "Wand of Fates", quality = 4, itemLevel = 83, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 119, max = 222, school = "Shadow", speed = 1.5 } }
Items[22821] = { name = "Doomfinger", quality = 4, itemLevel = 92, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 146, max = 271, school = "Shadow", speed = 1.5 } }
Items[23009] = { name = "Wand of the Whispering Dead", quality = 4, itemLevel = 83, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 119, max = 222, school = "Shadow", speed = 1.5 } }
Items[23177] = { name = "Lady Falther'ess' Finger", quality = 3, itemLevel = 41, requiredLevel = 36, itemType = "Wand", equipSlot = "Ranged", damage = { min = 34, max = 65, school = "Shadow", speed = 1.3 } }
Items[33200] = { name = "Spine of a Shipwrecked Pirate", quality = 2, itemLevel = 59, requiredLevel = 54, itemType = "Wand", equipSlot = "Ranged", damage = { min = 59, max = 107, school = "Physical", speed = 1.6 } }
Items[33352] = { name = "Elder Wand", quality = 2, itemLevel = 58, itemType = "Wand", equipSlot = "Ranged", damage = { min = 57, max = 105, school = "Fire", speed = 1.6 } }
Items[41117] = { name = "Withered Wand", quality = 1, itemLevel = 7, itemType = "Wand", equipSlot = "Ranged", damage = { min = 8, max = 16, school = "Shadow", speed = 1.8 } }
Items[42365] = { name = "Star of Maras'ethil", quality = 2, itemLevel = 54, itemType = "Wand", equipSlot = "Ranged", damage = { min = 60, max = 119, school = "Shadow", speed = 2 } }
Items[51735] = { name = "Scourgelord's Fang", quality = 4, itemLevel = 75, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 110, max = 197, school = "Shadow", speed = 1.6 } }
Items[51816] = { name = "Webwood Branch", quality = 1, itemLevel = 7, itemType = "Wand", equipSlot = "Ranged", damage = { min = 7, max = 14, school = "Nature", speed = 1.6 } }
Items[51820] = { name = "Bhartec's Lost Wand", quality = 1, itemLevel = 7, itemType = "Wand", equipSlot = "Ranged", damage = { min = 7, max = 15, school = "Shadow", speed = 1.7 } }
Items[55134] = { name = "Rod of Permafrost", quality = 4, itemLevel = 83, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 119, max = 222, school = "Frost", speed = 1.5 } }
Items[55511] = { name = "Hellflame", quality = 4, itemLevel = 92, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 159, max = 286, school = "Fire", speed = 1.6 } }
Items[58009] = { name = "Quistis' Wand", quality = 2, itemLevel = 38, requiredLevel = 33, itemType = "Wand", equipSlot = "Ranged", damage = { min = 32, max = 62, school = "Fire", speed = 1.5 } }
Items[58026] = { name = "Rod of Stromgarde", quality = 2, itemLevel = 33, itemType = "Wand", equipSlot = "Ranged", damage = { min = 44, max = 69, school = "Arcane", speed = 2.1 } }
Items[58047] = { name = "Grasp of Ancestors", quality = 3, itemLevel = 33, requiredLevel = 28, itemType = "Wand", equipSlot = "Ranged", damage = { min = 35, max = 64, school = "Nature", speed = 1.5 } }
Items[58089] = { name = "Thornlash Branch", quality = 3, itemLevel = 34, requiredLevel = 29, itemType = "Wand", equipSlot = "Ranged", damage = { min = 35, max = 64, school = "Nature", speed = 1.5 } }
Items[58137] = { name = "Netherbranch", quality = 3, itemLevel = 36, requiredLevel = 31, itemType = "Wand", equipSlot = "Ranged", damage = { min = 35, max = 67, school = "Shadow", speed = 1.5 } }
Items[58205] = { name = "Primal Flameslinger", quality = 4, itemLevel = 66, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 77, max = 156, school = "Fire", speed = 1.5 } }
Items[58253] = { name = "Lector's Baton", quality = 3, itemLevel = 61, requiredLevel = 56, itemType = "Wand", equipSlot = "Ranged", damage = { min = 68, max = 127, school = "Arcane", speed = 1.6 } }
Items[58277] = { name = "Lady Winter's Touch", quality = 2, itemLevel = 40, itemType = "Wand", equipSlot = "Ranged", damage = { min = 33, max = 64, school = "Frost", speed = 1.5 } }
Items[60427] = { name = "Skullrattler", quality = 3, itemLevel = 65, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 98, max = 169, school = "Shadow", speed = 2.1 } }
Items[60805] = { name = "Clutch of the Damned", quality = 3, itemLevel = 63, requiredLevel = 58, itemType = "Wand", equipSlot = "Ranged", damage = { min = 70, max = 130, school = "Frost", speed = 1.5 } }
Items[61019] = { name = "Wand of the Eclipse", quality = 3, itemLevel = 66, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 79, max = 144, school = "Arcane", speed = 1.7 } }
Items[61020] = { name = "Lodestone", quality = 4, itemLevel = 66, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 77, max = 156, school = "Shadow", speed = 1.5 } }
Items[61286] = { name = "Bloodfang Effigy", quality = 3, itemLevel = 68, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 90, max = 168, school = "Fire", speed = 1.8 } }
Items[61374] = { name = "Grungy Firestick", quality = 2, itemLevel = 10, requiredLevel = 5, itemType = "Wand", equipSlot = "Ranged", damage = { min = 9, max = 19, school = "Fire", speed = 1.8 } }
Items[61615] = { name = "Burning Torch", quality = 2, itemLevel = 58, requiredLevel = 53, itemType = "Wand", equipSlot = "Ranged", damage = { min = 57, max = 105, school = "Fire", speed = 1.6 } }
Items[80544] = { name = "Quel'dorei Magister's Spellflinger", quality = 3, itemLevel = 65, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 62, max = 110, school = "Arcane", speed = 1.3 } }
Items[80545] = { name = "Quel'dorei Cleric's Wand", quality = 3, itemLevel = 65, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 62, max = 110, school = "Arcane", speed = 1.3 } }
Items[80644] = { name = "Revantusk Mystic's Mojobender", quality = 3, itemLevel = 65, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 62, max = 110, school = "Shadow", speed = 1.3 } }
Items[80645] = { name = "Revantusk Mender's Wand", quality = 3, itemLevel = 65, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 62, max = 110, school = "Arcane", speed = 1.3 } }
Items[80748] = { name = "Corrupter's Focus", quality = 3, itemLevel = 52, requiredLevel = 47, itemType = "Wand", equipSlot = "Ranged", damage = { min = 84, max = 132, school = "Shadow", speed = 2.1 } }
Items[80799] = { name = "Wand of Divine Justice", quality = 3, itemLevel = 41, requiredLevel = 36, itemType = "Wand", equipSlot = "Ranged", damage = { min = 55, max = 86, school = "Holy", speed = 1.9 } }
Items[80829] = { name = "Moonbeam", quality = 3, itemLevel = 33, requiredLevel = 27, itemType = "Wand", equipSlot = "Ranged", damage = { min = 30, max = 55, school = "Arcane", speed = 1.3 } }
Items[81290] = { name = "Diathorus' Claw", quality = 3, itemLevel = 33, itemType = "Wand", equipSlot = "Ranged", damage = { min = 43, max = 81, school = "Shadow", speed = 1.9 } }
Items[81320] = { name = "Crackling Zapper", quality = 3, itemLevel = 36, itemType = "Wand", equipSlot = "Ranged", damage = { min = 42, max = 74, school = "Nature", speed = 1.7 } }
Items[83215] = { name = "Blackflame Wand", quality = 3, itemLevel = 39, requiredLevel = 34, itemType = "Wand", equipSlot = "Ranged", damage = { min = 16, max = 30, school = "Shadow", speed = 1.3 } }
Items[83467] = { name = "Cryptwatcher's Call", quality = 3, itemLevel = 65, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 62, max = 121, school = "Shadow", speed = 1.4 } }
Items[84602] = { name = "Consecrated Caduceus", quality = 3, itemLevel = 68, requiredLevel = 60, itemType = "Wand", equipSlot = "Ranged", damage = { min = 80, max = 149, school = "Holy", speed = 1.6 } }
