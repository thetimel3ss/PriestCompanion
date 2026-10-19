# Changelog

## [Unreleased]

### Added — Nampower exact Book of Prayer refund and larger mana text (2026-10-19)
- Prefer the live Nampower `SPELL_ENERGIZE_ON_SELF` server event, filtered to spell ID **52942** (Book of Prayer), mana power type `0`, nonperiodic, and positive amount. The displayed `+N mana` is the server-reported amount (`arg5`), not a calculated percentage. Match to the current recent qualifying heal, with a short buffer if the energize event precedes the successful cast event; avoid duplicating other energize sources.
- Keep the existing ClassicAPI `C_Spell.GetSpellPowerCost` prediction as a fallback (`~N mana`) when the direct Nampower report is unavailable; existing Inner Focus suppression and Ascendance's dynamically modified cost path remain relevant. Nampower is an optional integration and does not replace the preferred ClassicAPI success event.
- Detect Nampower's major/minor release through `GetNampowerVersion()`. On **4.5+**, registering the energize event enables it; older versions require the Nampower `NP_EnableSpellEnergizeEvents` CVar, set automatically only when the user enables **Show mana refund** and the talent is active. The addon does not execute a slash command. If the addon changes an older CVar, it restores its prior value when the user disables the option or logs out (including reload).
- Rename the checkbox from **Show estimated mana refund** to **Show mana refund** and document `+N` (Nampower actual) versus `~N` (ClassicAPI estimate). Preserve its previous saved state and default off behavior.
- Increase the mana-refund font from `GameFontHighlightSmall` to `GameFontHighlight`, without changing the maintainer's manually adjusted tracker title font.
- **In-game validation pending:** test Nampower 4.0 vs 4.5+, event delivery/timing and fallbacks, Inner Focus suppression, Ascendance, reload, and color/number agreement.

### Added — Predicted Book of Prayer mana refund (2026-10-19)
- Renamed the visible Options subtab **Advanced** to **Tracker**, preserving the existing internal section ID (`advanced`) and all user settings.
- Added **Show estimated mana refund** (off by default) next to the existing independent color-border option. After a confirmed qualifying heal, the HUD may display e.g. `~38 mana`; the tilde explicitly indicates a prediction, **not an observed/verified increase in mana**. When cost data is unavailable the HUD does not display a fabricated value.
- On ClassicAPI-capable clients, capture the spell's live `C_Spell.GetSpellPowerCost(spellID)[1].cost` at `UNIT_SPELLCAST_SENT`, match the spell ID and cast GUID at `UNIT_SPELLCAST_SUCCEEDED`, and estimate `effectiveCost * talentPoints * 0.15`, rounding the *displayed* estimate to an integer. Other providers keep the previous family/color tracking without making numeric estimates.
- Account for the tested OctoWoW Inner Focus quirk: an Inner Focus-affected cast returns no mana, and the next healing cast is also ineligible; zero-cost casts suppress the displayed refund. Confirm full behavior on the live server, including buff cancellation/expiration, instant casts, and Ascendance changes; no hardcoded Ascendance multiplier is used.
- The main healing tracker still requires Book of Prayer talent points and only considers the same six healing families, independent of rank. Mana forecasts and Inner Focus suppression are **unreleased pending in-game verification**.

### Added — Configurable Prayer Tracker auto-hide (2026-10-19)
- Added an opt-in **Auto-hide after inactivity** checkbox in Options → Advanced with a numeric-only Vanilla `InputBoxTemplate` field for the timeout (1–600 whole seconds, default 15). The input is disabled when auto-hide is unchecked and includes a tooltip describing the timer.
- The inactivity timer resets only when a compatible healing spell is successfully cast. Once the timeout expires the floating HUD hides automatically and is restored by the next successful qualifying heal, including while a previous hide is in effect.
- Auto-hide is off by default to preserve existing behavior; the checkbox and timeout are persisted per character in `PriestCompanionCharDB`. Numeric values are validated and clamped by the core, including data loaded from saved variables.
- The feature does not change talent detection, spell-family logic, cast event providers, colored refund border, movable/resizable HUD, or the maintainer's adjusted tracker title font. In-game verification still required.

### Changed — Advanced tooltip help and startup tab (2026-10-19)
- Moved the explanatory text for **Show refund status (border color)** and **Lock position** into native `GameTooltip` hover hints; both the checkbox and its text label show the tooltip, and the label can be clicked to toggle the setting.
- Renamed **Lock position and size** to **Lock position** (it continues to prevent both dragging and resizing).
- Removed the temporary **Last confirmed heal** line and all **Quest History Diagnostics** labels/status from Options → Advanced. The quest-history core and background tracking are unchanged; the UI will be revisited in a future feature.
- Removed the now-unused explanatory paragraphs and reduced the Advanced scrolling content height. Updated General's description of Advanced.
- Changed the first-open window default after client load to **Options → General**. Later manual tab changes are respected while the session remains open; `/priest options` continues to explicitly open General.
- Preserved the maintainer's latest `dcccb773` tracker title font-size adjustment and existing saved Prayer Tracker preferences. Pending in-game visual verification.

### Changed — Cleaner Book of Prayer HUD (2026-10-19)
- Removed the `30%` / `15%` / `0%` refund footer entirely. The existing Advanced **Show refund status (border color)** checkbox now controls only the green/red/neutral HUD border and subtle background tint.
- Increased logical compact spell icon size from 36 to 48 and expanded icon size from 40 to 54; when **Show spell name** is unchecked, increase them further to 62 and 64 respectively.
- Enlarged the primary spell name using the regular `GameFontHighlight` font, improved the readability of the previous spell label, and repositioned icons/arrow to use the freed space. The content continues to scale proportionally with window resizing.
- Adjusted the Advanced help text to describe border colors rather than percentage. Talent detection, healing-family rules, saved window sizes and the maintainer's positioning changes remain intact. In-game visual validation pending.

### Improved — Prayer Tracker sizing and visual status (2026-10-19)
- The floating HUD now uses an internal scaled content frame so the header, spell icons, names, and footer resize proportionally with the window; compact minimum dimensions are 68x68 (previously 104x112) and expanded minimum dimensions are 104x78 (previously 170x118).
- Replaced the verbose `Eligible: ... mana cost` / `Same spell: no refund` messages with a color-coded HUD border and subtle background: green for eligible family changes, red for repeated families, neutral before a comparison or when the option is disabled. The small footer shows only the talent refund rate (15%/30%) or 0%; no mana amounts are estimated.
- Renamed the Advanced checkbox to **Show refund status (border color)** and aligned all six checkboxes with a consistent 30px vertical step; the red talent-points requirement is now inline with Enable Tracker.
- Preserved previous per-character geometry/settings, drag and edge resizing, cast detection and the maintainer's title/main-tab positions. Pending in-game UI verification.

### Added — Book of Prayer Tracker prototype (2026-10-17)
- Added `Data/HealingSpells.lua` to define six rank-independent healing families: Flash Heal, Renew, Prayer of Healing, Heal, Greater Heal and Lesser Heal.
- Added `Core/PrayerTracker.lua`: scans the character's talents for Book of Prayer points, normalizes successful player casts by healing family and records previous/current families. Ignores interrupted/failed casts and periodic ticks. Uses one cast provider at a time (ClassicAPI `UNIT_SPELLCAST_SUCCEEDED`, then Nampower `SPELL_CAST_EVENT`, then SuperWoW `UNIT_CASTEVENT`).
- Added `UI/PrayerTracker.lua`, an independent compact/expanded HUD with actual spellbook icons when available. The default compact view displays the latest heal, optional spell name and a footer indicating whether the last heal was eligible for a 15%/30% cost refund. **No numeric mana amount is estimated or claimed to have been measured.**
- Advanced now provides checkboxes for Enable Tracker, Expanded mode, Show spell name, Show mana refund eligibility, Show outside combat and Lock position and size. With no Book of Prayer points, Enable Tracker is disabled with a red warning.
- Implemented eight mouse-resize edges/corners, drag-to-move, size-responsive spell icons/labels and two independently saved panel sizes; locking prevents both movement and resizing.
- Added `PriestCompanionCharDB` as a per-character SavedVariable for the settings and HUD geometry. Both TOCs load the new data, core and HUD in order.
- This feature is **unreleased and not tested in-game**. Check event delivery, custom talent visibility, rank grouping and frame resizing on OctoWoW before promoting to main.

### Changed — Options command (2026-10-17)
- Replaced the redundant `/priest env` / `/pc env` command with `/priest options` / `/pc options`, which open the existing **Options → General** page.
- Updated slash-command help; the Mods diagnostics remain accessible through the Options UI and `/priest` still toggles the main window.
- Based the change on the maintainer's `bb8b9cf1` tab/title layout commit without modifying those visual adjustments.

### Fixed — Mods link field alignment and readability (2026-10-17)
- Matched Puppeteer's Vanilla `InputBoxTemplate` link behavior: named link edit boxes, corrected the default left texture anchor, set 4px internal text insets and centered the link text.
- Set link text to full white for readability while preserving copy/select behavior and the existing read-only URL restoration.
- Kept this fix confined to `UI/EnvironmentPanel.lua`; no changes to DLL detection, server queries, Wands or other navigation.

### Changed — Native tab visuals and Mods presentation (2026-10-17)
- Matched Puppeteer's compact decorated window heading with the cropped Vanilla `UI-DialogBox-Header` texture and centered Priest Companion title.
- Switched the Wands/Options bottom tabs and General/Advanced/Mods top tabs to `PanelTemplates_SetNumTabs`, `PanelTemplates_TabResize` and `PanelTemplates_SetTab` so the selected/pressed textures and tab border joins follow Blizzard's own Vanilla 1.12 behavior.
- Anchored secondary tabs immediately above the shared content border and removed the redundant outer Options border/heading to reduce doubled outlines.
- Redesigned Options → Mods with an introduction, colored per-DLL headings and detected/missing/unsupported statuses, expanded capability descriptions, and selectable source links for ClassicAPI, SuperWoW, Nampower and UnitXP SP3.
- Kept the Mods Refresh action display-only (no new server query) and preserved Wands/Source Details. The earlier `/priest env` shortcut was superseded by `/priest options` later in this unreleased branch.
- Visual and interaction verification inside the client is still pending; no version bump or main-branch changes.

### Fixed — Vanilla 1.12 tab compatibility (2026-10-17)
- Replaced unsupported native Button `SetEnabled()` calls with `Enable()` / `Disable()` in `UI/MainFrame.lua` and `UI/OptionsPanel.lua`. This addresses Lua errors when opening the main frame or selecting Options subtabs.
- Kept the same tab selection behavior, slash commands and Puppeteer-inspired layout. In-game retesting is pending.

### Added — Puppeteer-Inspired Options UI (2026-10-17)
- Added native Vanilla-style bottom tabs (**Wands** and **Options**) and secondary Options tabs (**General**, **Advanced**, **Mods**), modeled on Puppeteer's two-level navigation without importing PTGuiLib or other dependencies.
- Added `UI/OptionsPanel.lua` for nested navigation, a General information page and an Advanced read-only quest-history diagnostics page.
- Reworked `UI/EnvironmentPanel.lua` as a scrollable **Options → Mods** page with individual ClassicAPI, SuperWoW, Nampower and UnitXP SP3 cards, status, version information and descriptions of optional capabilities.
- Initially changed `/priest env` and `/pc env` to open **Options → Mods** directly; these were subsequently replaced with `/priest options` / `/pc options` (Options → General). The Mods Refresh button remains read-only.
- Preserved existing Wand Progression data, filters, row rendering and Source Details behavior. Both Vanilla and ClassicAPI TOCs now load the Options panel before the nested Mods page.
- The interface is still **Unreleased** and requires in-game validation, especially native tab templates, scrolling and navigation. The addon remains version `0.1.2`.

### Added — Environment Tab (2026-10-17)
- Initially introduced a dedicated **Environment** tab to display client diagnostics without filling game chat. Its contents have since been reorganized into **Options → Advanced / Mods** in this unreleased branch.
- Added `UI/EnvironmentPanel.lua`, a read-only diagnostic panel with grouped labels and a **Refresh** button that only refreshes the displayed snapshot and server-query status; it does not send `.queststatus`.
- The initial Environment-tab command was later redirected to **Options → Mods**; the main `/priest` command still opens/closes the main window.
- Added main-frame tab navigation while keeping the existing Wand Progression panel and Source Details available, and loaded the new panel in both Vanilla and ClassicAPI TOCs.
- Retained the current `0.1.2` version until the new interface has been validated in-game.

### Changed — Environment Diagnostics (2026-10-17)
- Expanded `/priest env` (also `/pc env`) to report the addon version, client flavor, ClassicAPI detected/installed/minimum versions, compatibility, loaded adapter, and `QUEST_TURNED_IN` registration status.
- The event line distinguishes unavailable, not registered, and registered-but-not-yet-verified delivery; registration alone does not prove a real quest turn-in event was received.
- Included the quest-history server query state and unavailable reason (where provided), without sending an additional request merely to display the diagnostics.
- Improved optional extension detection metadata: SuperWoW version with a conservative legacy-API fallback, Nampower version via a protected provider call, and UnitXP SP3 loader/dispatcher probe indication.
- These capabilities remain sampled during addon startup. After enabling or updating a DLL, restart the WoW client before relying on the diagnostic output.

### Changed — ClassicAPI and Quest History (2026-10-17)
- Established an **optional** ClassicAPI v1.11.0 integration baseline; the addon still supports Vanilla 1.12 without the DLL, and the existing `_ClassicAPI.toc` flavor remains selected automatically by compatible ClassicAPI clients.
- Separated presence, version, minimum support, loaded adapter and quest-turn-in event capabilities in `Core/Capabilities.lua`.
- Guarded `Core/ClassicAPI.lua` against absent/outdated ClassicAPI and added protected enhanced item API calls with preserved Vanilla fallbacks.
- Removed the `C_QuestLog.IsQuestFlaggedCompleted` override, because this API cannot provide historical quest completion state in Vanilla 1.12.
- Registered `QUEST_TURNED_IN` according to ClassicAPI runtime capability rather than selected TOC flavor; kept local, server, pfQuest and optional positive API history providers.
- Protected the server history command from failed chat calls and unsupported guild transport; `GetServerQueryState()` now reports `unavailableReason` when the server query could not start.
- Updated [ROADMAP.md](ROADMAP.md) with compatibility expectations and remaining **in-game test cases**. Changes are not included in a tagged release and have not yet been exercised in a WoW client.

## [0.1.2] - 2026-10-17

### Changed
- Completed all registered instance `worldMap` references, adding the Ragefire Chasm (389) native map (`mapID = 4`, `zoneID = 1`).
- Added precise map coordinates for Rigger Gizelton (11626) and Taragaman the Hungerer (11520), and corrected Lady Falther'ess (14686) to 65.3, 16.9 in Razorfen Downs.
- Added acquisition notes for all 28 `Multiple creatures` sources: 21 world-drop-style entries without a fixed instance and seven collective dungeon/raid drops, including items with more than 200 possible droppers.
- Preserved the deliberate `(0, 0)` markers when precise coordinates remain unknown, including Watchman Doomgrip (9476) and Elisandra Spellbinder (80945).
- Updated the versions in both TOC flavors and the Lua metadata fallback to `0.1.2`.

### Fixed
- Removed unused/redundant NPC records Noxxion's Spawn (13456) and Harbinger Aph'ygth (65114).
- Removed aggregate-only NPC references 15319 and 91910 from items 21801 and 60805, respectively; kept the group-drop description without a fabricated individual NPC marker.
- Removed the contradictory `mobCount = 1` from the multi-creature Wand of Divine Justice source (80799).

### Documentation and Technical Review (2026-10-17)
- Updated [ROADMAP.md](ROADMAP.md) with the 2026-10-17 audit: 173 NPC records, one missing location, six `(0, 0)` placeholders, no instances lacking `worldMap`, and all 28 aggregate drops carrying notes.
- Documented the first Priority 1 technical review of ClassicAPI TOC selection, runtime detection, quest-turn-in event support, and expected test cases. **No ClassicAPI runtime behavior has been modified yet.**
- Confirmed continued 146/146 wand, item, and source coverage for the current OctoWoW dataset. New server content can be added in subsequent maintenance updates.

### Documentation (2026-10-16)
- Separated current limitations, next-step priorities, and planned features into [ROADMAP.md](ROADMAP.md), keeping released change history here.
- Reassessed current OctoWoW wand coverage and documented in-game validation of the configured custom maps and floors.
- Audited NPC coordinates (five missing location records and seven `(0, 0)` placeholders), Ragefire Chasm world-map metadata, and 28 aggregate `Multiple creatures` sources.
- Retained the historical 0.1.0 plan without treating it as the current roadmap.

## [0.1.1] - 2026-10-16

### Release Summary
- First usable Wand Progression feature, with search, recommended filters, acquisition sources, quest-chain details, tooltips, and map navigation.
- Continued Vanilla 1.12 compatibility with optional ClassicAPI, SuperWoW, Nampower, and UnitXP SP3 enhancements.
- Set both TOC versions to 0.1.1 and aligned the Lua metadata fallback with the same version.

### Boss Loot Visibility
- Preserved full loot data for Incindis (52145), Sulfuron Harbinger (12098), Lucifron (12118), and Shazzrah (12264) while intentionally hiding their tables in Source Details.
- Added `showBossLoot = false` to the relevant drop sources and support for this option in Source Details, without changing the item drops or boss loot data.
- Added explanatory comments above the four archived-but-available boss loot records.

### Boss Loot Database (2026-10-16)
- Split boss loot acquisition data into `Data/BossLoot.lua` and load it in both Vanilla and ClassicAPI TOCs.
- Formatted 41 boss tables and 1,018 loot entries with one field per line, descriptive NPC headers, and ascending NPC ID order; item IDs, chances, qualities, notes and item order remain unchanged.
- Linked the existing Sulfuron Harbinger (12098), Lucifron (12118), Shazzrah (12264), and Drifting Avatar of Sand (61316) loot tables to their drop sources with `lootNPCID`, preserving their existing NPC classifications.
- Removed the redundant BossLoot initialization and local alias from `Data/Sources.lua`.
- Kept the deliberately discarded tables (7272, 7274, 7795, 9476, 63107, and 80830) excluded; Korrak (12159) was already absent from the new file and was not restored.

This version extends the initial 0.1.0 foundation with the first usable Wand Progression module. Development and additional features will continue in the 0.1.x series.

### Added
- Added Wand Progression module foundation.
- Added static item database.
- Added item acquisition source database.
- Added dedicated Wand progression database.
- Added quest database.
- Added quest chain database.
- Added instance database for dungeon and raid references.
- Added support for multiple acquisition sources per item.
- Added support for faction-specific item sources.
- Added automatic player faction detection.
- Added automatic player level detection.
- Added Wand list with:
  - Item icon and name.
  - DPS.
  - Required level.
  - Recommended level range.
  - Acquisition source.
  - Faction restrictions.
  - Dungeon context.
- Added Wand list filters:
  - Source type.
  - Faction.
  - Player level usability.
  - Recommended items only.
- Added automatic faction filtering mode based on the current character.
- Added recommended progression highlighting.
- Added unavailable item highlighting when the player's level is too low.
- Added colored Required Level indicator for unusable items.
- Added dynamic item DPS calculation.
- Added scrollable Wand list.
- Increased the main addon window height for improved list visibility.

### Tooltips
- Added standard WoW item tooltip support.
- Added a secondary Priest Companion source tooltip.
- Added dynamic tooltip positioning to avoid leaving the visible game area.
- Added automatic tooltip width adjustment.
- Added crafting source information.
- Added profession detection.
- Added profession skill requirement detection.
- Added reagent availability detection.
- Added required tool detection.
- Added item icons for reagents and crafting tools.
- Added green/red status coloring for available and missing crafting requirements.
- Added automatic item cache refresh when using ClassicAPI.
- Added visual indication for sources with additional details.

### Quest Sources
- Added item-started quest support via `startItem` with optional `startItemName` and `startDropNPC` fallback.
- Resolved quest-start item drops from shared `Data/Sources.lua` records (including multiple NPCs), retaining faction filtering.
- Added `Show Start` navigation to item droppers or the associated instance map, while preserving NPC-started quests and `Show End`.
- Displayed the starter item and its dropper in expanded quest details, with clear messaging when the location is unknown.
- Added quest reward source support.
- Added faction-specific quest sources.
- Added quest chain support.
- Added collapsible quest entries in Source Details.
- Added quest chain display beginning from the reward quest and following prerequisite quests backwards.
- Added quest descriptions and objectives support.
- Added quest reward item display.
- Added XP and reputation reward support.
- Added GameTooltip support for items displayed inside quest details.
- Added Show Start and Show End actions for quest NPCs.
- Added dungeon context for quests completed inside instances.
- Added per-character quest completion history.
- Added direct server quest history synchronization via `.queststatus` / `TWQUEST` when supported.
- Added optional `pfQuest_history` import as an additional quest completion provider.
- Added live quest completion tracking through `QUEST_TURNED_IN` when available.
- Added native Show Start / Show End world map navigation.
- Added animated quest start and quest end map markers.
- Added native Vanilla dungeon map support through `SetMapZoom()` indices.
- Added per-location `instanceZoneID` overrides for dungeon sections.
- Supported one NPC location through `map` or a list of locations through `locations`.
- Added pulsing drop markers, optional pfQuest lookup, and configured instance entrance fallbacks.
- Added centralized NPC database with reusable NPC locations.
- Added all matching alternative quest sources to Source Details, keeping each alternative and its prerequisite chain independent.
- Added explicit `exclusiveWith` quest relationships and an `Unavailable` status when a mutually exclusive quest is confirmed completed.
- Registered mutual exclusions for Wand of Biting Cold: Alliance quests 7202/8271 and Horde quests 7181/8272.
- Preserved active and completed quest states ahead of exclusion checks; unconfirmed completion remains `Unknown`.
- Added alternative-quest explanations in expanded descriptions and blocked status in the source tooltip.
- Supported fixed, choice, and mixed quest rewards.

### Source Details
- Added dedicated Source Details panel.
- Added expandable source information instead of placing large quest chains inside tooltips.
- Added support for Craft, Quest, Drop, and Vendor source structures.
- Added creature and boss drop details, drop chances, and boss loot tables with item tooltips and quality colors.
- Added multiple drop-source sections and Show on Map actions.
- Added instance-only map navigation for sources without an individual NPC record when instance map metadata is available.
- Added crafting detail rows with required skill, reagents, tools, and bag counts.
- Added multiple vendor details with NPC-backed names, locations, map buttons, optional price text and notes.
- Added Back navigation to return to the Wand list.

### Architecture
- Added Vanilla-compatible API abstraction layer.
- Added optional ClassicAPI enhancements.
- Added ClassicAPI-specific addon TOC.
- Added capability detection for:
  - ClassicAPI.
  - SuperWoW.
  - Nampower.
  - UnitXP SP3.
- Added Vanilla fallbacks for item information.
- Added item count abstraction for bag checks.
- Added profession skill abstraction.
- Added asynchronous ClassicAPI item data handling.
- Separated static item data from acquisition source data.
- Separated Wand progression recommendations from item properties.
- Separated quest data from quest chain relationships.
- Added reusable instance references for dungeon and raid content.
- Added centralized NPC references shared by quests and map navigation.
- Added unified quest history providers while keeping pfQuest and ClassicAPI optional.
- Added instance-owned WorldMap metadata and entrance fallbacks.

### Wand List Updates
- Sorted wands by required level, recommended range minimum, DPS, and name, with item ID as the final tie-breaker. Challenge-only wands sort after ordinary wands.
- Added a case-insensitive wand search field.
- Defaulted the level filter to `All`, faction to `Auto`, and the curated `Recommended` filter to enabled.
- Turning off `Recommended` includes both recommended and non-recommended wands.
- Used the minimum required level of matching quest sources when an item has no equip-level requirement.
- Removed decorative asterisks from wand entries and used a shared skull icon for creature and boss drops.
- Limited recommended highlighting to the explicitly curated progression wands.

### Data
- Expanded item, wand, source, quest, chain, NPC, instance, and boss-loot catalogs; added the alternate Cenarion Aid starter records.
- Added OctoWoW custom items, quests, NPCs, and instance references alongside Vanilla content.
- Expanded curated recommendations, including Webwood Branch, Withered Wand, and Bhartec's Lost Wand.
- Added Lesser Mystic Wand and Greater Mystic Wand crafting sources and materials.
- Added challenge-only metadata and the Level One Lunatic note for relevant loot.
- Kept Grungy Firestick out of the progression list while retaining its item record.
- Updated quest chains and sources, including Nether Force Wand, and corrected Pyric Caduceus instance metadata.
- Expanded dungeon map metadata and NPC records for RFD, BRD, ZF, BRS, Stratholme, and Scholomance; some boss coordinates remain incomplete.
- Updated Flaming Incinerator, Freezing Shard, Serpentine Skuller, Skycaller, Torch of Austen, Thunderwood, Starfaller, Jaina's Firestarter, Wand of Allistarj, and Skul's Ghastly Touch source data.
- Updated Plaguemaw the Rotting and Baroness Anastari locations.
- Corrected Wand of Biting Cold rewards for all four quest sources and displayed the two alternative quests per faction.
- Added Lesser Magic Wand.
- Added Greater Magic Wand.
- Added Gravestone Scepter.
- Added Alliance and Horde acquisition paths for Gravestone Scepter.
- Added Blackfathom Deeps instance data.
- Added In Search of Thaelrid quest data.
- Added Alliance Blackfathom Villainy quest data.
- Added Horde Blackfathom Villainy quest data.
- Added Gravestone Scepter Alliance quest chain.
- Added native Blackfathom Deeps WorldMap metadata (`mapID 7`, `zoneID 1`).
- Added Argent Guard Thaelrid dungeon coordinates for Blackfathom Deeps.

### Changed
- Redesigned Wand Progression from a single-item information panel into a compact list.
- Redesigned acquisition source display using icons instead of plain text.
- Redesigned the inner panel with a darker background.
- Redesigned recommendation highlighting from yellow to green.
- Redesigned crafting tooltip to reduce unnecessary information.
- Changed source data to support multiple acquisition methods for the same item.
- Changed faction restrictions to belong to acquisition sources instead of items.
- Changed quest chain presentation to show the reward quest first, followed by its prerequisites.
- Changed the main window size to provide more vertical space.
- Improved organization of UI layout values for easier visual adjustment.
- Changed Wand source metadata elements to use independently configurable X/Y positions.
- Changed quest NPC references to use centralized NPC IDs instead of duplicated NPC data.
- Changed dungeon map metadata to live in `Data/Instances.lua` instead of map core logic.

### Fixed
- Display all filtered vendor sources in Source Details, with a separate Show on Map button for each registered NPC, optional prices and wrapping acquisition notes.
- Reuse vendor map buttons safely across items and refreshes; resolve vendor names/locations from NPC records and use coin markers with existing NPC messages and map fallbacks.
- Vendor navigation change reviewed statically; the local execution environment was unavailable, so this change still requires Lua runtime and in-game verification.
- Show NPC chat tips once per navigation from drop or quest start/end buttons, with or without coordinates, including instance maps, multiple locations and fallback paths.
- Prefer `npc.message` over legacy `npc.map.message`; absent, empty or whitespace-only messages produce no tip. Removed the automatic map-only notice when no custom message is configured; map errors still report normally.
- Extended map-only navigation to outdoor zones when coordinates are absent, invalid or `(0, 0)`, keeping map-target verification and fallback handling.
- Added optional `npc.message` chat tips for NPC navigation, with legacy `map.message` support, and wrapping `source.note` text in drop details.
- Configured The Duke of Shards / Sparkling Crystal Wand to explain random summoning in its drop details and when opening Silithus without a marker.
- Opened dungeon maps without NPC pins when coordinates are missing or use the `(0, 0)` placeholder; invalid/out-of-range coordinates are not plotted.
- Verified the selected WorldMap indices after `SetMapZoom()` and caught invalid-target errors before placing markers. Unsupported internal maps fall back to configured entrances, explicitly labeled as entrances.
- Continued to the optional pfQuest lookup when a native `npc.map` cannot be shown.
- Shared drop-button navigation between the first and additional source buttons; failed NPC navigation now retries the source's instance map and configured entrance.
- Displayed all faction-compatible starters for Cenarion Aid (8254) within the existing Woestave chain: Brother Joshua and High Priest Rohan for Alliance, Ur'kyo for Horde, each with a Show Start button.
- Reused and hid starter rows correctly across quest expansion and faction changes, including their contribution to card and scroll height.
- Preserved recent user changes: corrected Azshara/dungeon names, removed duplicate BFD record, updated ZG/BWL map metadata and NPC positions, renamed the Woestave chain, and registered `SKILL_LINES_CHANGED` in Source Details.
- Fixed Wand list failing to load when adding multiple entries.
- Fixed ClassicAPI item icons displaying the unknown-item icon while item data was still loading.
- Fixed UnitXP SP3 detection when loaded through environments that do not expose `Vanilla1121mod.UnitXP_SP3`.
- Fixed faction source detection when an item has both Alliance and Horde acquisition paths.
- Improved tooltip positioning near screen boundaries.
- Improved Wand column alignment.
- Improved dropdown spacing and filter readability.
- Fixed Source Details scroll range after expanding and collapsing quests.
- Refreshed and clamped Wand list scrolling after filter changes.
- Limited indentation of long quest chains to preserve readable card widths.
- Sized the quest detail scroll area to include all alternative sources.
- Fixed XP and reputation reward coloring in Source Details.
- Fixed Blackfathom Deeps quest markers to use the native dungeon map and correct Thaelrid coordinates.

### Validation and Maintenance Notes
- The maintainer validated the custom maps and configured floors in game and individually tested the changes implemented after 2026-10-13.
- Earlier Lua 5.0.3 syntax and mocked-WoW-API tests remain historical verification; they do not substitute for the maintainer's later in-game checks.
- The OctoWoW wand database is complete for the current scope (146 wands with item and acquisition-source records). Future server additions and corrections are routine database updates.
- Outstanding technical limitations, the NPC/location inventory, aggregate-drop review, and future features are tracked in [ROADMAP.md](ROADMAP.md).

---

## [0.1.0] - 2026-09-25

### Added
- Initial Priest Companion addon structure.
- Added addon metadata and versioning.
- Added SavedVariables database foundation.
- Added basic slash commands.
- Added initial main window.
- Added basic environment detection framework.

### Planned
- Wand Progression.
- Skills database.
- Talent builds.
- BiS lists.
- Consumables.
- pfQuest integration.
- Minimap button.
- Auto Mana.
- OOM announcer.
- Auto buff (self).
- Auto buy items for buffs.
