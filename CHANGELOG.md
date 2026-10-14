# Changelog

## [Unreleased]

Updated through 2026-10-13 (including fixes based on `5ff74e8`). This section describes the current development branch; no new release version has been assigned.

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

### Known Limitations (code review, 2026-10-13)
- Several NPC records still lack precise coordinates. Their dungeon map can be opened without a marker, or a configured entrance used when the internal map is unavailable.
- Map lookup still requires matching zone names or explicit map metadata. Selected indices can be checked, but correct dungeon artwork, floor alignment and NPC positions still need in-game verification.
- Some sources still reference NPCs without centralized records. Inline names can display and instance fallbacks can be used, but native NPC coordinates require completing the database.
- The detail panel still renders only the primary crafting source and only the selected source type. Vendor map buttons require an NPC record; source-only names/prices can display before the NPC database is completed.
- Quest-history event registration uses the ClassicAPI environment flag, while other panels use capability detection. Standard-TOC ClassicAPI detection does not load the ClassicAPI API overrides or enable turn-in tracking.
- Item names can fall back to local data, but icons and full item tooltips still depend on game-provided item data.
- All Lua files passed syntax loading in Lua 5.0.3. In-memory tests covered map fallback/error paths, faction-specific starters, quest-card reuse/height, and both drop-button handlers with mocked WoW APIs. Actual Vanilla 1.12 rendering, custom maps and server behavior still require in-game testing.

### Planned
- Complete the Wand Progression item database.
- Replace or improve the current dungeon icon.
- Expand optional pfQuest integration for missing quest/map data where useful.
- Add reputation requirements.
- Add open-world, dungeon, and raid content filters.
- Add Skills database.
- Add Talent builds.
- Add BiS lists.
- Add Consumables.
- Add Settings tab with quest-history sync preferences and reset controls.
- Add Minimap button.
- Add Auto Mana tools.
- Add OOM announcer.
- Add automatic self-buff utilities.
- Add automatic purchasing of buff reagents.

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
