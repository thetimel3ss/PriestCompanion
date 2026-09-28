PriestCompanion = { Data = {} }
local paths = {
 'Data/Items.lua','Data/Instances.lua','Data/NPCs.lua','Data/Sources.lua',
 'Data/Wands.lua','Data/Quests.lua','Data/QuestChains.lua',
 'Data/OctoItems.lua','Data/OctoInstances.lua','Data/OctoNPCs.lua',
 'Data/OctoWands.lua','Data/OctoQuests.lua','Data/OctoQuestChains.lua',
 'Data/OctoItemNames.lua','Data/OctoLoot.lua',
 'Data/OctoDropMobs.lua','Data/OctoSources.lua',
}
for _, path in ipairs(paths) do assert(loadfile(path))() end
local d = PriestCompanion.Data
local count, sourceCount, questCount, mobCount, lootCount = 0,0,0,0,0
for id, wand in pairs(d.Wands) do
 count=count+1
 assert(d.Items[id], 'item missing '..id)
 local sources=d.Sources[id]
 assert(sources and #sources>0, 'source missing '..id)
 for _, source in ipairs(sources) do
  sourceCount=sourceCount+1
  if source.questID then
   questCount=questCount+1
   local quest=d.Quests[source.questID]
   assert(quest, 'quest missing '..source.questID)
   assert(quest.startNPC and quest.endNPC,
    'start/end location missing '..source.questID)
   if source.chainID then
    local chain=d.QuestChains[source.chainID]
    assert(chain and #chain.steps>1, 'chain missing '..source.chainID)
    assert(chain.steps[#chain.steps]==source.questID,
     'chain does not end at reward quest '..source.questID)
    for _, step in ipairs(chain.steps) do
     assert(d.Quests[step], 'chain step missing '..step)
    end
   end
  end
  if source.instanceID then assert(d.Instances[source.instanceID], 'instance missing '..source.instanceID) end
  if source.lootNPCID then
   lootCount=lootCount+1
   assert(d.BossLoot[source.lootNPCID], 'loot missing '..source.lootNPCID)
  end
  if source.npcType=='Boss' then
   assert(source.lootNPCID, 'boss loot missing '..source.npcID)
  end
  if source.reagents then
   for _, reagent in ipairs(source.reagents) do
    assert(d.ItemNames[reagent.itemID], 'reagent name missing '..reagent.itemID)
   end
  end
  if source.mobs then
   assert(#source.mobs==source.mobCount, 'mob count differs '..id..' '..#source.mobs..' '..tostring(source.mobCount))
   for _, mob in ipairs(source.mobs) do
    mobCount=mobCount+1
    assert(d.DropMobs[mob.id], 'mob name missing '..mob.id)
   end
  end
 end
end
assert(count==147, 'expected 147 obtainable wands, got '..count)
print(('OK %d wands, %d sources, %d quest references, %d mob references, %d boss loot references'):format(count,sourceCount,questCount,mobCount,lootCount))
