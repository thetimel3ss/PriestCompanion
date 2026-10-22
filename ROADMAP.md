# Priest Companion Roadmap

The roadmap tracks outstanding improvements and ongoing verification. Released functionality belongs in [CHANGELOG.md](CHANGELOG.md), not here.

**Review date:** 2026-10-19  
**Current release:** `0.2.0` (`main`)  
**Future development:** separate feature branches from `main`

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

### Optional ClassicAPI integration — included in v0.2.0 (2026-10-19)
- **Flavor TOC selection:** ClassicAPI v1.11.0+ automatically redirects a request for `PriestCompanion.toc` to `PriestCompanion_ClassicAPI.toc` if it exists. Without that DLL support, Vanilla loads the normal TOC. The two existing manifests are deliberately retained, and ClassicAPI is **not** a required dependency.
- **Minimum enhanced baseline:** `CLASSIC_API_VERSION >= 11100` (v1.11.0) for this integration. `Core/Capabilities.lua` now differentiates DLL presence, version, supported version, adapter-loaded state, and expected `QUEST_TURNED_IN` support. Future Skills/Talents/BiS/Consumables/reputation/mana/buff modules should probe their own functions before increasing the minimum.
- **Adapter guard:** `Core/ClassicAPI.lua` leaves the Vanilla API untouched if the version is absent or too old. Item name/icon/count/tooltip enhancements check for callable providers and protect calls with `pcall`, then use their Vanilla fallbacks as appropriate.
- **Quest history:** `QUEST_TURNED_IN` registration now depends on a supported ClassicAPI runtime, not on the TOC flavor. The registered event provides quest ID in `arg1`. A `pcall(RegisterEvent)` result is recorded as `QuestHistory.LiveTurnInRegistered` but **cannot prove event delivery**.
- **Impossible native quest history:** `C_QuestLog.IsQuestFlaggedCompleted` is not feasible in the Vanilla 1.12 client; its ClassicAPI adapter override was removed. Retain SavedVariables, live turn-ins, positive injected provider results, the server-specific `.queststatus`/`TWQUEST` protocol, and optional pfQuest import. Never classify an unknown result as definitely incomplete.
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

### Resurrection Assistant — detection and selection (`feature/resurrection-assistant`)

- [x] Create a branch from the validated `feature/announcer` head, preserving the original branch and `main`.
- [x] Add `Core/ResurrectionAssistant.lua` to the regular and ClassicAPI TOCs. The initial detection-only implementation was reviewed separately before introducing an explicitly clicked cast action.
- [x] Implement event-driven party/raid snapshots and per-unit health/flags updates, skipping the player, disconnected units and released ghosts. Prefer a manually selected eligible group target, then Priest → Shaman → Paladin → Druid → Mage → Hunter → Warlock → Warrior → Rogue.
- [x] **Strict combat gate:** `PLAYER_REGEN_DISABLED` suspends all roster/death evaluation and candidate selection. All health/group/addon messages are ignored while the priest is in combat. `PLAYER_REGEN_ENABLED` rebuilds the roster once, so deaths during combat are discovered only afterwards. No OnUpdate polling or background roster scanning.
- [x] Interoperate with optional pfUI LibPredict and HealComm library queries; receive HealComm/CTRA start/stop broadcasts directly, but only from members of the current party/raid. Expire unconfirmed offers; optionally consume ClassicAPI remote cast START observations when the recipient is available. No extra libraries are bundled, and the vanilla core remains Lua 5.0 compatible.
- [x] Validate current target status when explicitly querying candidates, and apply optional distance / line-of-sight checks when present. An unknown distance does not prove a target is within cast range; the game's cast validation remains authoritative.
- [x] Keep read-only `/pc res status` (or `/pc res next`) for inspection. Add `/pc res` as a **manually invoked, single-attempt Resurrection command** for use in a macro; it never starts a cast from an event or timer.
- [x] **First five in-game tests (party, 2026-10-22):** with a living member, `/pc res status` returned 0 eligible / 0 incoming / 0 released; after death without release, 1 eligible / 0 incoming / 0 released; after release, 0 eligible / 0 incoming / 1 released; during combat, the assistant reported itself paused; after leaving combat, the candidate information refreshed.
- [x] **Priest-first priority updated:** Priest → Shaman → Paladin → Druid → Mage → Hunter → Warlock → Warrior → Rogue. A manually selected eligible dead party/raid member still takes precedence.
- [ ] **Further in-game validation (deferred at maintainer request):** priest-first class ordering against multiple dead players and selected-target override; pfUI/HealComm/CTRA incoming Resurrection detection, duplicate prevention, stops, expiry and multiple casters. These remain explicitly unverified; button development proceeds independently.
- [x] **Death-triggered floating button:** `UI/ResurrectionAssistant.lua` subscribes to the core's state-change notifications, not `OnUpdate`. The button appears out of combat for an eligible dead party/raid member; clicking makes one attempt on a newly revalidated candidate. With no eligible unit but a released party/raid member, it prepares manual world-corpse targeting. Supports dragging, saved per-character position, reset and visibility checkbox in Options → Tools → Resurrection (enabled by default).
- [x] **Cast dispatch:** prefer optional ClassicAPI `C_Spell.CastAtUnit` without changing the player's target. Vanilla fallback clears an unrelated target, uses `CastSpellByName` + `SpellTargetUnit`, and restores selection when possible. The Announcer remains responsible for cast-start/interruption chat messages. The button is hidden in combat and triggers no detection while in combat.
- [x] **Button tested in OctoWoW:** when a party member dies without releasing, the floating button appears and clicking casts Resurrection on the candidate.
- [x] **Released corpse tested:** after release, clicking the button prepares the Resurrection spell for a manual world-corpse click.
- [x] **Combat visibility tested:** entering combat hides the popup; exiting combat restores it according to the available candidate state, with no in-combat roster scanning.
- [x] **Window persistence tested:** the maintainer confirmed the floating window retained its position.
- [ ] **Remaining floating-button acceptance:** disabled Show button vs independent `/pc res`; checkbox persistence across /reload; Reset position; no button for disconnected units; Vanilla without ClassicAPI; no duplicate/wrong-target casts with competing healers; already-casting behavior; existing Announcer regression.
- [x] **Compact / Expanded Resurrection HUD:** compact Tracker-style layout with centered clickable Resurrection icon, optional nickname below it and class at the bottom; the icon expands to occupy space freed when labels are hidden. Expanded retains the existing wide presentation with more context. Defaults: compact, name on, class off, unlocked.
- [x] **Whole-window click:** the frame itself is the cast button. Movement is distinguished from click; drag and bottom-right resize gestures must not fire a cast. A resize grip is hidden while Lock Position is active. The position remains per character.
- [x] **Size / scale:** per-mode saved scale in the range 70%–180%, adjustable from the Resurrection settings and by a bottom-right corner handle (when unlocked). Reset size applies to the selected display mode. Both modes retain their own scale.
- [x] **Colors / class labels:** green border for eligible target, yellow for released-body manual fallback, blue for Preview. Character names and class text use the target's class color; unresolved released corpses are never assigned a guessed class.
- [x] **Preview HUD:** show a test-only state without a dead player. Preview never calls the casting function, even if the window is clicked; options and drag/size adjustments update live; switching tabs or closing Options ends preview.
- [x] **Resurrection settings tooltips:** updated for each new checkbox, scale control, reset actions and Preview. No icon tooltip is added.
- [x] **Regression reproduced in game after the compact HUD rework:** the eligible-target and yellow released-corpse states were correctly detected, but clicking the redesigned HUD did not cast or prepare the cursor. A subsequent click could display "Resurrection was just requested." The prior UI version using an actual Button's OnClick was functional.
- [x] **Interaction fix prepared (awaiting in-game verification):** use a real full-surface WoW Button and a LeftButtonUp OnClick handler, as in the last known functional version, instead of triggering casts on a plain Frame's OnMouseUp; suppress click after dragging/resizing. Only start the repeat-click timer after the dispatch succeeds. No change to target detection, color, preview, or Announcer.
- [ ] **Priority immediate re-tests:** normal green target click starts Resurrection; released-corpse yellow click prepares the world cursor; one click triggers one attempt; a drag never casts; after a rejected cast, another click does not produce a stale "just requested" notice; Preview never casts.
- [ ] **Other new HUD in-game tests:** compact vs expanded and /reload persistence; optional nickname/class visibility and icon scaling; class color; Lock Position preventing move and resize while still casting on click; saved per-mode slider/resize scale; reset size and position; Preview without target and click never casting; preview termination on tab change; combat hide/reappear; previous Announcer behavior.
- [ ] **Other compatibility acceptance:** solo/raid, out-of-range members, ClassicAPI present/absent, external resurrection messages/timeout handling and untested priority order. Refine any behaviors that in-game tests uncover.

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
- [ ] **Resurrection Assistant:** offer a post-wipe dead-player list with player-confirmed resurrection actions; handle combat, range, and player availability.
- [ ] **Future announcers:** OOM alerts and other optional priest spell announcements. Avoid chat spam and preserve independent channel selection.

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

### Deferred — Wand Progression enhancements

- [x] **ClassicAPI code:** use the automatic flavor TOC redirect, add a guarded v1.11.0-capable adapter, detect capabilities separately, and preserve optional quest-history providers.
- [ ] **ClassicAPI in-game validation after v0.2.0:** complete the acceptance matrix above, specifically live `QUEST_TURNED_IN`, item fallbacks, no-guild server transport, and reload persistence in a dedicated follow-up branch if fixes are needed.
- [ ] **Source Details:** handle multiple acquisition types for one wand, and multiple matching craft entries, without losing current faction/source filters, layout reuse, or map navigation.
- [ ] **Structured reputation:** migrate optional requirements from free-text notes to a data structure with faction/standing; preserve backward-compatible notes, then consider reputation- and content-based filters.
- [ ] **Map/NPC follow-up:** do not guess missing positions for Risen Oilblaze, Watchman Doomgrip, Elisandra Spellbinder, or other `(0, 0)` entries. Add positions only when verified. All registered instances currently have `worldMap`.
- [ ] **Optional pfQuest review:** use additional quest start/end locations or group-drop hints only where Priest Companion lacks verified data, without creating a hard dependency.

**Deferred until after the above technical review and fixes:**
- [ ] Differentiate dungeon and raid icons. Consider door/entrance for dungeons and shield/crest for raids; validate exact Vanilla texture paths before selecting assets.

### Later capabilities (scope and feasibility to be assessed)

- [ ] Open-world / dungeon / raid content filters (potentially grouped with reputation filters).
- [ ] Add more configurable settings to Options → General / Advanced later (quest-history preferences, optional integrations, reset and UI settings). General is currently read-only; Advanced now contains Book of Prayer controls. Restore quest-history diagnostics elsewhere in a future feature.
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
