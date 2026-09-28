-- Priest Companion
-- Item Database
--
-- Static item properties only.
-- Acquisition requirements belong in Data/Sources.lua / Data/Quests.lua.
--
-- Project rule:
-- Every Wand Progression item must be confirmed to exist in the OctoWoW
-- database before being added here.

local PC = PriestCompanion

PC.Data.Items = PC.Data.Items or {}

local Items = PC.Data.Items

local function AddWand(
    itemID,
    name,
    quality,
    itemLevel,
    requiredLevel,
    minDamage,
    maxDamage,
    school,
    speed
)
    Items[itemID] = {
        name = name,
        quality = quality,
        itemLevel = itemLevel,
        requiredLevel = requiredLevel,

        itemType = "Wand",
        equipSlot = "Ranged",

        damage = {
            min = minDamage,
            max = maxDamage,
            school = school,
            speed = speed
        }
    }
end

--------------------------------------------------
-- Early Progression
--------------------------------------------------

AddWand(
    11287,
    "Lesser Magic Wand",
    2,
    15,
    5,
    12,
    22,
    "Arcane",
    1.50
)

AddWand(
    11288,
    "Greater Magic Wand",
    2,
    23,
    13,
    22,
    41,
    "Arcane",
    1.80
)

AddWand(
    5326,
    "Flaring Baton",
    2,
    18,
    nil,
    18,
    34,
    "Fire",
    1.90
)

AddWand(
    15204,
    "Moonstone Wand",
    2,
    18,
    nil,
    17,
    32,
    "Arcane",
    1.80
)

AddWand(
    5240,
    "Torchlight Wand",
    2,
    21,
    nil,
    14,
    27,
    "Fire",
    1.30
)

AddWand(
    7607,
    "Sable Wand",
    2,
    22,
    nil,
    21,
    40,
    "Shadow",
    1.80
)

AddWand(
    5252,
    "Wand of Decay",
    2,
    21,
    nil,
    16,
    31,
    "Shadow",
    1.50
)

AddWand(
    8071,
    "Sizzle Stick",
    2,
    23,
    nil,
    21,
    39,
    "Fire",
    1.70
)

AddWand(
    5198,
    "Cookie's Stirring Rod",
    3,
    22,
    17,
    20,
    38,
    "Arcane",
    1.30
)

AddWand(
    6677,
    "Spellcrafter Wand",
    2,
    26,
    nil,
    24,
    45,
    "Arcane",
    1.70
)

AddWand(
    5356,
    "Branding Rod",
    2,
    27,
    nil,
    24,
    45,
    "Fire",
    1.60
)

--------------------------------------------------
-- Mid Progression
--------------------------------------------------

AddWand(
    5246,
    "Excavation Rod",
    2,
    30,
    nil,
    32,
    60,
    "Fire",
    1.90
)

AddWand(
    5244,
    "Consecrated Wand",
    2,
    30,
    nil,
    20,
    38,
    "Nature",
    1.20
)

AddWand(
    7001,
    "Gravestone Scepter",
    3,
    29,
    nil,
    30,
    57,
    "Shadow",
    1.50
)

AddWand(
    5250,
    "Charred Wand",
    2,
    28,
    nil,
    28,
    52,
    "Fire",
    1.80
)

AddWand(
    16789,
    "Captain Rackmore's Tiller",
    2,
    36,
    nil,
    31,
    58,
    "Frost",
    1.50
)

AddWand(
    5248,
    "Flash Wand",
    2,
    37,
    nil,
    27,
    52,
    "Nature",
    1.30
)

AddWand(
    6797,
    "Eyepoker",
    2,
    37,
    nil,
    36,
    68,
    "Arcane",
    1.70
)

AddWand(
    15692,
    "Kodo Brander",
    2,
    38,
    nil,
    41,
    77,
    "Arcane",
    1.90
)

AddWand(
    4547,
    "Gnomish Zapper",
    2,
    40,
    nil,
    29,
    56,
    "Arcane",
    1.30
)

AddWand(
    5253,
    "Goblin Igniter",
    2,
    40,
    nil,
    46,
    85,
    "Fire",
    2.00
)

AddWand(
    5247,
    "Rod of Sorrow",
    2,
    39,
    nil,
    42,
    79,
    "Shadow",
    1.90
)

AddWand(
    5249,
    "Burning Sliver",
    2,
    40,
    nil,
    29,
    56,
    "Fire",
    1.30
)

AddWand(
    6806,
    "Dancing Flame",
    2,
    40,
    nil,
    36,
    68,
    "Fire",
    1.40
)

--------------------------------------------------
-- Late Progression
--------------------------------------------------

AddWand(
    11860,
    "Charged Lightning Rod",
    2,
    46,
    nil,
    39,
    73,
    "Nature",
    1.50
)

AddWand(
    19118,
    "Nature's Breath",
    2,
    50,
    nil,
    40,
    75,
    "Nature",
    1.40
)

AddWand(
    17745,
    "Noxious Shooter",
    3,
    51,
    46,
    56,
    104,
    "Nature",
    1.60
)

AddWand(
    10836,
    "Rod of Corrosion",
    3,
    56,
    51,
    50,
    93,
    "Nature",
    1.30
)

AddWand(
    16993,
    "Smokey's Fireshooter",
    2,
    60,
    nil,
    70,
    132,
    "Fire",
    1.90
)
