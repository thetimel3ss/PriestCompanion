# Wand acquisition snapshot

The files in this directory preserve the OctoWoW item, quest, NPC, and object
facts used to build the addon catalog on 2026-09-28. Each ID can be checked at
`https://octowow.st/db/?item=ID`, `?quest=ID`, or `?npc=ID`.

Run `python3 tools/octowow/build_catalog.py` from the repository root after
updating the JSON snapshots. It writes the `Data/Octo*.lua` files. Both TOCs
load these after the original curated records; the generator keeps the four
hand-verified Blackfathom NPC coordinates and quest journal entries.
Run `lua5.1 tools/octowow/validate.lua` to check item/source links, chains,
instances, mob names, and boss loot tables.

The catalog contains 147 wands with an acquisition source in the database.
The item listing also contains nine `Monster - Wand` equipment placeholders,
two numbered frost test items, and four player-looking wands with no documented
source: 50629 Chanting Rod, 50529 Rod of Charring, 70013 Diathorus' Claw, and
80772 Twisted Draenei Rib. The obtainable quest version of Diathorus' Claw is
81290. Items without a documented acquisition path are omitted until one is
verified.

Global random drops can have hundreds of creatures. All mob IDs, names, and
listed chances remain in the snapshot and in the generated data; the UI reveals
them in pages of 40. Boss loot likewise retains every row published on the
NPC page, including shared random drops. The map button uses native coordinates
when available and pfQuest's mob/object lookup for scripted spawns without
published coordinates. Without either, it opens the dungeon's entrance zone
without placing an unverified boss pin.
