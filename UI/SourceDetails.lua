-- Priest Companion
-- Source Details Panel
-- Expanded acquisition details opened from Wand Progression.
-- Quest sources use a collapsible, cascading journal layout.

local PC = PriestCompanion
local mainFrame = PC.UI.MainFrame

if not mainFrame then
    return
end

PC.UI.SourceDetails =
    PC.UI.SourceDetails or {}

local SourceDetails =
    PC.UI.SourceDetails

--------------------------------------------------
-- Layout
--------------------------------------------------

local PANEL_LEFT = 25
local PANEL_TOP = -55
local PANEL_RIGHT = -25
local PANEL_BOTTOM = 25

local CONTENT_WIDTH = 414
local CARD_WIDTH = 410
local CARD_PADDING = 10
local CHAIN_INDENT = 20
local CONNECTOR_HEIGHT = 25

local HEADER_HEIGHT = 52
local MIN_EXPANDED_HEIGHT = 120

local ITEM_ROW_HEIGHT = 26
local GAIN_ROW_HEIGHT = 20

local QUEST_ICON_SIZE = 22
local TOGGLE_SIZE = 16
local INSTANCE_ICON_SIZE = 20

local MAP_BUTTON_WIDTH = 82
local MAP_BUTTON_HEIGHT = 20

local SCROLL_RIGHT = -28
local SCROLL_BOTTOM = 14

--------------------------------------------------
-- Reward Colors
--------------------------------------------------

local XP_R = 1.00
local XP_G = 0.82
local XP_B = 0.00

local REP_R = 0.25
local REP_G = 1.00
local REP_B = 0.25

--------------------------------------------------
-- State
--------------------------------------------------

local activeItemID = nil
local activeSource = nil
local expandedQuests = {}

local Refresh

--------------------------------------------------
-- Helpers
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
            0.85,
            0.85,
            0.85
        )
    end
end

local function GetTextHeight(fontString)
    local height =
        fontString:GetStringHeight()
        or 0

    if height < 12 then
        height = 12
    end

    return height
end

local function FormatQuestText(text)
    if not text then
        return ""
    end

    local playerName =
        UnitName("player") or "player"

    local className =
        UnitClass("player") or "class"

    text =
        string.gsub(
            text,
            "<name>",
            playerName
        )

    text =
        string.gsub(
            text,
            "<class>",
            className
        )

    return text
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

local function ApplyTexture(
    texture,
    path,
    coords
)
    texture:SetTexture(
        path or
        "Interface\\Icons\\INV_Misc_QuestionMark"
    )

    if coords
    and table.getn(coords) >= 4 then
        texture:SetTexCoord(
            coords[1],
            coords[2],
            coords[3],
            coords[4]
        )
    else
        texture:SetTexCoord(
            0,
            1,
            0,
            1
        )
    end
end


--------------------------------------------------
-- NPC Resolution
--------------------------------------------------

local function GetNPC(npcReference)
    if not npcReference then
        return nil
    end

    --------------------------------------------------
    -- Backwards compatibility
    --------------------------------------------------
    --
    -- Older quest records may still contain the
    -- complete NPC table directly. Keeping support
    -- for that format lets us migrate quest data
    -- gradually without breaking existing entries.
    --------------------------------------------------

    if type(npcReference) == "table" then
        return npcReference
    end

    --------------------------------------------------
    -- NPC ID
    --------------------------------------------------

    local npcID = tonumber(npcReference)

    if not npcID then
        return nil
    end

    if not PC.Data
    or not PC.Data.NPCs then
        return nil
    end

    return PC.Data.NPCs[npcID]
end

--------------------------------------------------
-- Quest Status
--------------------------------------------------

local function GetQuestStatus(
    questID,
    quest,
    fallbackFaction
)
    local questName =
        quest
        and quest.name

    local historyStatus =
        "unknown"

    if PC.QuestHistory
    and type(
        PC.QuestHistory.GetStatus
    ) == "function" then
        historyStatus =
            PC.QuestHistory.GetStatus(
                questID,
                questName
            )
    else
        local completed =
            PC.API.IsQuestCompleted(
                questID
            )

        if completed == true then
            historyStatus =
                "completed"

        elseif questName
        and PC.API.IsQuestInLog(
            questName
        ) then
            historyStatus =
                "in_progress"
        end
    end

    if historyStatus ==
    "completed" then
        return
            "Completed",
            "good"
    end

    if historyStatus ==
    "in_progress" then
        return
            "In Progress",
            "warn"
    end

    local faction =
        quest
        and quest.faction
        or fallbackFaction
        or "Both"

    if not PC.API.IsFactionCompatible(
        faction
    ) then
        return
            "Wrong Faction",
            "bad"
    end

    local requiredLevel =
        quest
        and quest.requiredLevel

    if requiredLevel
    and PC.API.GetPlayerLevel() <
    requiredLevel then
        return
            "Level " ..
            tostring(requiredLevel),
            "bad"
    end

    -- Vanilla-style clients cannot prove that an arbitrary quest was
    -- never completed. If it is neither active nor known completed,
    -- keep the state explicitly unknown instead of claiming Not Started.
    return
        "Unknown",
        "neutral"
end

--------------------------------------------------
-- Map Integration
--------------------------------------------------

local function ShowNPCOnMap(
    npc,
    questName,
    label
)
    if not npc then
        return
    end

    local markerType =
        "questStart"

    if label == "End" then
        markerType =
            "questEnd"
    end

    if PC.Map
    and type(
        PC.Map.ShowNPC
    ) == "function" then
        local success =
            PC.Map.ShowNPC(
                npc,
                markerType,
                questName
            )

        if success then
            return
        end
    end

    local text =
        "|cff66ccffPriest Companion:|r " ..
        tostring(label or "Location") ..
        ": " ..
        tostring(
            npc.name or "Unknown NPC"
        )

    if npc.zone then
        text =
            text ..
            " - " ..
            tostring(npc.zone)
    end

    DEFAULT_CHAT_FRAME:AddMessage(
        text
    )
end

--------------------------------------------------
-- Item Tooltip Helpers
--------------------------------------------------

local function ShowItemTooltip()
    local button = this

    if not button.itemID then
        return
    end

    GameTooltip:SetOwner(
        button,
        "ANCHOR_RIGHT"
    )

    PC.API.SetItemTooltip(
        GameTooltip,
        button.itemID
    )

    GameTooltip:Show()
end

local function HideItemTooltip()
    GameTooltip:Hide()
end

--------------------------------------------------
-- Main Panel
--------------------------------------------------

local frame =
    CreateFrame(
        "Frame",
        nil,
        mainFrame
    )

frame:SetPoint(
    "TOPLEFT",
    mainFrame,
    "TOPLEFT",
    PANEL_LEFT,
    PANEL_TOP
)

frame:SetPoint(
    "BOTTOMRIGHT",
    mainFrame,
    "BOTTOMRIGHT",
    PANEL_RIGHT,
    PANEL_BOTTOM
)

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
    0.03,
    0.03,
    0.03,
    0.96
)

frame:SetBackdropBorderColor(
    0.30,
    0.30,
    0.30,
    1
)

frame:Hide()

--------------------------------------------------
-- Back Button
--------------------------------------------------

local backButton =
    CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelButtonTemplate"
    )

backButton:SetWidth(70)
backButton:SetHeight(22)

backButton:SetPoint(
    "TOPLEFT",
    frame,
    "TOPLEFT",
    12,
    -12
)

backButton:SetText("Back")

backButton:SetScript(
    "OnClick",
    function()
        frame:Hide()

        if PC.UI.WandPanel then
            PC.UI.WandPanel:Show()
        end
    end
)

--------------------------------------------------
-- Header
--------------------------------------------------

local panelTitle =
    frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

panelTitle:SetPoint(
    "TOP",
    frame,
    "TOP",
    0,
    -16
)

panelTitle:SetText(
    "Source Details"
)

local itemIcon =
    frame:CreateTexture(
        nil,
        "ARTWORK"
    )

itemIcon:SetWidth(32)
itemIcon:SetHeight(32)

itemIcon:SetPoint(
    "TOPLEFT",
    frame,
    "TOPLEFT",
    16,
    -48
)

local itemName =
    frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

itemName:SetPoint(
    "LEFT",
    itemIcon,
    "RIGHT",
    8,
    0
)

itemName:SetWidth(280)
itemName:SetJustifyH("LEFT")

local sourceTitle =
    frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

sourceTitle:SetPoint(
    "TOPLEFT",
    itemIcon,
    "BOTTOMLEFT",
    0,
    -8
)

sourceTitle:SetWidth(CONTENT_WIDTH)
sourceTitle:SetJustifyH("LEFT")

--------------------------------------------------
-- Scroll Frame
--------------------------------------------------

local scrollFrame =
    CreateFrame(
        "ScrollFrame",
        "PriestCompanionSourceDetailsScrollFrame",
        frame,
        "UIPanelScrollFrameTemplate"
    )

scrollFrame:SetPoint(
    "TOPLEFT",
    sourceTitle,
    "BOTTOMLEFT",
    0,
    -8
)

scrollFrame:SetPoint(
    "BOTTOMRIGHT",
    frame,
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

scrollChild:SetWidth(CONTENT_WIDTH)
scrollChild:SetHeight(1)

scrollFrame:SetScrollChild(
    scrollChild
)

--------------------------------------------------
-- Dynamic Pools
--------------------------------------------------

local questCards = {}
local connectors = {}
local genericRows = {}

local visibleQuestCards = 0
local visibleConnectors = 0
local visibleGenericRows = 0

--------------------------------------------------
-- Quest Card
--------------------------------------------------

local function ToggleQuestCard()
    local button = this

    if not button.questID then
        return
    end

    if expandedQuests[
        button.questID
    ] then
        expandedQuests[
            button.questID
        ] = nil
    else
        expandedQuests[
            button.questID
        ] = true
    end

    Refresh()
end

local function AcquireQuestCard(index)
    local card =
        questCards[index]

    if card then
        return card
    end

    card =
        CreateFrame(
            "Frame",
            nil,
            scrollChild
        )

    card:SetBackdrop({
        bgFile =
            "Interface\\Tooltips\\UI-Tooltip-Background",

        edgeFile =
            "Interface\\Tooltips\\UI-Tooltip-Border",

        tile = true,
        tileSize = 16,
        edgeSize = 12,

        insets = {
            left = 3,
            right = 3,
            top = 3,
            bottom = 3
        }
    })

    card:SetBackdropColor(
        0.055,
        0.055,
        0.055,
        0.94
    )

    card:SetBackdropBorderColor(
        0.28,
        0.28,
        0.28,
        1
    )

    --------------------------------------------------
    -- Clickable Header
    --------------------------------------------------

    card.headerButton =
        CreateFrame(
            "Button",
            nil,
            card
        )

    card.headerButton:SetPoint(
        "TOPLEFT",
        card,
        "TOPLEFT",
        4,
        -4
    )

    card.headerButton:SetPoint(
        "TOPRIGHT",
        card,
        "TOPRIGHT",
        -4,
        -4
    )

    card.headerButton:SetHeight(
        HEADER_HEIGHT - 8
    )

    card.headerButton:SetScript(
        "OnClick",
        ToggleQuestCard
    )

    card.headerHighlight =
        card.headerButton:CreateTexture(
            nil,
            "HIGHLIGHT"
        )

    card.headerHighlight:SetAllPoints(
        card.headerButton
    )

    card.headerHighlight:SetTexture(
        1,
        1,
        1,
        0.04
    )

    --------------------------------------------------
    -- Plus / Minus
    --------------------------------------------------

    card.toggleIcon =
        card.headerButton:CreateTexture(
            nil,
            "ARTWORK"
        )

    card.toggleIcon:SetWidth(
        TOGGLE_SIZE
    )

    card.toggleIcon:SetHeight(
        TOGGLE_SIZE
    )

    card.toggleIcon:SetPoint(
        "TOPLEFT",
        card.headerButton,
        "TOPLEFT",
        4,
        -5
    )

    --------------------------------------------------
    -- Quest Icon
    --------------------------------------------------

    card.questIcon =
        card.headerButton:CreateTexture(
            nil,
            "ARTWORK"
        )

    card.questIcon:SetWidth(
        QUEST_ICON_SIZE
    )

    card.questIcon:SetHeight(
        QUEST_ICON_SIZE
    )

    card.questIcon:SetPoint(
        "LEFT",
        card.toggleIcon,
        "RIGHT",
        4,
        0
    )

    card.questIcon:SetTexture(
        "Interface\\GossipFrame\\AvailableQuestIcon"
    )

    --------------------------------------------------
    -- Quest Title
    --------------------------------------------------

    card.title =
        card.headerButton:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontNormal"
        )

    card.title:SetPoint(
        "TOPLEFT",
        card.questIcon,
        "TOPRIGHT",
        6,
        -1
    )

    card.title:SetJustifyH("LEFT")

    --------------------------------------------------
    -- Status
    --------------------------------------------------

    card.status =
        card.headerButton:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    card.status:SetPoint(
        "TOPRIGHT",
        card.headerButton,
        "TOPRIGHT",
        -5,
        -7
    )

    card.status:SetWidth(88)
    card.status:SetJustifyH("RIGHT")

    --------------------------------------------------
    -- Meta
    --------------------------------------------------

    card.meta =
        card.headerButton:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    card.meta:SetPoint(
        "TOPLEFT",
        card.title,
        "BOTTOMLEFT",
        0,
        -4
    )

    card.meta:SetJustifyH("LEFT")
    card.meta:SetTextColor(
        0.72,
        0.72,
        0.72
    )

    --------------------------------------------------
    -- Instance Badge
    --------------------------------------------------

    card.instanceIcon =
        card.headerButton:CreateTexture(
            nil,
            "ARTWORK"
        )

    card.instanceIcon:SetWidth(
        INSTANCE_ICON_SIZE
    )

    card.instanceIcon:SetHeight(
        INSTANCE_ICON_SIZE
    )

    card.instanceText =
        card.headerButton:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    card.instanceText:SetJustifyH(
        "LEFT"
    )

    --------------------------------------------------
    -- Start / End rows
    --------------------------------------------------

    card.startLabel =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    card.startLabel:SetJustifyH("LEFT")

    card.endLabel =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    card.endLabel:SetJustifyH("LEFT")

    card.showStart =
        CreateFrame(
            "Button",
            nil,
            card,
            "UIPanelButtonTemplate"
        )

    card.showStart:SetWidth(
        MAP_BUTTON_WIDTH
    )

    card.showStart:SetHeight(
        MAP_BUTTON_HEIGHT
    )

    card.showStart:SetText(
        "Show Start"
    )

    card.showStart:SetScript(
        "OnClick",
        function()
            local button = this
            local parent =
                button:GetParent()

            ShowNPCOnMap(
                parent.startNPC,
                parent.questName,
                "Start"
            )
        end
    )

    card.showEnd =
        CreateFrame(
            "Button",
            nil,
            card,
            "UIPanelButtonTemplate"
        )

    card.showEnd:SetWidth(
        MAP_BUTTON_WIDTH
    )

    card.showEnd:SetHeight(
        MAP_BUTTON_HEIGHT
    )

    card.showEnd:SetText(
        "Show End"
    )

    card.showEnd:SetScript(
        "OnClick",
        function()
            local button = this
            local parent =
                button:GetParent()

            ShowNPCOnMap(
                parent.endNPC,
                parent.questName,
                "End"
            )
        end
    )

    --------------------------------------------------
    -- Description
    --------------------------------------------------

    card.descriptionHeader =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontNormalSmall"
        )

    card.descriptionHeader:SetText(
        "Description"
    )

    card.description =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    card.description:SetJustifyH("LEFT")
    card.description:SetJustifyV("TOP")

    --------------------------------------------------
    -- Objectives
    --------------------------------------------------

    card.objectivesHeader =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontNormalSmall"
        )

    card.objectivesHeader:SetText(
        "Objectives"
    )

    card.objectivesText =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    card.objectivesText:SetJustifyH("LEFT")
    card.objectivesText:SetJustifyV("TOP")

    --------------------------------------------------
    -- Rewards
    --------------------------------------------------

    card.rewardsHeader =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontNormalSmall"
        )

    card.rewardsHeader:SetText(
        "Rewards"
    )

    card.rewardMode =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    card.rewardMode:SetTextColor(
        0.72,
        0.72,
        0.72
    )

    --------------------------------------------------
    -- Gains
    --------------------------------------------------

    card.gainsHeader =
        card:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontNormalSmall"
        )

    card.gainsHeader:SetText(
        "Gains"
    )

    card.objectiveRows = {}
    card.rewardRows = {}
    card.gainRows = {}

    questCards[index] = card

    return card
end

--------------------------------------------------
-- Item Rows
--------------------------------------------------

local function AcquireItemRow(
    pool,
    parent,
    index
)
    local row =
        pool[index]

    if row then
        return row
    end

    row =
        CreateFrame(
            "Button",
            nil,
            parent
        )

    row:SetHeight(
        ITEM_ROW_HEIGHT
    )

    row.icon =
        row:CreateTexture(
            nil,
            "ARTWORK"
        )

    row.icon:SetWidth(20)
    row.icon:SetHeight(20)

    row.icon:SetPoint(
        "LEFT",
        row,
        "LEFT",
        0,
        0
    )

    row.name =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    row.name:SetPoint(
        "LEFT",
        row.icon,
        "RIGHT",
        6,
        0
    )

    row.name:SetJustifyH("LEFT")

    row.value =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    row.value:SetPoint(
        "RIGHT",
        row,
        "RIGHT",
        0,
        0
    )

    row.value:SetWidth(56)
    row.value:SetJustifyH("RIGHT")

    row.highlight =
        row:CreateTexture(
            nil,
            "HIGHLIGHT"
        )

    row.highlight:SetAllPoints(row)

    row.highlight:SetTexture(
        1,
        1,
        1,
        0.05
    )

    row:SetScript(
        "OnEnter",
        ShowItemTooltip
    )

    row:SetScript(
        "OnLeave",
        HideItemTooltip
    )

    pool[index] = row

    return row
end

local function AcquireObjectiveRow(
    card,
    index
)
    return
        AcquireItemRow(
            card.objectiveRows,
            card,
            index
        )
end

local function AcquireRewardRow(
    card,
    index
)
    return
        AcquireItemRow(
            card.rewardRows,
            card,
            index
        )
end

local function AcquireGainRow(
    card,
    index
)
    local row =
        card.gainRows[index]

    if row then
        return row
    end

    row =
        CreateFrame(
            "Frame",
            nil,
            card
        )

    row:SetHeight(
        GAIN_ROW_HEIGHT
    )

    row.label =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    row.label:SetPoint(
        "LEFT",
        row,
        "LEFT",
        0,
        0
    )

    row.label:SetJustifyH("LEFT")

    row.value =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    row.value:SetPoint(
        "RIGHT",
        row,
        "RIGHT",
        0,
        0
    )

    row.value:SetWidth(70)
    row.value:SetJustifyH("RIGHT")

    card.gainRows[index] = row

    return row
end

local function HideCardContent(card)
    card.startLabel:Hide()
    card.endLabel:Hide()
    card.showStart:Hide()
    card.showEnd:Hide()

    card.descriptionHeader:Hide()
    card.description:Hide()

    card.objectivesHeader:Hide()
    card.objectivesText:Hide()

    card.rewardsHeader:Hide()
    card.rewardMode:Hide()

    card.gainsHeader:Hide()

    local i

    for i = 1,
        table.getn(
            card.objectiveRows
        )
    do
        card.objectiveRows[i]:Hide()
    end

    for i = 1,
        table.getn(
            card.rewardRows
        )
    do
        card.rewardRows[i]:Hide()
    end

    for i = 1,
        table.getn(
            card.gainRows
        )
    do
        card.gainRows[i]:Hide()
    end
end

--------------------------------------------------
-- Quest Card Population
--------------------------------------------------

local function PopulateQuestCard(
    card,
    questID,
    source,
    activeItemID,
    depth
)
    HideCardContent(card)

    local quest = nil

    if PC.Data.Quests then
        quest =
            PC.Data.Quests[
                questID
            ]
    end

    local questName =
        quest
        and quest.name
        or (
            "Quest " ..
            tostring(questID)
        )

    card.questName = questName
    card.startNPC =
        quest
        and GetNPC(
            quest.startNPC
        )

    card.endNPC =
        quest
        and GetNPC(
            quest.endNPC
        )

    card.headerButton.questID =
        questID

    local expanded =
        expandedQuests[
            questID
        ] and true
        or false

    if expanded then
        card.toggleIcon:SetTexture(
            "Interface\\Buttons\\UI-MinusButton-UP"
        )
    else
        card.toggleIcon:SetTexture(
            "Interface\\Buttons\\UI-PlusButton-UP"
        )
    end

    card.title:SetText(
        questName
    )

    local statusText
    local status

    statusText,
    status =
        GetQuestStatus(
            questID,
            quest,
            source.faction
        )

    card.status:SetText(
        statusText
    )

    SetStatusColor(
        card.status,
        status
    )

    --------------------------------------------------
    -- Dynamic width from chain indentation
    --------------------------------------------------

    local cardWidth =
        CARD_WIDTH -
        (depth * CHAIN_INDENT)

    if cardWidth < 300 then
        cardWidth = 300
    end

    local bodyWidth =
        cardWidth -
        (CARD_PADDING * 2)

    card:SetWidth(
        cardWidth
    )

    card.title:SetWidth(
        cardWidth - 180
    )

    card.meta:SetWidth(
        bodyWidth - 130
    )

    card.description:SetWidth(
        bodyWidth
    )

    card.objectivesText:SetWidth(
        bodyWidth
    )

    --------------------------------------------------
    -- Meta
    --------------------------------------------------

    local metaText = ""

    if quest then
        if quest.questLevel then
            metaText =
                "Level " ..
                tostring(
                    quest.questLevel
                )
        end

        if quest.requiredLevel then
            if metaText ~= "" then
                metaText =
                    metaText ..
                    "  |  "
            end

            metaText =
                metaText ..
                "Req " ..
                tostring(
                    quest.requiredLevel
                )
        end
    end

    card.meta:SetText(
        metaText
    )

    --------------------------------------------------
    -- Instance badge in header
    --------------------------------------------------

    local instance =
        quest
        and GetInstance(
            quest.instanceID
        )

    if instance then
        card.instanceIcon:ClearAllPoints()

        card.instanceIcon:SetPoint(
            "TOPRIGHT",
            card.headerButton,
            "TOPRIGHT",
            -92,
            -24
        )

        ApplyTexture(
            card.instanceIcon,
            instance.icon,
            instance.iconCoords
        )

        card.instanceIcon:Show()

        card.instanceText:ClearAllPoints()

        card.instanceText:SetPoint(
            "LEFT",
            card.instanceIcon,
            "RIGHT",
            2,
            0
        )

        card.instanceText:SetText(
            instance.shortName or
            instance.name or
            "Instance"
        )

        card.instanceText:Show()
    else
        card.instanceIcon:Hide()
        card.instanceText:Hide()
    end

    --------------------------------------------------
    -- Collapsed
    --------------------------------------------------

    if not expanded then
        card:SetHeight(
            HEADER_HEIGHT
        )

        card:Show()

        return HEADER_HEIGHT
    end

    --------------------------------------------------
    -- Expanded Content
    --------------------------------------------------

    local y =
        -HEADER_HEIGHT - 7

    --------------------------------------------------
    -- Start
    --------------------------------------------------

    if card.startNPC then
        card.startLabel:ClearAllPoints()

        card.startLabel:SetPoint(
            "TOPLEFT",
            card,
            "TOPLEFT",
            CARD_PADDING,
            y
        )

        card.startLabel:SetWidth(
            bodyWidth -
            MAP_BUTTON_WIDTH -
            8
        )

        local startText =
            "Starts: " ..
            tostring(
                card.startNPC.name or
                "Unknown"
            )

        if card.startNPC.zone then
            startText =
                startText ..
                " - " ..
                tostring(
                    card.startNPC.zone
                )
        end

        card.startLabel:SetText(
            startText
        )

        card.startLabel:Show()

        card.showStart:ClearAllPoints()

        card.showStart:SetPoint(
            "TOPRIGHT",
            card,
            "TOPRIGHT",
            -CARD_PADDING,
            y + 4
        )

        card.showStart:Show()

        y = y - 25
    end

    --------------------------------------------------
    -- End
    --------------------------------------------------

    if card.endNPC then
        card.endLabel:ClearAllPoints()

        card.endLabel:SetPoint(
            "TOPLEFT",
            card,
            "TOPLEFT",
            CARD_PADDING,
            y
        )

        card.endLabel:SetWidth(
            bodyWidth -
            MAP_BUTTON_WIDTH -
            8
        )

        local endText =
            "Ends: " ..
            tostring(
                card.endNPC.name or
                "Unknown"
            )

        if card.endNPC.zone then
            endText =
                endText ..
                " - " ..
                tostring(
                    card.endNPC.zone
                )
        end

        card.endLabel:SetText(
            endText
        )

        card.endLabel:Show()

        card.showEnd:ClearAllPoints()

        card.showEnd:SetPoint(
            "TOPRIGHT",
            card,
            "TOPRIGHT",
            -CARD_PADDING,
            y + 4
        )

        card.showEnd:Show()

        y = y - 29
    end

    --------------------------------------------------
    -- Live/static quest text
    --------------------------------------------------

    local logDescription = nil
    local logObjectives = nil

    if quest
    and PC.API.GetQuestLogText then
        logDescription,
        logObjectives =
            PC.API.GetQuestLogText(
                quest.name
            )
    end

    local descriptionText =
        logDescription

    if not descriptionText
    or descriptionText == "" then
        descriptionText =
            quest
            and (
                quest.description or
                quest.summary
            )
            or "No description available."
    end

    descriptionText =
        FormatQuestText(
            descriptionText
        )

    card.descriptionHeader:ClearAllPoints()

    card.descriptionHeader:SetPoint(
        "TOPLEFT",
        card,
        "TOPLEFT",
        CARD_PADDING,
        y
    )

    card.descriptionHeader:Show()

    y = y - 17

    card.description:ClearAllPoints()

    card.description:SetPoint(
        "TOPLEFT",
        card,
        "TOPLEFT",
        CARD_PADDING,
        y
    )

    card.description:SetText(
        descriptionText
    )

    card.description:Show()

    y =
        y -
        GetTextHeight(
            card.description
        ) -
        10

    --------------------------------------------------
    -- Objectives
    --------------------------------------------------

    local objectiveText =
        logObjectives

    if not objectiveText
    or objectiveText == "" then
        objectiveText =
            quest
            and quest.objectiveText
            or nil
    end

    objectiveText =
        FormatQuestText(
            objectiveText
        )

    local objectiveCount = 0

    if quest
    and quest.objectives then
        objectiveCount =
            table.getn(
                quest.objectives
            )
    end

    if objectiveText ~= ""
    or objectiveCount > 0 then
        card.objectivesHeader:ClearAllPoints()

        card.objectivesHeader:SetPoint(
            "TOPLEFT",
            card,
            "TOPLEFT",
            CARD_PADDING,
            y
        )

        card.objectivesHeader:Show()

        y = y - 17

        if objectiveText ~= "" then
            card.objectivesText:ClearAllPoints()

            card.objectivesText:SetPoint(
                "TOPLEFT",
                card,
                "TOPLEFT",
                CARD_PADDING,
                y
            )

            card.objectivesText:SetText(
                objectiveText
            )

            card.objectivesText:Show()

            y =
                y -
                GetTextHeight(
                    card.objectivesText
                ) -
                5
        end

        local i

        for i = 1,
            objectiveCount
        do
            local objective =
                quest.objectives[i]

            if objective.type == "item"
            and objective.itemID then
                local row =
                    AcquireObjectiveRow(
                        card,
                        i
                    )

                row:SetWidth(
                    bodyWidth
                )

                row.name:SetWidth(
                    bodyWidth - 92
                )

                row:ClearAllPoints()

                row:SetPoint(
                    "TOPLEFT",
                    card,
                    "TOPLEFT",
                    CARD_PADDING,
                    y
                )

                row.itemID =
                    objective.itemID

                row.icon:SetTexture(
                    PC.API.GetItemIcon(
                        objective.itemID
                    )
                )

                row.name:SetText(
                    PC.API.GetItemName(
                        objective.itemID
                    )
                )

                local owned =
                    PC.API.GetItemCount(
                        objective.itemID
                    )

                local needed =
                    objective.amount or 1

                row.value:SetText(
                    tostring(owned) ..
                    " / " ..
                    tostring(needed)
                )

                if owned >= needed then
                    SetStatusColor(
                        row.name,
                        "good"
                    )

                    SetStatusColor(
                        row.value,
                        "good"
                    )
                else
                    SetStatusColor(
                        row.name,
                        "bad"
                    )

                    SetStatusColor(
                        row.value,
                        "bad"
                    )
                end

                row:Show()

                y =
                    y -
                    ITEM_ROW_HEIGHT
            end
        end

        y = y - 6
    end

    --------------------------------------------------
    -- Rewards
    --------------------------------------------------

    local rewardCount = 0

    if quest
    and quest.rewards
    and quest.rewards.items then
        rewardCount =
            table.getn(
                quest.rewards.items
            )
    end

    if rewardCount > 0 then
        card.rewardsHeader:ClearAllPoints()

        card.rewardsHeader:SetPoint(
            "TOPLEFT",
            card,
            "TOPLEFT",
            CARD_PADDING,
            y
        )

        card.rewardsHeader:Show()

        y = y - 17

        card.rewardMode:ClearAllPoints()

        card.rewardMode:SetPoint(
            "TOPLEFT",
            card,
            "TOPLEFT",
            CARD_PADDING,
            y
        )

        if quest.rewards.type ==
        "choice" then
            card.rewardMode:SetText(
                "Choose one:"
            )
        else
            card.rewardMode:SetText(
                "You receive:"
            )
        end

        card.rewardMode:Show()

        y = y - 18

        local i

        for i = 1,
            rewardCount
        do
            local rewardItemID =
                quest.rewards.items[i]

            local row =
                AcquireRewardRow(
                    card,
                    i
                )

            row:SetWidth(
                bodyWidth
            )

            row.name:SetWidth(
                bodyWidth - 70
            )

            row:ClearAllPoints()

            row:SetPoint(
                "TOPLEFT",
                card,
                "TOPLEFT",
                CARD_PADDING,
                y
            )

            row.itemID =
                rewardItemID

            row.icon:SetTexture(
                PC.API.GetItemIcon(
                    rewardItemID
                )
            )

            row.name:SetText(
                PC.API.GetItemName(
                    rewardItemID
                )
            )

            row.value:SetText("")

            if rewardItemID ==
            activeItemID then
                row.name:SetTextColor(
                    0.25,
                    1.00,
                    0.25
                )
            else
                row.name:SetTextColor(
                    0.85,
                    0.85,
                    0.85
                )
            end

            row:Show()

            y =
                y -
                ITEM_ROW_HEIGHT
        end

        y = y - 6
    end

    --------------------------------------------------
    -- Gains
    --------------------------------------------------

    local gainIndex = 0
    local gains =
        quest
        and quest.gains

    if gains
    and (
        gains.experience
        or gains.reputation
    ) then
        card.gainsHeader:ClearAllPoints()

        card.gainsHeader:SetPoint(
            "TOPLEFT",
            card,
            "TOPLEFT",
            CARD_PADDING,
            y
        )

        card.gainsHeader:Show()

        y = y - 18

        if gains.experience then
            gainIndex = gainIndex + 1

            local row =
                AcquireGainRow(
                    card,
                    gainIndex
                )

            row:SetWidth(
                bodyWidth
            )

            row:ClearAllPoints()

            row:SetPoint(
                "TOPLEFT",
                card,
                "TOPLEFT",
                CARD_PADDING,
                y
            )

            row.label:SetText(
                "Experience"
            )

            row.label:SetTextColor(
                XP_R,
                XP_G,
                XP_B
            )

            row.value:SetText(
                tostring(
                    gains.experience
                )
            )

            row.value:SetTextColor(
                XP_R,
                XP_G,
                XP_B
            )

            row:Show()

            y =
                y -
                GAIN_ROW_HEIGHT
        end

        if gains.reputation then
            local i

            for i = 1,
                table.getn(
                    gains.reputation
                )
            do
                gainIndex =
                    gainIndex + 1

                local reputation =
                    gains.reputation[i]

                local row =
                    AcquireGainRow(
                        card,
                        gainIndex
                    )

                row:SetWidth(
                    bodyWidth
                )

                row:ClearAllPoints()

                row:SetPoint(
                    "TOPLEFT",
                    card,
                    "TOPLEFT",
                    CARD_PADDING,
                    y
                )

                row.label:SetText(
                    "Reputation: " ..
                    tostring(
                        reputation.name or
                        "Unknown"
                    )
                )

                row.label:SetTextColor(
                    REP_R,
                    REP_G,
                    REP_B
                )

                row.value:SetText(
                    "+" ..
                    tostring(
                        reputation.amount or
                        0
                    )
                )

                row.value:SetTextColor(
                    REP_R,
                    REP_G,
                    REP_B
                )

                row:Show()

                y =
                    y -
                    GAIN_ROW_HEIGHT
            end
        end

        y = y - 5
    end

    local cardHeight =
        -y +
        CARD_PADDING

    if cardHeight <
    MIN_EXPANDED_HEIGHT then
        cardHeight =
            MIN_EXPANDED_HEIGHT
    end

    card:SetHeight(
        cardHeight
    )

    card:Show()

    return cardHeight
end

--------------------------------------------------
-- Chain Connector
--------------------------------------------------

local function AcquireConnector(index)
    local connector =
        connectors[index]

    if connector then
        return connector
    end

    connector =
        CreateFrame(
            "Frame",
            nil,
            scrollChild
        )

    connector.line =
        connector:CreateTexture(
            nil,
            "ARTWORK"
        )

    connector.line:SetTexture(
        0.42,
        0.42,
        0.42,
        1
    )

    connector.label =
        connector:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    connector.label:SetText(
        "Requires"
    )

    connector.label:SetTextColor(
        0.65,
        0.65,
        0.65
    )

    connectors[index] = connector

    return connector
end

--------------------------------------------------
-- Generic Rows
--------------------------------------------------

local function AcquireGenericRow(index)
    local row =
        genericRows[index]

    if row then
        return row
    end

    row =
        CreateFrame(
            "Frame",
            nil,
            scrollChild
        )

    row:SetWidth(CARD_WIDTH)
    row:SetHeight(36)

    row.icon =
        row:CreateTexture(
            nil,
            "ARTWORK"
        )

    row.icon:SetWidth(22)
    row.icon:SetHeight(22)

    row.icon:SetPoint(
        "LEFT",
        row,
        "LEFT",
        4,
        0
    )

    row.title =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    row.title:SetPoint(
        "LEFT",
        row.icon,
        "RIGHT",
        7,
        0
    )

    row.title:SetWidth(235)
    row.title:SetJustifyH("LEFT")

    row.value =
        row:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )

    row.value:SetPoint(
        "RIGHT",
        row,
        "RIGHT",
        -8,
        0
    )

    row.value:SetWidth(105)
    row.value:SetJustifyH("RIGHT")

    genericRows[index] = row

    return row
end

local function AddGenericRow(
    y,
    icon,
    iconCoords,
    titleText,
    valueText
)
    visibleGenericRows =
        visibleGenericRows + 1

    local row =
        AcquireGenericRow(
            visibleGenericRows
        )

    row:ClearAllPoints()

    row:SetPoint(
        "TOPLEFT",
        scrollChild,
        "TOPLEFT",
        0,
        y
    )

    ApplyTexture(
        row.icon,
        icon,
        iconCoords
    )

    row.title:SetText(
        titleText or ""
    )

    row.value:SetText(
        valueText or ""
    )

    row:Show()

    return y - 36
end

--------------------------------------------------
-- Clear Dynamic Content
--------------------------------------------------

local function ClearContent()
    local i

    for i = 1,
        table.getn(
            questCards
        )
    do
        questCards[i]:Hide()
        HideCardContent(
            questCards[i]
        )
    end

    for i = 1,
        table.getn(
            connectors
        )
    do
        connectors[i]:Hide()
    end

    for i = 1,
        table.getn(
            genericRows
        )
    do
        genericRows[i]:Hide()
    end

    visibleQuestCards = 0
    visibleConnectors = 0
    visibleGenericRows = 0
end

--------------------------------------------------
-- Quest Details
--------------------------------------------------

local function BuildQuestDetails(
    source,
    itemID
)
    local chain = nil

    if source.chainID
    and PC.Data.QuestChains then
        chain =
            PC.Data.QuestChains[
                source.chainID
            ]
    end

    local instanceID =
        GetSourceInstanceID(
            source
        )

    local instance =
        GetInstance(
            instanceID
        )

    if chain
    and chain.name then
        sourceTitle:SetText(
            "Quest Chain" ..
            (
                instance
                and (
                    "  |  " ..
                    instance.name
                )
                or ""
            )
        )

    elseif instance then
        sourceTitle:SetText(
            "Quest  |  " ..
            instance.name
        )

    else
        sourceTitle:SetText(
            "Quest Source"
        )
    end

    local steps = nil

    if chain
    and chain.steps
    and table.getn(
        chain.steps
    ) > 0 then
        steps = chain.steps
    else
        steps = {
            source.questID
        }
    end

    local y = 0
    local i
    local displayDepth = 0

    --------------------------------------------------
    -- Reward quest first, then prerequisites.
    --------------------------------------------------

    for i = table.getn(steps),
        1,
        -1
    do
        local questID =
            steps[i]

        if questID then
            visibleQuestCards =
                visibleQuestCards + 1

            local card =
                AcquireQuestCard(
                    visibleQuestCards
                )

            local indent =
                displayDepth *
                CHAIN_INDENT

            card:ClearAllPoints()

            card:SetPoint(
                "TOPLEFT",
                scrollChild,
                "TOPLEFT",
                indent,
                y
            )

            local cardHeight =
                PopulateQuestCard(
                    card,
                    questID,
                    source,
                    itemID,
                    displayDepth
                )

            y =
                y -
                cardHeight

            if i > 1 then
                visibleConnectors =
                    visibleConnectors + 1

                local connector =
                    AcquireConnector(
                        visibleConnectors
                    )

                connector:ClearAllPoints()

                connector:SetPoint(
                    "TOPLEFT",
                    scrollChild,
                    "TOPLEFT",
                    indent + 9,
                    y
                )

                connector:SetWidth(
                    CARD_WIDTH -
                    indent
                )

                connector:SetHeight(
                    CONNECTOR_HEIGHT
                )

                connector.line:ClearAllPoints()

                connector.line:SetPoint(
                    "TOPLEFT",
                    connector,
                    "TOPLEFT",
                    0,
                    0
                )

                connector.line:SetWidth(2)
                connector.line:SetHeight(14)

                connector.label:ClearAllPoints()

                connector.label:SetPoint(
                    "TOPLEFT",
                    connector,
                    "TOPLEFT",
                    12,
                    -4
                )

                connector:Show()

                y =
                    y -
                    CONNECTOR_HEIGHT
            end

            displayDepth =
                displayDepth + 1
        end
    end

    local totalHeight =
        -y

    if totalHeight < 1 then
        totalHeight = 1
    end

    scrollChild:SetHeight(
        totalHeight
    )
end

--------------------------------------------------
-- Drop Details
--------------------------------------------------

local function GetDropperIcon(source)
    return
        "Interface\\TargetingFrame\\UI-TargetingFrame-Skull"
end

local function BuildDropDetails(source)
    local instance =
        GetInstance(
            source.instanceID
        )

    if instance then
        sourceTitle:SetText(
            "Drop  |  " ..
            instance.name
        )
    else
        sourceTitle:SetText(
            "Drop Details"
        )
    end

    local y = 0

    y = AddGenericRow(
        y,
        GetDropperIcon(source),
        nil,
        "Dropped by",
        source.npcName
        or (
            "NPC " ..
            tostring(
                source.npcID or "?"
            )
        )
    )

    if instance then
        y = AddGenericRow(
            y,
            instance.icon,
            instance.iconCoords,
            instance.type == "raid"
            and "Raid"
            or "Dungeon",
            instance.name
        )

    elseif source.zone then
        y = AddGenericRow(
            y,
            "Interface\\Icons\\INV_Misc_Map_01",
            nil,
            "Location",
            source.zone
        )
    end

    if source.dropChance then
        y = AddGenericRow(
            y,
            "Interface\\Icons\\INV_Misc_Bag_10",
            nil,
            "Drop Chance",
            string.format(
                "%.2f%%",
                source.dropChance
            )
        )
    end

    scrollChild:SetHeight(
        -y
    )
end

--------------------------------------------------
-- Vendor Details
--------------------------------------------------

local function BuildVendorDetails(source)
    sourceTitle:SetText(
        "Vendor Details"
    )

    local y = 0

    y = AddGenericRow(
        y,
        "Interface\\Icons\\INV_Misc_Coin_01",
        nil,
        source.npcName or "Vendor",
        source.zone or ""
    )

    if source.priceText then
        y = AddGenericRow(
            y,
            "Interface\\Icons\\INV_Misc_Coin_01",
            nil,
            "Price",
            source.priceText
        )
    end

    scrollChild:SetHeight(
        -y
    )
end

--------------------------------------------------
-- Generic Details
--------------------------------------------------

local function BuildGenericDetails(source)
    sourceTitle:SetText(
        "Source Details"
    )

    local y = 0

    y = AddGenericRow(
        y,
        "Interface\\Icons\\INV_Misc_QuestionMark",
        nil,
        tostring(
            source.type or "Unknown"
        ),
        ""
    )

    scrollChild:SetHeight(
        -y
    )
end

--------------------------------------------------
-- Refresh
--------------------------------------------------

Refresh =
    function()
        if not activeItemID
        or not activeSource then
            return
        end

        local oldScroll = 0

        if scrollFrame.GetVerticalScroll then
            oldScroll =
                scrollFrame:GetVerticalScroll()
                or 0
        end

        ClearContent()

        itemIcon:SetTexture(
            PC.API.GetItemIcon(
                activeItemID
            )
        )

        itemName:SetText(
            PC.API.GetItemName(
                activeItemID
            )
        )

        if activeSource.type ==
        "quest" then
            BuildQuestDetails(
                activeSource,
                activeItemID
            )

        elseif activeSource.type ==
        "drop" then
            BuildDropDetails(
                activeSource
            )

        elseif activeSource.type ==
        "vendor" then
            BuildVendorDetails(
                activeSource
            )

        else
            BuildGenericDetails(
                activeSource
            )
        end

        --------------------------------------------------
        -- Refresh Scroll Region
        --------------------------------------------------

        if scrollFrame.UpdateScrollChildRect then
            scrollFrame:UpdateScrollChildRect()
        end

        --------------------------------------------------
        -- Restore Scroll Position
        --------------------------------------------------

        if scrollFrame.SetVerticalScroll then
            local maxScroll = oldScroll

            if scrollFrame.GetVerticalScrollRange then
                maxScroll =
                    scrollFrame:GetVerticalScrollRange()
                    or 0
            end

            if oldScroll > maxScroll then
                oldScroll = maxScroll
            end

            if oldScroll < 0 then
                oldScroll = 0
            end

            scrollFrame:SetVerticalScroll(
                oldScroll
            )
        end
    end

--------------------------------------------------
-- Public API
--------------------------------------------------

function SourceDetails.Open(
    itemID,
    source
)
    if not itemID
    or not source then
        return
    end

    activeItemID = itemID
    activeSource = source
    expandedQuests = {}

    GameTooltip:Hide()

    if PC.UI.SourceTooltip then
        PC.UI.SourceTooltip.Hide()
    end

    if PC.UI.WandPanel then
        PC.UI.WandPanel:Hide()
    end

    if scrollFrame.SetVerticalScroll then
        scrollFrame:SetVerticalScroll(0)
    end

    Refresh()
    frame:Show()
end

function SourceDetails.Hide()
    frame:Hide()
end

function SourceDetails.Refresh()
    if frame:IsShown() then
        Refresh()
    end
end

--------------------------------------------------
-- Dynamic Updates
--------------------------------------------------

local eventFrame =
    CreateFrame("Frame")

eventFrame:RegisterEvent(
    "PLAYER_LEVEL_UP"
)

eventFrame:RegisterEvent(
    "QUEST_LOG_UPDATE"
)

eventFrame:RegisterEvent(
    "BAG_UPDATE"
)

if PC.Capabilities.classicAPI then
    eventFrame:RegisterEvent(
        "ITEM_DATA_LOAD_RESULT"
    )
end

eventFrame:SetScript(
    "OnEvent",
    function()
        if event ==
        "ITEM_DATA_LOAD_RESULT" then
            local success = arg2

            if not success then
                return
            end
        end

        if frame:IsShown() then
            Refresh()
        end
    end
)
