# Changelog

## [Unreleased]

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
- Separated Wand progression recommendations from item properties.
- Separated quest data from quest chain relationships.
- Added reusable instance references for dungeon and raid content.

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

### Fixed
- Fixed Wand list failing to load when adding multiple entries.
- Fixed ClassicAPI item icons displaying the unknown-item icon while item data was still loading.
- Fixed UnitXP SP3 detection when loaded through environments that do not expose `Vanilla1121mod.UnitXP_SP3`.
- Fixed faction source detection when an item has both Alliance and Horde acquisition paths.
- Improved tooltip positioning near screen boundaries.
- Improved Wand column alignment.
- Improved dropdown spacing and filter readability.

### Planned
- Complete the Wand Progression item database.
- Add OctoWoW custom Wands, quests, NPCs, and sources.
- Improve independent positioning controls for:
  - Source icon.
  - Source text.
  - Faction icon.
  - Faction text.
  - Instance icon.
  - Instance text.
  - Details indicator.
- Replace or improve the current dungeon icon.
- Improve Wand list spacing near the scrollbar.
- Improve Source Details spacing near the scrollbar.
- Fix Source Details scroll range updates after expanding and collapsing quests.
- Add standard game colors for XP and reputation rewards.
- Add native Priest Companion world map markers.
- Add animated quest start and quest end markers.
- Add map coordinate support for NPCs.
- Remove the need for pfQuest for basic Show Start / Show End functionality.
- Keep pfQuest as an optional integration for enhanced map and quest features.
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