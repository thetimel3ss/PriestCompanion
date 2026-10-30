-- Priest Companion
-- ClassicAPI Enhancements

local PC = PriestCompanion

--------------------------------------------------
-- Runtime Guard
--------------------------------------------------

-- A flavor TOC loads this file only when ClassicAPI redirects the
-- manifest. A manually selected TOC must still be safe without the DLL.
local CLASSIC_API_MIN_VERSION = 11100

local classicAPIVersion =
    tonumber(CLASSIC_API_VERSION)

if not classicAPIVersion
or classicAPIVersion < CLASSIC_API_MIN_VERSION then
    -- Keep the original Vanilla API implementations untouched.
    return
end

--------------------------------------------------
-- Environment
--------------------------------------------------

PC.Environment.flavor = "ClassicAPI"
PC.Environment.classicAPI = true
PC.Environment.classicAPIVersion =
    classicAPIVersion

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

-- Do not override PC.API.IsQuestCompleted here.
-- QuestHistory owns the optional ClassicAPI 1.18.0+ Turtle-lineage
-- completed-quest adapter and accepts only positive evidence. The DLL's
-- initial empty cache must never become an authoritative negative here.

--------------------------------------------------
-- Item Cache Request
--------------------------------------------------

local function RequestItemData(itemID)
    if type(C_Item) == "table"
    and type(
        C_Item.RequestLoadItemDataByID
    ) == "function" then
        pcall(
            C_Item.RequestLoadItemDataByID,
            itemID
        )
    end
end

--------------------------------------------------
-- Item Name
--------------------------------------------------

function PC.API.GetItemName(itemID)
    if type(C_Item) == "table"
    and type(
        C_Item.GetItemNameByID
    ) == "function" then

        local success
        local name

        success, name = pcall(
            C_Item.GetItemNameByID,
            itemID
        )

        if success and name then
            return name
        end

        RequestItemData(itemID)
    end

    return VanillaGetItemName(itemID)
end

--------------------------------------------------
-- Item Icon
--------------------------------------------------

function PC.API.GetItemIcon(itemID)
    if type(C_Item) == "table"
    and type(
        C_Item.GetItemIconByID
    ) == "function" then

        local success
        local texture

        success, texture = pcall(
            C_Item.GetItemIconByID,
            itemID
        )

        if success and texture then
            return texture
        end

        RequestItemData(itemID)
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
    and type(
        tooltip.SetItemByID
    ) == "function" then

        local success = pcall(
            tooltip.SetItemByID,
            tooltip,
            itemID
        )

        if success then
            return
        end
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
    if type(C_Item) == "table"
    and type(
        C_Item.GetItemCount
    ) == "function" then

        local success
        local count

        success, count = pcall(
            C_Item.GetItemCount,
            itemID
        )

        if success and count ~= nil then
            return count
        end
    end

    return VanillaGetItemCount(itemID)
end
