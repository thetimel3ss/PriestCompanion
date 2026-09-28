-- Priest Companion
-- ClassicAPI Enhancements

local PC = PriestCompanion

--------------------------------------------------
-- Environment
--------------------------------------------------

PC.Environment.flavor = "ClassicAPI"
PC.Environment.classicAPI = true

if CLASSIC_API_VERSION then
    PC.Environment.classicAPIVersion =
        CLASSIC_API_VERSION
end

--------------------------------------------------
-- Preserve Vanilla Fallbacks
--------------------------------------------------

local VanillaGetItemName =
    PC.API.GetItemName

local VanillaGetItemIcon =
    PC.API.GetItemIcon

local VanillaSetItemTooltip =
    PC.API.SetItemTooltip

local VanillaGetItemCount =
    PC.API.GetItemCount

local VanillaIsQuestCompleted =
    PC.API.IsQuestCompleted

--------------------------------------------------
-- Item Name
--------------------------------------------------

function PC.API.GetItemName(itemID)
    if C_Item
    and C_Item.GetItemNameByID then

        local name =
            C_Item.GetItemNameByID(itemID)

        if name then
            return name
        end

        if C_Item.RequestLoadItemDataByID then
            C_Item.RequestLoadItemDataByID(
                itemID
            )
        end
    end

    return VanillaGetItemName(itemID)
end

--------------------------------------------------
-- Item Icon
--------------------------------------------------

function PC.API.GetItemIcon(itemID)
    if C_Item
    and C_Item.GetItemIconByID then

        local texture =
            C_Item.GetItemIconByID(itemID)

        if texture then
            return texture
        end

        if C_Item.RequestLoadItemDataByID then
            C_Item.RequestLoadItemDataByID(
                itemID
            )
        end
    end

    return VanillaGetItemIcon(itemID)
end

--------------------------------------------------
-- Item Tooltip
--------------------------------------------------

function PC.API.SetItemTooltip(
    tooltip,
    itemID
)
    if tooltip
    and tooltip.SetItemByID then

        tooltip:SetItemByID(itemID)
        return
    end

    VanillaSetItemTooltip(
        tooltip,
        itemID
    )
end

--------------------------------------------------
-- Item Count
--------------------------------------------------

function PC.API.GetItemCount(itemID)
    if C_Item
    and C_Item.GetItemCount then

        local count =
            C_Item.GetItemCount(itemID)

        if count ~= nil then
            return count
        end
    end

    return VanillaGetItemCount(itemID)
end

--------------------------------------------------
-- Quest Completion
--------------------------------------------------

function PC.API.IsQuestCompleted(
    questID
)
    if C_QuestLog
    and C_QuestLog.IsQuestFlaggedCompleted then

        local success
        local completed

        success,
        completed = pcall(
            C_QuestLog.IsQuestFlaggedCompleted,
            questID
        )

        if success then
            return completed
                and true
                or false
        end
    end

    return VanillaIsQuestCompleted(
        questID
    )
end
