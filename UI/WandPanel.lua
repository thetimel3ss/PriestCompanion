-- Priest Companion
-- Wand Progression Panel

local PC = PriestCompanion
local mainFrame = PC.UI.MainFrame

if not mainFrame then
    return
end

--------------------------------------------------
-- Layout Configuration
--------------------------------------------------

local ROW_HEIGHT = 52
local ROW_WIDTH = 425

local PANEL_LEFT = 25
local PANEL_TOP = -55
local PANEL_RIGHT = -25
local PANEL_BOTTOM = 25

local TITLE_X = 15
local TITLE_Y = -14

local PLAYER_INFO_X = -15
local PLAYER_INFO_Y = -16
local PLAYER_FACTION_ICON_SIZE = 30
local PLAYER_FACTION_ICON_X = 10
local PLAYER_FACTION_ICON_Y = -5

local DESCRIPTION_X = 0
local DESCRIPTION_Y = -5

local FILTER_BAR_X = -12
local FILTER_BAR_Y = -6
local FILTER_BAR_WIDTH = 440
local FILTER_BAR_HEIGHT = 75

local SOURCE_FILTER_X = 18
local SOURCE_FILTER_Y = 0
local SOURCE_DROPDOWN_X = -18
local SOURCE_DROPDOWN_Y = -2
local SOURCE_DROPDOWN_WIDTH = 80

local FACTION_FILTER_X = 120
local FACTION_FILTER_Y = 0
local FACTION_DROPDOWN_X = -18
local FACTION_DROPDOWN_Y = -2
local FACTION_DROPDOWN_WIDTH = 105

local LEVEL_FILTER_X = 247
local LEVEL_FILTER_Y = 0
local LEVEL_DROPDOWN_X = -18
local LEVEL_DROPDOWN_Y = -2
local LEVEL_DROPDOWN_WIDTH = 100

local SEARCH_LABEL_X = 18
local SEARCH_LABEL_Y = -46
local SEARCH_BOX_X = 64
local SEARCH_BOX_Y = -41
local SEARCH_BOX_WIDTH = 278
local SEARCH_BOX_HEIGHT = 20

local RECOMMENDED_X = 375
local RECOMMENDED_Y = -18
local RECOMMENDED_SIZE = 20
local RECOMMENDED_TEXT_X = 2

local HEADER_X = 14
local HEADER_Y = 2
local HEADER_HEIGHT = 18

local COL_DPS_X = 215
local COL_DPS_WIDTH = 50
local COL_REQ_X = 270
local COL_REQ_WIDTH = 70
local COL_REC_X = 345
local COL_REC_WIDTH = 60

local SCROLL_TOP_Y = -4
local SCROLL_RIGHT = -28
local SCROLL_BOTTOM = 15

local ITEM_TOOLTIP_GAP = 8

--------------------------------------------------
-- Source Metadata Layout
--
-- Each element on the second line of a Wand row is
-- positioned independently from the row itself.
--------------------------------------------------

local SOURCE_ICON_SIZE = 16
local SOURCE_ICON_X = 50
local SOURCE_ICON_Y = -8

local SOURCE_TEXT_X = 70
local SOURCE_TEXT_Y = -8

local FACTION_ICON_SIZE = 24
local FACTION_ICON_X = 107
local FACTION_ICON_Y = -13

local FACTION_TEXT_X = 123
local FACTION_TEXT_Y = -8

local INSTANCE_ICON_SIZE = 20
local INSTANCE_ICON_X = 170
local INSTANCE_ICON_Y = -8

local INSTANCE_TEXT_X = 193
local INSTANCE_TEXT_Y = -8

--------------------------------------------------
-- Row State Colors
--------------------------------------------------

local RECOMMENDED_R = 0.05
local RECOMMENDED_G = 0.35
local RECOMMENDED_B = 0.08
local RECOMMENDED_ALPHA = 0.30

local UNUSABLE_R = 0.35
local UNUSABLE_G = 0.05
local UNUSABLE_B = 0.05
local UNUSABLE_ALPHA = 0.30

--------------------------------------------------
-- Runtime State
--------------------------------------------------

local playerLevel = 1
local playerFaction = nil

local filters = {
    source = "All",
    faction = "Auto",
    level = "Usable",
    recommendedOnly = true,
    search = ""
}

local rows = {}
local activeRow = nil

local RefreshWandList

--------------------------------------------------
-- Player Context
--------------------------------------------------

local function UpdatePlayerContext()
    playerLevel =
        PC.API.GetPlayerLevel()

    playerFaction =
        PC.API.GetPlayerFaction()
end

--------------------------------------------------
-- Item Quality Colors
--------------------------------------------------

local function GetQualityColor(quality)
    if quality == 0 then
        return "|cff9d9d9d"
    elseif quality == 1 then
        return "|cffffffff"
    elseif quality == 2 then
        return "|cff1eff00"
    elseif quality == 3 then
        return "|cff0070dd"
    elseif quality == 4 then
        return "|cffa335ee"
    elseif quality == 5 then
        return "|cffff8000"
    end

    return "|cffffffff"
end

--------------------------------------------------
-- DPS
--------------------------------------------------

local function GetItemDPS(item)
    if not item
    or not item.damage
    or not item.damage.speed
    or item.damage.speed == 0 then
        return 0
    end

    local averageDamage =
        (
            item.damage.min +
            item.damage.max
        ) / 2

    return
        averageDamage /
        item.damage.speed
end

--------------------------------------------------
-- Recommended Range
--------------------------------------------------

local function GetRecommendedText(wand)
    if not wand
    or not wand.recommended
    or not wand.recommendedLevel then
        return "-"
    end

    local minLevel =
        wand.recommendedLevel.min

    local maxLevel =
        wand.recommendedLevel.max

    if minLevel
    and maxLevel then
        return
            tostring(minLevel) ..
            "-" ..
            tostring(maxLevel)
    end

    if minLevel then
        return
            tostring(minLevel) ..
            "+"
    end

    return "-"
end

local function IsRecommendedNow(wand)
    if not wand
    or not wand.recommended
    or not wand.recommendedLevel then
        return false
    end

    local minLevel =
        wand.recommendedLevel.min

    local maxLevel =
        wand.recommendedLevel.max

    if minLevel
    and playerLevel < minLevel then
        return false
    end

    if maxLevel
    and playerLevel > maxLevel then
        return false
    end

    return true
end

local function IsUsable(item)
    if not item
    or not item.requiredLevel then
        return true
    end

    return
        playerLevel >=
        item.requiredLevel
end

--------------------------------------------------
-- Source Visuals
--------------------------------------------------

local function GetSourceVisual(source)
    if not source then
        return
            "Interface\\Icons\\INV_Misc_QuestionMark",
            "Unknown"
    end

    if source.type == "craft" then
        if source.profession == "Enchanting" then
            return
                "Interface\\Icons\\Trade_Engraving",
                "Enchanting"
        end

        return
            "Interface\\Icons\\INV_Misc_QuestionMark",
            tostring(
                source.profession or "Craft"
            )
    end

    if source.type == "quest" then
        return
            "Interface\\GossipFrame\\AvailableQuestIcon",
            "Quest"
    end

    if source.type == "drop" then
        return
            "Interface\\Icons\\INV_Misc_Bag_10",
            "Drop"
    end

    if source.type == "vendor" then
        return
            "Interface\\Icons\\INV_Misc_Coin_01",
            "Vendor"
    end

    return
        "Interface\\Icons\\INV_Misc_QuestionMark",
        tostring(source.type or "Unknown")
end

local function GetFactionVisual(faction)
    if faction == "Alliance" then
        return
            "Interface\\TargetingFrame\\UI-PVP-Alliance",
            "|cff4080ffAlliance|r"
    end

    if faction == "Horde" then
        return
            "Interface\\TargetingFrame\\UI-PVP-Horde",
            "|cffff4040Horde|r"
    end

    return nil, nil
end

--------------------------------------------------
-- Filter Helpers
--------------------------------------------------

local function GetEffectiveFaction()
    if filters.faction == "Auto" then
        return playerFaction
    end

    if filters.faction == "All" then
        return nil
    end

    return filters.faction
end

local function SearchMatches(
    itemID,
    item
)
    local query =
        filters.search

    if not query
    or query == "" then
        return true
    end

    local name =
        item
        and item.name

    if not name then
        name =
            PC.API.GetItemName(
                itemID
            )
    end

    name = string.lower(
        tostring(name or "")
    )

    query = string.lower(
        tostring(query)
    )

    return string.find(
        name,
        query,
        1,
        true
    ) ~= nil
end

local function SourceMatchesFilters(source)
    if not source then
        return false
    end

    if filters.source ~= "All"
    and source.type ~= filters.source then
        return false
    end

    local factionFilter =
        GetEffectiveFaction()

    if factionFilter then
        local sourceFaction =
            source.faction or "Both"

        if sourceFaction ~= "Both"
        and sourceFaction ~= factionFilter then
            return false
        end
    end

    return true
end

local function GetMatchingSources(itemID)
    local result = {}

    local sources =
        PC.Data.Sources[itemID]

    if not sources then
        return result
    end

    local i

    for i = 1,
        table.getn(sources)
    do
        if SourceMatchesFilters(
            sources[i]
        ) then
            result[
                table.getn(result) + 1
            ] = sources[i]
        end
    end

    return result
end

local function GetPrimarySource(sources)
    if not sources
    or table.getn(sources) == 0 then
        return nil
    end

    local preferredFaction =
        GetEffectiveFaction()

    if not preferredFaction then
        preferredFaction =
            playerFaction
    end

    local i

    if preferredFaction then
        for i = 1,
            table.getn(sources)
        do
            if sources[i].faction ==
            preferredFaction then
                return sources[i]
            end
        end
    end

    for i = 1,
        table.getn(sources)
    do
        if not sources[i].faction
        or sources[i].faction == "Both" then
            return sources[i]
        end
    end

    return sources[1]
end

local function GetAggregateFaction(sources)
    if not sources
    or table.getn(sources) == 0 then
        return nil
    end

    local hasAlliance = false
    local hasHorde = false
    local i

    for i = 1,
        table.getn(sources)
    do
        local faction =
            sources[i].faction or "Both"

        if faction == "Both" then
            return "Both"
        elseif faction == "Alliance" then
            hasAlliance = true
        elseif faction == "Horde" then
            hasHorde = true
        end
    end

    if hasAlliance
    and hasHorde then
        return "Both"
    end

    if hasAlliance then
        return "Alliance"
    end

    if hasHorde then
        return "Horde"
    end

    return nil
end

local function GetSourceInstanceID(source)
    if not source then
        return nil
    end

    if source.instanceID then
        return source.instanceID
    end

    if source.type == "quest"
    and source.questID
    and PC.Data.Quests then
        local quest =
            PC.Data.Quests[
                source.questID
            ]

        if quest then
            return quest.instanceID
        end
    end

    return nil
end

local function GetAggregateInstanceID(sources)
    if not sources
    or table.getn(sources) == 0 then
        return nil
    end

    local foundID = nil
    local i

    for i = 1,
        table.getn(sources)
    do
        local instanceID =
            GetSourceInstanceID(
                sources[i]
            )

        if not instanceID then
            return nil
        end

        if not foundID then
            foundID = instanceID
        elseif foundID ~= instanceID then
            return nil
        end
    end

    return foundID
end

local function ItemPassesFilters(itemID)
    local item =
        PC.Data.Items[itemID]

    local wand =
        PC.Data.Wands[itemID]

    if not item
    or not wand then
        return false
    end

    if not SearchMatches(
        itemID,
        item
    ) then
        return false
    end

    local matchingSources =
        GetMatchingSources(itemID)

    if table.getn(
        matchingSources
    ) == 0 then
        return false
    end

    if filters.recommendedOnly
    and not wand.recommended then
        return false
    end

    if filters.level == "Usable" then
        if not IsUsable(item) then
            return false
        end

    elseif filters.level == "Future" then
        if IsUsable(item) then
            return false
        end

    elseif filters.level == "Recommended" then
        if not IsRecommendedNow(wand) then
            return false
        end
    end

    return true
end

--------------------------------------------------
-- Smart Item Tooltip Positioning
--------------------------------------------------

local function GetFrameEdges(reference)
    if not reference then
        return nil
    end

    local left = reference:GetLeft()
    local right = reference:GetRight()
    local top = reference:GetTop()
    local bottom = reference:GetBottom()

    if left
    and right
    and top
    and bottom then
        return left, right, top, bottom
    end

    local centerX
    local centerY

    centerX,
    centerY =
        reference:GetCenter()

    if not centerX
    or not centerY then
        return nil
    end

    local width =
        reference:GetWidth()
        or 0

    local height =
        reference:GetHeight()
        or 0

    return
        centerX - (width / 2),
        centerX + (width / 2),
        centerY + (height / 2),
        centerY - (height / 2)
end

local function GetBestTooltipSide(row)
    local left
    local right
    local top
    local bottom

    left,
    right,
    top,
    bottom =
        GetFrameEdges(row)

    if not left then
        return "RIGHT"
    end

    local screenWidth =
        UIParent:GetWidth()

    local screenHeight =
        UIParent:GetHeight()

    local tooltipWidth =
        GameTooltip:GetWidth()
        or 0

    local tooltipHeight =
        GameTooltip:GetHeight()
        or 0

    --------------------------------------------------
    -- Candidate Rectangle
    --
    -- RIGHT / LEFT are top-aligned with the row.
    -- TOP / BOTTOM are left-aligned with the row.
    --------------------------------------------------

    local function Fits(side)
        local candidateLeft
        local candidateRight
        local candidateTop
        local candidateBottom

        if side == "RIGHT" then
            candidateLeft =
                right +
                ITEM_TOOLTIP_GAP

            candidateRight =
                candidateLeft +
                tooltipWidth

            candidateTop = top
            candidateBottom =
                candidateTop -
                tooltipHeight

        elseif side == "LEFT" then
            candidateRight =
                left -
                ITEM_TOOLTIP_GAP

            candidateLeft =
                candidateRight -
                tooltipWidth

            candidateTop = top
            candidateBottom =
                candidateTop -
                tooltipHeight

        elseif side == "TOP" then
            candidateLeft = left
            candidateRight =
                candidateLeft +
                tooltipWidth

            candidateBottom =
                top +
                ITEM_TOOLTIP_GAP

            candidateTop =
                candidateBottom +
                tooltipHeight

        else
            candidateLeft = left
            candidateRight =
                candidateLeft +
                tooltipWidth

            candidateTop =
                bottom -
                ITEM_TOOLTIP_GAP

            candidateBottom =
                candidateTop -
                tooltipHeight
        end

        return
            candidateLeft >= 0
            and candidateRight <= screenWidth
            and candidateBottom >= 0
            and candidateTop <= screenHeight
    end

    --------------------------------------------------
    -- Fixed preference order.
    -- RIGHT is always the default. Only use another
    -- position if the complete tooltip would not fit.
    --------------------------------------------------

    local preferredSides = {
        "RIGHT",
        "LEFT",
        "TOP",
        "BOTTOM"
    }

    local i

    for i = 1,
        table.getn(preferredSides)
    do
        local side =
            preferredSides[i]

        if Fits(side) then
            return side
        end
    end

    --------------------------------------------------
    -- Extreme case: no position fits completely.
    -- Choose the side with the most primary-axis
    -- space and let SetClampedToScreen finish it.
    --------------------------------------------------

    local spaces = {
        RIGHT =
            screenWidth - right,

        LEFT = left,

        TOP =
            screenHeight - top,

        BOTTOM = bottom
    }

    local bestSide = "RIGHT"
    local bestSpace = -1

    for i = 1,
        table.getn(preferredSides)
    do
        local side =
            preferredSides[i]

        if spaces[side] > bestSpace then
            bestSpace = spaces[side]
            bestSide = side
        end
    end

    return bestSide
end

local function PositionItemTooltip(row)
    local side =
        GetBestTooltipSide(row)

    GameTooltip:ClearAllPoints()

    if side == "LEFT" then
        GameTooltip:SetPoint(
            "TOPRIGHT",
            row,
            "TOPLEFT",
            -ITEM_TOOLTIP_GAP,
            0
        )

    elseif side == "TOP" then
        GameTooltip:SetPoint(
            "BOTTOMLEFT",
            row,
            "TOPLEFT",
            0,
            ITEM_TOOLTIP_GAP
        )

    elseif side == "BOTTOM" then
        GameTooltip:SetPoint(
            "TOPLEFT",
            row,
            "BOTTOMLEFT",
            0,
            -ITEM_TOOLTIP_GAP
        )

    else
        GameTooltip:SetPoint(
            "TOPLEFT",
            row,
            "TOPRIGHT",
            ITEM_TOOLTIP_GAP,
            0
        )
    end
end

--------------------------------------------------
-- Hover / Click
--------------------------------------------------

local function ShowItemTooltips()
    local row = this

    activeRow = nil

    if not row.itemID then
        return
    end

    activeRow = row

    --------------------------------------------------
    -- Build the item tooltip first so its real size
    -- is known before choosing a side.
    --------------------------------------------------

    GameTooltip:SetOwner(
        row,
        "ANCHOR_NONE"
    )

    if GameTooltip.SetClampedToScreen then
        GameTooltip:SetClampedToScreen(true)
    end

    PC.API.SetItemTooltip(
        GameTooltip,
        row.itemID
    )

    GameTooltip:Show()

    PositionItemTooltip(row)

    --------------------------------------------------
    -- Source tooltip positions itself around the
    -- final GameTooltip position.
    --------------------------------------------------

    if PC.UI.SourceTooltip
    and row.source then
        PC.UI.SourceTooltip.Show(
            row.itemID,
            row.source
        )
    end
end

local function HideItemTooltips()
    activeRow = nil

    GameTooltip:Hide()

    if PC.UI.SourceTooltip then
        PC.UI.SourceTooltip.Hide()
    end
end

local function OnItemClick()
    local row = this

    activeRow = nil

    if not row.itemID
    or not row.source then
        return
    end

    if PC.UI.SourceTooltip
    and PC.UI.SourceTooltip.HasDetails(
        row.source
    )
    and PC.UI.SourceDetails then

        PC.UI.SourceDetails.Open(
            row.itemID,
            row.source
        )
    end
end

--------------------------------------------------
-- Main Panel
--------------------------------------------------

local panel =
    CreateFrame(
        "Frame",
        nil,
        mainFrame
    )

panel:SetPoint(
    "TOPLEFT",
    mainFrame,
    "TOPLEFT",
    PANEL_LEFT,
    PANEL_TOP
)

panel:SetPoint(
    "BOTTOMRIGHT",
    mainFrame,
    "BOTTOMRIGHT",
    PANEL_RIGHT,
    PANEL_BOTTOM
)

panel:SetBackdrop({
    bgFile =
        "Interface\\Tooltips\\UI-Tooltip-Background",

    edgeFile =
        "Interface\\Tooltips\\UI-Tooltip-Border",

    tile = true,
    tileSize = 16,
    edgeSize = 16,

    insets = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4
    }
})

panel:SetBackdropColor(
    0.03,
    0.03,
    0.03,
    0.96
)

panel:SetBackdropBorderColor(
    0.30,
    0.30,
    0.30,
    1
)

PC.UI.WandPanel = panel

--------------------------------------------------
-- Title
--------------------------------------------------

local sectionTitle =
    panel:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

sectionTitle:SetPoint(
    "TOPLEFT",
    panel,
    "TOPLEFT",
    TITLE_X,
    TITLE_Y
)

sectionTitle:SetText(
    "Wand Progression"
)

--------------------------------------------------
-- Player Information
--------------------------------------------------

local playerInfo =
    panel:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

playerInfo:SetPoint(
    "TOPRIGHT",
    panel,
    "TOPRIGHT",
    PLAYER_INFO_X,
    PLAYER_INFO_Y
)

local playerFactionIcon =
    panel:CreateTexture(
        nil,
        "ARTWORK"
    )

playerFactionIcon:SetWidth(
    PLAYER_FACTION_ICON_SIZE
)

playerFactionIcon:SetHeight(
    PLAYER_FACTION_ICON_SIZE
)

playerFactionIcon:SetPoint(
    "RIGHT",
    playerInfo,
    "LEFT",
    PLAYER_FACTION_ICON_X,
    PLAYER_FACTION_ICON_Y
)

--------------------------------------------------
-- Description
--------------------------------------------------

local description =
    panel:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

description:SetPoint(
    "TOPLEFT",
    sectionTitle,
    "BOTTOMLEFT",
    DESCRIPTION_X,
    DESCRIPTION_Y
)

description:SetText(
    "All wands have acquisition details. Hover for tooltips; click a wand to open Source Details."
)

--------------------------------------------------
-- Filter Bar
--------------------------------------------------

local filterBar =
    CreateFrame(
        "Frame",
        nil,
        panel
    )

filterBar:SetPoint(
    "TOPLEFT",
    description,
    "BOTTOMLEFT",
    FILTER_BAR_X,
    FILTER_BAR_Y
)

filterBar:SetWidth(
    FILTER_BAR_WIDTH
)

filterBar:SetHeight(
    FILTER_BAR_HEIGHT
)

--------------------------------------------------
-- Search
--------------------------------------------------

local searchLabel =
    filterBar:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

searchLabel:SetPoint(
    "TOPLEFT",
    filterBar,
    "TOPLEFT",
    SEARCH_LABEL_X,
    SEARCH_LABEL_Y
)

searchLabel:SetText(
    "Search"
)

local searchBox =
    CreateFrame(
        "EditBox",
        nil,
        filterBar,
        "InputBoxTemplate"
    )

searchBox:SetWidth(
    SEARCH_BOX_WIDTH
)

searchBox:SetHeight(
    SEARCH_BOX_HEIGHT
)

searchBox:SetPoint(
    "TOPLEFT",
    filterBar,
    "TOPLEFT",
    SEARCH_BOX_X,
    SEARCH_BOX_Y
)

searchBox:SetAutoFocus(false)

if searchBox.SetFontObject then
    searchBox:SetFontObject(
        "GameFontHighlightSmall"
    )
end

if searchBox.SetTextInsets then
    searchBox:SetTextInsets(
        6,
        6,
        0,
        0
    )
end

searchBox:SetText(
    filters.search
)

searchBox:SetScript(
    "OnTextChanged",
    function()
        filters.search =
            this:GetText()
            or ""

        RefreshWandList(true)
    end
)

searchBox:SetScript(
    "OnEscapePressed",
    function()
        this:ClearFocus()
    end
)

searchBox:SetScript(
    "OnEnterPressed",
    function()
        this:ClearFocus()
    end
)

--------------------------------------------------
-- Source Filter
--------------------------------------------------

local sourceLabel =
    filterBar:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

sourceLabel:SetPoint(
    "TOPLEFT",
    filterBar,
    "TOPLEFT",
    SOURCE_FILTER_X,
    SOURCE_FILTER_Y
)

sourceLabel:SetText("Source")

local sourceDropdown =
    CreateFrame(
        "Frame",
        "PriestCompanionSourceDropdown",
        filterBar,
        "UIDropDownMenuTemplate"
    )

sourceDropdown:SetPoint(
    "TOPLEFT",
    sourceLabel,
    "BOTTOMLEFT",
    SOURCE_DROPDOWN_X,
    SOURCE_DROPDOWN_Y
)

UIDropDownMenu_SetWidth(
    SOURCE_DROPDOWN_WIDTH,
    sourceDropdown
)

--------------------------------------------------
-- Faction Filter
--------------------------------------------------

local factionLabel =
    filterBar:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

factionLabel:SetPoint(
    "TOPLEFT",
    filterBar,
    "TOPLEFT",
    FACTION_FILTER_X,
    FACTION_FILTER_Y
)

factionLabel:SetText("Faction")

local factionDropdown =
    CreateFrame(
        "Frame",
        "PriestCompanionFactionDropdown",
        filterBar,
        "UIDropDownMenuTemplate"
    )

factionDropdown:SetPoint(
    "TOPLEFT",
    factionLabel,
    "BOTTOMLEFT",
    FACTION_DROPDOWN_X,
    FACTION_DROPDOWN_Y
)

UIDropDownMenu_SetWidth(
    FACTION_DROPDOWN_WIDTH,
    factionDropdown
)

--------------------------------------------------
-- Level Filter
--------------------------------------------------

local levelLabel =
    filterBar:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

levelLabel:SetPoint(
    "TOPLEFT",
    filterBar,
    "TOPLEFT",
    LEVEL_FILTER_X,
    LEVEL_FILTER_Y
)

levelLabel:SetText("Level")

local levelDropdown =
    CreateFrame(
        "Frame",
        "PriestCompanionLevelDropdown",
        filterBar,
        "UIDropDownMenuTemplate"
    )

levelDropdown:SetPoint(
    "TOPLEFT",
    levelLabel,
    "BOTTOMLEFT",
    LEVEL_DROPDOWN_X,
    LEVEL_DROPDOWN_Y
)

UIDropDownMenu_SetWidth(
    LEVEL_DROPDOWN_WIDTH,
    levelDropdown
)

--------------------------------------------------
-- Recommended Filter
--------------------------------------------------

local recommendedCheck =
    CreateFrame(
        "CheckButton",
        nil,
        filterBar,
        "UICheckButtonTemplate"
    )

recommendedCheck:SetWidth(
    RECOMMENDED_SIZE
)

recommendedCheck:SetHeight(
    RECOMMENDED_SIZE
)

recommendedCheck:SetPoint(
    "TOPLEFT",
    filterBar,
    "TOPLEFT",
    RECOMMENDED_X,
    RECOMMENDED_Y
)

local recommendedLabel =
    filterBar:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

recommendedLabel:SetPoint(
    "LEFT",
    recommendedCheck,
    "RIGHT",
    RECOMMENDED_TEXT_X,
    0
)

recommendedLabel:SetText(
    "Recommended"
)

recommendedCheck:SetScript(
    "OnClick",
    function()
        filters.recommendedOnly =
            not filters.recommendedOnly

        recommendedCheck:SetChecked(
            filters.recommendedOnly
        )

        RefreshWandList(true)
    end
)

recommendedCheck:SetChecked(
    filters.recommendedOnly
)

--------------------------------------------------
-- Dropdown Options
--------------------------------------------------

UIDropDownMenu_Initialize(
    sourceDropdown,
    function()
        local options = {
            { value = "All", text = "All" },
            { value = "craft", text = "Craft" },
            { value = "quest", text = "Quest" },
            { value = "drop", text = "Drop" },
            { value = "vendor", text = "Vendor" }
        }

        local i

        for i = 1,
            table.getn(options)
        do
            local info =
                UIDropDownMenu_CreateInfo()

            info.text = options[i].text
            info.value = options[i].value
            info.checked =
                filters.source ==
                options[i].value

            info.func =
                function()
                    filters.source =
                        this.value

                    UIDropDownMenu_SetText(
                        this:GetText(),
                        sourceDropdown
                    )

                    RefreshWandList(true)
                end

            UIDropDownMenu_AddButton(info)
        end
    end
)

UIDropDownMenu_Initialize(
    factionDropdown,
    function()
        local autoText = "Auto"

        if playerFaction then
            autoText =
                "Auto (" ..
                playerFaction ..
                ")"
        end

        local options = {
            { value = "Auto", text = autoText },
            { value = "Alliance", text = "Alliance" },
            { value = "Horde", text = "Horde" },
            { value = "All", text = "All" }
        }

        local i

        for i = 1,
            table.getn(options)
        do
            local info =
                UIDropDownMenu_CreateInfo()

            info.text = options[i].text
            info.value = options[i].value
            info.checked =
                filters.faction ==
                options[i].value

            info.func =
                function()
                    filters.faction =
                        this.value

                    UIDropDownMenu_SetText(
                        this:GetText(),
                        factionDropdown
                    )

                    RefreshWandList(true)
                end

            UIDropDownMenu_AddButton(info)
        end
    end
)

UIDropDownMenu_Initialize(
    levelDropdown,
    function()
        local options = {
            { value = "All", text = "All" },
            { value = "Usable", text = "Usable Now" },
            { value = "Future", text = "Future" },
            { value = "Recommended", text = "Recommended Now" }
        }

        local i

        for i = 1,
            table.getn(options)
        do
            local info =
                UIDropDownMenu_CreateInfo()

            info.text = options[i].text
            info.value = options[i].value
            info.checked =
                filters.level ==
                options[i].value

            info.func =
                function()
                    filters.level =
                        this.value

                    UIDropDownMenu_SetText(
                        this:GetText(),
                        levelDropdown
                    )

                    RefreshWandList(true)
                end

            UIDropDownMenu_AddButton(info)
        end
    end
)

UIDropDownMenu_SetText(
    "All",
    sourceDropdown
)

UIDropDownMenu_SetText(
    "Auto",
    factionDropdown
)

UIDropDownMenu_SetText(
    "Usable Now",
    levelDropdown
)

--------------------------------------------------
-- Table Header
--------------------------------------------------

local header =
    CreateFrame(
        "Frame",
        nil,
        panel
    )

header:SetPoint(
    "TOPLEFT",
    filterBar,
    "BOTTOMLEFT",
    HEADER_X,
    HEADER_Y
)

header:SetWidth(ROW_WIDTH)
header:SetHeight(HEADER_HEIGHT)

local itemHeader =
    header:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalSmall"
    )

itemHeader:SetPoint(
    "LEFT",
    header,
    "LEFT",
    4,
    0
)

itemHeader:SetText("Item")

local dpsHeader =
    header:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalSmall"
    )

dpsHeader:SetPoint(
    "LEFT",
    header,
    "LEFT",
    COL_DPS_X,
    0
)

dpsHeader:SetWidth(COL_DPS_WIDTH)
dpsHeader:SetJustifyH("CENTER")
dpsHeader:SetText("DPS")

local reqHeader =
    header:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalSmall"
    )

reqHeader:SetPoint(
    "LEFT",
    header,
    "LEFT",
    COL_REQ_X,
    0
)

reqHeader:SetWidth(COL_REQ_WIDTH)
reqHeader:SetJustifyH("CENTER")
reqHeader:SetText("Req Level")

local recHeader =
    header:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalSmall"
    )

recHeader:SetPoint(
    "LEFT",
    header,
    "LEFT",
    COL_REC_X,
    0
)

recHeader:SetWidth(COL_REC_WIDTH)
recHeader:SetJustifyH("CENTER")
recHeader:SetText("Recommended")

--------------------------------------------------
-- Scroll Frame
--------------------------------------------------

local scrollFrame =
    CreateFrame(
        "ScrollFrame",
        "PriestCompanionWandScrollFrame",
        panel,
        "UIPanelScrollFrameTemplate"
    )

scrollFrame:SetPoint(
    "TOPLEFT",
    header,
    "BOTTOMLEFT",
    0,
    SCROLL_TOP_Y
)

scrollFrame:SetPoint(
    "BOTTOMRIGHT",
    panel,
    "BOTTOMRIGHT",
    SCROLL_RIGHT,
    SCROLL_BOTTOM
)

local scrollChild =
    CreateFrame(
        "Frame",
        nil,
        scrollFrame
    )

scrollChild:SetWidth(ROW_WIDTH)
scrollChild:SetHeight(1)

scrollFrame:SetScrollChild(
    scrollChild
)

--------------------------------------------------
-- Scroll Region Refresh
--------------------------------------------------

local function RefreshScrollRegion(resetScroll)
    local scroll = 0

    if scrollFrame.GetVerticalScroll then
        scroll =
            scrollFrame:GetVerticalScroll()
            or 0
    end

    if resetScroll then
        scroll = 0
    end

    if scrollFrame.UpdateScrollChildRect then
        scrollFrame:UpdateScrollChildRect()
    end

    if scrollFrame.SetVerticalScroll then
        local maxScroll = scroll

        if scrollFrame.GetVerticalScrollRange then
            maxScroll =
                scrollFrame:GetVerticalScrollRange()
                or 0
        end

        if scroll > maxScroll then
            scroll = maxScroll
        end

        if scroll < 0 then
            scroll = 0
        end

        scrollFrame:SetVerticalScroll(
            scroll
        )
    end
end

--------------------------------------------------
-- Create Item Row
--------------------------------------------------

local function CreateItemRow()
    local row =
        CreateFrame(
            "Button",
            nil,
            scrollChild
        )

    row:SetWidth(ROW_WIDTH)
    row:SetHeight(ROW_HEIGHT)

    --------------------------------------------------
    -- State Background
    --------------------------------------------------

    local stateBackground =
        row:CreateTexture(
            nil,
            "BACKGROUND"
        )

    stateBackground:SetAllPoints(row)
    stateBackground:Hide()

    row.stateBackground =
        stateBackground

    --------------------------------------------------
    -- Hover Highlight
    --------------------------------------------------

    local hover =
        row:CreateTexture(
            nil,
            "HIGHLIGHT"
        )

    hover:SetAllPoints(row)
    hover:SetTexture(1, 1, 1)
    hover:SetAlpha(0.06)

    --------------------------------------------------
    -- Item Icon
    --------------------------------------------------

    local border =
        row:CreateTexture(
            nil,
            "BACKGROUND"
        )

    border:SetTexture(
        "Interface\\Buttons\\UI-Quickslot2"
    )

    border:SetWidth(38)
    border:SetHeight(38)

    border:SetPoint(
        "LEFT",
        row,
        "LEFT",
        4,
        0
    )

    local icon =
        row:CreateTexture(
            nil,
            "ARTWORK"
        )

    icon:SetWidth(32)
    icon:SetHeight(32)

    icon:SetPoint(
        "CENTER",
        border,
        "CENTER",
        0,
        0
    )

    row.icon = icon

    --------------------------------------------------
    -- Item Name
    --------------------------------------------------

    local name =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontNormal"
        )

    name:SetPoint(
        "TOPLEFT",
        border,
        "TOPRIGHT",
        8,
        -3
    )

    name:SetWidth(165)
    name:SetJustifyH("LEFT")

    row.nameText = name

    --------------------------------------------------
    -- Source Icon + Text
    --------------------------------------------------

    local sourceIcon =
        row:CreateTexture(
            nil,
            "ARTWORK"
        )

    sourceIcon:SetWidth(
        SOURCE_ICON_SIZE
    )
    sourceIcon:SetHeight(
        SOURCE_ICON_SIZE
    )

    sourceIcon:SetPoint(
        "LEFT",
        row,
        "LEFT",
        SOURCE_ICON_X,
        SOURCE_ICON_Y
    )

    row.sourceIcon = sourceIcon

    local sourceText =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    sourceText:SetPoint(
        "LEFT",
        row,
        "LEFT",
        SOURCE_TEXT_X,
        SOURCE_TEXT_Y
    )

    sourceText:SetJustifyH("LEFT")

    row.sourceText = sourceText

    --------------------------------------------------
    -- Faction Icon + Text
    --------------------------------------------------

    local factionIcon =
        row:CreateTexture(
            nil,
            "ARTWORK"
        )

    factionIcon:SetWidth(
        FACTION_ICON_SIZE
    )
    factionIcon:SetHeight(
        FACTION_ICON_SIZE
    )

    factionIcon:SetPoint(
        "LEFT",
        row,
        "LEFT",
        FACTION_ICON_X,
        FACTION_ICON_Y
    )

    row.factionIcon = factionIcon

    local factionText =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    factionText:SetPoint(
        "LEFT",
        row,
        "LEFT",
        FACTION_TEXT_X,
        FACTION_TEXT_Y
    )

    row.factionText = factionText

    --------------------------------------------------
    -- Instance Icon + Text
    --------------------------------------------------

    local instanceIcon =
        row:CreateTexture(
            nil,
            "ARTWORK"
        )

    instanceIcon:SetWidth(
        INSTANCE_ICON_SIZE
    )

    instanceIcon:SetHeight(
        INSTANCE_ICON_SIZE
    )

    instanceIcon:SetPoint(
        "LEFT",
        row,
        "LEFT",
        INSTANCE_ICON_X,
        INSTANCE_ICON_Y
    )

    instanceIcon:Hide()

    row.instanceIcon =
        instanceIcon

    local instanceText =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    instanceText:SetJustifyH(
        "LEFT"
    )

    instanceText:SetPoint(
        "LEFT",
        row,
        "LEFT",
        INSTANCE_TEXT_X,
        INSTANCE_TEXT_Y
    )

    instanceText:Hide()

    row.instanceText =
        instanceText

    --------------------------------------------------
    -- DPS
    --------------------------------------------------

    local dps =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    dps:SetPoint(
        "LEFT",
        row,
        "LEFT",
        COL_DPS_X,
        0
    )

    dps:SetWidth(COL_DPS_WIDTH)
    dps:SetJustifyH("CENTER")

    row.dpsText = dps

    --------------------------------------------------
    -- Required Level
    --------------------------------------------------

    local requiredLevel =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    requiredLevel:SetPoint(
        "LEFT",
        row,
        "LEFT",
        COL_REQ_X,
        0
    )

    requiredLevel:SetWidth(COL_REQ_WIDTH)
    requiredLevel:SetJustifyH("CENTER")

    row.requiredLevelText =
        requiredLevel

    --------------------------------------------------
    -- Recommended Level
    --------------------------------------------------

    local recommended =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    recommended:SetPoint(
        "LEFT",
        row,
        "LEFT",
        COL_REC_X,
        0
    )

    recommended:SetWidth(COL_REC_WIDTH)
    recommended:SetJustifyH("CENTER")

    row.recommendedText =
        recommended

    --------------------------------------------------
    -- Events
    --------------------------------------------------

    row:SetScript(
        "OnEnter",
        ShowItemTooltips
    )

    row:SetScript(
        "OnLeave",
        HideItemTooltips
    )

    row:SetScript(
        "OnClick",
        OnItemClick
    )

    return row
end

--------------------------------------------------
-- Apply Row State
--------------------------------------------------

local function ApplyRowState(
    row,
    item,
    wand
)
    local usable =
        IsUsable(item)

    row.requiredLevelText:SetTextColor(
        0.85,
        0.85,
        0.85
    )

    row.stateBackground:Hide()

    --------------------------------------------------
    -- Unusable wins over recommendation.
    --------------------------------------------------

    if not usable then
        row.stateBackground:SetTexture(
            UNUSABLE_R,
            UNUSABLE_G,
            UNUSABLE_B
        )

        row.stateBackground:SetAlpha(
            UNUSABLE_ALPHA
        )

        row.stateBackground:Show()

        row.requiredLevelText:SetTextColor(
            1.00,
            0.25,
            0.25
        )

        return
    end

    if IsRecommendedNow(wand) then
        row.stateBackground:SetTexture(
            RECOMMENDED_R,
            RECOMMENDED_G,
            RECOMMENDED_B
        )

        row.stateBackground:SetAlpha(
            RECOMMENDED_ALPHA
        )

        row.stateBackground:Show()
    end
end

--------------------------------------------------
-- Refresh Item Row
--------------------------------------------------

local function RefreshItemRow(
    row,
    itemID
)
    local item =
        PC.Data.Items[itemID]

    local wand =
        PC.Data.Wands[itemID]

    if not item
    or not wand then
        row:Hide()
        return
    end

    row.itemID = itemID

    local matchingSources =
        GetMatchingSources(itemID)

    local source =
        GetPrimarySource(
            matchingSources
        )

    row.sources = matchingSources
    row.source = source

    row.icon:SetTexture(
        PC.API.GetItemIcon(itemID)
    )

    row.nameText:SetText(
        GetQualityColor(
            item.quality
        ) ..
        PC.API.GetItemName(itemID) ..
        "|r"
    )

    row.dpsText:SetText(
        string.format(
            "%.2f",
            GetItemDPS(item)
        )
    )

    row.requiredLevelText:SetText(
        item.requiredLevel
        and tostring(
            item.requiredLevel
        )
        or "-"
    )

    row.recommendedText:SetText(
        GetRecommendedText(wand)
    )

    --------------------------------------------------
    -- Source
    --------------------------------------------------

    local sourceTexture
    local sourceLabel

    sourceTexture,
    sourceLabel =
        GetSourceVisual(source)

    row.sourceIcon:SetTexture(
        sourceTexture
    )

    row.sourceText:SetText(
        sourceLabel
    )

    --------------------------------------------------
    -- Aggregated Faction
    --------------------------------------------------

    local aggregateFaction =
        GetAggregateFaction(
            matchingSources
        )

    local factionTexture
    local factionLabel

    factionTexture,
    factionLabel =
        GetFactionVisual(
            aggregateFaction
        )

    if factionTexture then
        row.factionIcon:SetTexture(
            factionTexture
        )

        -- Crop a little transparent padding from the PvP crest textures
        -- so the visible emblem aligns better with the source text.
        row.factionIcon:SetTexCoord(
            0.08,
            0.92,
            0.08,
            0.92
        )

        row.factionIcon:Show()

        row.factionText:SetText(
            factionLabel
        )

        row.factionText:Show()
    else
        row.factionIcon:SetTexCoord(
            0,
            1,
            0,
            1
        )
        row.factionIcon:Hide()
        row.factionText:Hide()
    end

    --------------------------------------------------
    -- Aggregated Instance
    --------------------------------------------------

    local aggregateInstanceID =
        GetAggregateInstanceID(
            matchingSources
        )

    local instance = nil

    if aggregateInstanceID
    and PC.Data.Instances then
        instance =
            PC.Data.Instances[
                aggregateInstanceID
            ]
    end

    if instance then
        row.instanceIcon:SetTexture(
            instance.icon or
            "Interface\\Icons\\INV_Misc_Map_01"
        )

        if instance.iconCoords
        and table.getn(
            instance.iconCoords
        ) >= 4 then
            row.instanceIcon:SetTexCoord(
                instance.iconCoords[1],
                instance.iconCoords[2],
                instance.iconCoords[3],
                instance.iconCoords[4]
            )
        else
            row.instanceIcon:SetTexCoord(
                0,
                1,
                0,
                1
            )
        end

        row.instanceIcon:Show()

        row.instanceText:SetText(
            instance.shortName or
            instance.name or
            tostring(
                aggregateInstanceID
            )
        )

        row.instanceText:Show()
    else
        row.instanceIcon:Hide()
        row.instanceText:Hide()
    end

    ApplyRowState(
        row,
        item,
        wand
    )

    row:Show()
end

--------------------------------------------------
-- Sorting
--------------------------------------------------
-- Recommended level is the primary ascending key so the list remains a
-- progression. DPS breaks level ties; non-curated entries use required level.

local function GetRecommendedSortLevel(itemID)
    local wand =
        PC.Data.Wands[itemID]

    if wand
    and wand.recommended
    and wand.recommendedLevel
    and wand.recommendedLevel.min then
        return
            wand.recommendedLevel.min
    end

    local item =
        PC.Data.Items[itemID]

    if item
    and item.requiredLevel then
        return item.requiredLevel
    end

    return 0
end

local function SortWands(
    firstID,
    secondID
)
    local firstItem =
        PC.Data.Items[firstID]

    local secondItem =
        PC.Data.Items[secondID]

    local firstLevel =
        GetRecommendedSortLevel(
            firstID
        )

    local secondLevel =
        GetRecommendedSortLevel(
            secondID
        )

    if firstLevel ~= secondLevel then
        return firstLevel < secondLevel
    end

    local firstDPS =
        GetItemDPS(firstItem)

    local secondDPS =
        GetItemDPS(secondItem)

    if firstDPS ~= secondDPS then
        return firstDPS < secondDPS
    end

    local firstName =
        firstItem
        and firstItem.name
        or tostring(firstID)

    local secondName =
        secondItem
        and secondItem.name
        or tostring(secondID)

    firstName = string.lower(
        tostring(firstName)
    )

    secondName = string.lower(
        tostring(secondName)
    )

    if firstName ~= secondName then
        return firstName < secondName
    end

    return firstID < secondID
end

--------------------------------------------------
-- Refresh List
--------------------------------------------------

RefreshWandList =
    function(resetScroll)
        UpdatePlayerContext()

        --------------------------------------------------
        -- Player Display
        --------------------------------------------------

        local factionText =
            playerFaction or "Unknown"

        playerInfo:SetText(
            tostring(playerLevel)
        )

        if playerFaction == "Alliance" then
            playerFactionIcon:SetTexture(
                "Interface\\TargetingFrame\\UI-PVP-Alliance"
            )

            playerFactionIcon:Show()

        elseif playerFaction == "Horde" then
            playerFactionIcon:SetTexture(
                "Interface\\TargetingFrame\\UI-PVP-Horde"
            )

            playerFactionIcon:Show()

        else
            playerFactionIcon:Hide()
        end

        if filters.faction == "Auto" then
            UIDropDownMenu_SetText(
                "Auto (" ..
                factionText ..
                ")",
                factionDropdown
            )
        end

        --------------------------------------------------
        -- Collect Visible Items
        --------------------------------------------------

        local visibleItems = {}
        local itemID

        for itemID in pairs(PC.Data.Wands) do
            if ItemPassesFilters(
                itemID
            ) then
                visibleItems[
                    table.getn(
                        visibleItems
                    ) + 1
                ] = itemID
            end
        end

        table.sort(
            visibleItems,
            SortWands
        )

        --------------------------------------------------
        -- Rows
        --------------------------------------------------

        local i

        for i = 1,
            table.getn(visibleItems)
        do
            local row = rows[i]

            if not row then
                row = CreateItemRow()
                rows[i] = row
            end

            row:ClearAllPoints()

            row:SetPoint(
                "TOPLEFT",
                scrollChild,
                "TOPLEFT",
                0,
                -(
                    (i - 1) *
                    ROW_HEIGHT
                )
            )

            RefreshItemRow(
                row,
                visibleItems[i]
            )
        end

        for i =
            table.getn(visibleItems) + 1,
            table.getn(rows)
        do
            rows[i]:Hide()
        end

        local height =
            table.getn(visibleItems) *
            ROW_HEIGHT

        if height < 1 then
            height = 1
        end

        scrollChild:SetHeight(height)

        RefreshScrollRegion(
            resetScroll
        )
    end

--------------------------------------------------
-- Events
--------------------------------------------------

local eventFrame =
    CreateFrame("Frame")

if PC.Capabilities.classicAPI then
    eventFrame:RegisterEvent(
        "ITEM_DATA_LOAD_RESULT"
    )
end

eventFrame:RegisterEvent("PLAYER_LEVEL_UP")

eventFrame:SetScript(
    "OnEvent",
    function()
        if event == "ITEM_DATA_LOAD_RESULT" then
            local success = arg2

            if not success then
                return
            end
        end

        if mainFrame:IsShown() then
            RefreshWandList()

            if activeRow
            and activeRow.source
            and PC.UI.SourceTooltip then
                PC.UI.SourceTooltip.Show(
                    activeRow.itemID,
                    activeRow.source
                )
            end
        end
    end
)

--------------------------------------------------
-- Main Frame OnShow
--------------------------------------------------

mainFrame:SetScript(
    "OnShow",
    function()
        RefreshWandList(true)
    end
)
