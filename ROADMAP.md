# Priest Companion Roadmap

The roadmap tracks outstanding improvements and ongoing verification. Released functionality belongs in [CHANGELOG.md](CHANGELOG.md), not here.

**Review date:** 2026-10-17  
**Development branch:** `feature/classicapi-capabilities-questhistory`  
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

### Optional ClassicAPI integration — implementation on feature branch (2026-10-17)
- **Flavor TOC selection:** ClassicAPI v1.11.0+ automatically redirects a request for `PriestCompanion.toc` to `PriestCompanion_ClassicAPI.toc` if it exists. Without that DLL support, Vanilla loads the normal TOC. The two existing manifests are deliberately retained, and ClassicAPI is **not** a required dependency.
- **Minimum enhanced baseline:** `CLASSIC_API_VERSION >= 11100` (v1.11.0) for this integration. `Core/Capabilities.lua` now differentiates DLL presence, version, supported version, adapter-loaded state, and expected `QUEST_TURNED_IN` support. Future Skills/Talents/BiS/Consumables/reputation/mana/buff modules should probe their own functions before increasing the minimum.
- **Adapter guard:** `Core/ClassicAPI.lua` leaves the Vanilla API untouched if the version is absent or too old. Item name/icon/count/tooltip enhancements check for callable providers and protect calls with `pcall`, then use their Vanilla fallbacks as appropriate.
- **Quest history:** `QUEST_TURNED_IN` registration now depends on a supported ClassicAPI runtime, not on the TOC flavor. The registered event provides quest ID in `arg1`. A `pcall(RegisterEvent)` result is recorded as `QuestHistory.LiveTurnInRegistered` but **cannot prove event delivery**.
- **Impossible native quest history:** `C_QuestLog.IsQuestFlaggedCompleted` is not feasible in the Vanilla 1.12 client; its ClassicAPI adapter override was removed. Retain SavedVariables, live turn-ins, positive injected provider results, the server-specific `.queststatus`/`TWQUEST` protocol, and optional pfQuest import. Never classify an unknown result as definitely incomplete.
- **Server fallback:** `.queststatus` still uses `GUILD` chat (no unverified alternate channel). The code skips sending when `IsInGuild() == false` and records `not_in_guild`; missing chat API or send failures are also reported by `GetServerQueryState().unavailableReason`. Server support and delivery still need in-game confirmation. No reply means an unknown history state.
- **Options command:** `/priest options` (or `/pc options`) opens **Options → General**. The former `/priest env` shortcut was removed as redundant; Mods remains accessible via Options. The **Advanced** subtab displays turn-in registration (not delivery) and server-query status; Mods shows DLL compatibility. Refresh is display-only.
- **Maintainer's prior test result:** the expanded `/priest env` command was verified in-game before the Environment UI change. Reported values included ClassicAPI 1.15.9, SuperWoW 2.2, Nampower 4, UnitXP dispatcher detection and a server response containing 932 processed quest IDs. The **new tabbed presentation and refresh behavior** still require in-game validation.
- **Static checks completed:** version/adapter separation, the TOC loading order, absence of the unsupported quest-history API call, four Vanilla fallbacks and all existing history providers were inspected in the committed code.
- **In-game acceptance matrix still pending:** Vanilla-only + standard TOC; ClassicAPI >=1.11.0 + automatic flavor; a supported runtime using the standard TOC; manually selected ClassicAPI TOC without a functioning DLL; unsupported/older DLL. Test item functions, quest turn-ins (including reload persistence), server query with and without a guild, absent server support, and pfQuest import. Also test with the latest supported ClassicAPI version.
- **Status:** code implemented on `feature/classicapi-capabilities-questhistory` under **Unreleased**. It has not been validated inside a WoW 1.12 client; do not mark this task fully done until live testing confirms behavior.

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

### Current focus — Native tabbed Options UI and client diagnostics

- [x] Replace top-level command-style navigation with Vanilla-native **Wands / Options** bottom tabs, inspired by Puppeteer. The options area now has **General / Advanced / Mods** secondary tabs.
- [x] Add `UI/OptionsPanel.lua` for read-only General and Advanced information; reorganize `UI/EnvironmentPanel.lua` into a scrollable **Options → Mods** subpage with individual DLL cards.
- [x] Replace the former `/priest env` / `/pc env` with `/priest options` / `/pc options` opening Options → General; Mods remains available as a secondary tab.
- [x] Retain ClassicAPI detection/version/minimum/adapter, quest-history turn-in and server-query diagnostics, SuperWoW, Nampower and UnitXP SP3 details. The Mods Refresh button never sends chat/server queries.
- [x] Load Options before Mods in both TOCs; leave Wand Progression data, filtering and quest/source mapping unchanged.
- [x] **Puppeteer-inspired visual refinement:** centered decorated dialog title, PanelTemplates-driven pressed/selected tab artwork, secondary-tab border alignment, and descriptive Mods sections with detected/missing/unsupported colors and selectable links.
- [ ] **In-game UI validation:** check the decorated title position, border and pressed states for both tab tiers, copyable Mods links, scroll range and status colors; then check /priest options aliases, close/reopen, return from Source Details, and unchanged Wand list on Vanilla 1.12 with/without ClassicAPI. Static inspection cannot replace this test.

### Proposed feature — Book of Prayer heal-family tracker (design pending)

- **Goal:** a small, movable, optionally visible HUD showing the most recently *successfully cast* qualifying healing spell and which different healing families are eligible for the next Book of Prayer proc. This feature is a design proposal, not implemented or validated in-game.
- **Normalization:** compare spell families (Flash Heal, Renew, Greater Heal, etc.), ignoring ranks and distinguishing different spell types. Non-healing casts should not replace the previous healing family, and unsuccessful/interrupted casts should not update the state.
- **Preferred tracking:** ClassicAPI's `UNIT_SPELLCAST_SUCCEEDED` can provide spell ID/name for the local player (verify event support on each runtime); optional SuperWoW `UNIT_CASTEVENT` may provide a fallback via caster GUID, event type, and spell ID. Raw 1.12 `SPELLCAST_STOP` alone is not authoritative proof of cast success; account for unknown or limited mode if no reliable provider is available.
- **Talent detection:** query Vanilla `GetNumTalentTabs`, `GetNumTalents` and `GetTalentInfo` to detect Book of Prayer ranks if available; allow manual visibility until the custom talent can be verified in-game.
- **Open tests:** qualify spell list, Renew application vs periodic ticks, group heals, Holy Nova, overheals, Power Word: Shield, cast failure, combat-log edge cases, and talent points versus actual refund behavior. Do not claim confirmed mana refund from a client-side guess.

### Deferred — Wand Progression enhancements

- [x] **ClassicAPI code:** use the automatic flavor TOC redirect, add a guarded v1.11.0-capable adapter, detect capabilities separately, and preserve optional quest-history providers.
- [ ] **ClassicAPI in-game validation:** complete the acceptance matrix above, specifically live `QUEST_TURNED_IN`, item fallbacks, no-guild server transport, and reload persistence before merging this feature branch.
- [ ] **Source Details:** handle multiple acquisition types for one wand, and multiple matching craft entries, without losing current faction/source filters, layout reuse, or map navigation.
- [ ] **Structured reputation:** migrate optional requirements from free-text notes to a data structure with faction/standing; preserve backward-compatible notes, then consider reputation- and content-based filters.
- [ ] **Map/NPC follow-up:** do not guess missing positions for Risen Oilblaze, Watchman Doomgrip, Elisandra Spellbinder, or other `(0, 0)` entries. Add positions only when verified. All registered instances currently have `worldMap`.
- [ ] **Optional pfQuest review:** use additional quest start/end locations or group-drop hints only where Priest Companion lacks verified data, without creating a hard dependency.

**Deferred until after the above technical review and fixes:**
- [ ] Differentiate dungeon and raid icons. Consider door/entrance for dungeons and shield/crest for raids; validate exact Vanilla texture paths before selecting assets.

### Later capabilities (scope and feasibility to be assessed)

- [ ] Open-world / dungeon / raid content filters (potentially grouped with reputation filters).
- [ ] Add real configurable settings to Options → General / Advanced later (quest-history preferences, optional integrations, reset and UI settings). Current Options pages are read-only.
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
