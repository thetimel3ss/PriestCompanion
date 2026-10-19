-- Priest Companion
-- Book of Prayer: qualifying spell families.
-- Ranks intentionally share one family. No spell-casting automation.

local PC = PriestCompanion

PC.Data.HealingSpells = {
    ["Flash Heal"] = {
        icon = "Interface\\Icons\\Spell_Holy_FlashHeal"
    },
    ["Renew"] = {
        icon = "Interface\\Icons\\Spell_Holy_Renew"
    },
    ["Prayer of Healing"] = {
        icon = "Interface\\Icons\\Spell_Holy_PrayerOfHealing02"
    },
    ["Heal"] = {
        icon = "Interface\\Icons\\Spell_Holy_Heal"
    },
    ["Greater Heal"] = {
        icon = "Interface\\Icons\\Spell_Holy_GreaterHeal"
    },
    ["Lesser Heal"] = {
        icon = "Interface\\Icons\\Spell_Holy_LesserHeal"
    }
}

-- Avoid searching arbitrary spell IDs for rank relationships. ClassicAPI
-- and SuperWoW expose the localized *base name* of a successful cast.
-- The spellbook supplies actual icons for learned ranks.
