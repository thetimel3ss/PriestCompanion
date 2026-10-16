# Priest Companion Roadmap

The roadmap tracks outstanding improvements and ongoing verification. Released functionality belongs in [CHANGELOG.md](CHANGELOG.md), not here.

**Review date:** 2026-10-16  
**Development branch:** `feature/wand-progression-clean`  
**Current release:** `0.1.1`

## Current scope and confirmed decisions

- **Wand Progression database: complete for the current OctoWoW database.** `Data/Wands.lua` exposes 146 wands, each with an item entry and at least one acquisition source. The deliberately excluded Grungy Firestick (61374) remains for reference in Items/Sources only. Later server additions or corrections are normal maintenance, not an unfinished database.
- **Custom world maps, dungeon maps, and configured floors:** the maintainer has validated the maps and floors currently configured in game. New map metadata, floor alignment changes, and newly entered NPC coordinates still merit in-game checks.
- **Changes after 2026-10-13:** the maintainer tested the subsequent modifications individually in game. Earlier Lua 5.0.3/mock-API tests are historical context, not a substitute for later live tests.
- **Aggregate drops:** intentionally use `npcName = "Multiple creatures"` when many creatures can drop an item; enumerating individual NPCs is not required. For a drop with a configured `instanceID`, show the instance without a fabricated individual NPC pin. For drop records without an instance or NPC, show acquisition details without suggesting a precise location.
- **Loot table presentation:** Incindis (52145), Sulfuron Harbinger (12098), Lucifron (12118), and Shazzrah (12264) keep loot data but intentionally hide the full table in Source Details.

## Open technical limitations and maintenance

### Mapping and NPC locations

- Five records lack `map` and `locations` entirely; seven contain placeholder coordinates `(0, 0)`. These are not necessarily defects: moving spawns, unavailable dungeon boss overlays, and map-only navigation can make the lack of a pin intentional.
- The mapping layer relies on matching names or registered `instanceID`/`worldMap` metadata, and cannot infer every custom zone or floor. The current configured custom maps and floors have been **validated by the maintainer in game**. Continue verifying **new or changed** NPC coordinates and floor relationships rather than treating previously validated maps as untested.
- One instance has no `worldMap` record: Ragefire Chasm (389). Confirm whether adding native map metadata is useful and supported by the client before changing it.
- A vendor's Show on Map button still requires a centralized NPC entry. The name, price, and note can be shown without one.

### Source Details presentation

- When multiple acquisition records have different types, Source Details displays the selected type rather than all types at once. For crafting, it presents the primary matching craft record; quests, drops, and vendors already support multiple entries.
- Large boss loot tables are intentionally omitted for selected sources to avoid visual clutter and performance issues; records retained in `Data/BossLoot.lua` do not imply that the UI must render them.

### Optional ClassicAPI integration

- WoW determines the TOC at addon load time; **detecting ClassicAPI from Lua does not automatically switch between** `PriestCompanion.toc` and `PriestCompanion_ClassicAPI.toc`. A loader, packaging step, or installation choice must select the right manifest.
- `Core/Capabilities.lua` can recognize a ClassicAPI runtime, but only the ClassicAPI TOC loads `Core/ClassicAPI.lua` and enables `PC.Environment.classicAPI`. `Core/QuestHistory.lua` currently registers `QUEST_TURNED_IN` only when that environment flag is true. Consequently, the standard TOC plus a detected ClassicAPI runtime does not necessarily enable the same overrides or live turn-in tracking.
- **Priority 1 investigation:** decide how to select the TOC flavor at installation and whether live event support can be safely probed at runtime. Checking for a specific callable API is reasonable; detecting an event reliably is different from detecting a function. Registering an event does not by itself prove that a given client will deliver it. Preserve server and pfQuest quest-history fallbacks.

### Item information

- Local item records can provide names and numerical stats, while item icons and full tooltips may still require game-provided data or asynchronous item loading. This is a runtime dependency, not a missing wand record.

## Data audit (2026-10-16)

This is a snapshot of the committed data, for verification only. It is **not** a request to populate arbitrary or fabricated coordinates.

### NPCs without `map` or `locations` (5)

| NPC ID | Name | Recorded zone |
| --- | --- | --- |
| 11626 | Rigger Gizelton | Desolace |
| 11520 | Taragaman the Hungerer | Ragefire Chasm |
| 13456 | Noxxion's Spawn | Not set |
| 65114 | Harbinger Aph'ygth | Not set |
| 80116 | Risen Oilblaze | Not set |

### NPCs with `x = 0, y = 0` (7)

| NPC ID | Name | Recorded zone |
| --- | --- | --- |
| 1853 | Darkmaster Gandling | Scholomance |
| 9476 | Watchman Doomgrip | Blackrock Depths |
| 10509 | Jed Runewatcher | Blackrock Spire |
| 14516 | Death Knight Darkreaver | Scholomance |
| 14686 | Lady Falther'ess | Razorfen Downs |
| 15208 | The Duke of Shards | Silithus; random summon |
| 80945 | Elisandra Spellbinder | Dire Maul |

Coordinates `(0, 0)` mean no reliable position marker. Do not replace them with arbitrary guesses; the existing map-only fallback is intentional.

### Instance missing `worldMap` (1)

| Instance ID | Name | Notes |
| --- | --- | --- |
| 389 | Ragefire Chasm | No `worldMap` mapping; check native map support if a direct map is needed |

### Sources registered as `Multiple creatures` (28)

The **21 entries without `instanceID`** below are possible open-world/world-drop candidates, **not automatically proven world drops**. Verify their distribution against OctoWoW data before assigning a location or `sourceCategory`.

| Item ID | Wand | Instance ID | NPC ID |
| --- | --- | --- | --- |
| 5069 | Fire Wand | — | — |
| 5071 | Shadow Wand | — | — |
| 5207 | Opaque Wand | — | — |
| 5212 | Blazing Wand | — | — |
| 5213 | Scorching Wand | — | — |
| 5214 | Wand of Eventide | — | — |
| 5215 | Ember Wand | — | — |
| 5216 | Umbral Wand | — | — |
| 8184 | Firestarter | — | — |
| 8186 | Dire Wand | — | — |
| 12984 | Skycaller | — | — |
| 13004 | Torch of Austen | — | — |
| 13062 | Thunderwood | — | — |
| 13063 | Starfaller | — | — |
| 13064 | Jaina's Firestarter | — | — |
| 13065 | Wand of Allistarj | — | — |
| 15279 | Ivory Wand | — | — |
| 15280 | Wizard's Hand | — | — |
| 15281 | Glowstar Rod | — | — |
| 15282 | Dragon Finger | — | — |
| 15283 | Lunar Wand | — | — |

The **7 entries with `instanceID`** represent aggregated dungeon/raid drops; a map-only display may be preferable to a long mob list.

| Item ID | Wand | Instance ID | NPC ID | mobCount |
| --- | --- | --- | --- | --- |
| 9381 | Earthen Rod | 70 | — | — |
| 9489 | Gyromatic Icemaker | 721 | — | 11 |
| 10572 | Freezing Shard | 129 | — | 14 |
| 21801 | Antenna of Invigoration | 509 | 15319 | 21 |
| 60805 | Clutch of the Damned | 800 | 91910 | 15 |
| 80748 | Corrupter's Focus | 349 | — | 19 |
| 80799 | Wand of Divine Justice | 796 | — | 1 |

**Items requiring special confirmation:** `Sources[21801]` still has `npcID = 15319`, and `Sources[60805]` still has `npcID = 91910` in the current committed branch, although those IDs were intended to be removed for aggregated drops. `Sources[80799]` is labeled "Multiple creatures" with `mobCount = 1`; confirm whether it represents a single known mob, a grouped drop, or a placeholder. Avoid creating NPC records solely to satisfy aggregate sources.

## Next steps

### Priority 1 — Harden the Wand Progression release

- [ ] Clarify and fix ClassicAPI TOC selection vs runtime capability/event support for quest history.
- [ ] Improve Source Details when the same wand has multiple acquisition *types* or multiple craft alternatives, while respecting selected filters.
- [ ] Introduce structured reputation requirements (faction, standing, optional character standing check). Current `source.note` descriptions remain valid; add reputation and content filters when practical.
- [ ] Confirm aggregate source classifications from the 28-item audit; remove residual aggregate-only NPC IDs if that is still intended in the current branch.
- [ ] Review the value of adding `worldMap` to Ragefire Chasm and improve location records only when reliable coordinates are available.
- [ ] Review iconography and distinguish dungeons from raids. Suggested direction: a simple dungeon doorway icon for dungeons and a raid crest/skull or crossed-weapons emblem for raids; use subdued vs stronger visual accents. Verify texture paths in the Vanilla client before choosing a bundled/native asset.
- [ ] Evaluate optional pfQuest enhancements only where Priest Companion data is incomplete: quest start/end coordinates, relevant mob-drop locations, and area lookup fallbacks. Use runtime capability checks, avoid hard dependencies, and prefer the addon’s verified custom records over generic data. The existing mob lookup and quest history import already work as fallbacks.

### Later capabilities (scope and feasibility to be assessed)

- [ ] Open-world / dungeon / raid content filters (potentially grouped with reputation filters).
- [ ] Settings tab (quest-history preferences, optional integrations, reset and UI settings).
- [ ] Minimap launcher.
- [ ] Priest skills database.
- [ ] Talent builds.
- [ ] Best-in-slot lists.
- [ ] Consumables database.
- [ ] Mana support and out-of-mana announcements.
- [ ] Self-buff helpers and optional reagent purchase helpers, subject to client/API constraints.

### No longer planned as an incomplete feature

- [x] Complete the current OctoWoW Wand Progression item database (146 listed wands with corresponding items and sources).

## Documentation policy

- `CHANGELOG.md`: actual versioned additions, fixes, and changes; keep prior release entries intact.
- `ROADMAP.md`: current limitations, decisions, audited data, future enhancements, and priorities.
- New or changed client map metadata should be verified in-game; old validated behavior should not be relabeled as untested.
