"""Build Vanilla 1.12 Lua data from verified OctoWoW item/quest/NPC pages.

The catalog is kept in separate files so the original curated recommendations
and the hand-verified Blackfathom map coordinates remain intact.
"""
import json
import re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).parent
REPO = ROOT.parent.parent if (ROOT.parent.parent/'PriestCompanion.toc').exists() else ROOT.parent/'PriestCompanion'
def load(name): return json.loads((ROOT/name).read_text())
items={x['id']:x for x in load('item_facts.json') if x['views']}
quests={x['id']:x for x in load('quest_facts.json')}
npcs={x['id']:x for x in load('npcs_facts.json')}
objects={x['id']:x for x in load('objects_facts.json')}

# These are the game's zone/instance IDs in the Octo item and quest records.
# Only Blackfathom has a verified native SetMapZoom index; other instances
# intentionally use pfQuest or their physical entrance rather than fake pins.
INSTANCES={
 35:('Stormwind Vault','dungeon'),43:('Wailing Caverns','dungeon'),
 47:('Razorfen Kraul','dungeon'),48:('Blackfathom Deeps','dungeon'),
 109:('Sunken Temple','dungeon'),129:('Razorfen Downs','dungeon'),
 209:("Zul'Farrak",'dungeon'),229:('Blackrock Spire','dungeon'),
 269:('Caverns of Time: Black Morass','dungeon'),
 309:("Zul'Gurub",'raid'),349:('Maraudon','dungeon'),
  389:('Ragefire Chasm','dungeon'),509:('Ruins of Ahn\'Qiraj','raid'),
  531:('Temple of Ahn\'Qiraj','raid'),532:('Lower Karazhan Halls','raid'),
  533:('Naxxramas','raid'),718:('Wailing Caverns','dungeon'),
  719:('Blackfathom Deeps','dungeon'),721:('Gnomeregan','dungeon'),
  796:('Scarlet Monastery','dungeon'),800:('Karazhan Crypt','dungeon'),
  802:('Crescent Grove','dungeon'),814:('Tower of Karazhan','raid'),
  1581:('The Deadmines','dungeon'),1584:('Blackrock Depths','dungeon'),
  2017:('Stratholme','dungeon'),2057:('Scholomance','dungeon'),
  2557:('Dire Maul','dungeon'),2677:('Blackwing Lair','raid'),
  2717:('Molten Core','raid')}
ENTRANCE_ZONES={35:'Stormwind City',43:'The Barrens',47:'The Barrens',
 109:'Swamp of Sorrows',129:'The Barrens',209:'Tanaris',229:'Burning Steppes',
 269:'Tanaris',309:'Stranglethorn Vale',349:'Desolace',389:'Orgrimmar',
 509:'Silithus',531:'Silithus',532:'Deadwind Pass',533:'Eastern Plaguelands',
 718:'The Barrens',721:'Dun Morogh',796:'Tirisfal Glades',
 800:'Deadwind Pass',802:'Ashenvale',814:'Deadwind Pass',
 1581:'Westfall',1584:'Searing Gorge',2017:'Eastern Plaguelands',
 2057:'Western Plaguelands',2557:'Feralas',2677:'Burning Steppes',
  2717:'Burning Steppes'}
INSTANCE_SHORT={35:'SWV',43:'WC',47:'RFK',109:'ST',129:'RFD',
 209:'ZF',229:'BRS',269:'CoT',309:'ZG',349:'Mara',389:'RFC',
 509:'AQ20',531:'AQ40',532:'LK',533:'Naxx',718:'WC',721:'Gnomer',
 796:'SM',800:'KC',802:'CG',814:'ToK',1581:'DM',1584:'BRD',
 2017:'Strat',2057:'Scholo',2557:'DM',2677:'BWL',2717:'MC'}
INSTANCE_ALIASES={43:43,47:47,48:719,109:109,129:129,209:209,229:229,
  269:269,309:309,349:349,389:389,509:509,531:531,532:532,533:533,
  718:43,719:719,721:721,796:796,800:800,802:802,814:814,
  1581:1581,1584:1584,2017:2017,2057:2057,2557:2557,2677:2677,2717:2717,35:35}
SCRIPTED_BOSSES={
  1853:2057, 91928:800, 14516:2057, 7356:129,
  80830:35, 9476:1584, 13456:349, 15083:309,
  65114:269, 12259:2717, 20672:None,
}
BOSS_IDS={6109,63107,52145,12098,12118,12259,12264,15990,11981,
  59991,14510,14834,16028,15511,16061,10436,92111,61222,1853,
  91928,645,7272,7274,7795,14686,14324,6490,13282,14516,7356,
  9024,10440,5709,10509,10393,80830,80854,15208,15083,65113,
  14327,11520,12159,9476,5912,62069,4066,62548,62503,61517,
  80116,62193}
QUEST_INSTANCE={8257:109, 55006:721, 1487:43, 41353:814}
QUEST_ITEM_START={41353:61946,41841:62671}
SKILL={11287:10,11288:70,11289:155,11290:175}
RECIPES={
 11287:((4470,1),(10938,1)),11288:((4470,1),(10939,1)),
 11289:((11291,1),(11134,1),(11083,1)),
  11290:((11291,1),(11135,1),(11137,1))}
REAGENT_NAMES={4470:'Simple Wood',10938:'Lesser Magic Essence',
  10939:'Greater Magic Essence',11291:'Star Wood',
  11134:'Lesser Mystic Essence',11083:'Soul Dust',
  11135:'Greater Mystic Essence',11137:'Vision Dust',
  6218:'Runed Copper Rod',11130:'Runed Golden Rod'}
QUALITY={1:5,2:4,3:3,4:2,5:1,6:0}

def lua(x):
    if x is None:return 'nil'
    if x is True:return 'true'
    if x is False:return 'false'
    if isinstance(x,str):
        return '"'+x.replace('\\','\\\\').replace('"','\\"').replace('\r','').replace('\n','\\n')+'"'
    if isinstance(x,(int,float)):
        return format(x,'.9g') if isinstance(x,float) else str(x)
    if isinstance(x,list):return '{ '+', '.join(lua(v) for v in x)+' }'
    if isinstance(x,dict):
        return '{ '+', '.join((k if re.fullmatch(r'[A-Za-z_]\w*',str(k)) else '['+lua(k)+']')+' = '+lua(v) for k,v in x.items() if v is not None)+' }'
    raise TypeError(type(x))

def write(name,table,rows):
    heading='-- Priest Companion | OctoWoW acquisition catalog (verified 2026-09-28)\n'
    heading+='-- Source: https://octowow.st/db/ | Regenerate with tools/octowow/build_catalog.py\n'
    content=heading+'local Data = PriestCompanion.Data\n'
    if table in ('BossLoot','DropMobs','ItemNames'):
        content+='Data.'+table+' = Data.'+table+' or {}\n'
    content+='local '+table+' = Data.'+table+'\n\n'
    for key,value in rows:
        content+=table+'['+lua(key)+'] = '+lua(value)+'\n'
    (REPO/'Data'/name).write_text(content,encoding='utf-8')
    print(name,len(rows),len(content))

existing_ids={int(x) for x in re.findall(r'AddWand\(\s*(\d+),', (REPO/'Data/Items.lua').read_text())}
new_items=[];new_wands=[]
for id,x in sorted(items.items()):
    if id in existing_ids:continue
    damage=x['damage']
    if not damage or not x['speed']:raise RuntimeError(f'missing wand stats {id}')
    new_items.append((id,{'name':x['name'],'quality':QUALITY[x['quality']],
       'itemLevel':x['level'],'requiredLevel':x['requiredLevel'],
       'itemType':'Wand','equipSlot':'Ranged','damage':{
       'min':damage[0],'max':damage[1],'school':damage[2],'speed':x['speed']}}))
    new_wands.append((id,{'order':x['requiredLevel'] or max(1,x['level']-5)}))
write('OctoItems.lua','Items',new_items)
write('OctoWands.lua','Wands',new_wands)

instances=[]
for id,(name,kind) in sorted(INSTANCES.items()):
    if id==719:continue
    instances.append((id,{'name':name,'shortName':INSTANCE_SHORT.get(id,name),'type':kind,
       'description':('Raid' if kind=='raid' else 'Dungeon')+' encounter in '+name+'.',
       'entranceZone':ENTRANCE_ZONES.get(id),
       'icon':'Interface\\Icons\\INV_Misc_Map_01'}))
write('OctoInstances.lua','Instances',instances)

def maps_for(actor):
    page=(npcs if actor['kind']=='npc' else objects).get(actor['id'],{})
    maps=page.get('maps',[])
    valid=next((m for m in maps if m['x'] is not None and m['y'] is not None),None)
    return page,valid or (maps[0] if maps else None)

npc_ids={a['id'] for q in quests.values() for a in q['actors'].values() if a['kind']=='npc'}
npc_ids.update(QUEST_ITEM_START.values())
for x in items.values():
    for tab in ('dropped-by','sold-by'):
        npc_ids.update(int(r['id']) for r in x['views'].get(tab,[]) if len(x['views'].get(tab,[]))<=35)
npc_rows=[]
for id in sorted(npc_ids):
    if id in (4786,4787,4783,9087):continue
    page=npcs.get(id)
    if not page:continue
    maps=page['maps'];mapped=next((m for m in maps if m['x'] is not None),None)
    first=mapped or (maps[0] if maps else None)
    row={'id':id,'name':page['name'],'zone':first['zone'] if first else None}
    if mapped:row['map']={'zone':mapped['zone'],'x':mapped['x'],'y':mapped['y']}
    npc_rows.append((id,row))
write('OctoNPCs.lua','NPCs',npc_rows)

def chain_steps(quest_id):
    steps=[];seen=set()
    def visit(id):
        if id in seen:return
        if id not in quests:raise RuntimeError(f'prerequisite quest {id} is missing')
        q=quests[id]
        sequence=(q['series'][:q['series'].index(id)+1]
            if id in q['series'] else [id])
        for step in sequence:
            if step in seen:continue
            for prereq in quests[step].get('requires',[]):visit(prereq)
            seen.add(step);steps.append(step)
    visit(quest_id)
    return steps

reward_quest_ids={int(r['id']) for x in items.values()
                  for r in x['views'].get('reward-of',[])}
chains={}
for id in reward_quest_ids:
    steps=chain_steps(id)
    if len(steps)>1:chains['octo:'+str(id)]=steps

quest_rows=[]
for id,q in sorted(quests.items()):
    if id in (1198,1200,6561):continue
    row={'name':q['name'],'questLevel':q['level'],'requiredLevel':q['required'],
         'faction':q['faction'],'description':q['description'] or q['objective'],
         'objectiveText':q['objective']}
    instance=QUEST_INSTANCE.get(id) or INSTANCE_ALIASES.get(q['zoneID'])
    if instance:row['instanceID']=instance
    for label in ('start','end'):
        actor=q['actors'].get(label)
        if not actor and label=='start' and id in QUEST_ITEM_START:
            actor={'kind':'npc','id':QUEST_ITEM_START[id],
                   'name':npcs[QUEST_ITEM_START[id]]['name']}
        if not actor and id==2879 and label=='end':
            actor={'kind':'object','id':144063,'name':'Equinex Monolith'}
        if not actor and id==41945:
            row[label+'NPC']={'name':"Fena Ma'dar",'zone':"Moro'gai Village"}
            continue
        if not actor:continue
        key=label+'NPC'
        if actor['kind']=='npc':row[key]=actor['id']
        else:
            _,m=maps_for(actor)
            obj={'id':actor['id'],'kind':'object','name':actor['name']}
            if m:
                obj['zone']=m['zone']
                if m['x'] is not None:obj['map']={'zone':m['zone'],'x':m['x'],'y':m['y']}
            row[key]=obj
    if q['choices']:row['rewards']={'type':'choice','items':q['choices']}
    elif q['rewards']:row['rewards']={'type':'fixed','items':q['rewards']}
    quest_rows.append((id,row))
write('OctoQuests.lua','Quests',quest_rows)
write('OctoQuestChains.lua','QuestChains',[(id,{'name':quests[ids[-1]]['name'],
  'rewardQuestID':ids[-1],'steps':ids}) for id,ids in sorted(chains.items())])
item_names=dict(REAGENT_NAMES)
for q in quests.values():
    for id,name in q.get('rewardNames',{}).items():
        if name:item_names[int(id)]=name
write('OctoItemNames.lua','ItemNames',sorted(item_names.items()))

def location_ids(row):return [int(x) for x in re.findall(r'\d+',str(row.get('location','')))]
def instance_for_mob(row):
    id=int(row['id'])
    if id in SCRIPTED_BOSSES:return SCRIPTED_BOSSES[id]
    locs=location_ids(row)
    for loc in locs:
        if loc in INSTANCE_ALIASES:return INSTANCE_ALIASES[loc]
    for m in npcs.get(id,{}).get('maps',[]):
        if m['zoneID'] in INSTANCE_ALIASES:return INSTANCE_ALIASES[m['zoneID']]
    return None

def npc_zone(row):
    page=npcs.get(int(row['id']),{})
    return page['maps'][0]['zone'] if page.get('maps') else None

loot_rows=[];loot_ids=set()
sources=[]
drop_names={}
for id,x in sorted(items.items()):
    v=x['views'];all_sources=[]
    for r in v.get('reward-of',[]):
        q=quests.get(int(r['id']))
        if not q:continue
        instance=QUEST_INSTANCE.get(q['id']) or INSTANCE_ALIASES.get(q['zoneID'])
        chain='octo:'+str(q['id']) if 'octo:'+str(q['id']) in chains else None
        if q['id']==1200:chain='gravestone_scepter_alliance'
        actor=q['actors'].get('start') or q['actors'].get('end')
        _,m=maps_for(actor) if actor else ({},None)
        source={'type':'quest','questID':q['id'],'questName':q['name'],
          'faction':q['faction'],'requiredLevel':q['required'],
          'zone':m['zone'] if m else None,'instanceID':instance,'chainID':chain,'details':True}
        all_sources.append(source)
    for r in v.get('created-by',[]):
        reagents=[{'itemID':a,'amount':b} for a,b in RECIPES[id]]
        all_sources.append({'type':'craft','profession':'Enchanting','skill':SKILL[id],
           'spellID':int(r['id']),'reagents':reagents,
           'tools':[{'itemID':6218 if id in (11287,11288) else 11130}],
           'requiredLevel':x['requiredLevel'],'faction':'Both','details':True})
    for r in v.get('sold-by',[]):
        actor={'kind':'npc','id':int(r['id'])};_,m=maps_for(actor)
        all_sources.append({'type':'vendor','npcID':int(r['id']),'npcName':r['name'],
           'zone':m['zone'] if m else None,'faction':'Both','details':True})
    drops={int(r['id']):r for r in v.get('dropped-by',[])}
    grouped=defaultdict(list)
    for r in drops.values():grouped[instance_for_mob(r)].append(r)
    for instance,rows in sorted(grouped.items(),key=lambda a:(a[0] is None,a[0] or 0)):
        # Global random equipment can list hundreds of creatures. Keep a
        # representative list and the exact count, retaining every dungeon
        # trash mob and each boss as an independent source.
        world=instance is None and len(rows)>35
        if world:
            rows=sorted(rows,key=lambda r:float(r.get('percent') or 0),reverse=True)
        boss_like=len(rows)<=5 and not world
        if boss_like:
            groups=[[r] for r in rows]
        else:groups=[rows]
        for group in groups:
            first=group[0];npcid=int(first['id']);page=npcs.get(npcid,{})
            npc_class=page.get('npcClass') or ''
            is_boss=boss_like and (npc_class=='Boss'
                or (instance and npcid in BOSS_IDS))
            creature_type=('Boss' if is_boss else
                'Rare creature' if boss_like and 'Rare' in npc_class else
                'Named creature' if boss_like else
                'Raid creatures' if instance and INSTANCES[instance][1]=='raid'
                else 'Creatures')
            for r in group:drop_names[int(r['id'])]=r['name']
            mobs=[{'id':int(r['id']),
                   'chance':float(r['percent']) if 'percent' in r else None} for r in group]
            source={'type':'drop','npcID':npcid,
              'npcName':first['name'] if boss_like else ('Multiple creatures'),
              'npcType':creature_type,
              'instanceID':instance,'zone':npc_zone(first),
              'dropChance':float(first['percent']) if boss_like and 'percent' in first else None,
              'mobs':mobs,'mobCount':len(group),'details':True}
            if instance and not boss_like:source['zone']=None
            if is_boss and page.get('loot'):
                loot_ids.add(npcid);source['lootNPCID']=npcid
            all_sources.append(source)
    # Container sources are useful when a random world wand has no mob drop.
    if not drops:
        for r in v.get('contained-in-object',[])[:8]:
            all_sources.append({'type':'drop','npcName':r['name'],
              'npcType':'Container','zone':None,'details':True})
    sources.append((id,all_sources))

for id in sorted(loot_ids):
    rows=npcs[id]['loot']
    loot_rows.append((id,[{'itemID':r['id'],'name':r['name'],
      'chance':r['percent'],'quality':QUALITY.get(r.get('quality'))}
      for r in rows]))
write('OctoLoot.lua','BossLoot',loot_rows)
write('OctoDropMobs.lua','DropMobs',sorted(drop_names.items()))
write('OctoSources.lua','Sources',sources)
print('verified',len(items),'new',len(new_items),'boss loot',len(loot_rows),
      'source count',sum(len(x) for _,x in sources))
