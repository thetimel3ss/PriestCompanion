# Priest Companion Roadmap

The roadmap tracks outstanding improvements and ongoing verification. Released functionality belongs in [CHANGELOG.md](CHANGELOG.md), not here.

**Review date:** 2026-10-30
**Current release:** `0.5.0`
**Future development:** each new feature gets its own branch from `main`; implement and test there before an explicitly authorized merge into `main`.

**Release decision (2026-10-26):** maintainer confirmed the minimap tests passed and authorized closing v0.5.0 and integration into main. Historical checks for unrelated modules remain separate follow-up work.

## Current scope and confirmed decisions

- **Maintainer closure (2026-10-26):** Mana Announcer and Resurrection Assistant are complete for the requested scope. Their former optional acceptance/compatibility checklists are retired, not asserted to have been individually executed. Reopen only for a reported bug or an explicitly requested enhancement.
- **Reference-data scope closed (2026-10-26):** Wand Progression / Source Details, filters, reputation and maps satisfy the current requested scope. Further acquisition-type/recipe presentation, structured reputation, content filters, map/NPC completion, map icons and related pfQuest enrichment are dropped from the active plan. Existing limitations below are reference information, not an outstanding work queue. Do not resume these areas without a new maintainer request.

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

### Optional ClassicAPI integration — included in v0.2.0 (2026-10-19)
- **Flavor TOC selection:** ClassicAPI v1.11.0+ automatically redirects a request for `PriestCompanion.toc` to `PriestCompanion_ClassicAPI.toc` if it exists. Without that DLL support, Vanilla loads the normal TOC. The two existing manifests are deliberately retained, and ClassicAPI is **not** a required dependency.
- **Minimum enhanced baseline:** `CLASSIC_API_VERSION >= 11100` (v1.11.0) for this integration. `Core/Capabilities.lua` now differentiates DLL presence, version, supported version, adapter-loaded state, and expected `QUEST_TURNED_IN` support. Future Skills/Talents/BiS/Consumables/reputation/mana/buff modules should probe their own functions before increasing the minimum.
- **Adapter guard:** `Core/ClassicAPI.lua` leaves the Vanilla API untouched if the version is absent or too old. Item name/icon/count/tooltip enhancements check for callable providers and protect calls with `pcall`, then use their Vanilla fallbacks as appropriate.
- **Quest history:** `QUEST_TURNED_IN` registration now depends on a supported ClassicAPI runtime, not on the TOC flavor. The registered event provides quest ID in `arg1`. A `pcall(RegisterEvent)` result is recorded as `QuestHistory.LiveTurnInRegistered` but **cannot prove event delivery**.
- **Quest-history API status (reviewed 2026-10-30):** plain Vanilla still cannot provide a complete native quest-history bitmap. ClassicAPI 1.18.0 now adds completed-quest queries on Turtle-lineage clients via the server's `.queststatuses`/`TWQUEST` protocol; its initial empty cache is not proof of incompletion. The old unconditional override remains removed, and a new optional adapter is not implemented in this integration branch. Retain SavedVariables, live turn-ins, injected positive providers, the existing server-specific `.queststatus`/`TWQUEST` provider and pfQuest import. Quest UI/data scope remains closed unless explicitly reopened.
- **Server fallback:** `.queststatus` still uses `GUILD` chat (no unverified alternate channel). The code skips sending when `IsInGuild() == false` and records `not_in_guild`; missing chat API or send failures are also reported by `GetServerQueryState().unavailableReason`. Server support and delivery still need in-game confirmation. No reply means an unknown history state.
- **Options command and startup:** `/priest options` (or `/pc options`) explicitly opens **Options → General**, which is now also the first-open tab after loading the game. `/priest env` remains removed. Mods shows optional DLL compatibility; Advanced now hosts Book of Prayer options only. Quest-history core remains active but its diagnostic UI was temporarily removed pending relocation. Mods Refresh is display-only.
- **Maintainer's prior test result:** the expanded `/priest env` command was verified in-game before the Environment UI change. Reported values included ClassicAPI 1.15.9, SuperWoW 2.2, Nampower 4, UnitXP dispatcher detection and a server response containing 932 processed quest IDs. The **new tabbed presentation and refresh behavior** still require in-game validation.
- **Static checks completed:** version/adapter separation, the TOC loading order, absence of the unsupported quest-history API call, four Vanilla fallbacks and all existing history providers were inspected in the committed code.
- **In-game acceptance matrix still pending:** Vanilla-only + standard TOC; ClassicAPI >=1.11.0 + automatic flavor; a supported runtime using the standard TOC; manually selected ClassicAPI TOC without a functioning DLL; unsupported/older DLL. Test item functions, quest turn-ins (including reload persistence), server query with and without a guild, absent server support, and pfQuest import. Also test with the latest supported ClassicAPI version.
- **Status:** optional integration code included in `0.2.0`; the separate ClassicAPI and quest-history compatibility matrix remains **unverified**. Its release does not mean every client/provider combination has been tested.

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

### Optional ClassicAPI module integrations (`feature/classicapi-integrations`)

Scope: integration into existing Resurrection Assistant, Shield Tracker and Auto Mana, including cooldown display. Soulstone/self-resurrection UI is excluded by maintainer decision. A completed-quest adapter remains a proposal, not part of this increment. All integrations probe callable providers; the existing optional integration baseline remains 1.11.0.

- [x] Add native incoming-resurrection queries/events while preserving pending-offer and alternate-addon evidence, combat gating and manual clicks.
- [x] Add scalar aura snapshots/instance deltas, conservative full-update/login behavior, refresh deduplication and native fallback; preserve caster-isolated learned estimates and learning exclusions.
- [x] Use effective mana costs/exact ranks and the explicit-target ClassicAPI macro path. Preserve the existing Fear Ward protection and Nampower continuation cancellation rules.
- [x] Show cooldown preview/seconds and optional native cooldown sweep without permitting use of a cooling item. Disable clears all added subscriptions, pending work and HUD ticking.
- [x] Local syntax and mocked core/UI tests passed; no test files are included in the repository.

Combined in-game acceptance (ClassicAPI 1.18.2+ for native resurrection, plus older/no-DLL fallback checks):

- [ ] **Resurrection:** with two healers, cast at a dead party/raid member and confirm Assistant skips them, including when the other healer lacks Priest Companion. Interrupt and confirm eligibility returns unless another provider still reports a cast/offer. Complete a cast and verify pending-offer evidence is retained where available. Check released-corpse handling, combat gating, disable/reenable and reload.
- [ ] **Shield:** confirm Options reports the ClassicAPI aura reader; test own/external PW: Shield, rank-specific estimates, damage/full absorbs, refresh/replacement without double subtraction, expiry, dispel after a recent hit and a competing absorb. Verify new break learning and reset persistence. Enable/reload during an already active shield must not invent a full capacity. All numeric absorption remains approximate.
- [ ] **Auto Mana:** verify both triggers, affordable/unaffordable ranks and Inner Focus/free casts; test direct spells/action buttons and ClassicAPI `@mouseover`, selected-target and `@player` macros. Confirm protected Fear Ward does not consume an item. Verify original macro rank/target and ground-placement behavior survive optional Nampower continuation; change target/request, stop casting and disable to cancel. Three seconds is a maximum mana wait, not a fixed delay.
- [ ] **Consumable HUD:** select Tea and Major Mana, test ready-item fallback versus each item's missing-mana requirement, and put all permitted items on cooldown. Verify the icon, estimated gain, countdown and optional sweep; a click during cooldown must not consume. Also test drag/lock, group slider, options scrolling, minimap routes and saved settings.
- [ ] **Fallback/regression:** run the affected modules with older/missing ClassicAPI providers, with and without Nampower, and with every Enable off. Preserve existing Announcers/Book of Prayer behavior. No main merge or release before maintainer acceptance.

### Auto Mana prototype (`feature/auto-mana`, OctoWoW)

- [x] Add opt-in Tools/minimap controls and a floating manual-use button with saved position/lock; automatic mode and individual consumables require separate permission.
- [x] Share item selection, combat/group restrictions and attempt throttling between manual and automatic paths. Add exclusive per-item missing-mana and requested-spell insufficient-mana criteria; do not infer OOM for unknown spells or costs.
- [x] Add optional Nampower continuation with bounded mana wait, target/action validation and cancellation. No global queue CVars are changed. Three seconds is a maximum wait for sufficient mana, not a fixed delay. Disabled mode has no events, ticking or scans.
- [x] Local syntax and mocked core/UI checks passed; test harnesses remain local.
- [ ] OctoWoW: test both criteria with affordable/unaffordable ranks, per-item recovery boundaries, live item tooltip ranges versus fallback estimates, talent/free-cast cost changes and unknown-cost spells. Confirm actual item IDs/effects, Tea/Rejuvenation/Mana/Flask priorities, cooldowns, bag moves, manual item HUD with automatic on/off, Tea-on-cooldown fallback with enough/insufficient deficit for a potion, combat/group conditions (1/5/10/20) and saved settings after reload.
- [ ] Nampower: confirm one activation consumes and continues the exact rank on the intended target for direct spells, action buttons and supported macros; test mouseover changes, target changes, newer casts, Escape/stop cast, no target, rejected item use, slow mana restoration and queue overwrites. Continuation is experimental and only attempted with a resolved stable target GUID. Validate Fear Ward overwrite protection and Resurrection integrations.
- [ ] Validate the four Tools tabs, scrolling, red disabled Enable, dependent-control gating, manual window icon/gain updates, drag/lock, all option tooltips, group slider/wheel and minimap routes. Vanilla-only and alternate provider combinations still require live testing. No merge/release without maintainer approval.

### Shield Tracker prototype (`feature/shield-tracker`)

- [x] Implement opt-in player PW: Shield HUD, aura/time display, ~ rank/caster estimates or unknown capacity, single-provider adapters and Tools/minimap integration. No required extension or casting behavior.
- [x] Restyle HUD as a compact ShieldBuddy-like horizontal bar with icon, centered values and duration; keep usage and estimate guidance in the Shield Tracker options page.
- [x] Learn per-rank capacity from an observed shield after a recent damaging hit and aura removal, with no known competing absorb; keep local and external caster values separate. Narrow the correlation window, skip removals near known expiry, and cancel learning on explicit dispel events. Very close expiry or unavailable dispel events remain ambiguous.
- [x] Visual acceptance: maintainer reports bar, countdown, unknown/preview states, tooltip removal and retained options-page guidance passed in game.
- [x] Basic functionality, learned-value persistence and control persistence confirmed by the maintainer.
- [x] Add confirmation-protected reset for local and external-caster learned values; an eligible active shield falls back to its rank base estimate. Local mocked regression checks pass.
- [ ] Compatibility and remaining cases: Vanilla/ClassicAPI/Nampower >=4.5/SuperWoW and mixed stacks; all available ranks, including the untested other-priest shield path on the player; physical/spell/periodic/full-absorb damage, overlapping absorbs, break-and-learn separately for local and external casters followed by reload and later casts, expiry/dispel shortly after a hit, death, and enable mid-shield. Check locked drag/reset, preview cleanup and minimap actions. Base/learned values may differ if talent, gear or server modifiers change.
- [ ] Release/version/merge only after explicit maintainer approval. Multiple shield-type attribution remains outside this increment.

### Enable visual feedback — complete, v0.4.1 (2026-10-26)

Inactive Enable captions are red and Book of Prayer uses Enable. Maintainer authorized closing this feature and merging into main. Existing runtime monitoring and saved settings remain unchanged; no further acceptance task is scheduled for this feature.

### Consistent Enable controls (2026-10-26)

- [x] Gate dependent options in Fear Ward, Resurrection, Mana, Aggro and Book of Prayer; retain master availability rules, saved selections and existing secondary dependencies. Close Tracker preview on disable.
- [x] **Maintainer validation:** all affected option pages block controls when their master Enable is unchecked.
- [ ] **Remaining in-game acceptance (Fear Ward, Resurrection Announcer, Aggro and Tracker only):** for each still-open module, disable and verify checkbox/caption clicks, sliders, message editing, Default/Save/Reset and Preview are blocked. Reenable and confirm saved selections, damage-only blocked when Aggro Warning is off, and auto-hide delay blocked when Auto-hide is off. Verify Tracker HUD/preview hides immediately, no-talent/provider restrictions, tab switching and /reload persistence.
- **Pending-test documentation audit:** historical checklists can overlap. Closed Mana Announcer, Resurrection Assistant and reference-data scopes carry no active acceptance backlog; remaining open checks apply only to modules still in scope.

### Opt-in monitoring and expandable Guides (feature/aggro-announcer)

- [x] Gate Aggro events by individual warning toggles (health-only for Near Death, death/revival for enabled survival announcements, combat logs only for damage-based Aggro), with polling disabled when Aggro Warning is off.
- [x] Stop Mana event subscriptions entirely when master Enable is off (or both warnings off), retaining its startup settings loader.
- [x] Resurrection Assistant adds independent master Enable (default on to preserve existing behavior); stop roster/death/combat/addon-event subscriptions and hide HUD while off. Existing Show Resurrection button remains a visibility-only choice.
- [ ] Validate dynamic registrations after /reload, disabling and reenabling during combat, switching each option without stale announcements, preserving all saved values.
- [x] Fear Ward and Resurrection cast subscriptions now follow each announcer's Enable checkbox. The Resurrection recipient-resolution ticker stops when disabled; Fear Ward's independently enabled overwrite prevention remains unaffected.
- [x] Book of Prayer Tracker unsubscribes cast-provider events and optional Nampower refund integration, and removes its periodic OnUpdate when disabled. Re-enabling rescans talents and spellbook.
- [x] Resurrection Assistant now exposes a master Enable above Show Resurrection button, saving its state per character (default on for existing users), halting roster monitoring and hiding HUD while off. Other options stay saved and are visually disabled while off.
- [x] Resynchronize combat state when Aggro, Mana or Resurrection Assistant is re-enabled after an interval with no combat-event listeners; Tracker rescans the current talent when enabled after a possible disabled-period respec.
- [ ] **In-game regression:** verify toggle-off/no-scan and resume-after-enable for still-open Fear Ward, Resurrection Announcer, Aggro and Tracker modules, HUD preview / click behavior, saved options through /reload and recovery from disabled during combat.
- [x] Rename the main Wands tab to **Guides**, preserving the `wands` internal route and the existing Wand Progression view. Future nested tabs can offer BiS lists, consumables and enchants.

### Aggro / Survival Announcer — initial implementation (`feature/aggro-announcer`)

- [x] Branch from tested `feature/mana-announcer` without touching `main` or rewriting Mana functionality.
- [x] Add **Options > Announcer > Aggro** as a fourth native sub-tab with independent, directly constructed scroll content and per-character `PriestCompanionCharDB.aggroAnnouncer` settings.
- [x] Include independently enabled Aggro Warning, Near Death and Death Announcement under an opt-in master Enable. Defaults: all three checked, master off; Near Death 30%, aggro cooldown 15s, Say-only channels and customizable messages with Default/Save/Preview.
- [x] Use vanilla `UNIT_HEALTH`/`UNIT_MAXHEALTH`, `PLAYER_DEAD` and revival events; Near Death re-arms after recovery more than 15 percentage points above the threshold; Death fires once per death.
- [x] **Near Death threshold bounded to 1%-84% (2026-10-26):** strict rearm requires health > threshold +15 points, so 84% is the highest setting that can rearm at full health (100%). Both the UI slider and core set/load paths enforce 84%; previously saved 85%-99% values are normalized to 84% on load. Default remains 30%. In-game slider limit/persistence retest pending.
- [x] Aggro targeting mode (default) uses optional real `UnitThreatSituation >= 2` if present; otherwise checks hostile current-target and party/raid target-of-target every 0.75s, requiring two consistent observations and two misses for recovery. Do not depend on ClassicAPI for threat (its Vanilla threat APIs are unavailable).
- [x] Added **Only after taking damage** (off by default) below Aggro Warning. When enabled, suspends target-of-target polling and waits for a Vanilla incoming hostile combat-log hit plus a matching drop in player health, accepting either event order within one second. Does not trigger on target changes, full absorbs, misses or isolated fall damage; periodic DoT ticks alone are intentionally excluded. Damage from one uninterrupted attack is grouped with a four-second quiet interval and still honors the normal aggro cooldown. Persists per character and resets to disabled.
- [x] Add Vanilla-safe, confirmation-protected Reset to Defaults; avoid raw percentage format tokens in native popup strings.
- [x] **Aggro alert tests (2026-10-26, RavenCraft):** both target-based and damage-only modes announced correctly; repeated damage did not cause spam. The full Power Word: Shield absorption test subsequently **passed**: in damage-only mode, fully absorbed hits did not announce. An initial cross-module `/reload` persistence failure occurred in one RavenCraft client session (`SV: nil` for a test value); after restarting the client, the maintainer changed settings and confirmed they persisted on `/reload`. Treat this as a **transient, currently unreproduced session issue**, not an active code or merge blocker; investigate only if it recurs.
- [x] **Aggro options layout reorganized (2026-10-26):** master Enable applies to all three alerts; two checkbox rows (Aggro Warning / Only after taking damage; Near Death / Death Announcement), followed by Announcement Channels, Near Death threshold, Aggro-only cooldown and message editors. Retained all saved keys/default values.
- [x] **Near Death tested (2026-10-26):** maintainer confirmed Near Death works correctly after the threshold adjustment; specific death/revive corner cases remain to test.
- [x] **Damage-only UI dependency (2026-10-26):** make **Only after taking damage** selectable only when **Aggro Warning** is checked. Disable both the checkbox and its clickable label area, and turn its caption red, when Aggro Warning is off. Restore normal text and interaction when re-enabled, without clearing the saved damage-only selection or affecting the master Enable.
- [ ] **In-game acceptance:** validate the dependent disabled/red state (including non-clickable label), retained check state and /reload; two-column layout/scroll, editing/channels, reset OK/Cancel/Escape and cross-tab regressions for Mana/Fear Ward/Resurrection.
- [x] **Near Death first crossing (2026-10-26):** the maintainer confirmed the first warning occurs below the selected percentage. Another downward crossing after recovering merely above the threshold did not announce; this follows the existing **15 percentage-point rearm margin** (e.g. 30% must recover above 45%, not wait 5 seconds). Aggro's cooldown applies to Aggro Warning only. Updated tooltips and UI hint to clarify this without changing the safe anti-spam behavior.
- [ ] **Near Death / Death remaining:** verify recovery above threshold +15 points permits a second warning; test death exactly once and revival rearm, fall damage outside combat and /reload while low HP.
- [ ] **Aggro modes:** test target-based alerts in solo, party and raid (including mouseover healer without hostile target); enable **Only after taking damage** and verify no alert when merely targeted, then an alert after losing HP from an enemy hit. Full PW: Shield absorbs were verified without triggering; still check dodges/misses, DoT-only damage, environmental/fall damage, repeated hits (no spam), a fresh attack after a quiet interval plus cooldown, reset/defaults and /reload persistence. Confirm no OnUpdate scanning in damage mode or when Aggro Warning is off.
- [ ] **Compatibility:** Vanilla no extensions, ClassicAPI present, odd unit IDs/target-of-target availability, death/resurrect while in combat, unsupported optional threat APIs. Remaining compatibility cases are follow-up verification for v0.4.0.

### Mana Announcer — complete (maintainer decision, 2026-10-26)

Low Mana/OOM alerts, channels, messages, thresholds, combat filtering and reset controls satisfy the requested scope. No remaining feature or acceptance task is scheduled. Implementation and prior validation history are recorded in [CHANGELOG.md](CHANGELOG.md).

### Options navigation — Announcer and Tools separated (`feature/resurrection-assistant`)

- [x] Change the four Options top tabs to **General | Announcer | Tools | Mods**. Keep the normal default General page and an alias for legacy `advanced` / `tracker` navigation that opens Tools > Book of Prayer Tracker.
- [x] Put **Fear Ward** and **Resurrection** as independent sub-tabs under **Announcer**. Keep channel, custom message, Whisper, interruption and overwrite prevention controls with their existing SavedVariables.
- [x] Put **Resurrection Assistant** and **Book of Prayer Tracker** as independent sub-tabs under **Tools**. Move Assistant's HUD settings out of the long Resurrection Announcer page; reparent the existing Tracker controls instead of rebuilding them.
- [x] Keep existing control names, option keys, per-character scales, preview functions, slash commands and all cast/event core files unchanged. The Assistant and Tracker previews end when their sub-tab is hidden.
- [x] **Tools scroll containment rebuilt from Announcer (validated in OctoWoW on 2026-10-23):** previous viewport and ScrollFrame-reparenting changes did not fix content that visibly escaped the main frame when scrolling. Replaced Tools' nested/reparented pages with a *direct copy of Announcer's frame lifecycle*: Tools creates its own two UIPanelScrollFrameTemplate scrolls and scroll children as immediate children, sets SetScrollChild once and never reparents them. Moved Tracker options into their own module and adapted Assistant options to populate the already-created scroll child. Preserved names of existing controls, preview cleanup, scaling, saved data and spell/heal/announcer cores. Removed fixed-width tab resizing: the native template now sizes tabs to their captions, with shortened captions only if both cannot fit.
- [x] **Tools layout retested successfully in OctoWoW (2026-10-23):** the maintainer confirmed both Resurrection Assistant and Book of Prayer Tracker option pages now scroll within the addon window, and the sub-tab buttons correctly fit their titles.
- [x] **Announcer regression check (2026-10-24):** maintainer confirmed both Fear Ward and Resurrection announcers continue working after the Options reorganization and final checkbox label changes.
- [ ] **Other Options integration checks (not specifically reconfirmed):** Preview cleanup when switching Tools sub-tabs, saved settings across /reload after the reorganization, and special slider boundary cases.
- [ ] **Remaining Options navigation acceptance:** verify General, Announcer, Tools and Mods top-tab pressed styles; settings persistence across /reload; Preview stops on navigation; the legacy Tracker caller opens Tools > Tracker; no Lua errors. Tools scrolling/tab sizing and Fear Ward/Resurrection announcers were already validated.
- [ ] **MetaHunt inspiration review (future, separate scope):** modular option pages, event-efficient module gating, searchable reference data/book, class-specific widgets and optional mana warnings; do not port Hunter-specific features or make Nampower mandatory.

### Book of Prayer Tracker — uniform window scaling (`feature/resurrection-assistant`)

- [x] Bring Tracker window sizing in line with the Resurrection Assistant: **40%–120%** uniform scale, independent compact and expanded sizes, adjustment by any of its existing eight edges or corners and an Options → Tracker **Window size (per mode)** slider.
- [x] Preserve existing saved `prayerTracker` settings and migrate legacy independent width/height geometry to a proportional, bounded scale at load time. Keep saved position, lock, reset confirmation, auto-hide, preview, mana-value presentation and refund border logic unchanged.
- [x] Add **Reset current size** (100% for the selected mode); **Reset Position** still resets the position and *both* mode sizes. Keep the slider's percentage synchronized when the user drags a border/corner.
- [x] **Core Tracker regression tested in OctoWoW (2026-10-22):** successful healing casts continue to be registered, mana values are tracked normally, and refund status border colors remain correct following the new window scaling implementation.
- [x] **Tracker interface validated in OctoWoW (2026-10-22):** the maintainer confirmed the new window scale control, border/edge resizing, saved layout persistence, Lock Position and Preview all function as expected.
- [ ] **Additional Tracker edge cases (not individually confirmed):** exact 40% and 120% extremes in both Compact/Expanded modes; independent size persistence per mode; Reset current size and Reset Position confirmation; spell-name/mana-refund icon reflow at minimum scale. Core heal, mana and refund-border behavior has already passed.

### Resurrection Assistant — complete (maintainer decision, 2026-10-26)

Candidate selection, priority/manual target handling, incoming-resurrection avoidance, combat restrictions, clickable HUD, sizing, preview and master Enable satisfy the requested scope. No remaining feature or acceptance task is scheduled. Earlier optional edge-case checklists are retired by scope decision; see [CHANGELOG.md](CHANGELOG.md) for implementation and recorded test results. Resurrection Announcer remains a separate module.

### Tools — Fear Ward and Resurrection (in progress on `feature/announcer`)

- [x] Rename Options → Announcer to **Options → Tools**, with native **Fear Ward** and **Resurrection** sub-tabs to accommodate later assistant/automation features alongside each spell's announcements.
- [x] Give each tool its own scroll area and settings UI, keeping existing saved data and cast/event logic intact. Preserve the legacy `announcer` section ID and `PC.UI.AnnouncerPanel` alias for compatibility.
- [x] **Basic sub-tab navigation tested in OctoWoW:** the maintainer confirmed that the Fear Ward and Resurrection sub-tabs work in Options → Tools.
- [x] **Persistence after /reload:** the maintainer confirmed that customized Resurrection/Whisper messages and previously selected settings remain saved after a UI reload.
- [ ] **Additional sub-tab acceptance:** verify selected-tab visuals, layout bounds, scroll positions, tooltips, 30px row spacing, independent channel toggles, Default/Save/Preview behavior, unsaved draft handling during tab switching, and Fear Ward regression behavior.

#### Resurrection Announcer (core live cast/whisper/corpse tests passed; further edge cases pending)

- [x] Add a separate Resurrection Whisper template, default `Casting {spell} on you. Please don't release!`, editable independently of public text with Default/Save/Preview and per-character persistence.
- [x] Add optional **Announce interrupted casts** (default off), editable public cancellation text and short Whisper notice, guarded by matching START and interrupted/failed GUIDs. Never announce pre-START failures or post-success cancellation.
- [x] For released-player corpse clicks, allow SENT with an empty target to match START. Try `UnitSpellTargetName("player")` briefly; if still unresolved, announce a generic corpse recipient on public channels only (no guessed Whisper).
- [x] **Released corpse, cast started:** when Resurrection is selected and the caster clicks the released player's body in the world, an announcement is sent using the generic corpse description.
- [x] **Released corpse, cast interrupted:** the interruption announcement is sent to the enabled chat channels with a generic corpse description; Whisper is correctly skipped because the recipient name is unknown.
- [x] **Identified target, Whisper enabled:** a normal Resurrection cast sends the configured recipient-specific Whisper message.
- [x] **Identified target, cast interrupted:** the configured interruption message is sent and the recipient is also notified by Whisper.
- [x] **Outside-range attempt:** the maintainer confirmed that the client prevents the Resurrection cast from starting, and no announcement is emitted. This does not independently exercise a server-side pre-START failure after SENT.
- [x] **Successful cast completion:** the maintainer confirmed that a Resurrection finishing normally does not generate a false interruption announcement.
- [ ] **Remaining acceptance tests:** pre-START failure after SENT (if reproducible), duplicate START/FAILED/INTERRUPTED events, interruption toggle off, released corpse with recoverable name, mouseover and target-switching casts, separate Default/Save/Preview interactions, multiple channels and unavailable group channels, ClassicAPI absent. Saved changes surviving /reload were confirmed.

- [x] Add an opt-in Resurrection section in Options → Tools → Resurrection with separate saved preferences, independently selectable Say/Yell/Party/Raid/Self/**Whisper** channels, and Default/Save/Preview message editing.
- [x] Correlate ClassicAPI `UNIT_SPELLCAST_SENT` (target, GUID, spell) with `UNIT_SPELLCAST_START` (same GUID, spell) so the message is sent **only after Resurrection begins casting**; deduplicate START and discard pre-start failure. Do not announce completion/acceptance.
- [x] Whisper the captured named Resurrection recipient only after matched START; never derive an absent recipient from the current target. Default `Casting {spell} on {target}.` prevents a misleading completed-resurrection claim. No Whisper option is added to Fear Ward.
- [x] Move **Prevent overwriting Fear Ward** beside **Enable Fear Ward**, retaining tooltip and 30px spacing of other checkbox rows; use the freed space for Resurrection settings.
- [x] **Basic Resurrection announcement confirmed in-game:** the maintainer reports that Resurrection notices are being sent successfully. The exact selected channels and START/failure timing were not separately confirmed in this test report.
- [ ] **Other in-game acceptance:** distinguish pre-START rejection after SENT from client-side out-of-range prevention, verify different ranks/spellbook, mouseover and target switching, duplicate/absent event handling, channel combinations and unavailable channels, ClassicAPI absent, and previously validated Fear Ward behavior. Customized settings persisting after /reload are already verified. Corpse/Whisper/interruption paths and normal completion without false interruption are confirmed.

#### Fear Ward (previously validated paths)

- [x] Add an optional, independent per-character **Prevent overwriting Fear Ward** setting under Options → Tools → Fear Ward (disabled by default). Check the recipient's current aura before supported Lua spell dispatches and prevent duplicate application with a local notice, even when announcements are disabled.
- [x] **Maintainer's first live checks:** Fear Ward on a recipient without an active buff works; action-bar casts, spellbook casts and typed `/cast Fear Ward` are prevented when that recipient is buffed.
- [x] **Follow-up implementation:** cover no-target self-casts, explicit SuperWoW recipient arguments and `SpellTargetUnit` cursor targeting; preserve the initial working paths.
- [x] **Self-cast retest:** the maintainer confirmed no-target Fear Ward correctly blocks recasting when the priest already has Fear Ward.
- [x] **ClassicAPI macro path fix:** ClassicAPI's `/cast [@unit]` uses `C_Spell.CastAtUnit`; added a before-cast guard for the explicit unit (including mouseover) rather than the selected target. The exact macro `/cast [@mouseover,help,nodead][help,nodead][@player] Fear Ward` is the regression case.
- [x] **Mouseover regression verified in-game:** with `/cast [@mouseover,help,nodead][help,nodead][@player] Fear Ward`, the maintainer confirmed that an already-buffed mouseover target is protected and the macro does not reapply Fear Ward. This validates the ClassicAPI `C_Spell.CastAtUnit` guard for that scenario only.
- [x] **Additional mouseover live tests:** the maintainer confirmed Fear Ward casts normally when the mouseover recipient has no Fear Ward, and that a buffed selected target does not block Fear Ward on a different, unbuffed mouseover recipient. Together with the previous buffed-mouseover block, these cover the main mouseover recipient precedence checks.
- [ ] **Remaining live verification:** test mouseover-absent fallback to selected target and player, numeric spell IDs, direct actionbar/spellbook/typed /cast regression after the latest change, other DLL macro paths, and SuperWoW `CastSpellByName("Fear Ward", "mouseover")` / Lua `SpellTargetUnit` as available. No universal cast interception is claimed.
- [ ] **Aura verification:** confirm spellID 6346 and aura name/texture on OctoWoW, verify protection against a buff applied by another priest, and test the absence of ClassicAPI.

- [x] Create the original Options → Announcer tab and per-character Fear Ward preferences (now accessed via Options → Tools → Fear Ward).
- [x] Allow multiple selected announcement channels at once: Say, Yell, Party, Raid and local-only Self. Skip unavailable group channels rather than rerouting; allow an independent toggle for self-cast announcements.
- [x] Support customizable message text and preview, retaining the target placeholder. Announce only after confirmed ClassicAPI SENT → SUCCEEDED GUID match; skip failed casts, duplicate success, or unknown recipients without assuming a target.
- [x] Place Fear Ward and channel help text into native hover tooltips on checkboxes/captions, use exact 30px spacing between Enable Fear Ward, the channel header and each row. Preserve the right column, move Include casts on myself beside Yell, and add independent Yell selection/persistence.
- [x] Add Default/Save to the custom Fear Ward announcement message: Default loads the original text as a draft, Save/Enter commits, Escape reverts; changing other checkboxes preserves the unsaved draft, and leaving the tab discards it. Preview reflects the draft without sending messages.
- [ ] **In-game verification:** Fear Ward on self/party/raid members, Say + Raid, Say + Yell + Raid and Party + Say simultaneously, tooltip hover on checkboxes and captions, checkbox spacing, Default/Save/Enter/Escape for the custom text and /reload persistence, success vs failed/out-of-range casts, mouseover casts, changing target immediately, duplicate events, missing target, no ClassicAPI, channel changes mid-session, and settings across /reload.
- [x] **Resurrection Announcer (initial implementation):** opt-in, per-spell multi-channel selection and confirmed cast START announcements, with Whisper addressed to the captured recipient. In-game verification still pending.
- [ ] **Fear Ward Assistant:** allow a preferred target and cooldown/aura readiness reminders; assess whether automatic casting is supported and permitted by the client/server before implementing any action.
- [ ] **Future announcers:** assess other optional priest spell announcements. Mana/OOM is already complete; preserve independent channels and avoid chat spam.

### Native tabbed Options UI and client diagnostics — released in v0.2.0

- [x] Replace top-level command-style navigation with Vanilla-native **Wands / Options** bottom tabs, inspired by Puppeteer. The options area now has **General / Advanced / Mods** secondary tabs.
- [x] Add `UI/OptionsPanel.lua` for read-only General information and interactive Book of Prayer settings under Advanced; reorganize `UI/EnvironmentPanel.lua` into a scrollable **Options → Mods** subpage with individual DLL sections.
- [x] Replace the former `/priest env` / `/pc env` with `/priest options` / `/pc options` opening Options → General; Mods remains available as a secondary tab.
- [x] Retain ClassicAPI detection/version/minimum/adapter, quest-history turn-in and server-query diagnostics, SuperWoW, Nampower and UnitXP SP3 details. The Mods Refresh button never sends chat/server queries.
- [x] Load Options before Mods in both TOCs; leave Wand Progression data, filtering and quest/source mapping unchanged.
- [x] **Puppeteer-inspired visual refinement:** centered decorated dialog title, PanelTemplates-driven pressed/selected tab artwork, secondary-tab border alignment, and descriptive Mods sections with detected/missing/unsupported colors and selectable links.
- [ ] **In-game UI validation:** confirm first-open Options → General after `/reload`, tab switching and reopening, the two Advanced tooltips (hover on checkbox *and* label), the removed Quest History Diagnostics display, the decorated title and selected tab textures, Mods links/scroll/status, `/priest options` aliases, and the unchanged Wands view. Static inspection cannot replace this test.

### Book of Prayer Tracker — released in v0.2.0 (2026-10-19)

- [x] **Maintainer-confirmed in-game checks:** Nampower displays mana correctly when Renew follows Flash Heal rapidly; Reset Position and Preview Tracker worked before confirmation was added. The maintainer also verified Inner Focus → heal → heal; Ascendance → heal → another heal; Ascendance → heal → heal; Inner Focus → Ascendance → heal → heal / another heal; Ascendance → Inner Focus → heal → heal / another heal. Inner Focus requires restarting the refund cycle, correctly reflected by the tracker; Ascendance reports reduced mana returned. Reset confirmation and other rapid-cast/compatibility sequences still need live testing.

- [x] Define six supported healing families independent of spell rank: Flash Heal, Renew, Prayer of Healing, Heal, Greater Heal and Lesser Heal.
- [x] Scan `GetTalentInfo` for the actual Book of Prayer talent and current points. Recheck upon login, talents and spellbook changes; do not enable the tracker without talent points.
- [x] Track successful local-player casts, prioritizing ClassicAPI `UNIT_SPELLCAST_SUCCEEDED`; Nampower `SPELL_CAST_EVENT` and SuperWoW `UNIT_CASTEVENT` are optional fallbacks. Avoid double-counting one cast across providers. Do not derive success from `SPELLCAST_STOP`.
- [x] Implement a compact HUD with larger icon and optional spell name, expanded mode with the penultimate healing family, and refund status via green/red/neutral border only (no displayed percentage). Keep drag movement and resizing from all edges/corners. On 2026-10-19, add proportional scaling of the entire inner HUD and reduce minimum window dimensions.
- [x] Rename the visible Advanced subtab to **Tracker** (internal navigation ID remains `advanced`). Add Tracker checkboxes: Enable, Expanded, Show spell name, Show refund status (border color), Show estimated mana refund (off by default), Show outside combat, Lock position. When talent points = 0, disable Enable and display a red explanation. Hover tooltips document refund colors and movement/resizing.
- [x] Add opt-in **Auto-hide after inactivity** (default off) and a numeric-only timeout field (1–600 seconds, default 15) under Options → Advanced. Reset the timer after each confirmed supported heal; hide on timeout and restore on the next qualifying cast. Save both preferences per character; disabling auto-hide disables the timeout input.
- [x] Prefer **actual mana returned** via Nampower `SPELL_ENERGIZE_ON_SELF` (Book of Prayer ID `52942`, mana type `0`, `arg5` exact amount), rendering `+N mana`. Nampower 4.5+ enables the event by registration; older versions require a guarded `NP_EnableSpellEnergizeEvents` CVar toggle while the user enables Show mana refund. Keep ClassicAPI `UNIT_SPELLCAST_SENT` + `C_Spell.GetSpellPowerCost` as the fallback `~N mana` estimate when the direct report does not arrive. Preserve Inner Focus suppression behavior and use dynamic cost modifiers for Ascendance.
- [x] Persist settings and separate compact/expanded sizes and screen position per character in `PriestCompanionCharDB`.
- [ ] **In-game OctoWoW validation (mandatory):** check the talent scanner for 0/1/2 points, changing talents/respec, rank-independent family tracking, Renew ticks and Prayer of Healing being counted once, cast success vs interruption, actual spell icons and expanded name layout (including long names), proportional scaling down to 68x68 compact / 104x78 expanded, border colors for eligible/repeated/unknown spells without a percentage footer, and the evenly spaced Advanced checkboxes. Test auto-hide after the configured delay (1, 15, 600 seconds), repeated same-family heals resetting the timer, hiding before the first heal on a fresh login, revival on the next confirmed heal, ignored non-healing casts, numeric-only validation, locked/drag behavior, and per-character preferences across `/reload` and relog.
- [x] **Rapid-heal energize correlation:** retain independently buffered Nampower events and a short history of eligible successful casts, matching by amount vs. ClassicAPI cost estimate, cast order and event timing. Use a **400ms post-success window**, **150ms pre-success allowance**, and short settling/deferred-SENT delays instead of discarding all heals occurring within 750ms. Consume each event/cast at most once; preserve fallback when no reliable correspondence exists. The GUID-less Nampower packets remain inherently ambiguous for overlapping equal-cost spells.
- [x] **Tracker layout controls:** add Reset Position with native OK/Cancel confirmation (resets both compact and expanded dimensions and the saved offset, without changing other per-character preferences, including lock) and Preview Tracker (temporary UI-only sample, visible even without the talent or outside-combat permission). Preview does not touch the real healing history and ends on leaving the settings page; its simulated content is visibly labeled.
- [ ] **Live synchronization tests:** Flash Heal → Renew → Flash Heal, multiple instant heals close together, canceled casts followed by a heal, Inner Focus + Ascendance, Nampower event before/after SUCCEEDED, no ClassicAPI, and a delayed server packet. Confirm exactly one real refund is shown per cast, or a fallback estimate/blank instead of a mismatched value.
- [ ] **Live layout controls:** verify Reset Position OK vs Cancel/Escape when locked and unlocked, after changing compact/expanded dimensions, and across /reload. Test Preview with 0/2 and 2/2 talent, while auto-hide is enabled, after enabling/disabling the mana label, while dragging/resizing, and on switching tabs/closing the main frame; verify genuine heal history remains unchanged.
- [x] **Mana label spacing:** reserve footer space when **Show mana refund** is checked; reposition and shrink spell icons rather than moving the mana text. If **Show spell name** is unchecked, allow a larger icon; adapt further for names wrapping onto two lines. Preserve distinct compact/expanded sizing and the existing saved window geometry.
- [ ] **Visual validation:** test all four combinations of Show spell name / Show mana refund in compact and expanded modes, including long spell names and window scaling at saved minimum sizes. Confirm no overlaps between icon, name, and mana text.
- [ ] **Remaining mana refund validation:** Inner Focus and Ascendance cast-order behavior is maintainer-confirmed (see checked item above). Still compare Nampower `SPELL_ENERGIZE_ON_SELF` packets against `+N mana` across all families/ranks, determine before/after `UNIT_SPELLCAST_SUCCEEDED` delivery, test Nampower 4.0 CVar vs 4.5+ event registration, restoring CVar state, ClassicAPI `~N mana` fallback when events are absent, canceled casts, and reload; distinguish actual server amounts from rounding and client estimates.
- [ ] **Client variation:** test with and without ClassicAPI and with each fallback extension separately. If no trustworthy cast events are present, keep tracking unavailable rather than incorrectly treating `SPELLCAST_STOP` as a confirmed heal.
- [x] **Refund accuracy architecture:** use server-reported Nampower energize data when present and optional ClassicAPI-derived estimates otherwise. Numeric output is user-toggleable, with `+` for actual server data and `~` for an estimate. Session statistics remain out of scope.

### Reference-data enhancements — closed / dropped from active scope (2026-10-26)

Wand Progression / Source Details, filters, reputation and maps are complete for the maintainer's current needs. Additional multi-type acquisition displays, multiple craft entries, structured reputation, content filters, missing-location research, dungeon/raid icon changes and related pfQuest enrichment are not scheduled. The data audit above preserves known facts without requiring further work. General optional-client/quest-history compatibility remains documented separately.

### Later capabilities (scope and feasibility to be assessed)

- [ ] Add more configurable settings to Options → General / Advanced later (quest-history preferences, optional integrations, reset and UI settings). General now includes minimap visibility/reset controls; Book of Prayer settings live under Tools. Restore quest-history diagnostics elsewhere in a future feature.
- [x] **Minimap launcher — complete, v0.5.0:** Priest icon, Guides/General access, Announcer/Tools hover submenus, left-click module Enable/right-click settings, saved visibility/position/lock and talent-aware Tracker indication. Maintainer confirmed functional, /reload and final dismissal/lock/recovery checks passed. Implementation and validation are recorded in [CHANGELOG.md](CHANGELOG.md). Circular minimaps are the current scope; other shapes and third-party compatibility require a future explicit request.
- [ ] Priest skills database.
- [ ] Talent builds.
- [ ] Best-in-slot lists.
- [ ] Consumables database.
- [ ] Self-buff helpers and optional reagent purchase helpers, subject to client/API constraints.

### No longer planned as an incomplete feature

- [x] Complete the current OctoWoW Wand Progression item database (146 listed wands with corresponding items and sources).

## Documentation policy

- **Commit/push policy (maintainer, 2026-10-26):** commit and push every completed change on its working branch so the history and current work remain available beyond this machine. This standing authorization does not authorize merging into main or publishing a new version without approval. Persistent repository instructions are in [AGENTS.md](AGENTS.md).

- Versions use MAJOR.MINOR.PATCH: PATCH for fixes/text/small visual adjustments, MINOR for new features, MAJOR for a maturity milestone or major compatibility change. Keep the released version in both TOCs and the Lua fallback; development changes stay under Unreleased until release approval.
- Work on a dedicated feature branch, implement and test, then version/commit/push and merge only with maintainer authorization. Delete implemented feature branches only after confirming their commits are incorporated into main.

- `CHANGELOG.md`: actual versioned additions, fixes, and changes; keep prior release entries intact.
- `ROADMAP.md`: current limitations, decisions, audited data, future enhancements, and priorities. Keep implementation/test history in CHANGELOG rather than duplicating it here.
- A scope closure is not a claim that every historical test passed. Remove retired checks from active work and record the maintainer decision and date; reopen only on explicit request or a reported bug.
- Published CHANGELOG entries remain historical snapshots. Later validation or scope decisions supersede earlier pending notes; the current backlog is maintained here.
- New or changed client map metadata should be verified in-game; old validated behavior should not be relabeled as untested.
