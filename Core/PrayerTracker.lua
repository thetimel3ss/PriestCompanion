-- Priest Companion
-- Book of Prayer tracker: talent, successful cast and session HUD state.
-- Vanilla Lua 5.0 compatible; no spell automation; mana predictions approximate.

local PC = PriestCompanion

PC.Modules.PrayerTracker = PC.Modules.PrayerTracker or {}
local Tracker = PC.Modules.PrayerTracker

local DEFAULTS = {
    enabled = true,
    expanded = false,
    showSpellName = true,
    showRefund = true,
    showManaRefund = false,
    outsideCombat = true,
    autoHide = false,
    autoHideSeconds = 15,
    locked = false,
    x = 0,
    y = -150,
    compactWidth = 118,
    compactHeight = 112,
    expandedWidth = 212,
    expandedHeight = 130,
    compactScale = 1,
    expandedScale = 1
}

local BOOL_OPTIONS = {
    enabled = true,
    expanded = true,
    showSpellName = true,
    showRefund = true,
    showManaRefund = true,
    outsideCombat = true,
    autoHide = true,
    locked = true
}

local settings = {}
local listeners = {}
local geometryRevision = 0
local talentPoints = 0
local talentFound = false
local lastFamily = nil
local previousFamily = nil
local lastIcon = nil
local previousIcon = nil
local lastEligible = false
local lastRefundEstimate = nil
local lastRefundActual = nil
local lastHealTime = nil
local pendingCastCost = nil
local lastRefundMatched = false

-- Nampower reports Book of Prayer (52942) without the originating cast GUID.
-- Keep a bounded queue, correlate by success time and effective spell cost,
-- and avoid attributing late events to whichever spell is currently displayed.
local recentHeals = {}
local waitingRefunds = {}
local healSequence = 0
local latestHealSequence = nil
local REFUND_AFTER_WINDOW = 0.40
local REFUND_BEFORE_WINDOW = 0.15
local REFUND_SETTLE_SECONDS = 0.12
local REFUND_DEFER_SENT_SECONDS = 0.24
local REFUND_PACKET_TTL = 0.48
local RECENT_HEAL_TTL = 1.25
local ReconcileRefunds = nil
local innerFocusReady = false
local innerFocusBlockNext = false
local provider = "unavailable"
local lastCastGUID = nil
local ConfigureManaProvider = nil
local RefreshTrackingEvents
local ScanSpellbook

for key, value in pairs(DEFAULTS) do
    settings[key] = value
end

--------------------------------------------------
-- Public State and Options
--------------------------------------------------

function Tracker.GetOption(key)
    return settings[key]
end

-- A valid setting is an integer from 1 to 600 seconds.
-- Keep this in the core, so UI input cannot store invalid values.
local function NormalizeAutoHideSeconds(value)
    local number = tonumber(value)

    if not number or number ~= number then
        return nil
    end

    number = math.floor(number)

    if number < 1 then
        return 1
    elseif number > 600 then
        return 600
    end

    return number
end

function Tracker.GetTalentPoints()
    return talentPoints
end

function Tracker.IsTalentFound()
    return talentFound
end

function Tracker.GetProvider()
    return provider
end

function Tracker.GetState()
    return {
        last = lastFamily,
        previous = previousFamily,
        lastIcon = lastIcon,
        previousIcon = previousIcon,
        eligible = lastEligible,
        refundEstimate = lastRefundEstimate,
        refundActual = lastRefundActual,
        talentPoints = talentPoints,
        provider = provider
    }
end

function Tracker.AddListener(callback)
    if type(callback) == "function" then
        table.insert(listeners, callback)
    end
end

local function Notify()
    local i
    for i = 1, table.getn(listeners) do
        -- These are Priest Companion-owned UI listeners. Surface an
        -- actual UI error during testing instead of silently hiding it.
        listeners[i]()
    end
end

local function SaveOption(key, value)
    settings[key] = value

    if type(PriestCompanionCharDB) == "table" then
        PriestCompanionCharDB.prayerTracker =
            PriestCompanionCharDB.prayerTracker or {}
        PriestCompanionCharDB.prayerTracker[key] = value
    end
end

function Tracker.SetAutoHideSeconds(value)
    local seconds = NormalizeAutoHideSeconds(value)

    if not seconds then
        return false
    end

    SaveOption("autoHideSeconds", seconds)
    Notify()
    return true
end

function Tracker.ShouldAutoHide()
    if not settings.autoHide then
        return false
    end

    -- Hide on login until a qualifying heal occurs in this session.
    if not lastHealTime then
        return true
    end

    if type(GetTime) ~= "function" then
        return false
    end

    return GetTime() - lastHealTime >= settings.autoHideSeconds
end

function Tracker.SetOption(key, value)
    if not BOOL_OPTIONS[key] then
        return false
    end

    if key == "enabled" and value == true and talentPoints < 1 then
        Tracker.ScanTalents()
    end
    if key == "enabled" and value == true and talentPoints < 1 then
        return false
    end

    SaveOption(key, value == true)
    if key == "enabled" and RefreshTrackingEvents then
        if value == true and ScanSpellbook then ScanSpellbook() end
        RefreshTrackingEvents()
    end

    if key == "showManaRefund" then
        -- A setting toggle must not replay already-received mana packets.
        recentHeals = {}
        waitingRefunds = {}
        if ConfigureManaProvider then
            ConfigureManaProvider()
        end
    end

    Notify()
    return true
end

--------------------------------------------------
-- Tracker window scale
-- Keep the old width/height variables for backward compatibility.
-- Both display modes now save proportional sizes between 40%-120%.
--------------------------------------------------

local function WindowMode(expanded)
    if expanded then
        return "expandedScale", "expandedWidth", "expandedHeight",
            212, 130
    end
    return "compactScale", "compactWidth", "compactHeight", 118, 112
end

local function ClampWindowScale(raw)
    local value = tonumber(raw)
    if not value or value ~= value then return nil end
    if value < 0.40 then value = 0.40 end
    if value > 1.20 then value = 1.20 end
    return value
end

local function RoundedWindowScale(raw)
    local value = ClampWindowScale(raw)
    if not value then return nil end
    return math.floor(value * 20 + 0.5) / 20
end

function Tracker.GetWindowScale(expanded)
    if expanded == nil then expanded = settings.expanded end
    local key = WindowMode(expanded)
    return ClampWindowScale(settings[key]) or 1
end

local function SaveModeWindowScale(value, expanded)
    local key, widthKey, heightKey, baseWidth, baseHeight =
        WindowMode(expanded)
    SaveOption(key, value)
    SaveOption(widthKey, baseWidth * value)
    SaveOption(heightKey, baseHeight * value)
end

function Tracker.SetWindowScale(raw, expanded)
    if expanded == nil then expanded = settings.expanded end
    local scale = RoundedWindowScale(raw)
    if not scale then return false end
    SaveModeWindowScale(scale, expanded)
    geometryRevision = geometryRevision + 1
    Notify()
    return true
end

-- Saving a window drag only updates position. A border/corner drag
-- selects the dominant axis and snaps the window back to a uniform
-- scale, matching the Resurrection Assistant HUD.
function Tracker.SaveGeometry(x, y, width, height, direction, startingScale)
    if settings.locked then return end

    if type(x) == "number" and x == x then
        SaveOption("x", x)
    end
    if type(y) == "number" and y == y then
        SaveOption("y", y)
    end

    if type(width) == "number" and type(height) == "number" then
        local _, _, _, baseWidth, baseHeight =
            WindowMode(settings.expanded)
        local widthScale = width / baseWidth
        local heightScale = height / baseHeight
        local scale
        if direction == "LEFT" or direction == "RIGHT" then
            scale = widthScale
        elseif direction == "TOP" or direction == "BOTTOM" then
            scale = heightScale
        else
            local previous = startingScale or
                Tracker.GetWindowScale()
            if math.abs(widthScale - previous) >=
                math.abs(heightScale - previous) then
                scale = widthScale
            else
                scale = heightScale
            end
        end
        scale = RoundedWindowScale(scale)
        if scale then SaveModeWindowScale(scale, settings.expanded) end
    end

    geometryRevision = geometryRevision + 1
    Notify()
end

-- Reset only placement and saved sizes, not any behavior preferences.
-- This also works when the position is locked.
function Tracker.GetGeometryRevision()
    return geometryRevision
end

function Tracker.ResetGeometry()
    local fields = {
        "x", "y",
        "compactWidth", "compactHeight",
        "expandedWidth", "expandedHeight",
        "compactScale", "expandedScale"
    }
    local i

    for i = 1, table.getn(fields) do
        local key = fields[i]
        SaveOption(key, DEFAULTS[key])
    end

    geometryRevision = geometryRevision + 1
    Notify()
end

function Tracker.IsActive()
    return talentPoints > 0
        and settings.enabled == true
        and provider ~= "unavailable"
end

--------------------------------------------------
-- Talent Detection
--------------------------------------------------

local function ScanBookOfPrayer()
    local oldPoints = talentPoints
    local oldFound = talentFound
    local points = 0
    local found = false

    local _, class = UnitClass("player")

    if class == "PRIEST"
    and type(GetNumTalentTabs) == "function"
    and type(GetNumTalents) == "function"
    and type(GetTalentInfo) == "function" then
        local ok, tabs = pcall(GetNumTalentTabs)

        if ok and type(tabs) == "number" then
            local t
            local i
            for t = 1, tabs do
                local countOk, count =
                    pcall(GetNumTalents, t)

                if countOk and type(count) == "number" then
                    for i = 1, count do
                        local talentOk, name, icon, tier, column, rank =
                            pcall(GetTalentInfo, t, i)

                        if talentOk
                        and type(name) == "string"
                        and string.lower(name) == "book of prayer" then
                            points = tonumber(rank) or 0
                            found = true
                            break
                        end
                    end
                end

                if found then
                    break
                end
            end
        end
    end

    talentPoints = points
    talentFound = found

    if talentPoints == 0 then
        lastFamily = nil
        previousFamily = nil
        lastIcon = nil
        previousIcon = nil
        lastEligible = false
        lastRefundEstimate = nil
        lastRefundActual = nil
        lastHealTime = nil
        pendingCastCost = nil
        lastRefundMatched = false
        recentHeals = {}
        waitingRefunds = {}
        latestHealSequence = nil
        innerFocusReady = false
        innerFocusBlockNext = false
        lastCastGUID = nil
    end

    if talentPoints ~= oldPoints or talentFound ~= oldFound then
        -- A respec can acquire or remove Book of Prayer at runtime.
        if ConfigureManaProvider then
            ConfigureManaProvider()
        end
        Notify()
    end
end

function Tracker.ScanTalents()
    ScanBookOfPrayer()
end

--------------------------------------------------
-- Spellbook Icons and Healing Families
--------------------------------------------------

local function GetSpellFamily(name)
    if type(name) ~= "string" then
        return nil
    end

    -- The cast event supplies the spell base name, regardless of rank.
    -- Handle optional trailing rank text only, never substring matches
    -- (Heal must not accidentally match Greater Heal).
    name = string.gsub(name, "%s*%([^%)]+%)$", "")

    if PC.Data.HealingSpells[name] then
        return name
    end

    return nil
end

ScanSpellbook = function()
    if type(GetNumSpellTabs) ~= "function"
    or type(GetSpellTabInfo) ~= "function"
    or type(GetSpellName) ~= "function"
    or type(GetSpellTexture) ~= "function" then
        return
    end

    local numTabs = GetNumSpellTabs()
    local tab

    for tab = 1, numTabs do
        local _, _, offset, numSpells = GetSpellTabInfo(tab)

        if type(offset) == "number"
        and type(numSpells) == "number" then
            local slot
            for slot = offset + 1, offset + numSpells do
                local name = GetSpellName(slot, "spell")
                local family = GetSpellFamily(name)

                if family then
                    local icon = GetSpellTexture(slot, "spell")
                    if icon then
                        PC.Data.HealingSpells[family].icon = icon
                    end
                end
            end
        end
    end
end

local function ResolveSpellName(spellID, providedName)
    if GetSpellFamily(providedName) then
        return providedName
    end

    if not spellID then
        return nil
    end

    if type(GetSpellInfo) == "function" then
        local ok, name = pcall(GetSpellInfo, spellID)
        if ok and GetSpellFamily(name) then
            return name
        end
    end

    if type(SpellInfo) == "function" then
        local ok, name = pcall(SpellInfo, spellID)
        if ok and GetSpellFamily(name) then
            return name
        end
    end

    return nil
end

--------------------------------------------------
-- Pre-cast cost snapshot (ClassicAPI)
--------------------------------------------------

local function ReadEffectiveManaCost(spellID)
    if type(C_Spell) ~= "table"
    or type(C_Spell.GetSpellPowerCost) ~= "function"
    or type(spellID) ~= "number" then
        return nil
    end

    local ok, costs = pcall(C_Spell.GetSpellPowerCost, spellID)
    if not ok or type(costs) ~= "table" then
        return nil
    end

    local entry = costs[1]
    if type(entry) ~= "table" or entry.type ~= 0 then
        return nil
    end

    local amount = tonumber(entry.cost)
    if amount and amount >= 0 then
        return amount
    end
    return nil
end

local function CaptureSentSpell(castGUID, spellID, spellName)
    -- A new SENT invalidates only the pending cost snapshot; older
    -- confirmed heals and their Nampower packets must remain available.
    pendingCastCost = nil

    if not GetSpellFamily(ResolveSpellName(spellID, spellName)) then
        return
    end

    pendingCastCost = {
        guid = castGUID,
        spellID = spellID,
        cost = ReadEffectiveManaCost(spellID),
        at = type(GetTime) == "function" and GetTime() or nil
    }
end

local function IsInnerFocus(spellID, spellName)
    if spellName == "Inner Focus" then
        return true
    end

    if spellID and type(GetSpellInfo) == "function" then
        local ok, name = pcall(GetSpellInfo, spellID)
        if ok and name == "Inner Focus" then return true end
    end

    if spellID and type(SpellInfo) == "function" then
        local ok, name = pcall(SpellInfo, spellID)
        if ok and name == "Inner Focus" then return true end
    end
    return false
end

--------------------------------------------------
-- A Successful Heal Changes the Cycle
--------------------------------------------------

function Tracker.RecordSuccessfulSpell(spellID, spellName, castGUID)
    if talentPoints < 1 then return false end

    -- Inner Focus itself is not a healing spell. Its free spell and the
    -- next healing spell are both refund-ineligible on OctoWoW.
    if IsInnerFocus(spellID, spellName) then
        innerFocusReady = true
        return false
    end

    local family = GetSpellFamily(ResolveSpellName(spellID, spellName))

    if castGUID and castGUID == lastCastGUID then return false end

    local usedInnerFocus = innerFocusReady
    if usedInnerFocus then
        innerFocusReady = false
        innerFocusBlockNext = true
    end

    if not family then return false end

    local effectiveCost = nil
    local matchedSent = pendingCastCost
        and pendingCastCost.guid == castGUID
        and pendingCastCost.spellID == spellID

    if matchedSent then
        effectiveCost = pendingCastCost.cost
    end
    pendingCastCost = nil

    lastCastGUID = castGUID
    previousFamily = lastFamily
    previousIcon = lastIcon
    lastFamily = family
    lastIcon = PC.Data.HealingSpells[family].icon

    local blockRefund = usedInnerFocus
    if not usedInnerFocus and innerFocusBlockNext then
        blockRefund = true
        innerFocusBlockNext = false
    end

    if effectiveCost == 0 then
        blockRefund = true
        innerFocusBlockNext = true
    end

    lastEligible =
        previousFamily ~= nil
        and previousFamily ~= family
        and not blockRefund

    lastRefundEstimate = nil
    lastRefundActual = nil
    lastRefundMatched = false

    local castTime = nil
    if type(GetTime) == "function" then
        castTime = GetTime()
    end

    if lastEligible and effectiveCost and effectiveCost > 0 then
        -- Approximate: the server may round fractional refunds either way.
        lastRefundEstimate =
            math.floor(effectiveCost * talentPoints * 0.15 + 0.5)
    end

    -- Include ineligible heals in the timeline, but never assign them a
    -- refund. A new successful spell does not invalidate an older packet.
    if castTime then
        healSequence = healSequence + 1
        latestHealSequence = healSequence
        table.insert(recentHeals, {
            sequence = healSequence,
            guid = castGUID,
            spellID = spellID,
            family = family,
            at = castTime,
            expected = lastRefundEstimate,
            eligible = lastEligible,
            matched = false
        })
        if ReconcileRefunds then
            ReconcileRefunds()
        end
    end

    -- Reset inactivity only for a confirmed, qualifying healing cast.
    if castTime then
        lastHealTime = castTime
    end

    Notify()
    return true
end

--------------------------------------------------
-- Actual Book of Prayer Mana (optional Nampower)
--------------------------------------------------

local BOOK_OF_PRAYER_ENERGIZE_ID = 52942
local nampowerEnergizeRegistered = false
local legacyEnergizeCVarChanged = false
local legacyEnergizePriorCVar = nil

local function IsLegacyNampower()
    if type(GetNampowerVersion) ~= "function" then
        return true
    end

    local ok, major, minor = pcall(GetNampowerVersion)
    if not ok then
        return true
    end

    major = tonumber(major)
    minor = tonumber(minor) or 0

    if not major then
        return true
    end

    -- Nampower >= 4.5 enables this event via registration alone.
    return major < 4 or (major == 4 and minor < 5)
end

-- A packet may be delivered immediately before SUCCEEDED, immediately
-- after it, or during the SENT of the next instant heal. Cost proximity
-- disambiguates different families/ranks when ClassicAPI is available.
local function FindRefundCandidate(packet)
    local best = nil
    local bestScore = nil
    local i

    for i = 1, table.getn(recentHeals) do
        local heal = recentHeals[i]
        local differenceInTime = packet.at - heal.at

        if heal.eligible and not heal.matched
        and differenceInTime >= -REFUND_BEFORE_WINDOW
        and differenceInTime <= REFUND_AFTER_WINDOW then
            local score = nil

            if heal.expected and heal.expected > 0 then
                local difference = math.abs(heal.expected - packet.amount)
                local tolerance = math.max(
                    6, math.floor(heal.expected * 0.25 + 0.5)
                )
                if difference <= tolerance then
                    score = difference / heal.expected
                        + math.abs(differenceInTime) * 0.1
                end
            else
                -- Without ClassicAPI cost data, match in cast order.
                -- The Nampower event alone has no identifying GUID.
                score = 1 + math.abs(differenceInTime) * 0.1
            end

            if score and (not bestScore or score < bestScore) then
                best = heal
                bestScore = score
            end
        end
    end

    return best
end

ReconcileRefunds = function()
    if type(GetTime) ~= "function" then
        return
    end

    local now = GetTime()
    local i

    -- Prevent stale casts being candidates for a later refund packet.
    for i = table.getn(recentHeals), 1, -1 do
        if now - recentHeals[i].at > RECENT_HEAL_TTL then
            table.remove(recentHeals, i)
        end
    end

    i = 1
    while i <= table.getn(waitingRefunds) do
        local packet = waitingRefunds[i]
        local age = now - packet.at
        local pendingNewCast = pendingCastCost
            and pendingCastCost.at
            and pendingCastCost.at <= packet.at

        -- Give success events time to arrive, including instant Renew.
        -- A newer SENT may otherwise steal an older heal's packet.
        if age < REFUND_SETTLE_SECONDS
        or (pendingNewCast and age < REFUND_DEFER_SENT_SECONDS) then
            i = i + 1
        else
            local heal = FindRefundCandidate(packet)

            if heal then
                heal.matched = true
                if heal.sequence == latestHealSequence then
                    lastRefundActual = packet.amount
                    lastRefundMatched = true
                    Notify()
                end
                table.remove(waitingRefunds, i)
            elseif age > REFUND_PACKET_TTL then
                -- Do not guess a spell if neither amount nor timing fit.
                table.remove(waitingRefunds, i)
            else
                i = i + 1
            end
        end
    end
end

local function ReceiveBookOfPrayerMana(spellID, powerType, amount, periodic)
    if not settings.showManaRefund or talentPoints < 1 then
        return
    end

    if tonumber(spellID) ~= BOOK_OF_PRAYER_ENERGIZE_ID
    or tonumber(powerType) ~= 0 then
        return
    end

    -- Ignore unrelated periodic resource gains and zero-valued packets.
    if tonumber(periodic) == 1 then
        return
    end

    amount = tonumber(amount)
    if not amount or amount <= 0 then
        return
    end

    if type(GetTime) ~= "function" then
        return
    end

    table.insert(waitingRefunds, {
        amount = amount,
        at = GetTime()
    })

    -- Reconciliation also runs OnUpdate, after the short settling delay.
    ReconcileRefunds()
end

--------------------------------------------------
-- Optional Spellcast Event Providers
--------------------------------------------------

local eventFrame = CreateFrame("Frame")
local pendingTalentRescan = nil

ConfigureManaProvider = function()
    if not (PC.Capabilities and PC.Capabilities.nampower) then
        return
    end

    local requested = settings.enabled and settings.showManaRefund
        and talentPoints > 0

    if requested then
        if not nampowerEnergizeRegistered then
            nampowerEnergizeRegistered = pcall(
                eventFrame.RegisterEvent,
                eventFrame,
                "SPELL_ENERGIZE_ON_SELF"
            )
        end

        if nampowerEnergizeRegistered
        and IsLegacyNampower()
        and type(SetCVar) == "function"
        and type(GetCVar) == "function" then
            local ok, value = pcall(GetCVar, "NP_EnableSpellEnergizeEvents")
            if ok and tostring(value) ~= "1" then
                local changed = pcall(
                    SetCVar, "NP_EnableSpellEnergizeEvents", "1"
                )
                if changed then
                    legacyEnergizeCVarChanged = true
                    legacyEnergizePriorCVar = value
                end
            end
        end
    else
        if nampowerEnergizeRegistered then
            pcall(
                eventFrame.UnregisterEvent,
                eventFrame,
                "SPELL_ENERGIZE_ON_SELF"
            )
            nampowerEnergizeRegistered = false
        end

        -- Only restore a legacy CVar when this addon itself changed it.
        -- A value enabled beforehand by the player or another addon
        -- must be left alone.
        if legacyEnergizeCVarChanged
        and legacyEnergizePriorCVar ~= nil
        and type(SetCVar) == "function" then
            pcall(
                SetCVar,
                "NP_EnableSpellEnergizeEvents",
                tostring(legacyEnergizePriorCVar)
            )
            legacyEnergizeCVarChanged = false
            legacyEnergizePriorCVar = nil
        end
    end
end

local function ScheduleTalentRescan()
    -- A short follow-up covers delayed server talent and spellbook data
    -- after login, talent purchase or respec without polling forever.
    pendingTalentRescan = 0.8
end

local function RegisterProvider(eventName, name)
    local success = pcall(
        eventFrame.RegisterEvent,
        eventFrame,
        eventName
    )

    if success then
        provider = name
        return true
    end

    return false
end

-- Prefer exactly one source. This avoids counting one cast twice when
-- ClassicAPI, Nampower and SuperWoW are installed simultaneously.
if PC.Capabilities.classicAPISupported then
    RegisterProvider("UNIT_SPELLCAST_SUCCEEDED", "ClassicAPI")
    if provider == "ClassicAPI" then
        pcall(eventFrame.RegisterEvent, eventFrame,
            "UNIT_SPELLCAST_SENT")
        pcall(eventFrame.RegisterEvent, eventFrame,
            "UNIT_SPELLCAST_FAILED")
        pcall(eventFrame.RegisterEvent, eventFrame,
            "UNIT_SPELLCAST_FAILED_QUIET")
        pcall(eventFrame.RegisterEvent, eventFrame,
            "UNIT_SPELLCAST_INTERRUPTED")
    end
end

if provider == "unavailable"
and PC.Capabilities.nampower then
    RegisterProvider("SPELL_CAST_EVENT", "Nampower")
end

if provider == "unavailable"
and PC.Capabilities.superWoW then
    RegisterProvider("UNIT_CASTEVENT", "SuperWoW")
end

eventFrame:RegisterEvent("VARIABLES_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PLAYER_LOGOUT")
eventFrame:RegisterEvent("CHARACTER_POINTS_CHANGED")
eventFrame:RegisterEvent("SPELLS_CHANGED")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")

local trackerMonitorEvents = {
    "PLAYER_ENTERING_WORLD", "CHARACTER_POINTS_CHANGED",
    "SPELLS_CHANGED", "PLAYER_LEVEL_UP",
    "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED"
}
local trackerCastEvents = {
    "UNIT_SPELLCAST_SUCCEEDED", "UNIT_SPELLCAST_SENT",
    "UNIT_SPELLCAST_FAILED", "UNIT_SPELLCAST_FAILED_QUIET",
    "UNIT_SPELLCAST_INTERRUPTED", "SPELL_CAST_EVENT", "UNIT_CASTEVENT"
}
RefreshTrackingEvents = function()
    local active = settings.enabled == true
    local casts = active and talentPoints > 0
    local i
    for i = 1, table.getn(trackerMonitorEvents) do
        local name = trackerMonitorEvents[i]
        if active then eventFrame:RegisterEvent(name)
        else eventFrame:UnregisterEvent(name) end
    end
    for i = 1, table.getn(trackerCastEvents) do
        local name = trackerCastEvents[i]
        local required = casts and (
            (provider == "ClassicAPI"
                and string.find(name, "UNIT_SPELLCAST", 1, true) ~= nil)
            or (provider == "Nampower" and name == "SPELL_CAST_EVENT")
            or (provider == "SuperWoW" and name == "UNIT_CASTEVENT"))
        if required then pcall(eventFrame.RegisterEvent, eventFrame, name)
        else pcall(eventFrame.UnregisterEvent, eventFrame, name) end
    end
    if not active then
        pendingTalentRescan = nil
        recentHeals, waitingRefunds = {}, {}
        pendingCastCost = nil
    end
    if ConfigureManaProvider then ConfigureManaProvider() end
end
RefreshTrackingEvents()

local function LoadSettings()
    PriestCompanionCharDB =
        PriestCompanionCharDB or {}

    local saved = PriestCompanionCharDB.prayerTracker

    if type(saved) == "table" then
        local key
        for key in pairs(DEFAULTS) do
            if BOOL_OPTIONS[key] then
                if type(saved[key]) == "boolean" then
                    settings[key] = saved[key]
                end
            elseif key == "autoHideSeconds" then
                local seconds = NormalizeAutoHideSeconds(saved[key])
                if seconds then
                    settings[key] = seconds
                end
            elseif type(saved[key]) == "number" then
                settings[key] = saved[key]
            end
        end
    end

    -- Legacy builds stored separate widths/heights. Preserve their
    -- effective visual size on first load, then use uniform scaling.
    -- A skewed older layout uses the smaller dimension ratio so no
    -- content is clipped when migrated.
    local i
    local modes = { false, true }
    for i = 1, table.getn(modes) do
        local expanded = modes[i]
        local scaleKey, widthKey, heightKey, baseWidth, baseHeight =
            WindowMode(expanded)
        if type(saved) ~= "table"
        or type(saved[scaleKey]) ~= "number" then
            local legacyScale = math.min(
                (settings[widthKey] or baseWidth) / baseWidth,
                (settings[heightKey] or baseHeight) / baseHeight
            )
            settings[scaleKey] = ClampWindowScale(legacyScale) or 1
        else
            settings[scaleKey] =
                ClampWindowScale(settings[scaleKey]) or 1
        end
    end

    RefreshTrackingEvents()
    Notify()
end

eventFrame:SetScript(
    "OnUpdate",
    function()
        if not settings.enabled then return end
        if pendingTalentRescan then
            pendingTalentRescan =
                pendingTalentRescan - arg1

            if pendingTalentRescan <= 0 then
                pendingTalentRescan = nil
                ScanSpellbook()
                ScanBookOfPrayer()
                RefreshTrackingEvents()
            end
        end

        if table.getn(waitingRefunds) > 0 and ReconcileRefunds then
            ReconcileRefunds()
        end
    end
)

eventFrame:SetScript(
    "OnEvent",
    function()
        if event == "VARIABLES_LOADED" then
            LoadSettings()
            return
        end

        if event == "PLAYER_LOGOUT" then
            -- On older Nampower, avoid leaving a global CVar enabled
            -- across sessions solely because of Priest Companion.
            if legacyEnergizeCVarChanged
            and legacyEnergizePriorCVar ~= nil
            and type(SetCVar) == "function" then
                pcall(
                    SetCVar,
                    "NP_EnableSpellEnergizeEvents",
                    tostring(legacyEnergizePriorCVar)
                )
                legacyEnergizeCVarChanged = false
                legacyEnergizePriorCVar = nil
            end
            return
        end

        if event == "PLAYER_ENTERING_WORLD" then
            if not settings.enabled then return end
            ScanSpellbook()
            ScanBookOfPrayer()
            RefreshTrackingEvents()
            ScheduleTalentRescan()
            Notify()
            return
        end

        if event == "CHARACTER_POINTS_CHANGED"
        or event == "PLAYER_LEVEL_UP" then
            ScanBookOfPrayer()
            RefreshTrackingEvents()
            ScheduleTalentRescan()
            return
        end

        if event == "SPELLS_CHANGED" then
            ScanSpellbook()
            ScanBookOfPrayer()
            RefreshTrackingEvents()
            ScheduleTalentRescan()
            return
        end

        if event == "PLAYER_REGEN_ENABLED"
        or event == "PLAYER_REGEN_DISABLED" then
            Notify()
            return
        end

        if event == "SPELL_ENERGIZE_ON_SELF" then
            ReceiveBookOfPrayerMana(arg3, arg4, arg5, arg6)
            return
        end

        if event == "UNIT_SPELLCAST_SENT"
        and provider == "ClassicAPI" then
            if arg1 == "player" then
                CaptureSentSpell(arg3, arg4, arg5)
            end
            return
        end

        if provider == "ClassicAPI"
        and (event == "UNIT_SPELLCAST_FAILED"
        or event == "UNIT_SPELLCAST_FAILED_QUIET"
        or event == "UNIT_SPELLCAST_INTERRUPTED") then
            if arg1 == "player" and pendingCastCost
            and pendingCastCost.guid == arg2 then
                pendingCastCost = nil
            end
            return
        end

        if event == "UNIT_SPELLCAST_SUCCEEDED"
        and provider == "ClassicAPI" then
            if arg1 == "player" then
                Tracker.RecordSuccessfulSpell(arg3, arg4, arg2)
            end
            return
        end

        if event == "SPELL_CAST_EVENT"
        and provider == "Nampower" then
            if arg1 == 1 and (arg5 == 0 or not arg5) then
                Tracker.RecordSuccessfulSpell(arg2, nil, nil)
            end
            return
        end

        if event == "UNIT_CASTEVENT"
        and provider == "SuperWoW" then
            if arg3 ~= "CAST" then
                return
            end

            local guid = nil

            if type(UnitGUID) == "function" then
                guid = UnitGUID("player")
            end

            if not guid then
                local exists
                exists, guid = UnitExists("player")
            end

            if guid and arg1 == guid then
                Tracker.RecordSuccessfulSpell(arg4, nil, nil)
            end
        end
    end
)

-- Retain the existing timer callback but install it only while enabled.
local trackingTick = eventFrame:GetScript("OnUpdate")
local updateTrackingEvents = RefreshTrackingEvents
RefreshTrackingEvents = function()
    updateTrackingEvents()
    eventFrame:SetScript("OnUpdate",
        settings.enabled and trackingTick or nil)
end
RefreshTrackingEvents()
