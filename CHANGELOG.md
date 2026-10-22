# Changelog

## [Unreleased]

### Improved — Resurrection Assistant compact/expanded HUD (2026-10-22)
- Reworked the Resurrection Assistant's floating window to support **Compact** and **Expanded** layouts. Compact defaults to a centered Resurrection icon, colored player nickname below it and optional class line, in the style of Book of Prayer Tracker. Hiding labels automatically enlarges the icon; Expanded retains a wide heading/details presentation.
- The **entire window is clickable** to make exactly one user-initiated cast attempt, except for a small dedicated resize corner. Dragging the window or its resize grip does not initiate a cast. Lock Position disables movement/resize but preserves clicking.
- Added per-character visual options: Expanded mode (default off), Show player name (default on), Show player class (default off), Lock position (default off), mode-specific scales (70–180%), Reset current size, Reset position, and updated tooltips. Existing saved visibility/position data remain compatible.
- Display colors: green for an eligible unit target, yellow for released-corpses requiring a world click, blue for Preview; player nickname and class line inherit that character's class color.
- A **Preview HUD** button shows a clearly labeled mock target even with no dead party members. It updates with live options and is strictly visual: clicking while Preview is active never casts. Preview stops on tab change or closing Options. No icon tooltip is used.
- Added an out-of-combat player-target-change refresh so the HUD follows the eligible selected recipient instead of waiting for a death/roster event. No OnUpdate roster polling or in-combat scans were added.
- **Static review only; in-game validation pending.** Class-priority ordering and HealComm/LibPredict duplicate-resurrection tests remain deferred as requested.

### Validated — Resurrection Assistant button basic interactions (2026-10-22)
- The maintainer confirmed four in-game checks in OctoWoW: (1) a dead party member makes the button appear and clicking casts Resurrection; (2) released-body mode prepares the spell for a manual corpse click; (3) the button hides in combat and returns after combat; (4) the floating window position is persistent.
- Class priority across multiple dead members, HealComm/LibPredict duplicate detection and other advanced compatibility scenarios remain pending at the maintainer's request. No functional code changed during this validation.

### Added — Clickable Resurrection Assistant button (2026-10-22)
- Added a compact, draggable, event-driven Resurrection button that appears when a party/raid member is dead and eligible **outside combat**. The button uses change notifications, not a frame-by-frame group scan.
- Each click starts **at most one Resurrection attempt**. Candidates are revalidated at click time; an eligible selected target overrides the Priest-first class priority. ClassicAPI `C_Spell.CastAtUnit` is preferred, while the base Vanilla implementation uses `CastSpellByName` and `SpellTargetUnit` after clearing an unrelated selection.
- When all remaining dead group members have released their spirit, the button prepares Resurrection for a manual world click rather than guessing a corpse's unit token. The existing Announcer continues to handle all chat messages.
- Added the per-character **Show Resurrection button** checkbox (enabled by default) and **Reset button position** under Options → Tools → Resurrection. The floating window can be dragged by its header; its coordinates persist across `/reload`.
- Activated manual `/pc res` for exactly one cast attempt; `/pc res status` and `/pc res next` remain diagnostic. Hiding the floating button does not disable the manual command.
- **Subsequently validated in game:** button targeting, released corpse cursor, combat hiding/reappearance and persistent window position. Checkbox behavior, advanced duplicate prevention and Announcer regression tests are still open; class priority and HealComm/LibPredict tests remain deferred as requested.

### Changed and validated — Resurrection Assistant baseline (2026-10-22)
- Changed candidate priority to **Priest first**, followed by Shaman, Paladin, Druid, Mage, Hunter, Warlock, Warrior and Rogue. An eligible manually selected dead target still overrides class order.
- **In-game party tests passed:** with one living teammate, counts were 0 eligible / 0 incoming / 0 released; after the teammate died without release, 1 / 0 / 0; after release, 0 / 0 / 1. The Assistant reported being blocked in combat and refreshed its results after combat ended.
- The new priority ordering itself, raid scenarios, external resurrection protocols and regressions still require in-game validation. No automatic cast or popup has been added.

### Added — Resurrection Assistant candidate engine (2026-10-22)
- Introduced `feature/resurrection-assistant` from the validated `feature/announcer` commit; the prior branch and `main` are untouched.
- Added `Core/ResurrectionAssistant.lua` to both TOCs for event-driven party/raid death detection and priority-based candidate selection. At the time of that initial commit, the Assistant did not cast spells or display a popup; the following change adds the click-only action.
- During the priest's combat, roster/health/death detection and addon-message processing pause completely. `PLAYER_REGEN_ENABLED` refreshes the roster after combat; no per-frame scanning runs.
- Filters dead but not released/ghost players, disconnections, incoming resurrection offers, and optionally known range/line-of-sight failures. An eligible dead player currently targeted has precedence, followed by the fixed class order (Shaman, Paladin, Priest, Druid, Mage, Hunter, Warlock, Warrior, Rogue).
- Reads optional pfUI LibPredict and HealComm data, parses HealComm/CTRA start/cancel messages only from current group members, and supports ClassicAPI remote START when a named target can be resolved. No pfUI or Ace dependency is added to Priest Companion.
- Added read-only `/pc res status` and `/pc res next` for in-game diagnosis. `/pc res` explains that casting has not been implemented.
- **Static checks only; in-game testing pending** for events, group changes, combat pause, priority, external communication, missing providers, ghost handling, and regression behavior.

### Validated — Resurrection settings persistence after reload (2026-10-22)
- In OctoWoW, the maintainer confirmed that the final save-and-reload test passed: customized Resurrection/Whisper messages and selected settings persisted after `/reload`.
- This validates saved changes surviving a UI reload, not every Default/Save/Preview interaction or other edge cases. No runtime changes were needed.

### Validated — Released corpses, Whisper and Resurrection interruptions (2026-10-22)
- **Released corpse:** a world-cursor cast on a player who has released their spirit sends the generic Resurrection start announcement.
- **Interrupted released-corpse cast:** the generic interruption notice reaches the selected chat channels and Whisper is skipped for the unidentified recipient.
- **Named Resurrection target with Whisper enabled:** the recipient receives the configured personalized Whisper.
- **Interrupted named-target Resurrection:** the configured interruption message is sent and the target also receives a Whisper notification.
- All four scenarios were confirmed in OctoWoW by the maintainer. The maintainer additionally confirmed that an out-of-range Resurrection attempt is stopped by the client without any announcement, and a normally completed cast does not produce a false interruption notice. Client-side out-of-range rejection does not independently validate a server-side failure after SENT but before START. Duplicate event handling, channel combinations, and name recovery for released corpses remain unverified; message persistence was confirmed in a subsequent test. No code changes were required.

### Improved — Resurrection Whisper, interruptions and released corpses (2026-10-22)
- Continue requiring matched ClassicAPI `UNIT_SPELLCAST_SENT` and `UNIT_SPELLCAST_START` GUIDs before sending the cast-start announcement; no claim of completion/acceptance. Attempts failing before START stay silent.
- Add a separate editable **Whisper message**, default `Casting {spell} on you. Please don't release!`, with Default, Save/Enter, Escape and unsent preview. Public message remains independent and all settings persist per character.
- Add optional **Announce interrupted casts** (disabled by default). For matching INTERRUPTED/FAILED after START, send one cancellation notice to selected channels. Public cancel message is editable with Default/Save/Preview; Whisper uses `Resurrection on you was interrupted.`. Never report an attempt failing before START or a cast already marked successful as an interrupted one.
- For a released player's corpse clicked in the world, SENT may lack a resolvable unit token. Preserve this cast, correlate with START, briefly check `UnitSpellTargetName("player")`, and then emit a generic public announcement for `a released player's corpse` if no name can be verified. Never whisper an unknown recipient; provide a throttled local diagnostic.
- Keep Fear Ward functionality unchanged. **In-game validation now confirms** generic corpse casts/interruption, Whisper on named targets, and cancellation Whisper. **Still pending:** pre-START failure suppression, duplicate events, corpse-name recovery, text persistence, and /reload.

### Validated — Basic Tools navigation and Resurrection announcements (2026-10-22)
- In OctoWoW, the maintainer confirmed that the **Fear Ward** and **Resurrection** sub-tabs under Options → Tools work.
- The maintainer also confirmed that **Resurrection announcements are being sent**. This validates the basic user-visible announcement flow, not each available channel or precise START-versus-failure behavior.
- Continue testing Whisper delivery, START timing, interruptions, target switching, channel combinations, settings persistence and detailed sub-tab UI interactions before treating the feature as fully validated.

### Changed — Options → Tools navigation and two sub-tabs (2026-10-20)
- Renamed the former **Options → Announcer** tab to **Options → Tools**, reserving this area for both current announcements and future Fear Ward / Resurrection assistants.
- Split its previous long vertically stacked page into native **Fear Ward** and **Resurrection** sub-tabs with separate scroll areas. Each preserves its own enabled option, multi-channel checkboxes, tooltips, custom message, Default/Save controls and unsent preview.
- Preserved the existing `PriestCompanionCharDB.announcer` storage, spell provider/event behavior, and the public `PC.UI.AnnouncerPanel` alias for compatibility. Existing callers selecting the legacy `announcer` section transparently navigate to Tools.
- Unsaved custom message drafts are discarded upon changing sub-tabs or leaving Tools, while saved settings persist. The selected tool sub-tab is maintained when navigating away from and back to Options.
- **In-game UI validation pending:** native tab look/selection, positioning and scroll bounds, 30px row rhythm, changes to channels/tooltips, Default/Save/Preview across sub-tab switches, settings persistence, and continued Fear Ward protection and Resurrection START announcements.

### Added — Resurrection Announcer and Fear Ward options layout (2026-10-19)
- Added a distinct **Resurrection Announcer** section inside Options → Announcer, retaining existing Fear Ward selections and settings. Resurrection has its own disabled-by-default enable setting, message, and independently selectable channels: Say, Yell, Party, Raid, Self (local chat), and **Whisper**.
- Implemented confirmation before announcing: ClassicAPI `UNIT_SPELLCAST_SENT` records the Resurrection recipient and castGUID; `UNIT_SPELLCAST_START` for the same GUID triggers the announcement exactly once only after the cast actually starts. Pre-start failures, unknown recipients, and events without a matching SENT do not announce. This is **not** a claim that the resurrection completed or was accepted.
- Added per-character saving of Resurrection settings nested under `PriestCompanionCharDB.announcer.resurrection`. Default text is `Casting {spell} on {target}.`; separate Default, Save/Enter, Escape, and unsent live Preview behave like Fear Ward.
- **Whisper** (Resurrection only, initially off) sends the start announcement directly to the recipient captured from SENT. Other selected chat channels continue independently, and unavailable Party/Raid channels are skipped. Fear Ward's existing channel settings have no Whisper option.
- Relocated **Prevent overwriting Fear Ward** to the right of **Enable Fear Ward** (same row), retained its checkbox/caption tooltip, and compacted the Resurrection section upward. Both sections preserve the 30px channel-row rhythm.
- **Live testing pending:** normal Resurrection from action bar and mouseover macro, interruption and failed casts, wrong target, duplicate START events, multiple enabled channels including Whisper, no group and no recipient, text edits and persistence across /reload. Fear Ward regression tests remain applicable.

### Fixed — ClassicAPI mouseover Fear Ward macro routing (2026-10-19)
- The maintainer verified that Fear Ward without a target now correctly prevents self-overwriting, while `/cast [@mouseover,help,nodead][help,nodead][@player] Fear Ward` was still recasting on an already-buffed mouseover unit.
- Traced ClassicAPI's `/cast` macro conditional handler to `C_Spell.CastAtUnit(spell, unit, placeGroundSpell)`; a mouseover-targeted cast bypasses the old `CastSpellByName` hook and the `SpellTargetUnit` targeting cursor.
- Add a guarded `C_Spell.CastAtUnit` interception for Fear Ward using its exact passed unit, independent of the selected target. Preserve original return values and forwarding for other spells; recognize numeric spell ID 6346 as well as names.
- **In-game retest (confirmed):** the maintainer verified that `/cast [@mouseover,help,nodead][help,nodead][@player] Fear Ward` is blocked when the mouseover recipient already has Fear Ward.
- **In-game retest (confirmed):** the maintainer verified that an unbuffed mouseover recipient receives Fear Ward normally, including when the current selected target already has Fear Ward; the guard checks the actual mouseover recipient instead of erroneously blocking on selected target state.
- **Still to verify:** mouseover-absent fallback to selected target/player, numeric spell IDs and other DLL macro paths, and that previously validated direct action-bar, spellbook, typed /cast and self-cast paths continue working after this change.

### Fixed — Fear Ward targeting edge cases (2026-10-19)
- Based on maintainer tests: unbuffed target casts, actionbar reapplication blocking, spellbook blocking and typed `/cast Fear Ward` all work in OctoWoW; mouseover macros and no-target self-casting bypassed the initial guard.
- Treat no selected target as the player for pre-cast Fear Ward protection, matching the tested self-cast behavior. Recognize explicit unit arguments supplied by SuperWoW (including mouseover), rather than testing the currently selected target.
- Intercept `SpellTargetUnit(unit)` only when it follows a Fear Ward targeting cursor within a short window; when that actual recipient has Fear Ward, cancel the pending targeting cursor via `SpellStopTargeting()`. Other spells and stale cursor state are not intentionally blocked.
- Support numeric spell ID `6346` in `CastSpellByName` hooks. Retain the default-off setting and do not alter successful announcement logic. Mouseover macros handled entirely by native/DLL macro engines are still not guaranteed to be intercepted.
- **In-game retest required:** no target with/without self-buff, SuperWoW direct unit casting, Lua `CastSpellByName` → `SpellTargetUnit` (buffed/unbuffed recipient), native `[@mouseover]` macros, friendly target present while cursor targets another ally, and actionbar/spellbook regression.

### Added — Optional Fear Ward overwrite protection (2026-10-19)
- Add an independent **Prevent overwriting Fear Ward** checkbox under Options → Announcer (off by default and saved per character). The option works regardless of whether message announcements are enabled.
- Before launching Fear Ward through `CastSpellByName`, `CastSpell` or direct-spell `UseAction` paths, check the friendly target's existing aura; skip the cast and display a throttled local warning when Fear Ward is already present. Use ClassicAPI spellID/name aura readers where available; Vanilla's icon lookup is a fallback.
- Do not cancel an already successful instant spell, block unidentified macros by icon, or assume a mouseover/implicit recipient. Native /cast commands, custom macro targets, and external client DLL cast paths may bypass Lua guards; full universal prevention is not asserted.
- Verification pending: native actionbar, spellbook, Lua macros, /cast, party/raid/self/mouseover paths, no target, cooldowns and no ClassicAPI; confirm no false positives or lost unrelated spells.

### Improved — Announcer layout and explicit message controls (2026-10-19)
- Tightened the gap after Enable Fear Ward to a consistent 30px between checkbox, Announcement channels heading and first channel row. Kept channel rows at 30px intervals, and moved Include casts on myself to the right column beside Yell.
- Added **Default** and **Save** buttons for the custom Fear Ward message. Default restores the original template in the editor as an unsaved draft; Save (or Enter) persists the message per character. Escape restores the saved text. Leaving the Announcer tab discards unsaved edits; changing other checkboxes does not.
- The on-screen preview updates as the draft changes without announcing or persisting it; normal Fear Ward announcements always use the saved template.

### Improved — Announcer checkbox tooltips, spacing and Yell (2026-10-19)
- Move the successful-cast guidance from the body below Enable Fear Ward into the enabled checkbox/caption tooltip. Move the Say/Party/Raid/Self channel explanation into channel checkbox/caption tooltips, including the new Yell behavior.
- Align channel and self-cast checkboxes to uniform 30px vertical rows while preserving the right-hand Party and Self column.
- Add **Yell** as a fifth, independent announcement channel (default off) with settings persistence, availability checking, and one message per successful cast alongside any other selected channels.
- Extend in-game checks to include Say + Yell + Raid, tooltip hover on checkbox/caption, checkbox row spacing, and preferences after /reload.

### Added — Fear Ward Announcer (development branch, 2026-10-19)
- Added independent Options → **Announcer** subtab, preserving General, Tracker, and Mods. Configurations are saved per character under `PriestCompanionCharDB.announcer` and disabled by default.
- Support **multiple simultaneous text channels**, using independent Say, Party, Raid, and Self (local chat) checkboxes. A successful Fear Ward can announce to Say and Raid at once; unavailable Party/Raid destinations are skipped rather than substituted. Optionally allow announcements when targeting oneself.
- Provide a configurable one-line chat template with `{target}` and optional `{spell}`, plus a preview that never sends chat messages. Recipient placeholder is retained when a custom template omits it.
- Pair ClassicAPI `UNIT_SPELLCAST_SENT` (recipient, cast GUID, spell 6346) with `UNIT_SPELLCAST_SUCCEEDED` using the same GUID. Failed/interrupted casts and unconfirmed targets do not announce; each cast announces at most once to each selected channel.
- ClassicAPI 1.11.0+ is required for confirmed target-aware announcements in this initial version; Nampower client-side `SPELL_CAST_EVENT` is not used as a successful server-cast confirmation. The rest of Priest Companion keeps its optional-DLL architecture.
- No spell automation or resurrection handling is included in this initial feature. **In-game acceptance tests pending**; the addon remains v0.2.0 until this branch is validated.

## [0.2.0] - 2026-10-19

### Release summary
- Introduced **Book of Prayer Tracker** for priests: talent detection, six rank-independent healing families, compact/expanded HUD, optional spell labels, refund-eligibility border, configurable auto-hide, movable/resizable saved position, Preview Tracker and a confirmation-protected Reset Position.
- Added optional **Nampower** Book of Prayer mana event reporting (`+N mana`), with cost-based **ClassicAPI** estimates (`~N mana`) when the direct event is unavailable. Reworked rapid-cast event correlation to preserve closely spaced Flash Heal → Renew refunds.
- Released the **Wands / Options** native tab interface, **Options → Tracker / Mods**, environment diagnostics, and guarded optional ClassicAPI and Quest History enhancements. Core Vanilla compatibility and two TOC flavors are retained.
- **Maintainer validation (OctoWoW):** rapid Flash Heal → Renew mana display, Reset Position and Preview Tracker worked in-game. The maintainer also tested Inner Focus → heal → heal; Ascendance → heal → another heal; Ascendance → heal → heal; both orders of Inner Focus and Ascendance followed by either two heals of the same family or different families. Inner Focus correctly required restarting the refund cycle; Ascendance correctly showed reduced mana refunds. Confirmation-dialog Cancel/Escape, reload, cross-client compatibility and other edge cases remain tracked in [ROADMAP.md](ROADMAP.md).

### Fixed — Fast consecutive heals and Reset Position confirmation (2026-10-19)
- Replace the blanket 750ms rapid-heal rejection with a bounded Nampower Book of Prayer packet queue and individual recent-success records. Correlate events against eligible casts by actual server amount, spell-cost estimate (when ClassicAPI is available), successful-cast order and event timing; keep a refund from an older cast even when a new spell is sent.
- Reduce the after-success matching window to **400ms** (150ms allowance for events just before SUCCEEDED) with a 120ms settling delay and a guarded 240ms delay when a newer SENT is pending. Accept at most one refund per successful heal, and preserve the ClassicAPI `~N mana` fallback when a packet cannot be matched confidently. Nampower does not provide the underlying cast GUID, so same-cost overlapping casts cannot be identified with certainty.
- Reset Position now opens a Vanilla-style **OK / Cancel** confirmation explaining that position and both compact/expanded window sizes return to defaults while other options (including lock) remain unchanged. Cancel/Escape does nothing.
- Documented live test scenarios for rapid Flash Heal → Renew, reversed order, duplicate/late packets, canceled casts, and confirming/canceling reset. Preview Tracker behavior is unchanged; remaining scenarios still need in-game verification.

### Improved — Book of Prayer event matching and tracker layout controls (2026-10-19)
- Introduced conservative Book of Prayer `SPELL_ENERGIZE_ON_SELF` matching for spell `52942`. The initial 750ms blanket suppression has since been superseded by the queue-based synchronization described above; ClassicAPI `~N mana` estimates remain the fallback.
- Continue matching ClassicAPI pre-cast mana-cost snapshots by `UNIT_SPELLCAST_SENT` GUID and spell ID, discarding the snapshot on new casts or matching failed/interrupted casts. Nampower refund packets are now buffered independently and are not cleared when another spell begins.
- Added **Reset Position** under Options → Tracker. It resets saved `x`, `y`, compact width/height, and expanded width/height to their original defaults without changing lock, visibility, mana, or other character preferences. Geometry refreshes immediately, including while locked.
- Added **Preview Tracker / Close Preview**. Preview uses a separate temporary UI-only sample of Renew → Flash Heal and `+38 mana` with a visible PREVIEW tag, respecting the current icon/name/refund-display preferences. It can be used without talent points and despite combat/auto-hide restrictions, and cannot overwrite healing history or the stored mana result. It ends on leaving the Tracker settings tab; dragging/resizing while unlocked intentionally saves only geometry.
- Optional ClassicAPI/Nampower/SuperWoW behavior and the maintainer's title font choice are preserved. Unverified edge cases remain tracked in the roadmap.

### Refined — Prayer Tracker spell layout with mana shown (2026-10-19)
- Kept the mana refund label anchored in its existing bottom position and adjusted spell-icon size and vertical placement instead, in both compact and expanded display modes.
- When **Show mana refund** is enabled, reserve footer space regardless of whether the last cast returned mana; this prevents the icon from jumping between successive casts. With **Show spell name** enabled, use a smaller icon to avoid the mana label. With the spell name hidden, retain a larger icon (compact: 54; expanded: 64 logical pixels).
- For names that wrap across multiple lines, reduce the icon further to preserve readability, including in compact mode. Without the mana option, the previous icon dimensions remain unchanged.
- Preserve per-character HUD geometry, Nampower/ClassicAPI mana sources, the enlarged mana label font, and the user's title font selection. In-game rendering remains to be verified.

### Added — Nampower exact Book of Prayer refund and larger mana text (2026-10-19)
- Prefer the live Nampower `SPELL_ENERGIZE_ON_SELF` server event, filtered to spell ID **52942** (Book of Prayer), mana power type `0`, nonperiodic, and positive amount. The displayed `+N mana` is the server-reported amount (`arg5`), not a calculated percentage. Match to the current recent qualifying heal, with a short buffer if the energize event precedes the successful cast event; avoid duplicating other energize sources.
- Keep the existing ClassicAPI `C_Spell.GetSpellPowerCost` prediction as a fallback (`~N mana`) when the direct Nampower report is unavailable; existing Inner Focus suppression and Ascendance's dynamically modified cost path remain relevant. Nampower is an optional integration and does not replace the preferred ClassicAPI success event.
- Detect Nampower's major/minor release through `GetNampowerVersion()`. On **4.5+**, registering the energize event enables it; older versions require the Nampower `NP_EnableSpellEnergizeEvents` CVar, set automatically only when the user enables **Show mana refund** and the talent is active. The addon does not execute a slash command. If the addon changes an older CVar, it restores its prior value when the user disables the option or logs out (including reload).
- Rename the checkbox from **Show estimated mana refund** to **Show mana refund** and document `+N` (Nampower actual) versus `~N` (ClassicAPI estimate). Preserve its previous saved state and default off behavior.
- Increase the mana-refund font from `GameFontHighlightSmall` to `GameFontHighlight`, without changing the maintainer's manually adjusted tracker title font.
- **In-game validation:** the maintainer confirmed correct Inner Focus cycle suppression and Ascendance's reduced actual refunds in multiple cast orders. Nampower 4.0 vs 4.5+ behavior, late event delivery, fallback-provider combinations, reload, and broader spell/rank coverage still require targeted tests.

### Added — Predicted Book of Prayer mana refund (2026-10-19)
- Renamed the visible Options subtab **Advanced** to **Tracker**, preserving the existing internal section ID (`advanced`) and all user settings.
- Added **Show estimated mana refund** (off by default) next to the existing independent color-border option. After a confirmed qualifying heal, the HUD may display e.g. `~38 mana`; the tilde explicitly indicates a prediction, **not an observed/verified increase in mana**. When cost data is unavailable the HUD does not display a fabricated value.
- On ClassicAPI-capable clients, capture the spell's live `C_Spell.GetSpellPowerCost(spellID)[1].cost` at `UNIT_SPELLCAST_SENT`, match the spell ID and cast GUID at `UNIT_SPELLCAST_SUCCEEDED`, and estimate `effectiveCost * talentPoints * 0.15`, rounding the *displayed* estimate to an integer. Other providers keep the previous family/color tracking without making numeric estimates.
- Account for the tested OctoWoW Inner Focus quirk: an Inner Focus-affected cast returns no mana, and the next healing cast is also ineligible; zero-cost casts suppress the displayed refund. Confirm full behavior on the live server, including buff cancellation/expiration, instant casts, and Ascendance changes; no hardcoded Ascendance multiplier is used.
- The healing tracker still requires Book of Prayer talent points and only considers the same six healing families, independent of rank. Mana forecasts and Inner Focus suppression have additional in-game test cases in the roadmap.

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
- This initial tracker implementation was subsequently refined and the maintainer confirmed the rapid-cast mana display works in OctoWoW. Additional talent/rank and resizing acceptance cases remain open in the roadmap.

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
- Kept the Mods Refresh action display-only (no new server query) and preserved Wands/Source Details. The earlier `/priest env` shortcut was subsequently superseded by `/priest options`.
- Visual and interaction verification for the new tab interface still includes outstanding in-game scenarios documented in the roadmap.

### Fixed — Vanilla 1.12 tab compatibility (2026-10-17)
- Replaced unsupported native Button `SetEnabled()` calls with `Enable()` / `Disable()` in `UI/MainFrame.lua` and `UI/OptionsPanel.lua`. This addresses Lua errors when opening the main frame or selecting Options subtabs.
- Kept the same tab selection behavior, slash commands and Puppeteer-inspired layout. In-game retesting is pending.

### Added — Puppeteer-Inspired Options UI (2026-10-17)
- Added native Vanilla-style bottom tabs (**Wands** and **Options**) and secondary Options tabs (**General**, **Advanced**, **Mods**), modeled on Puppeteer's two-level navigation without importing PTGuiLib or other dependencies.
- Added `UI/OptionsPanel.lua` for nested navigation, a General information page and an Advanced read-only quest-history diagnostics page.
- Reworked `UI/EnvironmentPanel.lua` as a scrollable **Options → Mods** page with individual ClassicAPI, SuperWoW, Nampower and UnitXP SP3 cards, status, version information and descriptions of optional capabilities.
- Initially changed `/priest env` and `/pc env` to open **Options → Mods** directly; these were subsequently replaced with `/priest options` / `/pc options` (Options → General). The Mods Refresh button remains read-only.
- Preserved existing Wand Progression data, filters, row rendering and Source Details behavior. Both Vanilla and ClassicAPI TOCs now load the Options panel before the nested Mods page.
- The interface ships with `0.2.0`. Native tab templates, scrolling and navigation retain in-game validation tasks in the roadmap.

### Added — Environment Tab (2026-10-17)
- Initially introduced a dedicated **Environment** tab to display client diagnostics without filling game chat. Its contents were subsequently reorganized into **Options → Tracker / Mods** during development.
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
- Updated [ROADMAP.md](ROADMAP.md) with compatibility expectations and remaining **in-game test cases**. The ClassicAPI enhancements are included in `0.2.0`, although their full acceptance matrix has not yet been completed.

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
