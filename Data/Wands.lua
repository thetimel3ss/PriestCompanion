-- Priest Companion
-- Wand Progression Database
--
-- suggestedLevel:
--   Useful level window from the progression references.
--
-- recommendations:
--   Curated green-highlight ranges. These may differ by faction.
--   The UI uses the currently selected/player faction.
--
-- All item entries must already exist in Data/Items.lua and must have been
-- confirmed to exist in the OctoWoW database.

local PC = PriestCompanion

PC.Data.Wands = PC.Data.Wands or {}

local Wands = PC.Data.Wands

local function AddWand(
    itemID,
    order,
    suggestedMin,
    suggestedMax,
    allianceMin,
    allianceMax,
    hordeMin,
    hordeMax
)
    local wand = {
        order = order
    }

    if suggestedMin then
        wand.suggestedLevel = {
            min = suggestedMin,
            max = suggestedMax
        }
    end

    if allianceMin
    or hordeMin then
        wand.recommendations = {}

        if allianceMin then
            wand.recommendations.Alliance = {
                min = allianceMin,
                max = allianceMax
            }
        end

        if hordeMin then
            wand.recommendations.Horde = {
                min = hordeMin,
                max = hordeMax
            }
        end
    end

    Wands[itemID] = wand
end

--------------------------------------------------
-- Early Progression
--------------------------------------------------

AddWand(
    11287,
    10,
    5,
    12,
    5,
    12,
    5,
    12
)

AddWand(
    11288,
    20,
    13,
    19,
    13,
    19,
    13,
    18
)

AddWand(
    5326,
    30,
    17,
    19,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    15204,
    40,
    17,
    19,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    5240,
    50,
    18,
    20,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    7607,
    60,
    20,
    24,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    5252,
    70,
    18,
    20,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    8071,
    80,
    20,
    24,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    5198,
    90,
    20,
    24,
    20,
    24,
    nil,
    nil
)

AddWand(
    6677,
    100,
    25,
    27,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    5356,
    110,
    19,
    26,
    nil,
    nil,
    19,
    26
)

--------------------------------------------------
-- Mid Progression
--------------------------------------------------

AddWand(
    5246,
    120,
    28,
    30,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    5244,
    130,
    29,
    31,
    29,
    31,
    nil,
    nil
)

AddWand(
    5818,
    135,
    28,
    31,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    7001,
    140,
    27,
    32,
    27,
    32,
    27,
    32
)

AddWand(
    5250,
    150,
    27,
    29,
    nil,
    nil,
    27,
    29
)

AddWand(
    6806,
    160,
    33,
    38,
    nil,
    nil,
    33,
    38
)

AddWand(
    16789,
    170,
    34,
    36,
    34,
    36,
    34,
    36
)

AddWand(
    5247,
    180,
    36,
    38,
    36,
    38,
    nil,
    nil
)

AddWand(
    5249,
    190,
    37,
    38,
    37,
    38,
    nil,
    nil
)

AddWand(
    5248,
    200,
    35,
    37,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    6797,
    210,
    38,
    41,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    15692,
    220,
    38,
    40,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    4547,
    230,
    38,
    40,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    5253,
    240,
    39,
    41,
    39,
    41,
    39,
    41
)

--------------------------------------------------
-- Late Progression
--------------------------------------------------

AddWand(
    11860,
    250,
    45,
    47,
    45,
    47,
    45,
    47
)

AddWand(
    19118,
    260,
    52,
    60,
    nil,
    nil,
    52,
    60
)

AddWand(
    17745,
    270,
    50,
    53,
    50,
    53,
    50,
    53
)

AddWand(
    10836,
    280,
    51,
    60,
    nil,
    nil,
    nil,
    nil
)

AddWand(
    16993,
    290,
    54,
    60,
    54,
    60,
    54,
    60
)
