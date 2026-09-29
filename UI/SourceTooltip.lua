-- Priest Companion
-- Source Tooltip
-- Custom acquisition tooltip shown above GameTooltip.

local PC = PriestCompanion

PC.UI.SourceTooltip =
    PC.UI.SourceTooltip or {}

local SourceTooltip =
    PC.UI.SourceTooltip

--------------------------------------------------
-- Layout
--------------------------------------------------

local TOOLTIP_DEFAULT_WIDTH = 310
local TOOLTIP_MIN_WIDTH = 250
local TOOLTIP_MAX_WIDTH = 420
local TOOLTIP_PADDING = 12
local ROW_HEIGHT = 20
local ICON_SIZE = 16
local ICON_TEXT_SPACE = 22
local TEXT_COLUMN_GAP = 12
local RIGHT_TEXT_MIN_WIDTH = 40
local RIGHT_TEXT_MAX_WIDTH = 120
local CONTENT_TOP = -34
local CONTENT_BOTTOM = 12
local TOOLTIP_GAP = 8

--------------------------------------------------
-- Colors
--------------------------------------------------

local function SetStatusColor(
    fontString,
    status
)
    if status == "good" then
        fontString:SetTextColor(
            0.25,
            1.00,
            0.25
        )

    elseif status == "bad" then
        fontString:SetTextColor(
            1.00,
            0.25,
            0.25
        )

    elseif status == "warn" then
        fontString:SetTextColor(
            1.00,
            0.82,
            0.00
        )

    else
        fontString:SetTextColor(
            0.90,
            0.90,
            0.90
        )
    end
end

--------------------------------------------------
-- Frame
--------------------------------------------------

local frame =
    CreateFrame(
        "Frame",
        "PriestCompanionSourceTooltip",
        UIParent
    )

frame:SetWidth(
    TOOLTIP_DEFAULT_WIDTH
)

frame:SetHeight(80)
frame:SetFrameStrata("TOOLTIP")

if frame.SetClampedToScreen then
    frame:SetClampedToScreen(true)
end

frame:SetBackdrop({
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

frame:SetBackdropColor(
    0.02,
    0.02,
    0.02,
    0.96
)

frame:SetBackdropBorderColor(
    0.35,
    0.35,
    0.35,
    1
)

frame:Hide()

--------------------------------------------------
-- Title
--------------------------------------------------

local title =
    frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

title:SetPoint(
    "TOPLEFT",
    frame,
    "TOPLEFT",
    12,
    -12
)

title:SetJustifyH("LEFT")

--------------------------------------------------
-- Text Measurement
--------------------------------------------------

local measureSmall =
    frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

measureSmall:Hide()

local measureTitle =
    frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

measureTitle:Hide()

local function GetMeasuredWidth(
    fontString,
    text
)
    fontString:SetText(
        text or ""
    )

    local width =
        fontString:GetStringWidth()
        or 0

    return width
end

--------------------------------------------------
-- Row Pool
--------------------------------------------------

local rows = {}
local visibleRows = 0

local function AcquireRow(index)
    local row = rows[index]

    if row then
        return row
    end

    row =
        CreateFrame(
            "Frame",
            nil,
            frame
        )

    row:SetHeight(
        ROW_HEIGHT
    )

    row.icon =
        row:CreateTexture(
            nil,
            "ARTWORK"
        )

    row.icon:SetWidth(
        ICON_SIZE
    )

    row.icon:SetHeight(
        ICON_SIZE
    )

    row.icon:SetPoint(
        "LEFT",
        row,
        "LEFT",
        0,
        0
    )

    row.leftText =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    row.leftText:SetPoint(
        "LEFT",
        row,
        "LEFT",
        ICON_TEXT_SPACE,
        0
    )

    row.leftText:SetWidth(190)
    row.leftText:SetJustifyH("LEFT")

    row.rightText =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    row.rightText:SetPoint(
        "RIGHT",
        row,
        "RIGHT",
        0,
        0
    )

    row.rightText:SetWidth(80)
    row.rightText:SetJustifyH("RIGHT")

    rows[index] = row

    return row
end

local function ClearRows()
    local i

    for i = 1, table.getn(rows) do
        rows[i]:Hide()
    end

    visibleRows = 0
end

local function AddRow(
    iconPath,
    leftText,
    rightText,
    status,
    section,
    rightStatus,
    iconCoords
)
    visibleRows =
        visibleRows + 1

    local row =
        AcquireRow(
            visibleRows
        )

    row.rawLeftText =
        leftText or ""

    row.rawRightText =
        rightText or ""

    row.isSection =
        section and true
        or false

    row.hasIcon =
        iconPath ~= nil
        and not row.isSection

    row:ClearAllPoints()

    row:SetPoint(
        "TOPLEFT",
        frame,
        "TOPLEFT",
        TOOLTIP_PADDING,
        CONTENT_TOP -
        ((visibleRows - 1) * ROW_HEIGHT)
    )

    row.leftText:ClearAllPoints()

    if row.isSection then
        row.icon:Hide()

        row.leftText:SetPoint(
            "LEFT",
            row,
            "LEFT",
            0,
            0
        )

        row.leftText:SetTextColor(
            1,
            0.82,
            0
        )

        row.rightText:SetTextColor(
            1,
            0.82,
            0
        )
    else
        if iconPath then
            row.icon:SetTexture(
                iconPath
            )

            if iconCoords
            and table.getn(
                iconCoords
            ) >= 4 then
                row.icon:SetTexCoord(
                    iconCoords[1],
                    iconCoords[2],
                    iconCoords[3],
                    iconCoords[4]
                )
            else
                row.icon:SetTexCoord(
                    0,
                    1,
                    0,
                    1
                )
            end

            row.icon:Show()
        else
            row.icon:Hide()
        end

        local leftOffset = 0

        if row.hasIcon then
            leftOffset =
                ICON_TEXT_SPACE
        end

        row.leftText:SetPoint(
            "LEFT",
            row,
            "LEFT",
            leftOffset,
            0
        )

        SetStatusColor(
            row.leftText,
            status
        )

        SetStatusColor(
            row.rightText,
            rightStatus or status
        )
    end

    row.leftText:SetText(
        row.rawLeftText
    )

    row.rightText:SetText(
        row.rawRightText
    )

    row:Show()
end

local function AddSection(text)
    AddRow(
        nil,
        text,
        "",
        "neutral",
        true
    )
end

--------------------------------------------------
-- Dynamic Width
--------------------------------------------------

local function Clamp(
    value,
    minimum,
    maximum
)
    if value < minimum then
        return minimum
    end

    if value > maximum then
        return maximum
    end

    return value
end

local function CalculateTooltipWidth()
    local width =
        GetMeasuredWidth(
            measureTitle,
            title:GetText() or ""
        ) +
        (TOOLTIP_PADDING * 2)

    local i

    for i = 1,
        visibleRows
    do
        local row = rows[i]

        local leftWidth =
            GetMeasuredWidth(
                measureSmall,
                row.rawLeftText
            )

        local rightWidth =
            GetMeasuredWidth(
                measureSmall,
                row.rawRightText
            )

        local contentWidth =
            leftWidth

        if row.hasIcon then
            contentWidth =
                contentWidth +
                ICON_TEXT_SPACE
        end

        if rightWidth > 0 then
            contentWidth =
                contentWidth +
                TEXT_COLUMN_GAP +
                rightWidth
        end

        contentWidth =
            contentWidth +
            (TOOLTIP_PADDING * 2)

        if contentWidth > width then
            width = contentWidth
        end
    end

    return Clamp(
        width,
        TOOLTIP_MIN_WIDTH,
        TOOLTIP_MAX_WIDTH
    )
end

local function ResizeRows(
    tooltipWidth
)
    local rowWidth =
        tooltipWidth -
        (TOOLTIP_PADDING * 2)

    local i

    for i = 1,
        visibleRows
    do
        local row = rows[i]

        row:SetWidth(
            rowWidth
        )

        local rightWidth = 0

        if row.rawRightText ~= "" then
            rightWidth =
                GetMeasuredWidth(
                    measureSmall,
                    row.rawRightText
                ) + 4

            rightWidth =
                Clamp(
                    rightWidth,
                    RIGHT_TEXT_MIN_WIDTH,
                    RIGHT_TEXT_MAX_WIDTH
                )
        end

        if rightWidth > 0 then
            row.rightText:SetWidth(
                rightWidth
            )
        else
            row.rightText:SetWidth(1)
        end

        row.leftText:ClearAllPoints()

        local leftOffset = 0

        if row.hasIcon then
            leftOffset =
                ICON_TEXT_SPACE
        end

        row.leftText:SetPoint(
            "LEFT",
            row,
            "LEFT",
            leftOffset,
            0
        )

        local leftWidth =
            rowWidth -
            leftOffset

        if rightWidth > 0 then
            leftWidth =
                leftWidth -
                rightWidth -
                TEXT_COLUMN_GAP
        end

        if leftWidth < 40 then
            leftWidth = 40
        end

        row.leftText:SetWidth(
            leftWidth
        )
    end
end

local function FinishLayout()
    local width =
        CalculateTooltipWidth()

    frame:SetWidth(
        width
    )

    ResizeRows(
        width
    )

    local height =
        44 +
        (visibleRows * ROW_HEIGHT) +
        CONTENT_BOTTOM

    if height < 70 then
        height = 70
    end

    frame:SetHeight(height)
end

--------------------------------------------------
-- Source Helpers
--------------------------------------------------

local function HasDetails(source)
    if not source then
        return false
    end

    if source.chainID
    or source.details then
        return true
    end

    if source.type == "quest"
    or source.type == "drop"
    or source.type == "vendor" then
        return true
    end

    return false
end

local function GetQuestChainSize(chainID)
    if not chainID
    or not PC.Data.QuestChains then
        return 0
    end

    local chain =
        PC.Data.QuestChains[chainID]

    if not chain
    or not chain.steps then
        return 0
    end

    return table.getn(chain.steps)
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

local function GetInstance(instanceID)
    if not instanceID
    or not PC.Data.Instances then
        return nil
    end

    return
        PC.Data.Instances[
            instanceID
        ]
end

local function AddInstanceRow(source)
    local instanceID =
        GetSourceInstanceID(source)

    local instance =
        GetInstance(instanceID)

    if not instance then
        return
    end

    local label = "Instance"

    if instance.type == "dungeon" then
        label = "Dungeon"
    elseif instance.type == "raid" then
        label = "Raid"
    end

    AddRow(
        instance.icon or
        "Interface\\Icons\\INV_Misc_Map_01",
        label,
        instance.name or
        tostring(instanceID),
        "neutral",
        false,
        nil,
        instance.iconCoords
    )
end

--------------------------------------------------
-- Craft Tooltip
--------------------------------------------------

local function BuildCraft(
    itemID,
    source
)
    title:SetText("Crafting")

    local professionIcon =
        "Interface\\Icons\\Trade_Engraving"

    local skill
    local maxSkill

    skill,
    maxSkill =
        PC.API.GetProfessionSkill(
            source.profession
        )

    local hasProfession =
        skill ~= nil

    local requiredSkill =
        source.skill or 0

    local skillReady =
        hasProfession
        and skill >= requiredSkill

    --------------------------------------------------
    -- Profession + Required Skill
    --------------------------------------------------

    AddRow(
        professionIcon,
        source.profession or "Profession",
        tostring(requiredSkill),
        hasProfession
        and "good"
        or "bad",
        false,
        skillReady
        and "good"
        or "bad"
    )

    --------------------------------------------------
    -- Reagents
    --------------------------------------------------

    if source.reagents
    and table.getn(source.reagents) > 0 then
        AddSection("Reagents")

        local i

        for i = 1,
            table.getn(source.reagents)
        do
            local reagent =
                source.reagents[i]

            local owned =
                PC.API.GetItemCount(
                    reagent.itemID
                )

            local required =
                reagent.amount or 1

            local ready =
                owned >= required

            AddRow(
                PC.API.GetItemIcon(
                    reagent.itemID
                ),

                PC.API.GetItemName(
                    reagent.itemID
                ),

                tostring(owned) ..
                " / " ..
                tostring(required),

                ready
                and "good"
                or "bad"
            )
        end
    end

    --------------------------------------------------
    -- Tools
    --------------------------------------------------

    if source.tools
    and table.getn(source.tools) > 0 then
        AddSection("Tools")

        local i

        for i = 1,
            table.getn(source.tools)
        do
            local tool =
                source.tools[i]

            local owned =
                PC.API.GetItemCount(
                    tool.itemID
                )

            local ready =
                owned > 0

            AddRow(
                PC.API.GetItemIcon(
                    tool.itemID
                ),

                PC.API.GetItemName(
                    tool.itemID
                ),

                ready
                and "Ready"
                or "Missing",

                ready
                and "good"
                or "bad"
            )
        end
    end
end

--------------------------------------------------
-- Quest Tooltip
--------------------------------------------------

local function BuildQuest(
    itemID,
    source
)
    title:SetText("Quest Reward")

    local quest

    if PC.Data.Quests then
        quest =
            PC.Data.Quests[
                source.questID
            ]
    end

    local questName =
        quest
        and quest.name
        or (
            "Quest " ..
            tostring(
                source.questID or "?"
            )
        )

    AddRow(
        "Interface\\GossipFrame\\AvailableQuestIcon",
        questName,
        "",
        "neutral"
    )

    AddInstanceRow(source)

    local questStatus =
        "unknown"

    if PC.QuestHistory
    and type(
        PC.QuestHistory.GetStatus
    ) == "function" then
        questStatus =
            PC.QuestHistory.GetStatus(
                source.questID,
                questName
            )
    else
        local completed =
            PC.API.IsQuestCompleted(
                source.questID
            )

        if completed == true then
            questStatus =
                "completed"

        elseif PC.API.IsQuestInLog(
            questName
        ) then
            questStatus =
                "in_progress"
        end
    end

    if questStatus ==
    "completed" then
        AddRow(
            "Interface\\GossipFrame\\ActiveQuestIcon",
            "Quest Status",
            "Completed",
            "good"
        )

    elseif questStatus ==
    "in_progress" then
        AddRow(
            "Interface\\GossipFrame\\ActiveQuestIcon",
            "Quest Status",
            "In progress",
            "warn"
        )

    else
        AddRow(
            "Interface\\GossipFrame\\AvailableQuestIcon",
            "Quest Status",
            "Unknown",
            "neutral"
        )
    end

    local faction =
        quest
        and quest.faction
        or source.faction
        or "Both"

    if faction ~= "Both" then
        local factionReady =
            PC.API.IsFactionCompatible(
                faction
            )

        local factionIcon =
            "Interface\\Icons\\INV_Misc_QuestionMark"

        if faction == "Alliance" then
            factionIcon =
                "Interface\\TargetingFrame\\UI-PVP-Alliance"

        elseif faction == "Horde" then
            factionIcon =
                "Interface\\TargetingFrame\\UI-PVP-Horde"
        end

        AddRow(
            factionIcon,
            "Faction",
            faction,

            factionReady
            and "good"
            or "bad"
        )
    end

    local requiredLevel =
        quest
        and quest.requiredLevel
        or source.requiredLevel

    if requiredLevel then
        local levelReady =
            PC.API.GetPlayerLevel() >=
            requiredLevel

        AddRow(
            PC.API.GetItemIcon(itemID),
            "Required Level",
            tostring(requiredLevel),
            levelReady
            and "good"
            or "bad"
        )
    end

    local chainSize =
        GetQuestChainSize(
            source.chainID
        )

    if chainSize > 1 then
        AddRow(
            "Interface\\GossipFrame\\AvailableQuestIcon",
            "Quest Chain",
            tostring(chainSize) ..
            " steps",
            "neutral"
        )
    end

    if HasDetails(source) then
        AddSection(
            "|cffffd100Left-click to view details|r"
        )
    end
end

--------------------------------------------------
-- Drop Tooltip
--------------------------------------------------

local function GetDropperIcon(source)
    return
        "Interface\\TargetingFrame\\UI-TargetingFrame-Skull"
end

local function BuildDrop(
    itemID,
    source
)
    title:SetText("Drop")

    AddRow(
        GetDropperIcon(source),
        "Dropped by",
        source.npcName
        or (
            "NPC " ..
            tostring(source.npcID or "?")
        ),
        "neutral"
    )

    AddInstanceRow(source)

    if not source.instanceID
    and source.zone then
        AddRow(
            "Interface\\Icons\\INV_Misc_Map_01",
            "Location",
            source.zone,
            "neutral"
        )
    end

    if source.dropChance then
        AddRow(
            "Interface\\Icons\\INV_Misc_Bag_10",
            "Drop Chance",
            string.format(
                "%.2f%%",
                source.dropChance
            ),
            "neutral"
        )
    end

    if source.faction
    and source.faction ~= "Both" then
        local factionReady =
            PC.API.IsFactionCompatible(
                source.faction
            )

        AddRow(
            source.faction == "Horde"
            and "Interface\\TargetingFrame\\UI-PVP-Horde"
            or "Interface\\TargetingFrame\\UI-PVP-Alliance",

            "Faction",
            source.faction,

            factionReady
            and "good"
            or "bad"
        )
    end

    if HasDetails(source) then
        AddSection(
            "|cffffd100Left-click to view details|r"
        )
    end
end

--------------------------------------------------
-- Vendor Tooltip
--------------------------------------------------

local function BuildVendor(
    itemID,
    source
)
    title:SetText("Vendor")

    AddRow(
        "Interface\\Icons\\INV_Misc_Coin_01",
        source.npcName or "Vendor",
        source.zone or "",
        "neutral"
    )

    if source.priceText then
        AddRow(
            "Interface\\Icons\\INV_Misc_Coin_01",
            "Price",
            source.priceText,
            "neutral"
        )
    end

    if source.faction
    and source.faction ~= "Both" then
        local factionReady =
            PC.API.IsFactionCompatible(
                source.faction
            )

        AddRow(
            source.faction == "Horde"
            and "Interface\\TargetingFrame\\UI-PVP-Horde"
            or "Interface\\TargetingFrame\\UI-PVP-Alliance",

            "Faction",
            source.faction,

            factionReady
            and "good"
            or "bad"
        )
    end

    if HasDetails(source) then
        AddSection(
            "|cffffd100Left-click to view details|r"
        )
    end
end

--------------------------------------------------
-- Smart Positioning
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

local function GetBestSide(
    reference,
    floatingFrame,
    preferredSides
)
    local left
    local right
    local top
    local bottom

    left,
    right,
    top,
    bottom =
        GetFrameEdges(reference)

    if not left then
        return preferredSides[1]
    end

    local screenWidth =
        UIParent:GetWidth()

    local screenHeight =
        UIParent:GetHeight()

    local floatingWidth =
        floatingFrame:GetWidth()
        or TOOLTIP_DEFAULT_WIDTH

    local floatingHeight =
        floatingFrame:GetHeight()
        or 80

    --------------------------------------------------
    -- Test the full candidate rectangle.
    -- TOP and BOTTOM preserve the LEFT edge shared
    -- with GameTooltip. RIGHT and LEFT preserve the
    -- TOP edge.
    --------------------------------------------------

    local function Fits(side)
        local candidateLeft
        local candidateRight
        local candidateTop
        local candidateBottom

        if side == "TOP" then
            candidateLeft = left
            candidateRight =
                candidateLeft +
                floatingWidth

            candidateBottom =
                top +
                TOOLTIP_GAP

            candidateTop =
                candidateBottom +
                floatingHeight

        elseif side == "BOTTOM" then
            candidateLeft = left
            candidateRight =
                candidateLeft +
                floatingWidth

            candidateTop =
                bottom -
                TOOLTIP_GAP

            candidateBottom =
                candidateTop -
                floatingHeight

        elseif side == "RIGHT" then
            candidateLeft =
                right +
                TOOLTIP_GAP

            candidateRight =
                candidateLeft +
                floatingWidth

            candidateTop = top
            candidateBottom =
                candidateTop -
                floatingHeight

        else
            candidateRight =
                left -
                TOOLTIP_GAP

            candidateLeft =
                candidateRight -
                floatingWidth

            candidateTop = top
            candidateBottom =
                candidateTop -
                floatingHeight
        end

        return
            candidateLeft >= 0
            and candidateRight <= screenWidth
            and candidateBottom >= 0
            and candidateTop <= screenHeight
    end

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
    -- Extreme case: choose the side with the most
    -- primary-axis room. Screen clamping remains the
    -- final safety net.
    --------------------------------------------------

    local spaces = {
        TOP =
            screenHeight - top,

        BOTTOM = bottom,

        RIGHT =
            screenWidth - right,

        LEFT = left
    }

    local bestSide =
        preferredSides[1]

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

local function PositionAroundGameTooltip()
    --------------------------------------------------
    -- Default layout:
    --
    -- [ Source Tooltip ]
    -- [ GameTooltip    ]
    --
    -- Both share the same LEFT edge. Only change the
    -- source position when the complete frame would
    -- leave the visible screen area.
    --------------------------------------------------

    local preferredSides = {
        "TOP",
        "BOTTOM",
        "RIGHT",
        "LEFT"
    }

    local side =
        GetBestSide(
            GameTooltip,
            frame,
            preferredSides
        )

    frame:ClearAllPoints()

    if side == "BOTTOM" then
        frame:SetPoint(
            "TOPLEFT",
            GameTooltip,
            "BOTTOMLEFT",
            0,
            -TOOLTIP_GAP
        )

    elseif side == "RIGHT" then
        frame:SetPoint(
            "TOPLEFT",
            GameTooltip,
            "TOPRIGHT",
            TOOLTIP_GAP,
            0
        )

    elseif side == "LEFT" then
        frame:SetPoint(
            "TOPRIGHT",
            GameTooltip,
            "TOPLEFT",
            -TOOLTIP_GAP,
            0
        )

    else
        frame:SetPoint(
            "BOTTOMLEFT",
            GameTooltip,
            "TOPLEFT",
            0,
            TOOLTIP_GAP
        )
    end
end

--------------------------------------------------
-- Public API
--------------------------------------------------

local activeItemID = nil
local activeSource = nil

function SourceTooltip.Show(
    itemID,
    source
)
    if not itemID
    or not source then
        SourceTooltip.Hide()
        return
    end

    activeItemID = itemID
    activeSource = source

    ClearRows()

    if source.type == "craft" then
        BuildCraft(
            itemID,
            source
        )

    elseif source.type == "quest" then
        BuildQuest(
            itemID,
            source
        )

    elseif source.type == "drop" then
        BuildDrop(
            itemID,
            source
        )

    elseif source.type == "vendor" then
        BuildVendor(
            itemID,
            source
        )

    else
        title:SetText("Source")

        AddRow(
            "Interface\\Icons\\INV_Misc_QuestionMark",
            tostring(source.type or "Unknown"),
            "",
            "neutral"
        )
    end

    FinishLayout()

    PositionAroundGameTooltip()

    frame:Show()
end

function SourceTooltip.Hide()
    activeItemID = nil
    activeSource = nil

    frame:Hide()
end

function SourceTooltip.Refresh()
    if activeItemID
    and activeSource
    and frame:IsShown() then
        SourceTooltip.Show(
            activeItemID,
            activeSource
        )
    end
end

function SourceTooltip.HasDetails(source)
    return HasDetails(source)
end

--------------------------------------------------
-- Dynamic Updates
--------------------------------------------------

local eventFrame =
    CreateFrame("Frame")

eventFrame:RegisterEvent("BAG_UPDATE")
eventFrame:RegisterEvent("SKILL_LINES_CHANGED")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")

eventFrame:SetScript(
    "OnEvent",
    function()
        if frame:IsShown() then
            SourceTooltip.Refresh()
        end
    end
)
