-- Priest Companion
-- Base API
-- Vanilla 1.12 compatible

local PC = PriestCompanion

local UNKNOWN_ICON =
    "Interface\\Icons\\INV_Misc_QuestionMark"

--------------------------------------------------
-- Internal Helpers
--------------------------------------------------

local function ExtractItemID(itemLink)
    if not itemLink then
        return nil
    end

    local startPos
    local endPos
    local itemID

    startPos,
    endPos,
    itemID = string.find(
        itemLink,
        "item:(%d+)"
    )

    if itemID then
        return tonumber(itemID)
    end

    return nil
end

--------------------------------------------------
-- Item Name
--------------------------------------------------

function PC.API.GetItemName(itemID)
    local item

    if PC.Data.Items then
        item = PC.Data.Items[itemID]
    end

    if item and item.name then
        return item.name
    end

    if PC.Data.ItemNames
    and PC.Data.ItemNames[itemID] then
        return PC.Data.ItemNames[itemID]
    end

    local name = GetItemInfo(itemID)

    if name then
        return name
    end

    return "Item " .. tostring(itemID)
end

--------------------------------------------------
-- Item Icon
--------------------------------------------------

function PC.API.GetItemIcon(itemID)
    local name
    local link
    local quality
    local itemLevel
    local itemMinLevel
    local itemType
    local itemSubType
    local stackCount
    local equipLocation
    local texture

    name,
    link,
    quality,
    itemLevel,
    itemMinLevel,
    itemType,
    itemSubType,
    stackCount,
    equipLocation,
    texture = GetItemInfo(itemID)

    if texture then
        return texture
    end

    return UNKNOWN_ICON
end

--------------------------------------------------
-- Item Tooltip
--------------------------------------------------

function PC.API.SetItemTooltip(tooltip, itemID)
    tooltip:SetHyperlink(
        "item:" ..
        tostring(itemID) ..
        ":0:0:0:0:0:0:0"
    )
end

--------------------------------------------------
-- Item Count In Bags
--------------------------------------------------

function PC.API.GetItemCount(itemID)
    local total = 0
    local bag

    for bag = 0, 4 do
        local slots =
            GetContainerNumSlots(bag)

        local slot

        for slot = 1, slots do
            local itemLink =
                GetContainerItemLink(
                    bag,
                    slot
                )

            local bagItemID =
                ExtractItemID(itemLink)

            if bagItemID == itemID then
                local texture
                local itemCount

                texture,
                itemCount =
                    GetContainerItemInfo(
                        bag,
                        slot
                    )

                total =
                    total +
                    (itemCount or 1)
            end
        end
    end

    return total
end

--------------------------------------------------
-- Profession Skill
--------------------------------------------------

function PC.API.GetProfessionSkill(
    professionName
)
    local numSkills =
        GetNumSkillLines()

    local i

    for i = 1, numSkills do
        local skillName
        local isHeader
        local isExpanded
        local skillRank
        local numTempPoints
        local skillModifier
        local skillMaxRank

        skillName,
        isHeader,
        isExpanded,
        skillRank,
        numTempPoints,
        skillModifier,
        skillMaxRank =
            GetSkillLineInfo(i)

        if not isHeader
        and skillName == professionName then
            return
                skillRank or 0,
                skillMaxRank or 0
        end
    end

    return nil, nil
end

--------------------------------------------------
-- Player Context
--------------------------------------------------

function PC.API.GetPlayerLevel()
    return UnitLevel("player") or 1
end

function PC.API.GetPlayerFaction()
    return UnitFactionGroup("player")
end

function PC.API.IsFactionCompatible(
    faction
)
    if not faction
    or faction == "Both" then
        return true
    end

    return
        faction ==
        PC.API.GetPlayerFaction()
end

--------------------------------------------------
-- Quest Log
--------------------------------------------------

function PC.API.IsQuestInLog(
    questName
)
    if not questName then
        return false
    end

    local numEntries =
        GetNumQuestLogEntries()

    local i

    for i = 1, numEntries do
        local title
        local level
        local questTag
        local suggestedGroup
        local isHeader

        title,
        level,
        questTag,
        suggestedGroup,
        isHeader =
            GetQuestLogTitle(i)

        if not isHeader
        and title == questName then
            return true
        end
    end

    return false
end

--------------------------------------------------
-- Quest Completion
-- Vanilla has no reliable persistent completed
-- quest query for arbitrary quest IDs.
--------------------------------------------------

function PC.API.IsQuestCompleted(
    questID
)
    return nil
end

--------------------------------------------------
-- Quest Log Text
--
-- Returns the full quest description/objective text when the quest
-- is currently present in the player's quest log. Vanilla cannot
-- query arbitrary quest text by quest ID, so callers should keep a
-- static summary as a fallback for quests not currently active.
--------------------------------------------------

function PC.API.GetQuestLogText(
    questName
)
    if not questName then
        return nil, nil
    end

    local numEntries =
        GetNumQuestLogEntries()

    local previousSelection =
        GetQuestLogSelection()

    local description = nil
    local objectives = nil

    local i

    for i = 1, numEntries do
        local title
        local level
        local questTag
        local suggestedGroup
        local isHeader

        title,
        level,
        questTag,
        suggestedGroup,
        isHeader =
            GetQuestLogTitle(i)

        if not isHeader
        and title == questName then
            SelectQuestLogEntry(i)

            description,
            objectives =
                GetQuestLogQuestText()

            break
        end
    end

    if previousSelection
    and previousSelection > 0 then
        SelectQuestLogEntry(
            previousSelection
        )
    end

    return description, objectives
end
