# Changelog

## [Unreleased]

### Added
- Added Wand Progression module foundation.
- Added static item database.
- Added item acquisition source database.
- Added dedicated Wand progression database.
- Added an expanded OctoWoW-verified Wand Progression catalog covering early, mid, and late leveling options.
- Added faction-aware Wand recommendation ranges for Alliance and Horde.
- Added suggested level ranges for useful non-primary Wand alternatives.
- Added quest database.
- Added quest chain database.
- Added instance database for dungeon and raid references.
- Added support for multiple acquisition sources per item.
- Added support for faction-specific item sources.
- Added lightweight quest and drop source metadata for progression items whose full Source Details records are not implemented yet.
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
- Added faction-aware recommendation highlighting based on the active faction filter/player faction.
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
- Added centralized NPC database with reusable NPC locations.

### Source Details
- Added dedicated Source Details panel.
- Added expandable source information instead of placing large quest chains inside tooltips.
- Added support for Craft, Quest, Drop, and Vendor source structures.
- Added reusable structure for future dungeon boss and vendor details.
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
- Separated item equip requirements from quest/source acquisition requirements.
- Separated Wand progression recommendations from item properties.
- Separated quest data from quest chain relationships.
- Added reusable instance references for dungeon and raid content.
- Added centralized NPC references shared by quests and map navigation.
- Added unified quest history providers while keeping pfQuest and ClassicAPI optional.
- Added instance-owned WorldMap metadata and entrance fallbacks.

### Data
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
- Added OctoWoW-verified progression entries for Flaring Baton, Moonstone Wand, Torchlight Wand, Sable Wand, Wand of Decay, Sizzle Stick, Cookie's Stirring Rod, Spellcrafter Wand, Branding Rod, Excavation Rod, Consecrated Wand, Charred Wand, Dancing Flame, Captain Rackmore's Tiller, Rod of Sorrow, Burning Sliver, Flash Wand, Eyepoker, Kodo Brander, Gnomish Zapper, Goblin Igniter, Charged Lightning Rod, Nature's Breath, Noxious Shooter, Rod of Corrosion, and Smokey's Fireshooter.

### Changed
- Redesigned Wand Progression from a single-item information panel into a compact list.
- Redesigned acquisition source display using icons instead of plain text.
- Redesigned the inner panel with a darker background.
- Redesigned recommendation highlighting from yellow to green.
- Redesigned crafting tooltip to reduce unnecessary information.
- Changed source data to support multiple acquisition methods for the same item.
- Changed faction restrictions to belong to acquisition sources instead of items.
- Changed the Recommended column to prefer faction-specific recommendation ranges and fall back to general suggested ranges.
- Changed Wand usability checks to consider both actual item equip requirements and acquisition-source requirements.
- Changed quest chain presentation to show the reward quest first, followed by its prerequisites.
- Changed the main window size to provide more vertical space.
- Improved organization of UI layout values for easier visual adjustment.
- Changed Wand source metadata elements to use independently configurable X/Y positions.
- Changed quest NPC references to use centralized NPC IDs instead of duplicated NPC data.
- Changed dungeon map metadata to live in `Data/Instances.lua` instead of map core logic.

### Fixed
- Fixed Wand list failing to load when adding multiple entries.
- Fixed ClassicAPI item icons displaying the unknown-item icon while item data was still loading.
- Fixed UnitXP SP3 detection when loaded through environments that do not expose `Vanilla1121mod.UnitXP_SP3`.
- Fixed faction source detection when an item has both Alliance and Horde acquisition paths.
- Fixed quest-reward Wands incorrectly treating the quest minimum level as an intrinsic item equip requirement.
- Fixed incomplete catalog sources showing a Source Details action before detailed quest/NPC/map data exists.
- Improved tooltip positioning near screen boundaries.
- Improved Wand column alignment.
- Improved dropdown spacing and filter readability.
- Fixed Source Details scroll range after expanding and collapsing quests.
- Fixed XP and reputation reward coloring in Source Details.
- Fixed Blackfathom Deeps quest markers to use the native dungeon map and correct Thaelrid coordinates.

### Planned
- Complete the remaining Wand Progression entries after OctoWoW existence/source verification.
- Add OctoWoW custom Wands, quests, NPCs, and sources.
- Replace or improve the current dungeon icon.
- Expand optional pfQuest integration for missing quest/map data where useful.
- Add dungeon drop sources.
- Add boss drop information.
- Add drop chance information.
- Add vendor source details.
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