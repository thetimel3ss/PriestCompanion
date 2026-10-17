# Priest Companion Roadmap

The roadmap tracks outstanding improvements and ongoing verification. Released functionality belongs in [CHANGELOG.md](CHANGELOG.md), not here.

**Review date:** 2026-10-17  
**Development branch:** `feature/wand-progression-clean`  
**Current release:** `0.1.2`

## Current scope and confirmed decisions

- **Wand Progression database: complete for the current OctoWoW database.** `Data/Wands.lua` exposes 146 wands, each with an item entry and at least one acquisition source. The deliberately excluded Grungy Firestick (61374) remains for reference in Items/Sources only. Later server additions or corrections are normal maintenance, not an unfinished database.
- **Custom world maps, dungeon maps, and configured floors:** the maintainer has validated the maps and floors currently configured in game. New map metadata, floor alignment changes, and newly entered NPC coordinates still merit in-game checks.
- **Changes after 2026-10-13:** the maintainer validated previous changes individually in game. The latest 2026-10-17 data commit was reviewed statically; that review is not a substitute for confirming new coordinates and map behavior in the client. Earlier Lua 5.0.3/mock-API tests remain historical context.
- **Aggregate drops:** all 28 `npcName = "Multiple creatures"` entries now include the maintainer's acquisition note: 21 world-drop-style records without a fixed NPC/instance and seven multi-mob instance drops. No fake pin should be added. The former aggregate NPC IDs 15319/91910 and the misleading `mobCount = 1` on item 80799 have been removed.
- **Loot table presentation:** Incindis (52145), Sulfuron Harbinger (12098), Lucifron (12118), and Shazzrah (12264) keep loot data but intentionally hide the full table in Source Details.

## Open technical limitations and maintenance

### Mapping and NPC locations
- All **31 registered instances** now have `worldMap` metadata. Ragefire Chasm (389) was completed with `mapID = 4`, `zoneID = 1`.
- One NPC (Risen Oilblaze, 80116) has neither `map` nor `locations`; its exact location/existence remains unconfirmed. Six other NPCs retain `(0, 0)` placeholders; some are intentional because exact positions cannot be trusted or spawns are variable.
- Rigger Gizelton (11626), Taragaman the Hungerer (11520), and Lady Falther'ess (14686) received locations/corrections. Noxxion's Spawn (13456) and Harbinger Aph'ygth (65114) were intentionally removed as unused/redundant.
- Configured custom map identifiers and floors were validated by the maintainer in game. The resolver still requires known `worldMap` indices or resolvable names. **New or modified** maps and NPC pins need targeted game verification; an unknown exact coordinate should use a map-only view.
- Vendor Show on Map still requires a centralized NPC record. Names, prices, and notes can be shown without it.

### Source Details presentation

- When multiple acquisition records have different types, Source Details displays the selected type rather than all types at once. For crafting, it presents the primary matching craft record; quests, drops, and vendors already support multiple entries.
- Large boss loot tables are intentionally omitted for selected sources to avoid visual clutter and performance issues; records retained in `Data/BossLoot.lua` do not imply that the UI must render them.

### Optional ClassicAPI integration — Priority 1 technical review (2026-10-17)
- **Manifest selection:** the client selects the addon's TOC **before Lua runs**. Detecting `CLASSIC_API_VERSION` in Lua cannot automatically load `PriestCompanion_ClassicAPI.toc`. Installation/packaging must explicitly select which TOC the game sees as the addon manifest, or the loader architecture must be redesigned to avoid a separate flavor.
- **Split detection:** `Core/Capabilities.lua` sets `PC.Capabilities.classicAPI` if the ClassicAPI environment flag or `CLASSIC_API_VERSION` is present. However, `Core/ClassicAPI.lua` (included **only** by the specialized TOC) sets `PC.Environment.classicAPI = true` without guarding against absent ClassicAPI. The two booleans therefore represent different things and can disagree.
- **Quest completion event:** `Core/QuestHistory.lua` registers `QUEST_TURNED_IN` based only on `PC.Environment.classicAPI`. The external ClassicAPI implementation includes `QUEST_TURNED_IN(questID, xpReward, moneyReward)`, backed by a quest-completion packet hook; the Priest Companion correctly reads the quest ID from `arg1`. The **registration condition**, rather than the event handler's argument, needs revision.
- **Fallbacks:** the direct server `.queststatus`/`TWQUEST` provider, local SavedVariables, pfQuest import, and positive API completion checks must stay functional even when ClassicAPI is absent. The server query currently uses the `GUILD` chat channel; validate its behavior without guild membership and on non-Octo servers. A missing reply leaves progress as unknown rather than proof of non-completion.
- **Candidate approach for Priority 1:** clearly separate `runtimeDetected`, `adapterLoaded`, and `eventSupported` capabilities. Decide whether to keep two explicit installation flavors or always load guarded ClassicAPI adapters from the standard TOC. Detect concrete APIs/functions for each feature; for backported events, gate registration by the confirmed provider/version or documented client support, with `pcall`/safe fallback where appropriate. Merely attempting `RegisterEvent` is **not** proof an event will fire.
- **Acceptance matrix:** Vanilla-only with standard TOC; ClassicAPI available with standard TOC; ClassicAPI available with specialized TOC; specialized TOC without ClassicAPI (should safely fall back or be rejected during packaging). For each, check addon load, item names/icons/tooltips, positive quest completion lookup, `QUEST_TURNED_IN` after turn-in, and server/pfQuest history fallbacks.
- **Status:** technical review documented; **no runtime behavior changed yet**.

### Item information

- Local item records can provide names and numerical stats, while item icons and full tooltips may still require game-provided data or asynchronous item loading. This is a runtime dependency, not a missing wand record.

## Data audit (2026-10-17)

Snapshot of the **latest committed data**, not a request to populate guessed coordinates.

### NPCs without `map` or `locations` (1)

| NPC ID | Name | Status |
| --- | --- | --- |
| 80116 | Risen Oilblaze | Kept intentionally; precise location and existence not yet verified |

### NPCs with `x = 0, y = 0` (6)

| NPC ID | Name | Zone | Status |
| --- | --- | --- | --- |
| 1853 | Darkmaster Gandling | Scholomance | Map-only/position still needs confirmation |
| 9476 | Watchman Doomgrip | Blackrock Depths | Exact location unknown |
| 10509 | Jed Runewatcher | Blackrock Spire | Map-only/position still needs confirmation |
| 14516 | Death Knight Darkreaver | Scholomance | Map-only/position still needs confirmation |
| 15208 | The Duke of Shards | Silithus | Random summon; no fixed pin |
| 80945 | Elisandra Spellbinder | Dire Maul | Precise coordinates unconfirmed |

`(0, 0)` is a placeholder, **not** a valid pin. Watchman Doomgrip (9476) and Elisandra Spellbinder (80945) specifically await reliable coordinates. The Duke of Shards (15208) is a random summon. Lady Falther'ess (14686) no longer has placeholder coordinates.

### Instances without `worldMap` (0)

All 31 instanced entries have a `worldMap`. Ragefire Chasm (389) now specifies `worldMap = { mapID = 4, zoneID = 1 }`.

### Sources registered as `Multiple creatures` (28)

All 28 records have `source.note`: 21 world-drop-style entries with `"World drop from multiple creatures. No fixed location."` and seven instanced aggregate drops with `"Dropped by multiple creatures in this instance."`. None needs a fabricated single NPC ID.

**Without `instanceID` (21):**

| Item ID | Wand | mobCount | Note |
| --- | --- | --- | --- |
| 5069 | Fire Wand | — | Confirmed acquisition note |
| 5071 | Shadow Wand | — | Confirmed acquisition note |
| 5207 | Opaque Wand | — | Confirmed acquisition note |
| 5212 | Blazing Wand | — | Confirmed acquisition note |
| 5213 | Scorching Wand | — | Confirmed acquisition note |
| 5214 | Wand of Eventide | — | Confirmed acquisition note |
| 5215 | Ember Wand | — | Confirmed acquisition note |
| 5216 | Umbral Wand | — | Confirmed acquisition note |
| 8184 | Firestarter | — | Confirmed acquisition note |
| 8186 | Dire Wand | — | Confirmed acquisition note |
| 12984 | Skycaller | 215 | Confirmed acquisition note |
| 13004 | Torch of Austen | 466 | Confirmed acquisition note |
| 13062 | Thunderwood | 426 | Confirmed acquisition note |
| 13063 | Starfaller | 459 | Confirmed acquisition note |
| 13064 | Jaina's Firestarter | 354 | Confirmed acquisition note |
| 13065 | Wand of Allistarj | 560 | Confirmed acquisition note |
| 15279 | Ivory Wand | 753 | Confirmed acquisition note |
| 15280 | Wizard's Hand | 846 | Confirmed acquisition note |
| 15281 | Glowstar Rod | — | Confirmed acquisition note |
| 15282 | Dragon Finger | — | Confirmed acquisition note |
| 15283 | Lunar Wand | 254 | Confirmed acquisition note |

**With `instanceID` (7):**

| Item ID | Wand | Instance ID | mobCount | Note |
| --- | --- | --- | --- | --- |
| 9381 | Earthen Rod | 70 | — | Confirmed acquisition note |
| 9489 | Gyromatic Icemaker | 721 | 11 | Confirmed acquisition note |
| 10572 | Freezing Shard | 129 | 14 | Confirmed acquisition note |
| 21801 | Antenna of Invigoration | 509 | 21 | Confirmed acquisition note |
| 60805 | Clutch of the Damned | 800 | 15 | Confirmed acquisition note |
| 80748 | Corrupter's Focus | 349 | 19 | Confirmed acquisition note |
| 80799 | Wand of Divine Justice | 796 | — | Confirmed acquisition note |

`Sources[21801]` and `Sources[60805]` no longer contain aggregate-only NPC IDs (15319/91910). `Sources[80799]` no longer has the contradictory `mobCount = 1`. The item entries and their source details are otherwise preserved.

## Next steps

### Priority 1 — Harden the Wand Progression release

- [ ] **ClassicAPI integration and quest history:** choose a clear TOC packaging/loading strategy; align capability detection and optional adapters; gate `QUEST_TURNED_IN` by actual supported provider/version and test the acceptance matrix above. Preserve server and pfQuest fallback providers.
- [ ] **Source Details:** handle multiple acquisition types for one wand, and multiple matching craft entries, without losing current faction/source filters, layout reuse, or map navigation.
- [ ] **Structured reputation:** migrate optional requirements from free-text notes to a data structure with faction/standing; preserve backward-compatible notes, then consider reputation- and content-based filters.
- [ ] **Map/NPC follow-up:** do not guess missing positions for Risen Oilblaze, Watchman Doomgrip, Elisandra Spellbinder, or other `(0, 0)` entries. Add positions only when verified. All registered instances currently have `worldMap`.
- [ ] **Optional pfQuest review:** use additional quest start/end locations or group-drop hints only where Priest Companion lacks verified data, without creating a hard dependency.

**Deferred until after the above technical review and fixes:**
- [ ] Differentiate dungeon and raid icons. Consider door/entrance for dungeons and shield/crest for raids; validate exact Vanilla texture paths before selecting assets.

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
