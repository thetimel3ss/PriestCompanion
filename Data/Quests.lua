-- Priest Companion
-- Quest Database
--
-- Quest records contain only quest-specific data.
-- NPC identity and locations are stored separately
-- in Data/NPCs.lua.
--
-- Full quest text is read from the player's quest
-- log when possible; otherwise the summary stored
-- here is used.

local PC = PriestCompanion

PC.Data.Quests =
    PC.Data.Quests or {}

local Quests =
    PC.Data.Quests

--------------------------------------------------
-- In Search of Thaelrid
--------------------------------------------------

Quests[1198] = {
    name = "In Search of Thaelrid",
    questLevel = 24,
    requiredLevel = 18,
    faction = "Alliance",
    instanceID = 719,
    startNPC = 4786,
    endNPC = 4787,
    objectiveText = "Find Argent Guard Thaelrid inside Blackfathom Deeps.",
    summary = "Dawnwatcher Shaedlass asks you to locate the missing Argent Dawn scout Thaelrid inside Blackfathom Deeps and assist him.",
    gains = {
        experience = 240,
        reputation = {
            {
                name = "Argent Dawn",
                amount = 150
            },

            {
                name = "Darnassus",
                amount = 150
            }
        }
    }
}

--------------------------------------------------
-- Ignition
--------------------------------------------------

Quests[858] = {
    name = "Ignition",
    questLevel = 18,
    requiredLevel = 13,
    faction = "Both",
    startNPC = 3439,
    endNPC = 3439,
    objectiveText = "Get the Ignition Key and bring it to Wizzlecrank.",
    description = "I don't suppose Sputtervalve sent you? I'm in a bind here. I hopped in without realizing that I need a key to unlock the shredder's movement column. One of the other shredder operators asked me if everything was okay, and I panicked! Instead of telling him that I was missing my key, I told him there was some sort of mechanical problem. We need to get out of here on the double. Go up to the control room at the top of the derrick, the supervisor should have a key for this shredder. Help me out here!",
    gains = {
        experience = 140,
        reputation = {
            {
                name = "Ratchet",
                amount = 100
            }
        }
    }
}

--------------------------------------------------
-- The Escape
--------------------------------------------------

Quests[863] = {
    name = "The Escape",
    questLevel = 18,
    requiredLevel = 13,
    faction = "Both",
    startNPC = 3439,
    endNPC = 3442,
    requires = {
        858
    },

    objectiveText = "Protect Wizzlecrank and the stolen goblin shredder on the way to Sputtervalve in Ratchet.",
    description = "I suppose I'll learn as we go... Couldn't be too hard. Just some buttons here, and a lever or two... Well, are you ready to go?",
    rewards = {
        type = "choice",
        items = {
            5326, -- Flaring Baton
            5327  -- Greasy Tinker's Pants
        }
    },

    gains = {
        experience = 170,
        reputation = {
            {
                name = "Ratchet",
                amount = 150
            }
        }
    }
}

--------------------------------------------------
-- Blackfathom Villainy - Alliance
--------------------------------------------------

Quests[1200] = {
    name = "Blackfathom Villainy",
    questLevel = 27,
    requiredLevel = 18,
    faction = "Alliance",
    instanceID = 719,
    startNPC = 4787,
    endNPC = 4783,
    objectiveText = "Defeat Twilight Lord Kelris and bring his head to Dawnwatcher Selgorm in Darnassus.",
    summary = "Thaelrid explains that Twilight's Hammer cultists in Blackfathom Deeps serve Aku'Mai and asks you to end Twilight Lord Kelris' activities.",
    objectives = {
        {
            type = "item",
            itemID = 5881,
            amount = 1
        }
    },

    rewards = {
        type = "choice",
        items = {
            7001, -- Gravestone Scepter
            7002  -- Arctic Buckler
        }
    },

    gains = {
        experience = 330,
        reputation = {
            {
                name = "Argent Dawn",
                amount = 200
            },

            {
                name = "Darnassus",
                amount = 200
            }
        }
    }
}

--------------------------------------------------
-- Blackfathom Villainy - Horde
--------------------------------------------------

Quests[6561] = {
    name = "Blackfathom Villainy",
    questLevel = 27,
    requiredLevel = 18,
    faction = "Horde",
    instanceID = 719,
    startNPC = 4787,
    endNPC = 9087,
    objectiveText = "Defeat Twilight Lord Kelris and bring his head to Bashana Runetotem in Thunder Bluff.",
    summary = "Thaelrid asks you to stop Twilight Lord Kelris and the Twilight's Hammer activity surrounding Aku'Mai in Blackfathom Deeps.",
    objectives = {
        {
            type = "item",
            itemID = 5881,
            amount = 1
        }
    },

    rewards = {
        type = "choice",
        items = {
            7001, -- Gravestone Scepter
            7002  -- Arctic Buckler
        }
    },

    gains = {
        experience = 330,
        reputation = {
            {
                name = "Argent Dawn",
                amount = 200
            },

            {
                name = "Thunder Bluff",
                amount = 200
            }
        }
    }
}

--------------------------------------------------
-- The People's Militia
--------------------------------------------------

Quests[14] = {
    name = "The People's Militia",
    questLevel = 17,
    requiredLevel = 9,
    faction = "Alliance",
    startNPC = 234,
    endNPC = 234,
    objectiveText = "Gryan Stoutmantle wants you to kill 15 Defias Highwaymen, 5 Defias Pathstalkers and 5 Defias Knuckledusters then return to him on Sentinel Hill.",
    description = "Some Defias have eluded us. My most trusted scout reports that these Defias have been looting and pillaging the countryside, all the way into Southern Westfall. We believe they are hiding out in the Dagger Hills, plotting their next move. Slay the wretches in the name of The People's Militia.",
    rewards = {
        type = "choice",
        items = {
            1566,
            1480,
            12296
        }
    }
}

--------------------------------------------------
-- The Blackwood Corrupted
--------------------------------------------------

Quests[4763] = {
    name = "The Blackwood Corrupted",
    questLevel = 18,
    requiredLevel = 15,
    faction = "Alliance",
    startNPC = 3649,
    endNPC = 3649,
    objectiveText = "Fill the Empty Cleansing Bowl at the Auberdine Moonwell.",
    description = "We've learned that a source of furbolg corruption is from the satyr. They hold sway via talismans that they channel magic through. If the furbolg have a chance at salvation, we must lure out the satyr corruptor and take that talisman! Fill this bowl at our moonwell and take samples of the furbolgs' food from their northern camp. Mix them and place it near the bonfire by the river; any furbolgs who eat will be cleansed just long enough to lure out the satyr corruptor... who then you must slay!",
    rewards = {
        type = "choice",
        items = {
            15204,
            15202,
            15203
        }
    }
}

--------------------------------------------------
-- The Coastal Menace
--------------------------------------------------

Quests[104] = {
    name = "The Coastal Menace",
    questLevel = 20,
    requiredLevel = 15,
    faction = "Both",
    startNPC = 392,
    endNPC = 392,
    objectiveText = "Bring a scale of Old Murk-Eye to Captain Grayson at the Westfall Lighthouse.",
    description = "When my life was ended upon the rocks, I had no clue what the afterlife held for me. The Lighthouse was black that night because Old Murk-Eye had scared the keeper's family off. They returned and re-lit the flame but Old Murk-Eye coerced the weaker minded murlocs to raid the Lighthouse with him once again. The second time the family was not so lucky and before my eyes they perished helplessly. Slay Old Murk-Eye if you see him along the shore and bring me one of his scales and I shall reward you.",
    rewards = {
        type = "choice",
        items = {
            1172,
            1557,
            5240
        }
    }
}

--------------------------------------------------
-- Underground Assault
--------------------------------------------------

Quests[2040] = {
    name = "Underground Assault",
    questLevel = 20,
    requiredLevel = 15,
    faction = "Alliance",
    instanceID = 1581,
    startNPC = 6579,
    endNPC = 6579,
    objectiveText = "Retrieve the Gnoam Sprecklesprocket from the Deadmines and return it to Shoni the Shilent in Stormwind.",
    description = "Gnomeregan has fallen under the control of those dastardly troggs! The situation is grave but perhaps you can help, <name>. Deep in the Deadmines is a functional goblin shredder. Find that shredder and bring back the intact power supply. With the shredder's power supply, we can give our gyrodrillmatic excavationators the power they need to break through the rocky underground borders of Gnomeregan, opening the way for a gnomish assault!",
    rewards = {
        type = "choice",
        items = {
            7606,
            7607
        }
    }
}

--------------------------------------------------
-- Beren's Peril
--------------------------------------------------

Quests[516] = {
    name = "Beren's Peril",
    questLevel = 21,
    requiredLevel = 16,
    faction = "Horde",
    startNPC = 2121,
    endNPC = 2121,
    objectiveText = "Locate Beren's Peril, then kill 6 Ravenclaw Drudgers and 6 Ravenclaw Guardians, then return to Shadow Priest Allister at the Sepulcher.",
    description = "I have received reports that a group of undead are holing up to prepare for an attack against us. Armed with this information, we can turn the tables and attack them first, nipping their little plan in the bud. Unfortunately, my information is spotty, at best. They are reported to be hiding in a location known as Beren's Peril. The exact location is unknown, but it appears to be a cave in the hills, near a pocket of Dalaran wizards. I trust your resourcefulness. Find them, and put them down.",
    rewards = {
        type = "fixed",
        items = {
            5252
        }
    }
}

--------------------------------------------------
-- Deviate Eradication
--------------------------------------------------

Quests[1487] = {
    name = "Deviate Eradication",
    questLevel = 21,
    requiredLevel = 15,
    faction = "Both",
    instanceID = 43,
    startNPC = 5768,
    endNPC = 5768,
    objectiveText = "Ebru in the Wailing Caverns wants you to kill 7 Deviate Ravagers, 7 Deviate Vipers, 7 Deviate Shamblers and 7 Deviate Dreadfangs.",
    description = "Naralex had a noble goal. Our great leader aspired to enter the Emerald Dream and help regrow these harsh lands back into the lush forest it once was. But something went terribly wrong. Naralex's dream turned into a nightmare and corrupt creatures began to inhabit the caverns. While some Disciples of Naralex seek to awake our master, my concern is with ridding these caves of the evil beasts. Brave the caverns, <name>, and eradicate the deviate spawn.",
    rewards = {
        type = "choice",
        items = {
            6476,
            8071,
            6481
        }
    }
}

--------------------------------------------------
-- Retrieval for Mauren
--------------------------------------------------

Quests[1078] = {
    name = "Retrieval for Mauren",
    questLevel = 26,
    requiredLevel = 17,
    faction = "Alliance",
    startNPC = 4078,
    endNPC = 4078,
    objectiveText = "Bring 8 Crystalized Scales to Collin Mauren in Stormwind.",
    description = "Travelers keep asking me about the Stonetalon Mountains. It seems to be a popular place for adventure--it doesn't matter if you're seeking wyvern, elementals, or you have business with the Venture Co. Within the Charred Vale, deep in Stonetalon, there used to be a species of basilisks whose scales, when ground to dust, made a wonderful reagent for some spells I've created. If those basilisks still live, I would love to have a few of their scales. Take your time, it is no rush, but I can pay well.",
    rewards = {
        type = "fixed",
        items = {
            6677
        }
    }
}

--------------------------------------------------
-- Isha Awak
--------------------------------------------------

Quests[873] = {
    name = "Isha Awak",
    questLevel = 27,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3388,
    endNPC = 3388,
    objectiveText = "Bring the Heart of Isha Awak to Mahren Skyseer.",
    description = "The grand Isha Awak is lord of these waters. Great is his strength, and solemn his pride. The humans on the coast fear him, for he has consumed many of their number. But I do not fear him. I am grateful he is here. He is a worthy challenge, and honorable prey. If you are ready, then swim out and search for Isha Awak, the Deep Doom. His spirit dwells in his heart, and to hear its beat is to know your fate.",
    rewards = {
        type = "choice",
        items = {
            5356,
            5357
        }
    }
}

--------------------------------------------------
-- Ormer's Revenge
--------------------------------------------------

Quests[296] = {
    name = "Ormer's Revenge",
    questLevel = 29,
    requiredLevel = 22,
    faction = "Alliance",
    startNPC = 1078,
    endNPC = 1078,
    objectiveText = "Ormer Ironbraid at the Whelgar Excavation Site wants you to kill Sarltooth and return to him with one of his talons once the task is fulfilled.",
    description = "While you were down there I happened to notice that one of those beasts stood out from the rest. He was bigger and more menacing. I bet he's the one who led the others here to cause the disruption to the dig site. I ask of you now one final task, <name>. See to it that Sarltooth is brought to justice. And considering the gravity of his crimes, justice in this case means death! Bring me one of his talons as proof of his death.",
    rewards = {
        type = "choice",
        items = {
            3493,
            3566,
            5246
        }
    }
}

--------------------------------------------------
-- Worgen in the Woods
--------------------------------------------------

Quests[223] = {
    name = "Worgen in the Woods",
    questLevel = 31,
    requiredLevel = 23,
    faction = "Alliance",
    startNPC = 663,
    endNPC = 661,
    objectiveText = "Bring Calor's note to Jonathan Carevin.",
    description = "Here you go, <name>. Bring this message to Master Carevin. <He quickly removes a piece of faded parchment and offers it to you.> A few more like you, and we will outnumber the Night Watch! Perhaps then we could complete the work that we few carry on today.",
    rewards = {
    type = "mixed",

    guaranteed = {
        5244 -- Consecrated Wand
    },

    choice = {
        2902,
        1547
    }
}
}

--------------------------------------------------
-- Answered Questions
--------------------------------------------------

Quests[1044] = {
    name = "Answered Questions",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 661,
    endNPC = 8026,
    objectiveText = "Return to Thyn'tel Bladeweaver in Darnassus.",
    description = "We shall rein in the worgen problem, have no worry of that. This evil that your friend introduced to our woods will be contained, and I bear her no ill will for her actions. Strange events are afoot in these times, <name>, and the darkness knows no respite. I will keep you no longer. I suspect that there are others that should hear of what you have found in the mines of Duskwood.",
    rewards = {
        type = "choice",
        items = {
            5817,
            5818
        }
    }
}

--------------------------------------------------
-- Dangerous!
--------------------------------------------------

Quests[567] = {
    name = "Dangerous!",
    questLevel = 28,
    requiredLevel = 19,
    faction = "Horde",
    startNPC = {
        id = 2008,
        kind = "object",
        name = "Dangerous!",
        zone = "Alterac Mountains",
        map = {
            zone = "Alterac Mountains",
            x = 61.37,
            y = 81.37
        }
    },

    endNPC = 2215,
    objectiveText = "High Executor Darthalia of Tarren Mill is offering a bounty on Clerk Horrace Whitesteed, Citizen Wilkes, Miner Hackett and Farmer Kalaba.",
    description = "Dangerous! The following humans of Hillsbrad have been deemed dangerous and are marked for bounty by High Executor Darthalia: Clerk Horrace Whitesteed. Wanted for the murder of Deathguard Toma. Citizen Wilkes. Wanted for the murder of Apothecary Eli. Miner Hackett. Wanted for the murder of Deathstalker Fry. Farmer Kalaba. Wanted for the ambush of supplies from the Undercity. All of these enemies are hiding and will be hard to find. A reward will be granted upon notice of their death.",
    rewards = {
        type = "choice",
        items = {
            3742,
            3743,
            5250
        }
    }
}

--------------------------------------------------
-- Final Passage
--------------------------------------------------

Quests[1394] = {
    name = "Final Passage",
    questLevel = 36,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 4488,
    endNPC = 2986,
    objectiveText = "Speak to Dorn Plainstalker in Thousand Needles.",
    description = "You have done well, <name>. You have passed my test, and the tests before mine. Return to Dorn in Thousand Needles. He will sense the change within you, and see that your mind, body and spirit are strong enough that you should be rewarded for your efforts. Stay true to the balance you've shown throughout these trials, <name>. Dorn will test you again in the future if you do.",
    rewards = {
        type = "choice",
        items = {
            6804,
            6806
        }
    }
}

--------------------------------------------------
-- Claim Rackmore's Treasure!
--------------------------------------------------

Quests[6161] = {
    name = "Claim Rackmore's Treasure!",
    questLevel = 36,
    requiredLevel = 30,
    faction = "Both",
    startNPC = {
        id = 177787,
        kind = "object",
        name = "Rackmore's Log",
        zone = "Desolace",
        map = {
            zone = "Desolace",
            x = 36.0852,
            y = 30.3905
        }
    },

    endNPC = {
        id = 177787,
        kind = "object",
        name = "Rackmore's Log",
        zone = "Desolace",
        map = {
            zone = "Desolace",
            x = 36.0852,
            y = 30.3905
        }
    },

    objectiveText = "Find Rackmore's Silver Key. Find Rackmore's Golden Key. Find and open Rackmore's Chest.",
    description = "Rackmore's log tells of how his ship was sailing for Feathermoon Stronghold when it was attacked by seafaring creatures. To prevent his treasure from falling into enemy hands, he hid his chest on Ranazjar Isle. To open the chest requires two keys, a silver and a gold. These keys were lost, but if the keys and the chest are found, a treasure awaits!",
    rewards = {
        type = "fixed",
        items = {
            16788,
            16789
        }
    }
}

--------------------------------------------------
-- Wanted! Otto and Falconcrest
--------------------------------------------------

Quests[685] = {
    name = "Wanted! Otto and Falconcrest",
    questLevel = 40,
    requiredLevel = 30,
    faction = "Alliance",
    startNPC = {
        id = 2713,
        kind = "object",
        name = "Wanted Board",
        zone = "Arathi Highlands",
        map = {
            zone = "Arathi Highlands",
            x = 46.04,
            y = 47.74
        }
    },

    endNPC = 2700,
    objectiveText = "Bring Otto's Head and Falconcrest's Head to Captain Nials at Refuge Pointe.",
    description = "The Stromgarde Militia has placed bounties on the heads of Lord Falconcrest, and his bodyguard Otto. Falconcrest heads the Syndicate's efforts in the Arathi Highlands, and his death would cause a major disruption in those efforts. His bodyguard Otto, although not a strategic target, is a fierce opponent and has killed dozens of our defenders. Their bounties may be collected from Captain Nials.",
    rewards = {
        type = "choice",
        items = {
            5247,
            4745
        }
    }
}

--------------------------------------------------
-- Crushridge Warmongers
--------------------------------------------------

Quests[504] = {
    name = "Crushridge Warmongers",
    questLevel = 40,
    requiredLevel = 30,
    faction = "Alliance",
    startNPC = 2263,
    endNPC = 2263,
    objectiveText = "Slay 15 Crushridge Warmongers, then return to Marshal Redpath in Southshore.",
    description = "Now that you've had a taste of the Crushridge ogres, I want you to really bloody their noses... Go into the Ruins of Alterac and seek out the Crushridge Warmongers. I want you to cut down a good number of them - that's the only way those brutes will learn to keep their distance from Alliance territory.",
    rewards = {
        type = "choice",
        items = {
            5249,
            3763
        }
    }
}

--------------------------------------------------
-- Pearl Diving
--------------------------------------------------

Quests[705] = {
    name = "Pearl Diving",
    questLevel = 37,
    requiredLevel = 30,
    faction = "Both",
    startNPC = 2817,
    endNPC = 2817,
    objectiveText = "Bring 9 Blue Pearls to Rigglefuzz in the Badlands.",
    description = "The Badlands is a harsh place, filled with vicious predators and bold scavengers. Scary, especially for a short little goblin. To survive, I have to be tricky! I know the recipe for flash bombs. I use those to scare away wildlife. But I'm running low on one of the ingredients: crushed blue pearl powder. Get me some and I'll make it worth your efforts. Heh, and I hope you have good boots on. The Blue Pearls I need are found from clams at the Vile Reef. Yep, the Vile Reef in Stranglethorn!",
    rewards = {
        type = "choice",
        items = {
            4086,
            5248
        }
    }
}

--------------------------------------------------
-- Questioning Reethe
--------------------------------------------------

Quests[1273] = {
    name = "Questioning Reethe",
    questLevel = 37,
    requiredLevel = 30,
    faction = "Horde",
    startNPC = 4983,
    endNPC = 4926,
    objectiveText = "Go with Ogron to speak with Reethe, then return to Krog in Brackenwall Village.",
    description = "It took a long time, but I found Reethe. He hide good for a human. Ogron worried that he might be crazy after so much time in swamp. You come with me for we go get answers from him.",
    rewards = {
        type = "choice",
        items = {
            6797,
            6798
        }
    }
}

--------------------------------------------------
-- Gizelton Caravan
--------------------------------------------------

Quests[5943] = {
    name = "Gizelton Caravan",
    questLevel = 38,
    requiredLevel = 32,
    faction = "Both",
    startNPC = 11626,
    endNPC = 11596,
    objectiveText = "Escort the Gizelton Caravan through Mannoroc Coven. Talk with Smeed at Scrabblescrew's Camp for your reward.",
    description = "You look like a capable <race>. Perhaps you're looking to make some money? Cork and I started this caravan to make a bundle of money; little did we know the dangers of turning a buck! Up ahead is Mannoroc Coven... normally the demons ignore us but something has the kodos spooked this time. I'll pay you to protect the caravan past Mannoroc Coven. Once we are safely past you can receive your reward from our business associate Smeed at Scrabblescrew's Camp.",
    rewards = {
        type = "choice",
        items = {
            15691,
            15692,
            15695
        }
    }
}

--------------------------------------------------
-- Sunken Treasure
--------------------------------------------------

Quests[666] = {
    name = "Sunken Treasure",
    questLevel = 40,
    requiredLevel = 35,
    faction = "Both",
    startNPC = 2774,
    endNPC = 2774,
    objectiveText = "Doctor Draxlegauge in Faldir's Cove wants you to collect 10 Elven Gems and return the Goggles of Gem Hunting once you are done.",
    description = "The treasure has been on the sea floor so long that the gems have calcified into thick stone. But the power harnessed in these goggles will allow you to locate them easily. A little gnomish ingenuity goes a long way! So borrow the Goggles of Gem Hunting, <name>, and see if you can collect some of the lost treasure for Captain O'Breen. I'd swim down there myself but...um...well, I have important scientific business to tend to up on the safe, dry land....er, yeah.",
    rewards = {
        type = "choice",
        items = {
            4547,
            4548
        }
    }
}

--------------------------------------------------
-- Venture Company Mining
--------------------------------------------------

Quests[600] = {
    name = "Venture Company Mining",
    questLevel = 41,
    requiredLevel = 30,
    faction = "Both",
    startNPC = 2498,
    endNPC = 2498,
    objectiveText = "Bring 10 Singing Blue Crystals to Crank Fizzlebub in Booty Bay.",
    description = "The Venture Company has a string of operations through Stranglethorn which keeps hard-working goblins, like me, from making honest gold! Please, you must help me! The Venture Company is mining near the Crystalvein Mine to the north. They can't get into the mine because of all the basilisks, but they're still able to dig up Singing Crystals from the surrounding hills. Take their crystals from them, and show them they don't have the run of the jungle. And... um... bring me those crystals as proof!",
    rewards = {
        type = "choice",
        items = {
            5253,
            4128
        }
    }
}

--------------------------------------------------
-- The Morrow Stone
--------------------------------------------------

Quests[2942] = {
    name = "The Morrow Stone",
    questLevel = 50,
    requiredLevel = 42,
    faction = "Alliance",
    startNPC = {
        id = 144063,
        kind = "object",
        name = "Equinex Monolith",
        zone = "Feralas",
        map = {
            zone = "Feralas",
            x = 38.8298,
            y = 13.151
        }
    },

    endNPC = 7764,
    objectiveText = "Return the Sparkling Stone and the Stave of Equinex to Troyas Moonbreeze in Feathermoon Stronghold.",
    description = "The moment the artifact is removed from the Monolith, you feel the energy in the Stave of Equinex begin to fade.",
    rewards = {
        type = "choice",
        items = {
            9654,
            9655
        }
    }
}

--------------------------------------------------
-- Ledger from Tanaris
--------------------------------------------------

Quests[4450] = {
    name = "Ledger from Tanaris",
    questLevel = 46,
    requiredLevel = 43,
    faction = "Both",
    startNPC = {
        id = 173265,
        kind = "object",
        name = "Wooden Outhouse",
        zone = "Searing Gorge",
        map = {
            zone = "Searing Gorge",
            x = 65.57,
            y = 62.12
        }
    },

    endNPC = 5411,
    objectiveText = "Take the copy of Goodsteel's Ledger and then find the items listed in it before seeking Krinkle Goodsteel in Tanaris.",
    description = "Oh, you know what? That reminds me. You wanna finish up a little job I took up while I was in Tanaris? It's easy... Krinkle Goodsteel in Gadgetzan was lookin' for some stuff found here in Searing Gorge and a few other places. Maybe you could take a look at the list and then bring it all to him? I'll just slide his ledger under the door if you're interested. Take that, and the stuff he wants back to him after ya collected it all.",
    rewards = {
        type = "choice",
        items = {
            11860,
            11861
        }
    }
}

--------------------------------------------------
-- Dark Vessels
--------------------------------------------------

Quests[7850] = {
    name = "Dark Vessels",
    questLevel = 50,
    requiredLevel = 46,
    faction = "Horde",
    instanceID = 47,
    startNPC = 14736,
    endNPC = 14736,
    objectiveText = "Primal Torntusk at Revantusk Village in the Hinterlands wants you to recover 10 Vessels of Tainted Blood from Jintha'alor. Return to Primal Torntusk when this task is complete.",
    description = "The Vilebranch fight with supernatural ferocity. This is due to the foul magical weavings of the Vile Priestess Hexx. Throughout Jintha'alor you will find dark vessels of tainted blood. The vessels radiate the foul magic of the faceless blood God, empowering the Vilebranch and also driving them to madness. Steal those vessels and return them to me so that I may remove the taint and ultimately loosen the grip of the blood God.",
    rewards = {
        type = "fixed",
        items = {
            19118
        }
    }
}

--------------------------------------------------
-- When Smokey Sings, I Get Violent
--------------------------------------------------

Quests[6041] = {
    name = "When Smokey Sings, I Get Violent",
    questLevel = 58,
    requiredLevel = 54,
    faction = "Both",
    startNPC = 11033,
    endNPC = 11033,
    objectiveText = "Travel to Plaguewood, northwest of Light's Hope. Destroy 8 Scourge Structures by using Smokey's Special Compound at the Mark of Detonation planted inside each building. Smokey has had the Ziggurats and Slaughterhouses marked.",
    description = "While you were gathering the supplies, I had some of my people handle marking the Scourge buildings we need demolished. Here's the plan: I'm going to give you ten sticks of my special compound. You're going to take them over to Plaguewood and plant them inside the Scourge structures that I've had marked for detonation. <Smokey snaps his fingers.> Bing! It's just that easy.",
    rewards = {
        type = "choice",
        items = {
            16992,
            16993
        }
    }
}

--------------------------------------------------
-- Ormer's Revenge (1)
--------------------------------------------------

Quests[294] = {
    name = "Ormer's Revenge",
    questLevel = 24,
    requiredLevel = 22,
    faction = "Alliance",
    startNPC = 1078,
    endNPC = 1078,
    objectiveText = "Ormer Ironbraid at the Whelgar Excavation Site wants you to kill 10 Mottled Screechers and 10 Mottled Raptors.",
    description = "The situation is severe, that much is for sure. When we uncovered these bones it attracted the Raptors. These filthy beasts killed my brethren and trapped me, Merrin and the poor Prospector up here. Help clear the Wetlands of these Raptors, <name>. Mottled Raptors and Mottled Screechers are just West of the bluff there. Kill 10 of each, if you can. That will be a good start to the vengeance I have planned for them."
}

--------------------------------------------------
-- Ormer's Revenge (2)
--------------------------------------------------

Quests[295] = {
    name = "Ormer's Revenge",
    questLevel = 27,
    requiredLevel = 22,
    faction = "Alliance",
    startNPC = 1078,
    endNPC = 1078,
    objectiveText = "Ormer Ironbraid wants you to kill 10 Mottled Scytheclaw raptors and 10 Mottled Razormaw raptors then return to him at the Whelgar Excavation Site.",
    description = "Now it's time to really make those dreaded Raptors regret their blood-thirst. Just down below there are scores of Mottled Scytheclaws and Mottled Razormaws. Make those rotten creatures pay by slaying 10 of each!"
}

--------------------------------------------------
-- Worgen in the Woods (1)
--------------------------------------------------

Quests[173] = {
    name = "Worgen in the Woods",
    questLevel = 28,
    requiredLevel = 23,
    faction = "Alliance",
    startNPC = 663,
    endNPC = 663,
    objectiveText = "Kill 6 Nightbane Shadow Weaver worgen for Calor in Darkshire.",
    description = "Darkness seems drawn inexorably to Duskwood. Master Carevin's quest is the expulsion of evil and heresy. Through our efforts are the people of Darkshire kept safe. You believe yourself worthy to join us? I once thought as you. Disillusioned by the complacency of the Watch, I joined Master Carevin. If you wish to prove yourself, it will not be through words. Test your skills against the Nightbane Shadow Weaver worgen in Brightwood Grove--bright, hah!--and the Rotting Orchard."
}

--------------------------------------------------
-- Worgen in the Woods (2)
--------------------------------------------------

Quests[221] = {
    name = "Worgen in the Woods",
    questLevel = 29,
    requiredLevel = 23,
    faction = "Alliance",
    startNPC = 663,
    endNPC = 663,
    objectiveText = "Kill 12 Nightbane Dark Runner worgen for Calor in Darkshire.",
    description = "You might have noticed some larger worgen wandering around with the Shadow Weavers in the woods? From what we can tell, these Dark Runners make up the bulk of the worgen numbers. On my rangings, I've also noticed that they have overrun the Rotting Orchard southwest of town. These worgen are a bit tougher than the last you faced. Be on your guard."
}

--------------------------------------------------
-- Worgen in the Woods (3)
--------------------------------------------------

Quests[222] = {
    name = "Worgen in the Woods",
    questLevel = 31,
    requiredLevel = 23,
    faction = "Alliance",
    startNPC = 663,
    endNPC = 663,
    objectiveText = "Kill 8 Nightbane Vile Fang and 8 Nightbane Tainted One worgen for Calor in Darkshire.",
    description = "Your previous accomplishments have convinced me that you are ready to take on the toughest worgen infesting the woods. Of the worgen that have made their new home here, the Vile Fangs and the Tainted Ones have proven the most dangerous. They've settled down near some of the caves and in the mine to the south. From far away you can even see the light from their bonfires..."
}

--------------------------------------------------
-- Crushridge Bounty
--------------------------------------------------

Quests[500] = {
    name = "Crushridge Bounty",
    questLevel = 36,
    requiredLevel = 30,
    faction = "Alliance",
    startNPC = 2263,
    endNPC = 2263,
    objectiveText = "Gather 9 Dirty Knucklebones from Crushridge ogres in the Alterac Mountains. Bring them to Marshal Redpath in Southshore.",
    description = "Crushridge ogres have dug an ogre mound up in the Alterac Mountains near the ruined city of Alterac. And my scouts tell me they've taken over those ruins as well. We can't let them get cozy up there; if they think they're safe where they are, then their next step will be to move down into the foothills, which will put them right at our front door! Go north to the Alterac Mountains and hunt ogres. Bring me the Dirty Knucklebones they carry and you will earn a nice bounty."
}

--------------------------------------------------
-- Sunken Treasure (1)
--------------------------------------------------

Quests[665] = {
    name = "Sunken Treasure",
    questLevel = 40,
    requiredLevel = 35,
    faction = "Both",
    startNPC = 2768,
    endNPC = 2774,
    objectiveText = "Escort Professor Phizzlethorpe to the cave and back.",
    description = "Now that we are full-fledged Blackwater Raiders it is our job to help Mr. O'Breen locate the lost elven treasure. It is next to impossible to find the gems in the dark sea without aid. The doctor has constructed some goggles that will help. He needs the goggles charged with the energy derived from the enchanted stone in the cave just up the hill. But the cave is cursed! When we get close, we get ambushed. Defend me and I can harness the energy from the stone into the goggles."
}

--------------------------------------------------
-- Caught!
--------------------------------------------------

Quests[4449] = {
    name = "Caught!",
    questLevel = 45,
    requiredLevel = 43,
    faction = "Both",
    startNPC = {
        id = 173265,
        kind = "object",
        name = "Wooden Outhouse",
        zone = "Searing Gorge",
        map = {
            zone = "Searing Gorge",
            x = 65.57,
            y = 62.12
        }
    },

    endNPC = {
        id = 173265,
        kind = "object",
        name = "Wooden Outhouse",
        zone = "Searing Gorge",
        map = {
            zone = "Searing Gorge",
            x = 65.57,
            y = 62.12
        }
    },

    objectiveText = "Kill 8 Dark Iron Geologists and bring 15 pieces of Silk Cloth to the person locked in the outhouse in Searing Gorge.",
    description = "Hey! Hey, you! Get over here! Ya gotta help me out. I was runnin' from them Dark Iron dwarves, and I hid in here to get out of sight. Damn bastard geologists and their magic ways! They musta seen me hide, cause next thing I knew, they locked the door and stuck me in here. Teach them geologists a lesson! Oh... an' can ya get me some pieces of silk cloth for... for... nothin'."
}

--------------------------------------------------
-- That's Asking A Lot
--------------------------------------------------

Quests[6026] = {
    name = "That's Asking A Lot",
    questLevel = 58,
    requiredLevel = 54,
    faction = "Both",
    startNPC = 11033,
    endNPC = 11033,
    objectiveText = "Smokey LaRue wants you to get 2 Thorium Bars, 1 Golden Rod, 8 Hi-Explosive Bombs, and 8 Unstable Triggers.",
    description = "These here Argent Dawn people commissioned ol' Smokey to do a little demolition work for 'em. Smokey's mammy ain't raised no dummy. When gold coin is slapped on the table, Smokey's services are available. That's my motto! Now I'd be willing to split the commission with you if you're willing to do a little legwork. Here's the deal: I'm going to head over to Plaguewood and mark the buildings we need destroyed. You gather the components for the bombs. Meet back here when you've got everything. Deal?"
}

--------------------------------------------------
-- The Howling Vale
--------------------------------------------------

Quests[1022] = {
    name = "The Howling Vale",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 3880,
    endNPC = 3880,
    objectiveText = "Go to the Howling Vale and study the Tome of Mel'Thandris, then return to Sentinel Melyria Frostshadow at the Shrine of Aessina.",
    description = "Though we have put many resources and much effort into driving the remaining demons from the Felwood to the north, our successes have been few. We have been able to keep much of the demonic presence from Ashenvale. To the north, near the Felwood border, the ruined shrine of Mel'Thandris has been overtaken by mysterious wolf-men. Their chilling calls have led the area to be known as the Howling Vale. The Tome of Mel'Thandris kept at the shrine may shed some light on why these wolf-men have come."
}

--------------------------------------------------
-- Velinde Starsong
--------------------------------------------------

Quests[1037] = {
    name = "Velinde Starsong",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 3880,
    endNPC = 8026,
    objectiveText = "Speak with Thyn'tel Bladeweaver at the Warrior's Terrace in Darnassus.",
    description = "Velinde Starsong was my predecessor here in Ashenvale Forest. At first it seemed she had the situation in Felwood under control, but little by little her efforts faltered. One day, she simply disappeared. I was sent here to continue her work. I'm afraid I know nothing of the priestess, however. Perhaps Thyn'tel Bladeweaver, one of the commanders of the Sentinels, knows further details of her disappearance that I was not a party to. Surely she will understand the import of such information."
}

--------------------------------------------------
-- Velinde's Effects
--------------------------------------------------

Quests[1038] = {
    name = "Velinde's Effects",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 8026,
    endNPC = 8026,
    objectiveText = "Search through Velinde's chest for her journal, then return it along with the key to Thyn'tel Bladeweaver in Darnassus.",
    description = "The Tome of Mel'Thandris showed you this? I suppose there would be little harm in allowing you to examine her belongings. This key will allow you to open the chest where we stored her things in the Sentinels' bunkhouse. She kept a journal of her duties, if there is anything to be learned, it will be from that. I should tell you, the Sentinels believe that she had her own reasons for leaving, and expect that she could return at any time. The priestess has done much in the past to earn our trust."
}

--------------------------------------------------
-- The Barrens Port
--------------------------------------------------

Quests[1039] = {
    name = "The Barrens Port",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 8026,
    endNPC = 3453,
    objectiveText = "Speak with Wharfmaster Dizzywig in Ratchet.",
    description = "Ratchet is the only port in the Barrens. Most likely Velinde found a trading vessel in Ratchet to take her to Blackwater Cove in Azeroth. We've had limited dealings with the goblins that run the port, but the master of the dock should have information about the comings and goings of ship passengers. Follow the road southeast through Ashenvale and you will find yourself in the Barrens. Watch your step, <name>, warriors of the Horde patrol the land. You will be safe at the port, though."
}

--------------------------------------------------
-- Passage to Booty Bay
--------------------------------------------------

Quests[1040] = {
    name = "Passage to Booty Bay",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 3453,
    endNPC = 3945,
    objectiveText = "Take a boat to Booty Bay and speak with Caravaneer Ruzzgot.",
    description = "Ah yes, finally found it. Should have told me she passed through here that long ago. Let's see. Velinde. Booked passage to Booty Bay on the Black Osprey. I don't have anything here saying otherwise, so I'd assume it arrived in port safely. Not much more help I can be to you, but she asked about overland travel over on that side of the world, and I mentioned Ruzzgot, a caravan driver based out of Booty Bay. Might be that this Velinde traveled with him. Move along, now. I haven't all day for you."
}

--------------------------------------------------
-- The Caravan Road
--------------------------------------------------

Quests[1041] = {
    name = "The Caravan Road",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 3945,
    endNPC = 267,
    objectiveText = "Speak with Clerk Daltry in Darkshire.",
    description = "Turns out I was wrong about you, and that isn't something that happens everyday. It just so happens that I remember this Velinde you're looking for. Isn't every day that a night elf priestess that wants to travel with a dirty old--but great for your shipping needs!--caravan like my own. We split up on the way north, she was headed for Darkshire. The clerk there keeps all sorts of records. Might know something useful. Be careful in the jungle, it is a deadly place even at the best of times."
}

--------------------------------------------------
-- The Carevin Family
--------------------------------------------------

Quests[1042] = {
    name = "The Carevin Family",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 267,
    endNPC = 661,
    objectiveText = "Speak with Jonathan Carevin in Darkshire.",
    description = "No, I don't have any records of a Velinde Starsong staying in Darkshire... though, if you don't mind me saying, I can hardly imagine a night elf priestess taking a room in the inn, if you get my meaning? These wolf-men you mentioned though, that's something I've heard about. Just the other day, Calor came into town with a string of their heads. He works with the Carevin family. Hunters of demons, undead, and other monstrosities. Speak with Jonathan, he's the head of the household."
}

--------------------------------------------------
-- The Scythe of Elune
--------------------------------------------------

Quests[1043] = {
    name = "The Scythe of Elune",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Alliance",
    startNPC = 661,
    endNPC = 661,
    objectiveText = "Look for signs of the Scythe of Elune then return to Jonathan Carevin in Darkshire.",
    description = "Your story rings true... I do not entirely understand your motives, but if your business here in Duskwood involves ridding the forest of worgen in any number, then I can forgo understanding for results. There is a mine to the south that has been overrun with worgen... They appeared out of nowhere, but from what we know, that is where they first were found. Go about your business, but I would ask that if you find anything of import, you share it with me. We will accept any aid in our war against evil."
}

--------------------------------------------------
-- In Search of Knowledge
--------------------------------------------------

Quests[2939] = {
    name = "In Search of Knowledge",
    questLevel = 47,
    requiredLevel = 42,
    faction = "Alliance",
    startNPC = 7764,
    endNPC = 7907,
    objectiveText = "Talk to Daryn Lightwind in Rut'theran Village.",
    description = "While the ruins of Feralas can be quite dangerous, they have much to tell of what has happened here. Searching through the rubble to the south a few days ago, I discovered what appears to be a normal stave. However, I just can't shake the feeling that there is something more to it. Angelas and I have been poring over our books here, but we can't find a thing about it. I have a colleague in Darnassus that may be able to tell us what this is, <name>. Why don't you go talk to her and see if she can help us?"
}

--------------------------------------------------
-- Feralas: A History
--------------------------------------------------

Quests[2940] = {
    name = "Feralas: A History",
    questLevel = 47,
    requiredLevel = 42,
    faction = "Alliance",
    startNPC = {
        id = 142958,
        kind = "object",
        name = "Feralas: A History",
        zone = "Teldrassil",
        map = {
            zone = "Teldrassil",
            x = 55.239,
            y = 91.4697
        }
    },

    endNPC = 7907,
    objectiveText = "Ask Daryn Lightwind if you may borrow her book.",
    description = "This book looks as if no one has opened it for quite a long time. Its covers are quite worn, and its pages yellowed, but after examining it, you notice that it might be just what Troyas is looking for. You pick it up, but realize you should probably ask before borrowing it."
}

--------------------------------------------------
-- The Borrower
--------------------------------------------------

Quests[2941] = {
    name = "The Borrower",
    questLevel = 48,
    requiredLevel = 42,
    faction = "Alliance",
    startNPC = 7907,
    endNPC = 7763,
    objectiveText = "Take the letter to Curgle Cranklehop in Tanaris.",
    description = "I have studied many subjects in my time, and my latest fascination is with the snapjaw that occupy the beach in the Hinterlands. There's one in particular I'd like to see, a giant snapjaw named Gammerita. I'd like to go myself, but my research keeps me here. I think a picture of her would be the next best thing. Take this letter to Curgle Cranklehop in Tanaris. She has created an invention for me that can capture a picture. She called it a \"snapshot,\" I think..."
}

--------------------------------------------------
-- The Super Snapper FX
--------------------------------------------------

Quests[2944] = {
    name = "The Super Snapper FX",
    questLevel = 48,
    requiredLevel = 42,
    faction = "Alliance",
    startNPC = 7763,
    endNPC = 7907,
    objectiveText = "Use the Super Snapper FX to take a snapshot of Gammerita, then return to Daryn Lightwind in Rut'theran Village.",
    description = "Have the first look at my new invention, <name>. All you need to do is target whatever it is you'd like to take a picture of, and push the button. What was that creature from the Hinterlands that you mentioned? Gammerita? Well, good luck finding her. I'm sure Daryn will be quite pleased with the snapshot you return to her. In any case, here's the Super Snapper. Have fun!"
}

--------------------------------------------------
-- Return to Troyas
--------------------------------------------------

Quests[2943] = {
    name = "Return to Troyas",
    questLevel = 48,
    requiredLevel = 42,
    faction = "Alliance",
    startNPC = 7907,
    endNPC = 7764,
    objectiveText = "Deliver the book to Troyas Moonbreeze in Feathermoon Stronghold.",
    description = "Here it is, <name>. Please, take care of my book. Now, hurry along. I'm sure Troyas is eager for your return."
}

--------------------------------------------------
-- The Stave of Equinex
--------------------------------------------------

Quests[2879] = {
    name = "The Stave of Equinex",
    questLevel = 50,
    requiredLevel = 42,
    faction = "Alliance",
    startNPC = 7764,
    endNPC = {
        id = 144063,
        kind = "object",
        name = "Equinex Monolith",
        zone = "Feralas",
        map = {
            zone = "Feralas",
            x = 38.8298,
            y = 13.151
        }
    },

    objectiveText = "Energize Troyas' Stave and find the Equinex Monolith.",
    description = "This stave might be the Stave of Equinex! The Stave of Equinex is actually a key, used to unlock the Equinex Monolith in the Ruins of Ravenwind, on the mainland west of the Dream Bough. Find the four flames that still burn in those ruins: Samha, Imbel, Byltan, and Lahassa. Retrieve their essence and then while standing by the Equinex Monolith, use the essences to energize the stave. If this is truly is the Stave of Equinex, you will be able to unlock the Monolith and gather a sacred artifact from it.",
    rewards = {
        type = "fixed",
        items = {
            9307
        }
    }
}

--------------------------------------------------
-- The People's Militia (1)
--------------------------------------------------

Quests[12] = {
    name = "The People's Militia",
    questLevel = 12,
    requiredLevel = 9,
    faction = "Alliance",
    startNPC = 234,
    endNPC = 234,
    objectiveText = "Gryan Stoutmantle wants you to kill 15 Defias Trappers and 15 Defias Smugglers then return to him on Sentinel Hill.",
    description = "The People's Militia has but one goal: To defend the lands of Westfall and return peace to our surroundings. Unfortunately, the price of peace is often blood. One of my scouts has brought word of a band of Defias Trappers wreaking havoc nearby. I have reports of Defias Trapper sightings near the Jangolode Mine to the Northwest as well as at the Molsen Farm and Furlbrow's Pumpkin Farm. If you seek to join our ranks, slay 15 Defias Trappers and 15 Defias Smugglers then return to me."
}

--------------------------------------------------
-- The People's Militia (2)
--------------------------------------------------

Quests[13] = {
    name = "The People's Militia",
    questLevel = 14,
    requiredLevel = 9,
    faction = "Alliance",
    startNPC = 234,
    endNPC = 234,
    objectiveText = "Gryan Stoutmantle wants you to kill 15 Defias Pillagers and 15 Defias Looters and return to him on Sentinel Hill.",
    description = "A band of vicious Defias Pillagers has been seen plundering the Gold Coast Quarry, Moonbrook and the Alexston Farmstead. The People's Militia will not stand for such behavior. Dispatch immediately, <name>, and make the Light's presence known in Westfall. The Gold Coast Quarry is near the shore, to the West of the tower. As the next step of your training, I want you to kill 15 of those foul Defias Pillagers and 15 Defias Looters."
}

--------------------------------------------------
-- How Big a Threat?
--------------------------------------------------

Quests[984] = {
    name = "How Big a Threat?",
    questLevel = 14,
    requiredLevel = 10,
    faction = "Alliance",
    startNPC = 3693,
    endNPC = 3693,
    objectiveText = "Find a corrupt furbolg camp in Darkshore and return to Terenthis in Auberdine.",
    description = "Some of my brethren were rescued from a corrupt furbolg in Teldrassil, and I've vowed to stop any more atrocities before more of our kind are injured... or worse. I have seen a couple hints of corruption in Darkshore already, but I have yet to find any widespread signs. I think it would be logical if the investigation continued with the furbolgs. Would you find one of their camps, and return to me if you see any signs of corruption?"
}

--------------------------------------------------
-- Thundris Windweaver
--------------------------------------------------

Quests[4761] = {
    name = "Thundris Windweaver",
    questLevel = 15,
    requiredLevel = 11,
    faction = "Alliance",
    startNPC = 3693,
    endNPC = 3649,
    objectiveText = "Speak with Thundris Windweaver in Auberdine.",
    description = "Your scouting of the furbolg camp is information that Thundris Windweaver should be made aware of. He graciously serves as the elder of Auberdine, offering sage and just stewardship of the day to day affairs of the village. Please - share with him your findings to date on the furbolg situation. I believe he has some ideas of his own on the reasons behind their corruption. Perhaps you can work with him to enact a plan to restore the balance of nature here!"
}

--------------------------------------------------
-- The Cliffspring River
--------------------------------------------------

Quests[4762] = {
    name = "The Cliffspring River",
    questLevel = 15,
    requiredLevel = 11,
    faction = "Alliance",
    startNPC = 3649,
    endNPC = 3649,
    objectiveText = "Travel north of Auberdine to the first waterfall along the Cliffspring River and draw a sample from the pool there.",
    description = "The Cliffspring River has begun turning foul and corrupted. It empties into the Mist's Edge, and I fear the wash will affect Auberdine soon. I suspect the Blackwood furbolgs up-river are the cause of the taint, but I also suspect that they aren't the true root of it. Take this sampling tube and go to the mouth of the river to our north. Proceed inland to the first waterfall and draw a sample from the pool there. You'll see a bridge overhead. Once you have a sample, return to me in Auberdine."
}

--------------------------------------------------
-- Speak with Shoni
--------------------------------------------------

Quests[2041] = {
    name = "Speak with Shoni",
    questLevel = 15,
    requiredLevel = 15,
    faction = "Alliance",
    startNPC = 6569,
    endNPC = 6579,
    objectiveText = "Speak with Shoni the Shilent in Stormwind.",
    description = "Perhaps... Perhaps you can help us in the battle for Gnomeregan. In Stormwind you will find the commander of our underground assault crew, Shoni the Shilent. Shoni needs assistance with her gyrodrillmatic excavationators. You will probably find her amongst the dwarves in Stormwind. Good luck, <name>."
}

--------------------------------------------------
-- Branding Rod - Sergra Darkthorn chain
--------------------------------------------------

Quests[860] = {
    name = "Sergra Darkthorn",
    questLevel = 10,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3441,
    endNPC = 3338,
    objectiveText = "Speak with Sergra Darkthorn at the Crossroads.",
    description = "Speak with Sergra Darkthorn at the Crossroads."
}

Quests[844] = {
    name = "Plainstrider Menace",
    questLevel = 12,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3338,
    endNPC = 3338,
    objectiveText = "Collect 7 Plainstrider Beaks and return them to Sergra Darkthorn in the Crossroads.",
    description = "Collect 7 Plainstrider Beaks and return them to Sergra Darkthorn in the Crossroads.",
    objectives = {
        {
            type = "item",
            itemID = 5087,
            amount = 5
        }
    }
}

Quests[845] = {
    name = "The Zhevra",
    questLevel = 13,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3338,
    endNPC = 3338,
    objectiveText = "Slay Zhevra Runners to collect 4 Zhevra Hooves for Sergra Darkthorn in the Crossroads.",
    description = "Slay Zhevra Runners to collect 4 Zhevra Hooves for Sergra Darkthorn in the Crossroads.",
    objectives = {
        {
            type = "item",
            itemID = 5086,
            amount = 5
        }
    }
}

Quests[903] = {
    name = "Prowlers of the Barrens",
    questLevel = 15,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3338,
    endNPC = 3338,
    objectiveText = "Collect 7 Prowler Claws from Savannah Prowlers for Sergra Darkthorn in the Crossroads.",
    description = "Collect 7 Prowler Claws from Savannah Prowlers for Sergra Darkthorn in the Crossroads.",
    objectives = {
        {
            type = "item",
            itemID = 5096,
            amount = 7
        }
    }
}

Quests[881] = {
    name = "Echeyakee",
    questLevel = 16,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3338,
    endNPC = 3338,
    objectiveText = "Bring Echeyakee's Hide to Sergra Darkthorn at the Crossroads.",
    description = "Bring Echeyakee's Hide to Sergra Darkthorn at the Crossroads.",
    objectives = {
        {
            type = "item",
            itemID = 5100,
            amount = 1
        }
    }
}

Quests[905] = {
    name = "The Angry Scytheclaws",
    questLevel = 17,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3338,
    endNPC = 3338,
    objectiveText = "Kill Sunscale raptors and collect their feathers. Use the feathers on the 3 Scytheclaw nests. Return to Sergra Darkthorn in the Crossroads.",
    description = "Kill Sunscale raptors and collect their feathers. Use the feathers on the 3 Scytheclaw nests. Return to Sergra Darkthorn in the Crossroads."
}

Quests[3261] = {
    name = "Jorn Skyseer",
    questLevel = 18,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3338,
    endNPC = 3387,
    objectiveText = "Speak with Jorn Skyseer at Camp Taurajo.",
    description = "Speak with Jorn Skyseer at Camp Taurajo."
}

Quests[882] = {
    name = "Ishamuhale",
    questLevel = 19,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3387,
    endNPC = 3387,
    objectiveText = "Bring Ishamuhale's Fang to Jorn at Camp Taurajo.",
    description = "Bring Ishamuhale's Fang to Jorn at Camp Taurajo.",
    objectives = {
        {
            type = "item",
            itemID = 5101,
            amount = 1
        }
    }
}

Quests[907] = {
    name = "Enraged Thunder Lizards",
    questLevel = 18,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3387,
    endNPC = 3387,
    objectiveText = "Bring 3 Thunder Lizard Blood to Jorn Skyseer at Camp Taurajo.",
    description = "Bring 3 Thunder Lizard Blood to Jorn Skyseer at Camp Taurajo.",
    objectives = {
        {
            type = "item",
            itemID = 5143,
            amount = 3
        }
    }
}

Quests[913] = {
    name = "Cry of the Thunderhawk",
    questLevel = 20,
    requiredLevel = 10,
    faction = "Horde",
    startNPC = 3387,
    endNPC = 3387,
    objectiveText = "Find and slay a Thunderhawk, return its wings to Jorn Skyseer at Camp Taurajo.",
    description = "Find and slay a Thunderhawk, return its wings to Jorn Skyseer at Camp Taurajo.",
    objectives = {
        {
            type = "item",
            itemID = 5164,
            amount = 1
        }
    },
    rewards = {
        type = "choice",
        items = {
            5302,
            5299,
            5306
        }
    }
}

Quests[874] = {
    name = "Mahren Skyseer",
    questLevel = 27,
    requiredLevel = 9,
    faction = "Horde",
    startNPC = 3387,
    endNPC = 3388,
    objectiveText = "Speak with Mahren Skyseer.",
    description = "Speak with Mahren Skyseer."
}

--------------------------------------------------
-- Dancing Flame - Test of Faith chain
--------------------------------------------------

Quests[1149] = {
    name = "Test of Faith",
    questLevel = 26,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 2986,
    endNPC = 2986,
    objectiveText = "If you have faith, leap from the planks overlooking Thousand Needles.",
    description = "If you have faith, leap from the planks overlooking Thousand Needles."
}

Quests[1150] = {
    name = "Test of Endurance",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 2986,
    endNPC = 2986,
    objectiveText = "Bring Grenka's Claw to Dorn Plainstalker in Thousand Needles.",
    description = "Bring Grenka's Claw to Dorn Plainstalker in Thousand Needles.",
    objectives = {
        {
            type = "item",
            itemID = 5843,
            amount = 1
        }
    }
}

Quests[1151] = {
    name = "Test of Strength",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 2986,
    endNPC = 2986,
    objectiveText = "Bring Fragments of Rok'Alim to Dorn Plainstalker in Thousand Needles.",
    description = "Bring Fragments of Rok'Alim to Dorn Plainstalker in Thousand Needles.",
    objectives = {
        {
            type = "item",
            itemID = 5844,
            amount = 1
        }
    }
}

Quests[1152] = {
    name = "Test of Lore",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 2986,
    endNPC = 4489,
    objectiveText = "Find Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains.",
    description = "Find Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains."
}

Quests[1154] = {
    name = "Test of Lore",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 4489,
    endNPC = 4489,
    objectiveText = "Find the Legacy of the Aspects and return it to Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains.",
    description = "Find the Legacy of the Aspects and return it to Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains.",
    objectives = {
        {
            type = "item",
            itemID = 5860,
            amount = 1
        }
    }
}

Quests[6627] = {
    name = "Test of Lore",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 4489,
    endNPC = 4489,
    objectiveText = "Answer Braug Dimspirit's question successfully and then speak to him again. He will remain in Stonetalon Mountains when you are ready.",
    description = "Answer Braug Dimspirit's question successfully and then speak to him again. He will remain in Stonetalon Mountains when you are ready."
}

Quests[1159] = {
    name = "Test of Lore",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 4489,
    endNPC = 4488,

    objectiveText = "Find Parqual Fintallas in Undercity.",
    description = "Find Parqual Fintallas in Undercity."
}

Quests[1160] = {
    name = "Test of Lore",
    questLevel = 36,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 4488,
    endNPC = 4488,

    objectiveText = "Find The Beginnings of the Undead Threat, and return it to Parqual Fintallas in Undercity.",
    description = "Find The Beginnings of the Undead Threat, and return it to Parqual Fintallas in Undercity.",

    objectives = {
        {
            type = "item",
            itemID = 5861,
            amount = 1
        }
    }
}

Quests[6628] = {
    name = "Test of Lore",
    questLevel = 30,
    requiredLevel = 25,
    faction = "Horde",
    startNPC = 4488,
    endNPC = 4488,
    objectiveText = "Answer Parqual Fintallas' question successfully and then speak to him again. He will remain in the Undercity until you are ready.",
    description = "Answer Parqual Fintallas' question successfully and then speak to him again. He will remain in the Undercity until you are ready."
}


--------------------------------------------------
-- Eyepoker - Lieutenant Paval Reethe chain
--------------------------------------------------

Quests[1269] = {
    name = "Lieutenant Paval Reethe",
    questLevel = 37,
    requiredLevel = 30,
    faction = "Horde",
    startNPC = {
        id = 21042,
        kind = "object",
        name = "Theramore Guard Badge",
        zone = "Dustwallow Marsh",
        map = {
            zone = "Dustwallow Marsh",
            x = 29.8,
            y = 48.2
        }
    },
    endNPC = 4926,

    objectiveText = "Bring Reethe's Badge to Krog in Brackenwall Village.",
    description = "Bring Reethe's Badge to Krog in Brackenwall Village.",

    objectives = {
        {
            type = "item",
            itemID = 5950,
            amount = 1
        }
    }
}
Quests[99] = { 
    name = "Arugal's Folly", 
    questLevel = 15, 
    requiredLevel = 9, 
    faction = "Horde", 
    description = "As my understanding of Arugal's magic grows so does my disdain for the hapless fool. I am close to completing my research on his so called remedy. My knowledge will be complete when I learn what enchantment is causing the strange behavior going on in Pyrewood Village. By day, the peasants appear to be Human. But when the sun goes down the townsfolk turn into Moonrage Worgen. I need to draw energy from the enchanted shackles Arugal cast on them. Bring to me six enchanted Pyrewood Shackles, <name>.", 
    objectiveText = "Bring 6 Pyrewood Shackles to Dalar Dawnweaver at the Sepulcher.", 
    startNPC = 1938, 
    endNPC = 1938, 
    rewards = { 
        type = "choice", 
        items = { 
            3586, 
            3570, 
            5242 
        } 
    } 
}

Quests[297] = { 
    name = "Gathering Idols", 
    questLevel = 18, 
    requiredLevel = 13, 
    faction = "Alliance", 
    description = "Recently, just before the Troggs surfaced within the site, we had uncovered a large number of strange, carved idols. But we didn't have the chance to study them, for soon after their discovery the Troggs chased us away from the ruins! And those idols have a strange effect on the Troggs. It makes them go berserk! Bring me 8 idols - I want to study them, and I want them out of Trogg hands! You can find the idols on the Troggs infesting the site.", 
    objectiveText = "Bring Magmar Fellhew 8 Carved Stone Idols.", 
    startNPC = 1345, 
    endNPC = 1345, 
    rewards = { 
        type = "choice", 
        items = { 
            5241, 
            6186, 
            3154 
        } 
    } 
}

Quests[376] = { 
    name = "The Damned", 
    questLevel = 2, 
    requiredLevel = 2, 
    faction = "Horde", 
    description = "My duties include tending to our wounded warriors, tailoring armor and clothes, and assisting Shadow Priest Sarvis with whatever else he might need. From the look of it, you'll be enlisted in his service also... hunting the Mindless Ones, if I know his mind. Well, if you'd like to stay in one piece--and I've no doubt you do--perhaps I can help. I'm running out of paws and wings, and if you bring me some, I'll find some armor for you. You'll find a good number of wolves and bats to the south.", 
        objectiveText = "Novice Elreth requires 6 Scavenger Paws and 6 Duskbat Wings.", 
        startNPC = 1661, 
        endNPC = 1661, 
        rewards = { 
            type = "choice", 
            items = { 
                6060, 
                2173 
            } 
        } 
    }

Quests[421] = { 
    name = "Prove Your Worth", 
    questLevel = 10, 
    requiredLevel = 9, 
    faction = "Horde", 
    description = "Lady Sylvanas has charged Varimathras with the conquering of the human and dwarven lands to the south. But that fool, Arugal -- charlatan of Dalaran and now cursed beast of Shadowfang Keep -- let his reckless magic wreak havoc with the strategic stronghold of Silverpine Forest. I need someone skilled in the ways of combat to help clean up Arugal's mess. Prove yourself to me by killing 5 Moonrage Whitescalps. The wretched beasts can often be found just off the road, down the hill below.", 
    objectiveText = "Dalar Dawnweaver at the Sepulcher wants you to kill 5 Moonrage Whitescalps.", 
    startNPC = 1938, 
    endNPC = 1938 
}

Quests[422] = { 
    name = "Arugal's Folly", 
    questLevel = 11, 
    requiredLevel = 9, 
    faction = "Horde", 
    description = "How Arugal gained acceptance within the Kirin Tor is beyond me. His spell-casting knowledge seemed as transparent as a blown glass bauble. What's important now is learning exactly what magic Arugal used so that I can turn it against him and secure Silverpine Forest for the Dark Lady. Arugal first stayed at the wheat farm just north of the bridge. One of the Deathstalkers reported seeing some spellbooks but could not secure them. Retrieve for me the spell labeled Remedy of Arugal from those books.", 
    objectiveText = "Retrieve the Remedy of Arugal for Dalar Dawnweaver at the Sepulcher.", 
    startNPC = 1938, 
    endNPC = 1938 
}

Quests[423] = { 
    name = "Arugal's Folly", 
    questLevel = 14, 
    requiredLevel = 9, 
    faction = "Horde", 
    description = "After examining Arugal's work my worst suspicions were confirmed. The old hack was not qualified to clean chamber pots in Dalaran let alone represent the Kirin Tor in its most dire hour. Fools! Arugal used enchanted items to reinforce his weak magic. I need to examine these items first hand. Travel forth and slay Moonrage Gluttons and Moonrage Darksouls until you have collected enough of their enchanted shackles for my research. The foul creatures have been seen to the north and east.", 
    objectiveText = "Bring 6 Glutton Shackles and 3 Darksoul Shackles to Dalar Dawnweaver at the Sepulcher.", 
    startNPC = 1938, 
    endNPC = 1938 
}

Quests[424] = { 
    name = "Arugal's Folly", 
    questLevel = 15, 
    requiredLevel = 9, 
    faction = "Horde", 
    description = "It will indeed take me longer than I had thought to uncover the dark secrets behind the enchantments Arugal was using. But in the meantime I need you to take care of a slight problem our Darkstalkers have discovered. It seems that Arugal let his magic spread to the Deep Elem Mine in the hills to the southeast. The mine would prove to be quite a resource for Varimathras's advance. I want you to behead the tainted foreman of the mine, Grimson the Pale. With his death, the mine shall be ours.", 
    objectiveText = "Kill Grimson the Pale and bring his head to Dalar Dawnweaver at the Sepulcher.", 
    startNPC = 1938, 
    endNPC = 1938 
}

Quests[436] = { 
    name = "Ironband's Excavation", 
    questLevel = 18, 
    requiredLevel = 13, 
    faction = "Alliance", 
    description = "Prospector Ironband is heading an excavation of ancient ruins east of the lake. His progress has been slow lately, especially considering all the supplies we've sent him. Ironband's a stout, honest dwarf who values results, which has me worried that forces are at work against him. Go to Ironband's Excavation and speak with Magmar Fellhew. He manages the details of the site and will know why there's a slowdown. To get to the excavation site, go around the southern tip of the lake, then head east.", 
        objectiveText = "Speak with Explorer Fellhew.", 
        startNPC = 1105, 
        endNPC = 1345 
}

Quests[544] = { 
    name = "Prison Break In", 
    questLevel = 34, 
    requiredLevel = 30, 
    faction = "Horde", 
    description = "I came to Tarren Mill to research, but now must resolve a crisis. You see, four Forsaken fled the Undercity a few months ago. They turned their backs on their brethren, but what's worse...they stole from the Dark Lady. These thieves broke into a secure vault and stole four artifacts, items our apothecaries required in certain studies. Sylvanas would have these artifacts returned. The thieves fled the Undercity to Dalaran, and those wizards quarantined them in the Lordamere Internment Camp.", 
    objectiveText = "Find the traitors and recover their artifacts, then return to Magus Voidglare in Tarren Mill.", 
        startNPC = 2410, 
        endNPC = 2410 
}

Quests[545] = { 
    name = "Dalaran Patrols", 
    questLevel = 35, 
    requiredLevel = 30, 
    faction = "Horde", 
    description = "The wizards of Dalaran constructed a vast, magical dome around the heart of their city. Some believe it was for protection from the violence of these times, while others say they merely wanted solitude, to study and plot. I don't care what the reason was. I do care that the ruined outskirts of their city, outside the dome, may hide valuable magical treasures. But the area is patrolled by the wizards and their elemental slaves. So hunt them, and return when their numbers are sufficiently reduced.", 
        objectiveText = "Kill 6 Dalaran Summoners and 12 Elemental Slaves, then return to Magus Voidglare in Tarren Mill.", 
            startNPC = 2410, 
            endNPC = 2410 
}

Quests[605] = { 
    name = "Singing Blue Shards", 
    questLevel = 35, 
    requiredLevel = 30, 
    faction = "Both", 
    description = "The Singing Crystals are unique to Stranglethorn, and are very valuable to certain parties. I can move those crystals, but the cursed Venture Company makes it hard for an honest entrepreneur like myself to gather any! I'd like to hire you. The basilisks in Stranglethorn eat the crystal. This gives them their hardened skin, and sometimes decent quality crystal can be harvested from it. You can get it from any basilisk, but the less nasty ones are along the shores south of Zul'Kunda, to the north.", 
    objectiveText = "Bring 10 Singing Crystal Shards to Crank Fizzlebub.", 
    startNPC = 2498, 
    endNPC = 2498 
}
Quests[668] = { 
    name = "Sunken Treasure", 
    questLevel = 40, 
    requiredLevel = 35, 
    faction = "Both", 
    description = "Let's not leave Captain O'Breen waiting. He'll want to see these gems first hand. After all, that's why we're here! And after a few weeks of consorting with these pirates, the professor and I have realized the last thing that's good for our health is to be caught hanging on to their treasure. Here, <name>, take these to O'Breen.", 
    objectiveText = "Take the Elven Gems to Captain O'Breen.", 
    startNPC = 2774, 
    endNPC = 2610 
}

Quests[669] = { 
    name = "Sunken Treasure", 
    questLevel = 40, 
    requiredLevel = 35, 
    faction = "Both", 
    description = "Fleet Master Seahorn will want to hear about our find at once. But as you can see, we're not in much of a position to get out of here. Not only is the tide too low, but those damned creatures we disrupted are keeping a close eye on our movements. You can be of great service to the Blackwater Raiders if you can get word to Fleet Master Seahorn in Booty Bay that we discovered the treasure and are working on extracting more. Take him this sample as proof.", 
    objectiveText = "Take the Sample Elven Gem to Fleet Master Seahorn in Booty Bay.", 
    startNPC = 2610, 
    endNPC = 2487 
}

Quests[670] = { 
    name = "Sunken Treasure", 
    questLevel = 40, 
    requiredLevel = 35, 
    faction = "Both", 
    description = "Say, <name>, you seem to be an adventurous type. My fleet is stuck in Booty Bay until we can restock. There are some heavy things brewing here and abroad and I need to get some top secret correspondence to Shakes O'Breen who is tied up off the Arathi coast. Can I trust you to deliver this message safely and in confidence?", 
    objectiveText = "Deliver Seahorn's Letter to Shakes O'Breen in Arathi Highlands.", 
    startNPC = 2487, 
    endNPC = 2610 
}

Quests[861] = { 
    name = "The Hunter's Way", 
    questLevel = 10, 
    requiredLevel = 10, 
    faction = "Horde", 
    description = "You are eager to explore, I can tell. I too had the lust to wander, once... Wander, and hunt. For hunting is a Tauren's greatest honor. If you truly wish to follow the ways of the hunter, then Melor Stonehoof can show you the path. He is in Thunder Bluff, on the Hunter's Rise. And to show him your skill and resolve, bring him the claws of the flatland prowlers of Mulgore. They are tough and cunning -- fitting prey for a young <class> on the hunter's path.", 
        objectiveText = "Bring 4 Flatland Prowler Claws to Melor Stonehoof in Thunder Bluff.", 
        startNPC = 3052, 
        endNPC = 3441 
}

Quests[954] = { 
    name = "Bashal'Aran", 
    questLevel = 12, 
    requiredLevel = 7, 
    faction = "Alliance", 
    description = "The ruins of Bashal'Aran to the east are overrun with demonic minions. The sprites and satyrs that have taken up residence in the area feed upon the magical energies of the area, their powers growing from continued exposure. Even with that, I have noticed that there is one shrine they will not approach. On the western side of the ruins, atop a small bluff, a strange blue aura permeates... There must be an explanation to the demons' reluctance. I would like you to investigate it.", 
    objectiveText = "Find the source of the strange blue aura in the ruins of Bashal'Aran.", 
    startNPC = 3649, 
    endNPC = 3650 
}

Quests[955] = { 
    name = "Bashal'Aran", 
    questLevel = 12, 
    requiredLevel = 7, 
    faction = "Alliance", 
    description = "If I were to relate the story of my life, I have no doubt it would surpass the limits of your patience. Let us say that mine has been a long and painful life, and this spectral form is perhaps the worst torment of all. I am held here by the means of magic. Though my words may seem disingenuous, I assure you I would be grateful beyond words if you would help me find the means of my imprisonment. A seal binds me, and by examining the earpieces of the sprites and grells, I may find a trace of it.", 
    objectiveText = "Acquire 8 Grell Earrings for Asterion in Bashal'Aran.", 
    startNPC = 3650, 
    endNPC = 3650 
}

Quests[956] = { 
    name = "Bashal'Aran", 
    questLevel = 13, 
    requiredLevel = 7, 
    faction = "Alliance", 
    description = "If the grells have come into close contact with the seal that binds my eternal prison, I suspect I know the cause. No doubt the seal has come into the possession of the satyr that lead them. I feel strongly that this must be true, <name>. One of the satyr must surely possess it. If you can obtain it, you would bring me so close to passing the bars of my prison that tears would come to my eyes.", 
    objectiveText = "Obtain the Ancient Moonstone Seal and bring it to Asterion in Bashal'Aran.", 
    startNPC = 3650, 
    endNPC = 3650 
}

Quests[957] = { 
    name = "Bashal'Aran", 
    questLevel = 13, 
    requiredLevel = 7, 
    faction = "Alliance", 
    description = "It was the craft of one of the most powerful of the Highborne that created the seal that formed my prison. In Ameth'Aran, the ruins to the south that are twin to these, persists even today an ancient flame, blue in color. In this flame this seal could be destroyed. Be wary in the ruins, <name>...", 
    objectiveText = "Destroy the Ancient Moonstone Seal at the ancient flame in Ameth'Aran, then return to Asterion in Bashal'Aran.", 
        startNPC = 3650, 
        endNPC = 3650, 
        rewards = { 
            type = "choice", 
            items = { 
                7229, 
                5617, 
                5604 
            } 
        } 
}

Quests[985] = { 
    name = "How Big a Threat?", 
    questLevel = 14, 
    requiredLevel = 10, 
    faction = "Alliance", 
    description = "You've already proven adept at scouting our enemy, <name>. Do you have what it takes to fight them as well? Not all adventurers prefer straightforward combat to the art of stealth and evasion. If you think you're up for the task, then the furbolg camp south of Auberdine is currently the biggest threat to our people. You'll find some of the Blackwood tribe there. Kill 8 pathfinders and 5 windtalkers, and return to me here.", 
        objectiveText = "Kill 8 Blackwood Pathfinders and 5 Windtalkers and return to Terenthis in Auberdine.", 
        startNPC = 3693, 
        endNPC = 3693 
}

Quests[1104] = { 
    name = "Salt Flat Venom", 
    questLevel = 30, 
    requiredLevel = 28, 
    faction = "Both", 
    description = "I have so many designs for our rocket car! So many! And I must try them all!! I'm working on a new type of fuel. One that burns really really really hot!! I haven't gotten the mixture perfect, but I think I know what I need... The scorpids who wander the Shimmering Flats have a venom with lots and lots of salt in it. It's very unique! And it's just what I need! Bring me venom and trust me -- our car will fly!!", 
    objectiveText = "Bring 6 Salty Scorpid Venoms to Fizzle Brassbolts in the Shimmering Flats.", 
    startNPC = 4454, 
    endNPC = 4454 
}

Quests[1106] = { 
    name = "Martek the Exiled", 
    questLevel = 35, 
    requiredLevel = 26, 
    faction = "Both", 
    description = "I'm developing a new engine that'll make the car go so fast! Fast enough to fly, I know it! I just need to make pistons that can handle very very heavy stress. All my trials have failed because I can't make pistons hard enough! But there is someone who might know how. His name is Martek the Exiled. He is a great smith and knows more about metal than anyone. Take him this letter, I know he can help! But he's far far away -- in Azeroth, in the Badlands, in a camp, with a goblin! Find him!", 
    objectiveText = "Bring Fizzle's Letter to Martek the Exiled in the Badlands.", 
    startNPC = 4454, endNPC = 4618 
}

Quests[1108] = { 
    name = "Indurium", 
    questLevel = 39, 
    requiredLevel = 28, 
    faction = "Both", 
    description = "I'm not out here just to stay away from people. There is a wealth of metal in the Badlands, <name>, if you have the guts to get it. The metal's called indurium and as luck would have it, it is rumored to possess high resistance to heat and stress. It might work for Fizzle's car. But let's make sure. Get me samples of indurium and I'll test its properties. True indurium ore lies deep in Uldaman, but the Stonevault troggs of the Badlands sometimes have flakes of it on them. Bring me those flakes.", 
    objectiveText = "Bring 10 Indurium Flakes to Martek the Exiled in the Badlands.", 
    startNPC = 4618, 
    endNPC = 4618 
}

Quests[1137] = { 
    name = "News for Fizzle", 
    questLevel = 38, 
    requiredLevel = 28, 
    faction = "Both", 
    description = "Indurium has an amazing resistance to heat! I'm sure it will work for Fizzle's pistons. But he'll need true indurium ore, not just the flakes. To get the ore, it must be mined from deep within Uldaman, on the northern borders of the Badlands. That is the true source of indurium. Send Fizzle Brassbolts my regards, and tell him what I told you. Safe travels, <name>. And it won't surprise me if we meet again -- once Fizzle learns of indurium he'll probably send you to Uldaman to acquire it!", 
    objectiveText = "Speak with Fizzle Brassbolts in the Shimmering Flats.", 
    startNPC = 4618, 
    endNPC = 4454, 
    rewards = { 
        type = "choice", 
        items = { 
            6729, 
            6732 
        } 
    } 
}

Quests[1169] = { 
    name = "Identifying the Brood", 
    questLevel = 43, 
    requiredLevel = 38, 
    faction = "Horde", 
    description = "Whilst that craven fool, Mok'Morokk, wallows in power and Tharg wrestles the demons of sorrow and vengeance and vies for leadership of the clan, I seem to be the only one concerned with identifying the source of aggression on our old home. Why the puzzled stare, <name>? Expecting me to speak like an uncouth ruffian merely because I am an ogre? Now back to business, bring to me the hearts and tongues from the whelps and hatchlings. I shall trace the root of this evil...", 
    objectiveText = "Draz'Zilb in Brackenwall Village would like you to bring him 15 Searing Tongues and 15 Searing Hearts.", 
    startNPC = 4501, 
    endNPC = 4501, 
    rewards = { 
        type = "choice", 
        items = { 
            9703, 
            9704 
        } 
    } 
}

Quests[1170] = { 
    name = "The Brood of Onyxia", 
    questLevel = 43, 
    requiredLevel = 38, 
    faction = "Horde", 
    description = "Stonemaul Village was invaded by the brood of Onyxia. But why would the daughter of the black dragonlord, Deathwing, descend upon our lands? This is most troubling. Surely, Onyxia was driven here for a purpose beyond laying siege to a small band of ogres. Notify Mok'Morokk at once! Action must be taken.", 
    objectiveText = "Speak with Overlord Mok'Morokk in Brackenwall Village.", 
    startNPC = 4501, 
    endNPC = 4500 
}

Quests[1171] = { 
    name = "The Brood of Onyxia", 
    questLevel = 43, 
    requiredLevel = 38, 
    faction = "Horde", 
    description = "You leave me alone now. Go tell Draz'Zilb we stay here. No black dragon here.", 
    objectiveText = "Speak with Draz'Zilb in Brackenwall Village.", 
    startNPC = 4500, 
    endNPC = 4501 
}

Quests[1172] = { 
    name = "The Brood of Onyxia", 
    questLevel = 45, 
    requiredLevel = 38, 
    faction = "Horde", 
    description = "Onyxia's brood has been scattered across the Dragonmurk. It is imperative that no more whelps be permitted to hatch. Make haste to Wyrmbog in the south of Dustwallow Marsh. Surely, she has made her lair there. Track down the evil dragon's eggs and destroy them. We will never reclaim Stonemaul Village if the surrounding area remains a breeding ground. As for Mok'Morokk... I have other plans for the sod.", 
    objectiveText = "Draz'Zilb in Brackenwall Village wants you to destroy 5 Eggs of Onyxia.", 
    startNPC = 4501, 
    endNPC = 4501, 
    rewards = { 
        type = "choice", 
        items = { 
            10700, 
            10701 
        } 
    } 
}

Quests[1173] = { 
    name = "Challenge Overlord Mok'Morokk", 
    questLevel = 45, 
    requiredLevel = 38, 
    faction = "Horde", 
    description = "You dare challenge Overlord Mok'Morokk? Haw! Me crush tiny <race>! You tell me when ready for good beating.", 
    objectiveText = "Defeat Mok'Morokk and report the news to Draz'Zilb in Brackenwall Village.", 
    startNPC = 4500, 
    endNPC = 4501, 
    rewards = { 
        type = "choice", 
        items = { 
            10703, 
            10704 
        } 
    } 
}

Quests[1947] = { 
    name = "Journey to the Marsh", 
    questLevel = 38, 
    requiredLevel = 30, 
    faction = "Both", 
    description = "Now it is time for you to earn your mage's wand. To begin this quest, speak with the human hermit Tabetha in Dustwallow Marsh. You will find her shack deep in the marsh, west of Theramore. Speak with her, for her knowledge is vast. You will find Tabetha's cottage west of Theramore, and just north of the Stonemaul Ruins.", 
    objectiveText = "Speak with Tabetha.", 
    startNPC = 4568, 
    endNPC = 6546 
}

Quests[1948] = { 
    name = "Items of Power", 
    questLevel = 40, 
    requiredLevel = 30, 
    faction = "Both", 
    description = "The building of a mage's wand is not easy. Rare substances are required, and a vessel must be made that can store great quantities of magical energy. You must gather these things and bring them to me. I have written onto this parchment that which you need, and instructions on how to get it. Bring me exactly what is on this list, and follow my written directions to the letter, for if you do not then when we make your wand things might go... badly.", 
    objectiveText = "Bring 1 Jade and the Bolt Charged Bramble to Tabetha in Dustwallow Marsh.", 
    startNPC = 6546, 
    endNPC = 6546 
}

Quests[1949] = { 
    name = "Hidden Secrets", 
    questLevel = 38, 
    requiredLevel = 30, 
    faction = "Both", 
    description = "To make your wand, there are key passages in a certain book that I must read. The book is called Rituals of Power, written by the Magus Tirth. I do not have a copy of his book, and none of the world's great libraries possess it. So you must speak with Tirth and gain it from him. Good luck. Tirth used to be a great mage and scholar, but now he spends his time at the gnome and goblin races in the Shimmering Flats, drinking and gambling.", 
    objectiveText = "Speak with Magus Tirth in the Shimmering Flats.", 
    startNPC = 6546, 
    endNPC = 6548 
}

Quests[1950] = { 
    name = "Get the Scoop", 
    questLevel = 30, 
    requiredLevel = 30, 
    faction = "Both", 
    description = "I can help you with the book, but first you have to help me! The tome you seek is in my magically locked strongbox. To open it a special phrase must be uttered, and I can't remember the phrase! Normally my assistant helps me remember these things but he's nowhere to be found. If you want my book, then find my apprentice! Ask around the race track--if you're lucky then someone has seen him. Either drag him back here, or at least get my magic phrase from him so we can open my box!", 
    objectiveText = "Find the phrase to Tirth's strongbox, then return to Tirth.", 
    startNPC = 6548, 
    endNPC = 6548 
}

Quests[1951] = { 
    name = "Rituals of Power", 
    questLevel = 40, 
    requiredLevel = 30, 
    faction = "Both", 
    description = "Hm... now that I think about it, I don't have my book! You see, I had some gambling debts and to pay them off I sold the last copy of Rituals of Power to a member of the clergy.... A member of the Scarlet Brotherhood. He must have taken it to their library in the Scarlet Monastery in Tirisfal Glades! If you want that book, then you'll have to go to the monastery to find it. And sorry about all the trouble. I'm not myself these days...", 
    objectiveText = "Bring the book Rituals of Power to Tabetha in Dustwallow Marsh.", 
    startNPC = 6548, 
    endNPC = 6546 
}

Quests[1952] = { 
    name = "Mage's Wand", 
    questLevel = 40, 
    requiredLevel = 30, 
    faction = "Both", 
    description = "I'll go make the wands now.", 
    objectiveText = "Speak with Tabetha after her ritual.", 
    startNPC = 6546, 
    endNPC = 6546, 
    rewards = { 
        type = "choice", 
        items = { 
            7514, 
            11263, 
            7513 
        } 
    } 
}

Quests[3519] = { 
    name = "A Friend in Need", 
    questLevel = 4, 
    requiredLevel = 2, 
    faction = "Alliance", 
    description = "Ughhh... I was bitten very badly by a spider named Githyiss the Vile while exploring the spider cave very close to here. I am sure I have been seriously poisoned; you must help me. Please tell Dirania Silvershine. She will be able to help me. Hurry... I'm so dizzy...", 
    objectiveText = "Speak to Dirania Silvershine in Shadowglen.", 
    startNPC = 8584, 
    endNPC = 8583 
}

Quests[3521] = { 
    name = "Iverron's Antidote", 
    questLevel = 4, 
    requiredLevel = 2, 
    faction = "Alliance", 
    description = "We may be able to help Iverron, as I know of an antidote that should help with the poison. It requires some ingredients, though, before I can make it. I'll need Hyacinth mushrooms. You can find these growing under trees, or you may collect them from the grell south of here; they seem to have taken a liking to them. I'll also need Moonpetal lilies, which only grow around watery pools. The last ingredient may prove the most difficult. From the very spiders that poisoned Iverron, collect Webwood ichor.", 
    objectiveText = "Collect 7 Hyacinth Mushrooms, 4 Moonpetal Lilies, and 1 Webwood Ichor for Dirania Silveshine in Shadowglen.", 
    startNPC = 8583, 
    endNPC = 8583 
}

Quests[3522] = { 
    name = "Iverron's Antidote", 
    questLevel = 4, 
    requiredLevel = 2, 
    faction = "Alliance", 
    description = "The antidote is ready, <name>. Please see that Iverron drinks it. There is something that you should know -- the antidote -- it will only remain viable for 5 minutes. You must get it to him in time. Speed be with you, <name>.", 
    objectiveText = "Bring Iverron's Antidote to Iverron before the time limit is up. Iverron can be found by the cave to the north.", 
    startNPC = 8583, 
    endNPC = 8584, 
    rewards = { 
        type = "choice", 
        items = { 
            10655, 
            10656 
        } 
    } 
}

Quests[4495] = { 
    name = "A Good Friend", 
    questLevel = 4, 
    requiredLevel = 2, 
    faction = "Alliance", 
    description = "A friend of mine named Iverron usually visits me at the same time every day. The strange thing is that he hasn't been by today at all -- he's several hours late, in fact. I admit, I am a little worried, <name>. Iverron spends a lot of time over by the cave to the north, and I'm sure you know how dangerous it is there -- spiders, everywhere! If you happen to be going that way, though, will you keep an eye out for him?", 
    objectiveText = "Find Iverron by the cave to the north.", 
    startNPC = 8583, 
    endNPC = 8584 
}

Quests[4821] = { 
    name = "Alien Egg", 
    questLevel = 26, 
    requiredLevel = 24, 
    faction = "Horde", 
    description = "A rumor has surfaced about an alien egg here in Thousand Needles. Those that report seeing this egg have failed to even get close enough to examine it in detail. Serpents guard the egg as if it's one of their own. I want you to seek out this alien egg and bring it to me so that I may examine it. Reports say the egg is located within a serpent den, but there are several serpent dens along the base of the cliff walls south and northeast of Freewind Post.", 
    objectiveText = "Return the Alien Egg to Hagar Lightninghoof in Freewind Post.", 
    startNPC = 10539, 
    endNPC = 10539 
}

Quests[4865] = { 
    name = "Serpent Wild", 
    questLevel = 26, 
    requiredLevel = 24, 
    faction = "Horde", 
    description = "If I did not see that with my own eyes I would never have believed it to be true. Vengeance has come to Thousand Needles! <Hagar wipes his brow.> <name>, you must act quickly! Go now and seek out Motega Firemane; he is located at Whitereach Post just northwest of Freewind Post along the road. He will know what to do!", 
        objectiveText = "Report your findings to Motega Firemane.", 
        startNPC = 10539, 
        endNPC = 10428 
}

Quests[5062] = { 
    name = "Sacred Fire", 
    questLevel = 27, 
    requiredLevel = 24, 
    faction = "Horde", 
    description = "Arikara is a deadly creature that must be dealt with swiftly. In order to hunt her down you will need to light the sacred fire of life - this will summon Arikara. Go now and harvest the rare Incendia agave plant. Once you have harvested enough agave, seek council with Magatha Grimtotem on Elder Rise in Thunder Bluff. She is a powerful shaman that can enchant the agave plant to create a powder that will light the fire. Travel northeast to the Boiling Pool and gather Incendia Agave.", 
    objectiveText = "Gather 10 bushels of Incendia Agave, and then consult Magatha Grimtotem on Elder Rise in Thunderbluff.", 
    startNPC = 10428, 
    endNPC = 4046 
}

Quests[5088] = { 
    name = "Arikara", 
    questLevel = 28, 
    requiredLevel = 24, 
    faction = "Horde", 
    description = "Take this refined and purified Incendia powder to Thousand Needles and toss it on the sacred fire of life. It is located in the Darkcloud Pinnacle on an isolated needle where they bury their dead. The enchantment that I have weaved into the Incendia powder will summon Arikara to you, <name>. I fear she may be stalking Cairne Bloodhoof; too much Tauren lore has changed, and I fear this has angered Arikara. Move quickly before all is lost, <class>!", 
    objectiveText = "Slay Arikara. Bring her remains and the Incendia powder to Motega Firemane in Whitereach Post as proof of your deed.", 
    startNPC = 4046, 
    endNPC = 10428, 
    rewards = { 
        type = "choice", 
        items = { 
            15464, 
            15465, 
            15466 
        } 
    } 
}

Quests[6133] = { 
    name = "The Ranger Lord's Behest", 
    questLevel = 60, 
    requiredLevel = 54, 
    faction = "Horde", 
    description = "The high elves of the Quel'Lithien lodge possesses something that belongs to me, <class>: A document detailing my life as a mortal. Before you ask; no, you most certainly are not privy to such information. Just do as I tell you, worm: Recover the registry. And imbecile, be sure to leave as much strife and grief as possible in your wake. Leave them suffering...", 
    objectiveText = "Travel to the northern borders of the Eastern Plaguelands and recover the Quel'Thalas Registry. The item is somewhere in the Quel'Lithien lodge.", 
    startNPC = 11878, 
    endNPC = 11878 
}

Quests[6135] = { 
    name = "Duskwing, Oh How I Hate Thee...", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Horde", 
    description = "Up until now, you have completed the missions I have assigned; even if not in the most timely manner. I suppose you think that you are ready for a challenge. Yes... Yes, imbecile, perhaps you are ready for a more involved set of missions. The albino demon bat, Duskwing, roams the countryside just north of here. Track him down and destroy him. Return to me with a patch of his white fur and you shall be rewarded.", 
    objectiveText = "Find Duskwing and slay him. From the corpse, recover a Patch of Duskwing's Fur and return it to Nathanos Blightcaller.", 
    startNPC = 11878, 
    endNPC = 11878, 
    rewards = { 
        type = "choice", 
        items = { 
            16994, 
            16995 
        } 
    } 
}

Quests[6144] = { 
    name = "The Call to Command", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Horde", 
    description = "The order has come down, <class>. Varimathras himself has requested that I send my most 'capable' agents back to the Undercity for a highly sensitive tactical operation. Unfortunately, my most capable agents were killed over three years ago. In their stead I have a collection of brain dead riff-raff. <Nathanos stares coldly at you.> Travel to the Undercity at once and report to Varimathras. Do not embarrass me, <class>!", 
    objectiveText = "Travel to the Undercity and speak with Varimathras.", 
    startNPC = 11878, 
    endNPC = 2425 
}

Quests[6145] = { 
    name = "The Crimson Courier", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Horde", 
    description = "Just as the body cannot survive without the head, the head cannot survive without the body. The defenses of the Scarlet Crusade's command inside Stratholme are almost impenetrable. We must, instead, cut the body out from under the head. My Deathstalkers have been collecting data on the activity of the Crusade outside of Stratholme. Each day, a report is sent from their central command to Tyr's Hand. This report is the key, <race>! Find the Crimson Courier and recover that report. Return it to Nathanos.", 
    objectiveText = "Return to Eastern Plaguelands and track down the Crimson Courier. Kill the Courier and recover the Grand Crusader's Command.", 
    startNPC = 2425, 
    endNPC = 11878 
}

Quests[6146] = { 
    name = "Nathanos' Ruse", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Horde", 
    description = "I have made some adjustments to this command. Should our little ruse work, they will expose the Scarlet Oracle and we shall strike! Now pay attention, <class>. You are to deliver this command to the Crusader Lord, Valdelmar. How? You are going to hand it to him, imbecile. Take the command and this rotten apple to Tyr's Hand. When you cross into the city, eat the apple. You will transform into something more... palatable to the humans. Take the command and hand it to the Crusader Lord, Valdelmar.", 
    objectiveText = "Travel to Tyr's Hand, southeast of the Marris Stead. Once there, take a bite of the Rotten Apple. While under the guise of the Scarlet Crusade, deliver the Grand Crusader's Command to Crusader Lord Valdelmar.", 
    startNPC = 11878, 
    endNPC = 11898 
}

Quests[6147] = { 
    name = "Return to Nathanos", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Horde", 
    description = "The Grand Crusader makes an unusual request. Hrm, regardless... what he asks will be done. Return to the Scarlet Bastion and notify him that the Oracle will be en route shortly. We will take every precaution to ensure that she makes it to Stratholme unharmed.", 
    objectiveText = "Return to Nathanos Blightcaller with the new information.", 
    startNPC = 11898, 
    endNPC = 11878 
}

Quests[6148] = { 
    name = "The Scarlet Oracle, Demetria", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Horde", 
    description = "Demetria is chief advisor to the Grand Crusader. She is called the Oracle due to her 'otherworldly' senses. She has successfully assisted the Crusade in several of their victories against the Scourge. While this ruse was successful in exposing her, if she truly does possess psychic powers, she will undoubtedly be expecting some sort of trouble. You are going to provide that 'trouble.' Track down the Oracle and terminate her. They should be moving out of Tyr's Hand as we speak. Make me proud, worm.", 
    objectiveText = "The Scarlet Crusade is on the move. Somewhere along the road from Tyr's Hand to Stratholme you will find the Oracle, Demetria, and her entourage. Hunt her down and slay her. Return to Nathanos Blightcaller should you succeed.", 
    startNPC = 11878, 
    endNPC = 11878, 
    rewards = { 
        type = "choice", 
        items = { 
            16996, 
            16997, 
            16998 
        } 
    } 
}

Quests[6182] = { 
    name = "The First and the Last", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Alliance", 
    description = "Nathanos Marris was the first and last of the human ranger lords. A disciple of Sylvanas Windrunner, now the Banshee Queen of the Forsaken. We had thought that Nathanos had been killed in action in the defense of Lordaeron five years ago. Although his corpse was never recovered, it was assumed that he did not make it out of the Eastern Plaguelands. Mathias Shaw has been investigating the disappearance and may have some new information. Report to him at once. He resides in Old Town, at the Barracks.", 
    objectiveText = "Speak with Mathias Shaw in Old Town Stormwind. He resides in the Barracks.", 
    startNPC = 1748, 
    endNPC = 332 
}

Quests[6183] = { 
    name = "Honor the Dead", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Alliance", 
    description = "Five of my best field agents were assigned the Marris case. One returned, only to end up dead in his sleep three days later. What little information we did manage to get out of him was incoherent gibberish. We made out two words: \"Nathanos,\" and \"Blightcaller.\" I do not have the available manpower to continue this investigation and Ravenholdt will not assist us. We must get to the bottom of this; if only to provide closure to the families of the deceased. Will you help?", 
        objectiveText = "Speak with Mathias Shaw again if you wish to accept his task.", 
        startNPC = 332, 
        endNPC = 332 
}

Quests[6184] = { 
    name = "Flint Shadowmore", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Alliance", 
    description = "The only information we have thus far, then, is that Nathanos Marris may have been slain by this Blightcaller. We assume the Blightcaller is the same fiend that disposed of my agents. Flint Shadowmore, another SI:7 operative, is stationed at the Alliance encampment of Chillwind Point in the Western Plaguelands. Seek him out; he will debrief you on the current situation in the Plagues and give you an assignment. Good luck, <name>.", 
    objectiveText = "Travel to Chillwind Camp in the Western Plaguelands and meet up with your contact, Flint Shadowmore.", 
    startNPC = 332, 
    endNPC = 12425 
}

Quests[6185] = { 
    name = "The Eastern Plagues", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Alliance", 
    description = "As I said, your first mission is one of reconnaissance. Nothing fancy, <name>. You must travel to the Eastern Plaguelands and look for any clues as to this Blightcaller. Be on the lookout for information about our missing operatives. We have to assume that they are dead and if they are dead, they must have a corpse... somewhere. <Flint swallows hard.> All SI:7 agents carry this insignia. <Flint shows you his SI:7 insignia.> Bring any of those that you may find back to me.", 
    objectiveText = "Scour the Eastern Plaguelands for clues as to the \"Blightcaller\" and the missing SI:7 agents. If you find any SI:7 Insignias, return them to Flint Shadowmore at Chillwind Camp.", 
    startNPC = 12425, 
    endNPC = 12425 
}

Quests[6186] = { 
    name = "The Blightcaller Cometh", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Alliance", 
    description = "<The blood appears to have completely drained from Flint's face.> Na... Nathanos did this? Nathanos is the Blightcaller? Why? He was... was so noble - a ranger lord respected by all. The only human ever allowed to train under the high elves. Now a ruthless agent of the Forsaken? I... I am sorry to ask this of you, <name>, but Highlord Fordragon must be informed of this turn of events at once. Please, return to Stormwind and deliver the news.", 
    objectiveText = "Return to Stormwind and inform Highlord Bolvar Fordragon of the fate of Nathanos Marris.", 
    startNPC = 12425, 
    endNPC = 1748 
}

Quests[6187] = { 
    name = "Order Must Be Restored", 
    questLevel = 60, 
    requiredLevel = 56, 
    faction = "Alliance", 
    description = "Do you know how many ranger lords exist in this world? How many human ranger lords have ever existed? Nathanos' accomplishments were unprecedented. He was a tactical genius, responsible for Alliance victories spanning a decade of conflict. And now... the champion of the Forsaken. No. This cannot be. Order must be restored. Gather an army, <name>. Return to the Plagues with your army and destroy the Blightcaller. I wish you luck, <name>. Truly, you will need it for this battle.", 
    objectiveText = "Assemble an army and travel to the Eastern Plaguelands. Launch a full assault on Nathanos Blightcaller and any Horde filth that may attempt to protect him.", 
    startNPC = 1748, 
    endNPC = 1748, 
    rewards = { 
        type = "choice", 
        items = { 
            16996, 
            16997, 
            16998 
        } 
    } 
}

Quests[7181] = { 
    name = "The Legend of Korrak", 
    questLevel = 60, 
    requiredLevel = 51, 
    faction = "Horde", 
    description = "The invading Stormpike are not the only threat in the region, soldier. The war in the Valley is waged on two fronts. The cannibal Winterax trolls also vie for power. They are lead by Korrak the Bloodrager - a cruel and cunning beast. A strike against Korrak could prove to be a crushing blow to the Winterax clan. Slay the beast and be rewarded!", 
    objectiveText = "According to legend, the leader of the mighty Winterax trolls appears at will to wreak havoc on the denizens of Alterac Valley.", 
    startNPC = 13840, 
    endNPC = 13840, 
    rewards = { 
        type = "choice", 
        items = { 
            19107, 
            19106, 
            19108, 
            20648 
        } 
    } 
}

Quests[7202] = { 
    name = "Korrak the Bloodrager", 
    questLevel = 60, 
    requiredLevel = 51, 
    faction = "Alliance", 
    description = "The indigenous Winterax trolls of the region are ruthless savages that would love nothing more than to have our bones added to their foul stew. We must show them our might! We have recovered tomes from their caves that detail their leadership hierarchy. The artifacts indicate that their leader, Korrak the Bloodrager, tends to remain hidden until given a reason to make his presence known. Death to Korrak would mean death to Winterax Clan! Slay him and return.", 
    objectiveText = "According to legend, the leader of the mighty Winterax trolls appears at will to wreak havoc on the denizens of Alterac Valley.", 
    startNPC = 13841, 
    endNPC = 13841, 
    rewards = { 
        type = "choice", 
        items = { 
            19107, 
            19106, 
            19108, 
            20648 
        } 
    } 
}

Quests[8254] = { 
    name = "Cenarion Aid", 
    questLevel = 52, 
    requiredLevel = 50, 
    faction = "Both", 
    description = "It is the way of the divine to help those in need. The how is insignificant -- only the why matters. The Cenarion Circle has such a need. Speak with Ogtinc to lend aid to their plight. He resides atop the cliffs to the northeast of the Ruins of Eldarath in Azshara.", 
    objectiveText = "Seek out Ogtinc in Azshara.", 
    startNPC = 5489, 
    endNPC = 8405 
}

Quests[8255] = { 
    name = "Of Coursers We Know", 
    questLevel = 52, 
    requiredLevel = 50, 
    faction = "Both", 
    description = "The mosshoof coursers of Azshara are magnificent animals who once lived in Felwood. They naturally resist disease and poison, and were unaffected by the corruption there. In their ancestral wisdom, they simply chose to leave that sickened place. It saddens my heart, but I must ask you to hunt these mighty beasts for me. Gather four courser glands as the first ingredient for a restorative salve -- a salve we will use to heal Felwood.", 
    objectiveText = "Acquire 4 Healthy Courser Glands and bring them to Ogtinc in Azshara. Ogtinc resides atop the cliffs northeast the Ruins of Eldarath.", 
    startNPC = 8405, 
    endNPC = 8405 
}

Quests[8256] = { 
    name = "The Ichor of Undeath", 
    questLevel = 52, 
    requiredLevel = 50, 
    faction = "Both", 
    description = "For this restorative salve, you must use a simple formula: one part poison, two parts cure. You have acquired one cure, now you must gather the poison. Powerful undead, such as the lingering highborne who wander the Ruins of Eldarath, are sometimes so infused with evil that it coalesces into a sickly greenish goo. To the living, this substance is known as ichor of undeath. Due to the potency of this vile element, I require only a single ichor.", 
    objectiveText = "Acquire an Ichor of Undeath for Ogtinc in Azshara. Ogtinc resides atop the cliffs northeast the Ruins of Eldarath.", 
    startNPC = 8405, 
    endNPC = 8405 
}

Quests[8257] = { 
    name = "Blood of Morphaz", 
    questLevel = 52, 
    requiredLevel = 50, 
    faction = "Both", 
    description = "Now the last part, the second cure. The green drake Morphaz is known to be immune to all forms of poison and disease -- many druids died to bring us this information. There is no doubt his blood is potent for our needs. A courier from the Cenarion Circle will take the parts you have already collected while you gather the last. Summon your allies and seek out the drake's lair in the sunken temple of Atal'Hakkar. Bring his blood to Greta Mosshoof in Felwood.", 
    objectiveText = "Kill Morphaz in the sunken temple of Atal'Hakkar, and return his blood to Greta Mosshoof in Felwood. The entrance to the sunken temple can be found in the Swamp of Sorrows.", 
    instanceID = 109, 
    startNPC = 8405, 
    endNPC = 10922, 
    rewards = { 
        type = "choice", 
        items = { 
            19990, 
            20082, 
            20006 
        } 
    } 
}

Quests[8271] = { 
    name = "Hero of the Stormpike", 
    questLevel = 60, 
    requiredLevel = 51, 
    faction = "Alliance", 
    description = "The indigenous Winterax trolls of the region are ruthless savages that would love nothing more than to have our bones added to their foul stew. We must show them our might! We have recovered tomes from their caves that detail their leadership hierarchy. The artifacts indicate that their leader, Korrak the Bloodrager, tends to remain hidden until given a reason to make his presence known. Death to Korrak would mean death to Winterax Clan! Slay him and return.", 
    objectiveText = "According to legend, the leader of the mighty Winterax trolls appears at will to wreak havoc on the denizens of Alterac Valley.", 
    startNPC = 13816, 
    endNPC = 13816, 
    rewards = { 
        type = "choice", 
        items = { 
            19107, 
            19106, 
            19108, 
            20648 
        } 
    } 
}

Quests[8272] = { 
    name = "Hero of the Frostwolf", 
    questLevel = 60, 
    requiredLevel = 51, 
    faction = "Horde", 
    description = "The invading Stormpike are not the only threat in the region, soldier. The war in the Valley is waged on two fronts. The cannibal Winterax trolls also vie for power. They are lead by Korrak the Bloodrager - a cruel and cunning beast. A strike against Korrak could prove to be a crushing blow to the Winterax clan. Slay the beast and be rewarded!", 
    objectiveText = "According to legend, the leader of the mighty Winterax trolls appears at will to wreak havoc on the denizens of Alterac Valley.", 
    startNPC = 13817, 
    endNPC = 13817, 
    rewards = { 
        type = "choice", 
        items = { 
            19107, 
            19106, 
            19108, 
            20648 
        } 
    } 
}

Quests[41196] = { 
    name = "Maddening Hunger", 
    questLevel = 4, 
    requiredLevel = 3, 
    faction = "Alliance", 
    description = "I can't take it- I can't take it anymore! You! YOU! Come here you little- <Ranathir shudders and shakes his head, his voice lowering.> No, no that's not me. I'm sorry. I'm sorry, please don't- you must forgive me, that wasn't me, I didn't mean it. But I...you see...I haven't had my dose of mana in...in... ...how long has it been? I feel like lately time has been standing still and laughing at me. Please, I need you to bring me an arcane crystal from the mines. The golems make it so hard to get them, and there are never enough. It's never enough... Please. Please hurry. I can't...stand it.", 
    objectiveText = "Fetch a charged arcane crystal from the mines and bring it back to Ranathir.", 
    startNPC = 61850, 
    endNPC = 61850, 
    rewards = { 
        type = "choice", 
        items = { 
            41116, 
            41117 
        } 
    } 
}

Quests[41353] = { 
    name = "Cold is the Night", 
    questLevel = 62, 
    requiredLevel = 60, 
    faction = "Both", 
    description = "With a single touch, the Amethyst begins to shine in a dim light that could easily enthrall your eyes forevermore. Yet it was not its beauty that captivated your mind. A voice rings into your head. One that does not belong to you. It echoes in stern yet soothing tone: “You must give this more thought Incantagos. Return to Kel'Theril and find comfort in my presence. That Tower is unpredictable and the Ley-Line on which it prays is purely chaotic. Fool yourself no longer, friend. There is another way!” The Amethyst shines no longer. And whenever touched would simply speak the same message. What an odd item you have stumbled upon. Perhaps exploring the Lake of Kel'Theril will offer you some sort of answer.", 
    objectiveText = "Investigate the mysteries of the Enchanted Amethyst.", 
    instanceID = 814, 
    startNPC = 61946, 
    endNPC = 62007 
}

Quests[41354] = { 
    name = "Embraced by the Moon", 
    questLevel = 62, 
    requiredLevel = 60, 
    faction = "Both", 
    description = "It appears the Amethyst is losing its enchantment. I would ask you not to question the way it works. It is a secret that perhaps ought to die with what was this home of mine. Alas, I bid you welcome to Kel'Theril. Once a city to behold, now, home to me and the troubled spirits of my kin. I know not why you sought me. I very much doubt it is the guilt for slaying Incantagos. <Al'Dorel sighs.> A foolish son seeking to please his Father. Yet who am I, or you, to judge his path? If it's answers you seek you may only find them through aiding me. For a favor must be met by another favor. The highborne that linger nearby must be put to rest. All across the lake they can be seen drifting with no purpose. Free them, and you will have my thanks.", 
    objectiveText = "Free the spirits of Suffering and Anguished Highborne within Kel'Theril for Al'Dorel.", 
    startNPC = 62007, 
    endNPC = 62007 
}

Quests[41355] = { 
    name = "And Lost to the Stars", 
    questLevel = 62, 
    requiredLevel = 60, 
    faction = "Both", 
    description = "Incantagos sought the Tower for its unstable ley-lines, and the intense power that lingered there. Incantagos sought to make a name for himself in the Blue Dragonflight, to advance their cause of the great dampening on azeroth. He sought to meet Malygos himself, but Haleh denied him this right, as she believed it was not yet time for them to meet. I am uncertain of her reasons. In truth, I begin to question the actions of the Blue day by day as they began to be rather aggressive even to those they once called allies. There were times I'd host the wyrmkin in my ruined home. It is sad to say that such times have passed, and now they have stolen something sacred to me. Before you learn more of Incantagos' choices, return this an item for me. A pristine moon-forged telescope that can see beyond the sky with its enchanted crystals. They ought to have taken it inside Mazthoril to the southeast.", 
    objectiveText = "Bring the Magical Telescope back to Al'Dorel.", 
    startNPC = 62007, 
    endNPC = 62007 
}

Quests[41356] = { 
    name = "Asleep Under Snow", 
    questLevel = 62, 
    requiredLevel = 60, 
    faction = "Both", 
    description = "Before Incantagos left for the Eastern Kingdoms I sought to give him counsel. For I truly was a friend of the Blue. I told him that the Ley-Line he sought was nothing but unstable and not even he, a Blue, could truly harness it. Alas, not even I- nor even the great Guardian could truly. Before he departed, he chose to rest in the Frostwhisper Gorge. He found solace amongst the Giants, for no reason I can think of. Dragons shed when they fall in deep slumber. Seek the demise of the roaming Giants, while it may upset the elements that roam these lands. We are in need of these scales, for they can tell us more. Do not falter, friend. Perhaps you see these tasks of mine as meaningless. But I assure you, this is not something we may leave unchecked.", 
    objectiveText = "Brings 6 Pristine Azure Scales to Al'Dorel.", 
    startNPC = 62007, 
    endNPC = 62007 
}

Quests[41357] = { 
    name = "The Enemy Lays", 
    questLevel = 62, 
    requiredLevel = 60, 
    faction = "Both", 
    description = "Have a look friend. These pristine scales once shined embraced by an Azure tone. Yet now, in their lifeless form they further resembles a raw piece of lapis instead. I harbor no ill intent towards you, fret not. I simply regret Incantagos met his demise. Were I any faster, perhaps he would lived. Regardless, it seems we are yet to be closer to the truth. I was afraid of this. With Incantagos gone, the magic of these scales has long dissipated. We could briefly return life to them. But to do that we would have to either siphon the life of another Blue Dragon to it, or something akin. I am afraid you are to travel East once more, friend. In the dungeons of what is now the largest Human Kingdom to remain you will find it. That despicable creation. For what reason had he done that, I will never understand. Seek the living shard of Arc'Tiras. Within its core you will find the very magic of the Blue, the essence of Malygos.", 
    objectiveText = "Bring the Core of Arc'Tiras back to Al'Dorel", 
    startNPC = 62007, 
    endNPC = 62007 
}

Quests[41358] = { 
    name = "Awoke at Sun Rise", 
    questLevel = 62, 
    requiredLevel = 60, 
    faction = "Both", 
    description = "With these objects gathered I can finally find the answers we both seek. Allow me mere moments to cast my spells. <Al'Dorel hums under his breath with his eyes closed.> This is rather hard to accept. I am unsure how to react. I - I suppose it is not worth avoiding. Arygos sought the Ley-Line of the Tower because the Blue considers the mortal races of Azeroth unworthy of the Arcane. It seems that Malygos himself is preparing for… I wouldn't call it a war nor a battle. Would the ants see your foot as a declaration of war or battle? Or just pure extermination. I must know if all believe this to be the right path. I cannot leave this place, so please. Please on my behalf speak to Haleh. She is the Broodmother of Kalimdor. She rests atop Mazthoril and there is a rune inside you can use to reach her.", 
    objectiveText = "Speak to Haleh at the top of Mazthoril about the truth revealed by Al'Dorel in Winterspring.", 
    startNPC = 62007, 
    endNPC = 10929 
}

Quests[41359] = { 
    name = "Through a Glimmering Light", 
    questLevel = 62, 
    requiredLevel = 60, 
    faction = "Both", 
    description = "So Incantagos is dead. Were you not sent by Al'Dorel I would have used my teeth rather than my words. Alas, I suppose the unexpected had once more taken a child of the Blue. It is all true mortal. We stand ready to deprive you mortal races of the Arcane. I hope you dare not question it. Not only has your foolishness brought the Great Sundering, the damned Burning Legion and all that came with it. A portal to a different world? A great feat, one that was paid in blood a million times over. As protectors of this world we are meant to limit the access to the Arcane. Yet all of you grew so confident and rather powerful. Lord Malygos, the very one who taught the first mages, has decided that you are no longer worthy of this responsibility. Azeroth can heal, and new races can be born. Sometimes a blank canvas is the best way to fix an issue. Treat this as a warning, and leave as I still have some pity left for one that played part in the ending of Incantagos. Tell Al'Dorel, he alone, shall be safe.", 
    objectiveText = "Return to Al'Dorel", 
    startNPC = 10929, 
    endNPC = 62007 
}

Quests[41360] = { 
    name = "Warm is the Day", 
    questLevel = 62, 
    requiredLevel = 60, 
    faction = "Both", 
    description = "Incantagos was not alone in his quest it seems. How could they be so blind, so ruthless? They must understand that this is not the path they must, walk. They must! <Al'Dorel sighs.> So there we have it, friend. The truth, one that even if you are to share, nobody will believe. All we can do is – live. Feel the warmth of the Sun even in these cold lands. Promises of end and death should never stop us from living today. Do not worry. For as much as I was a friend of the Blue. I will be ready, and so will you. A day will come when we shall see each other's faces once more. I pray it will be as long as possible. Until then. Come, I have a token from our long lost life that I wish to grant you.", 
    objectiveText = "Accept your gift.", 
    startNPC = 62007, 
    endNPC = 62007, 
    rewards = { 
        type = "choice", 
        items = { 
            55133, 
            55134, 
            55135 
        } 
    } 
}

Quests[41667] = { 
    name = "In Need of Shoes", 
    questLevel = 28, 
    requiredLevel = 25, 
    faction = "Alliance", 
    description = "This tournament is a farce. How can we even hope to win? I bet they've enchanted their horseshoes. I know it, I just know it! I cannot allow Stromgarde to be defeated by a bookworm kingdom and a newly formed—eh, I wouldn't even call it a kingdom. Theramore and Kul Tiras will be too preoccupied with each other, but the real threat is Dalaran. I don't like the sidelong glance that Modera woman is giving me; they have a trick up their sleeves—I know they do! Listen, <race>, I'll pay you handsomely. Return to Stormwind, take the boat to Darkshore, and then travel to Alah'thalas. I've heard rumors of a man named Chaddus Suncarrier who can provide a pair of enchanted horseshoes. Retrieve them for me, and your service to Stromgarde will not be forgotten—and your pocket will be a bit heavier.", 
    objectiveText = "Seek Chaddus Suncarrier in Alah'Thalas about a pair of enchanted horse shoes and return to Commander Leder.", 
    startNPC = 62477, 
    endNPC = 62477, 
    rewards = { 
        type = "fixed", 
        items = { 
            58026 
        } 
    } 
}

Quests[41841] = { 
    name = "Artifact of the Dark Lady", 
    questLevel = 38, 
    requiredLevel = 32, 
    faction = "Horde", 
    description = "<In your hand is the broken Bloodstone Pendant used by Ighal’for, disciple of the deranged Cho’gall, to summon the abhorrent beholder Mergothid into Azeroth. The wounds of the fierce battle against the demon are still strewn across your body. Blood runs down your arm onto your palm. Suddenly, the pendant shakes violently, letting out a twisted shriek while drawing in the red liquid. Shortly after, the blood is gone - and the pendant starts pulsating. You remember assisting a Forsaken warden in Tarren Mill recovering similar artifacts; relics that belonged to the Dark Lady, Sylvanas Windrunner. It’d be best to return her stolen trinkets back to her.>", 
    objectiveText = "Deliver the Bloodstone Pendant to Lady Sylvanas Windrunner in Undercity.", 
    startNPC = 62671, 
    endNPC = 10181, 
    rewards = { 
        type = "choice", 
        items = { 
            58277, 
            58278 
        } 
    } 
}

Quests[41945] = { 
    name = "Respect the Elderly", 
    questLevel = 55, 
    requiredLevel = 49, 
    faction = "Both", 
    description = "All this riffraff! To think an imbecile like Bhu’robi is the cause for all this chaos. He was always a nuisance, radical ideas and delusional aspirations walked hand in hand with this fool of a man! You would assume our chieftain would have realized this sooner, but he got blinded by his feelings of compassion to his ‘old friend’. Pah, to the nether with it I say. Bhu’robi is no longer a Draenei in my eyes, let alone a Moro’gai. Parash’ka! You made me ramble on about this again! Now my blood is boiling and my head is ready to burst. I will have you remedy this, scoundrel! Go to the Lunarclaw Den east of the village and bring me some brains of the featherfolk around there. I want only the gooiest you can find!", 
    objectiveText = "Fena Ma’dar in Moro’gai Village wants Lunarclaw brains to help with her headache.", 
    startNPC = { 
        name = "Fena Ma'dar", 
        zone = "Moro'gai Village" }, 
        endNPC = { 
            name = "Fena Ma'dar", 
            zone = "Moro'gai Village" }, 
            rewards = { 
                type = "choice", 
                items = { 
                    33352, 
                    33353, 
                    33354 
                } 
            } 
        }

Quests[42000] = { 
    name = "Highborne Burden", 
    questLevel = 54, 
    requiredLevel = 48, 
    faction = "Horde", 
    description = "The Earthmother has not been kind when it came to the fate of the Highborne. Punished for the actions of their queen, the restless souls roam all around Kalimdor and Moonwhisper is no exception. In what was Maras’ethil several spirits yet remain. Bound to this place with no hope. My heart ails for them. I cannot bear the torment of their souls any longer. While there are other tasks that require me here, I would ask you to deliver these souls from their eternal prison. They have no knowledge of their death, mere spectres that must be returned to the cycle of life and death. Maras’ethil rests south of Nendis and south east of Moro’gai Village.", 
    objectiveText = "Free the spirits of Mara’sethil and return to Mhulf Nighthorn in Moonhoof Village.", 
    startNPC = 62976, 
    endNPC = 62976, 
    rewards = { 
        type = "fixed", 
        items = { 
            42365 
        } 
    } 
}

Quests[55003] = { 
    name = "A New Power Source", 
    questLevel = 10, 
    requiredLevel = 7, 
    faction = "Horde", 
    description = "As a technician, it's our job to keep everythin' runnin' ya see? Well, we've run into a small problem, and by a small problem, I mean a big problem! The Oil from the platform isn't coming in and we're barely making due with what we got! That and we're gonna run outta barrels of the juice soon. But, I got an idea anyway. There's a place not far from here to the west called Thunder Ridge, and it's got that name for a reason. The beasts there pack one HELL of a punch! Get me six of their energized scales, so I can tinker with them as a power source. Now, they're not gonna be givin' you their scales, so use some force!", 
    objectiveText = "Gather six Energized Scales from Lightning Hides and Thunder Lizards at Thunder Ridge to the west and bring them to Technician Spuzzle in Sparkwater Port.", 
    startNPC = 91214, 
    endNPC = 91214, 
    rewards = { 
        type = "fixed", 
        items = { 
            81294 
        } 
    } 
}

Quests[55006] = { 
    name = "Backup Capacitor", 
    questLevel = 34, 
    requiredLevel = 29, 
    faction = "Horde", 
    description = "That was almost a disaster. We ran out of oil and almost used all of the power from the thunder lizard scales. What do you mean just work without power? Pal, most things here don't have a failsafe when the tap runs dry. Some things don't even have an off button! This town is a ticking timebomb. It'll blow up sky high if the oil platform is destroyed or overrun again, and I plan to have a backup plan. You see, I've heard some whispers that the gnomes invented some sort of capacitor that can power entire rigs for hours without end in an emergency, though I also heard Gnomeregan blew up and got radiated, and the capacitor went missing after that. That explains why nobody got their grubby hands on it yet. Venture there and see if you have any luck finding it, maybe bring your friends too, who knows what lurks down there.", 
    objectiveText = "Bring the Megaflux Capacitor to Technician Grimzlow.", 
    instanceID = 721, 
    startNPC = 91234, 
    endNPC = 91234, 
    rewards = { 
        type = "choice", 
        items = { 
            81319, 
            81320 
        } 
    } 
}

Quests[60110] = { 
    name = "Githyiss the Vile", 
    questLevel = 5, 
    requiredLevel = 3, 
    faction = "Alliance", 
    description = "Iverron was attacked, you say? And by Githyiss herself, outside the Shadowthread Cave? This is grave news... To think that the broodmother of the webwood spiders has become this hostile. I had already heard rumors of her mercilessly overhunting the local wildlife. If she has gone so far as to attack our people, however... It pains me to say this, but I fear that she must be put down. Her violent nature now threatens the very balance of Shadowglen. Take great caution if you are to hunt her, <name>; her poison is much stronger than any of her brood's. If you could, please bring back her venom sac so that I may further my research. I only hope it may yield answers to what is happening across Teldrassil.", 
    objectiveText = "Kill Githyiss the Vile and collect her Venom Sac, then return to Gilshalan Windwalker.", 
    startNPC = 2082, 
    endNPC = 2082, 
    rewards = { 
        type = "fixed", 
        items = { 
            51816, 
            51817 
        } 
    } 
}

Quests[60112] = { 
    name = "Fallen Adventurers", 
    questLevel = 4, 
    requiredLevel = 3, 
    faction = "Horde", 
    description = "While I'm bound to fulfill Marla's wish, I cannot help but think about Samuel's friends. They are damned into eternal service for the Scourge with their bodies and minds beyond recovery. Please, if you see them... lay them to rest.", 
    objectiveText = "Novice Elreth has asked you to kill Karrel Grayves, Daniel Ulfman and Stephen Bhartec. They were last seen at a camp near Deathknell's gate.", 
    startNPC = 1661, 
    endNPC = 1661, 
    rewards = { 
        type = "fixed", 
        items = { 
            51820, 
            51821 
        } 
    } 
}

Quests[70020] = { 
    name = "A Brother's Worried Mind", 
    questLevel = 29, 
    requiredLevel = 28, 
    faction = "Horde", 
    description = "My little brother, Taupo, is a gifted druid and more accomplished than I would ever hope to be but he is still my little brother. He was on his way to the Warsong Lumber Camp to help with the demonic corruption among other things. I fear he might find trouble as he has to pass through Felfire Hill. Please, find my little brother, I would do it myself but I do not wish him to think I find him incapable, yet I still worry. He left not so long ago, following the main road east, that is the path to the Lumber Camp.", 
    objectiveText = "Find Taupo Foreststrider, Loruk's brother at the beginning of Felfire Hill.", 
    startNPC = 11720, 
    endNPC = 70020 
}

Quests[70021] = { 
    name = "Taupo's Duty", 
    questLevel = 29, 
    requiredLevel = 28, 
    faction = "Horde", 
    description = "It was Earthmother's blessing to be born with such a worried elder brother, and as fate has it there you are, just the help that I needed. While I was making my way to the Lumber Camp I saw this Tauren bravely fight those demons and I have stopped to tend to his wounds. My skills helped stop his bleeding, but we need a salve to fully mend him. In the river you will find Boglings, slay them and bring me the cores, they will help bring our newest friend back on his feet, and do not worry <name>, this is all in the name of balance.", 
    objectiveText = "Bring Taupo 10 Bog Creatures' Cores.", 
    startNPC = 70020, 
    endNPC = 70020, 
    rewards = { 
        type = "fixed", 
        items = { 
            1970 
        } 
    } 
}

Quests[70022] = { 
    name = "Norvok of the Spear", 
    questLevel = 29, 
    requiredLevel = 28, 
    faction = "Horde", 
    description = "I was on my way to the Warsong Lumber Camp when I had my encounter with the demons, were it not for this druid I wouldn't have made it. I have a very important report addressed to the stationary Commander in charge, Commander Grushak, I would hurry right away but the wounds have yet to release me of my pain and my spear was lost in the battle. I ask you to find it while Taupo heals me. While you search for it - spare no demon.", 
    objectiveText = "Kill 10 Searing Infernals and 10 Felguards.", 
    startNPC = 70022, 
    endNPC = 70022, 
    rewards = { 
        type = "fixed", 
        items = { 
            70003 
        } 
    } 
}

Quests[70023] = { 
    name = "Report to Commander Grushak", 
    questLevel = 30, 
    requiredLevel = 28, 
    faction = "Horde", 
    description = "I am aware I am not going anywhere anytime soon <name>, there is no need for you to stare at me that way. You will have to give my report to Commander Grushak, tell him I sent you, he will be glad to have you by his side, he's a bit strict but that's what will keep you alive out there. Seek him in the first tower as you reach the Lumber Camp. As a personal request however, do keep an eye out for my spear, it carries years worth of history, been passed through my lineage from the first Hawkspear to the last and I do not wish it to be lost at the hands of demons. Travel safe my friend and may the Earthmother guide you.", 
    objectiveText = "Report to Commander Grushak at the Lumber Camp.", 
    startNPC = 70022, 
    endNPC = 70023 
}

Quests[70024] = { 
    name = "Wildthorn Menace", 
    questLevel = 30, 
    requiredLevel = 28, 
    faction = "Horde", 
    description = "The camp is as productive as the day it was built from the ground, which frankly doesn't mean much at all. The Wildthorn Lurkers have ascended upon our camp and are giving the peons and laborers a hard time, while my scouts are giving their all to slay them it is not enough. Go help the cause, <name>, after all I take you bringing this report as volunteering your aid, clean the camp of the wildthorn menace and I will see you rewarded.", 
    objectiveText = "Kill 10 Wildthorn Lurkers in Warsong Lumber Camp.", 
    startNPC = 70023, 
    endNPC = 70023, 
    rewards = { 
        type = "fixed", 
        items = { 
            933 
        } 
    } 
}

Quests[70025] = { 
    name = "Knife Eared Stalkers", 
    questLevel = 29, 
    requiredLevel = 28, 
    faction = "Horde", 
    description = "Those knife eared bastards are trying to force us out of the woods, they've sent a squadron of stalkers that hide around our fields and murder our peons, they must be stopped! Go get your hands dirty, leave none alive, and if anything make sure more of the peons don't die.", 
    objectiveText = "Kill 20 Ashenvale Stalkers.", 
    startNPC = 70023, 
    endNPC = 70023, 
    rewards = { 
        type = "choice", 
        items = { 
            70004, 
            70005, 
            70006 
        } 
    } 
}

Quests[70026] = { 
    name = "Peon's Wardrobe Makeover", 
    questLevel = 30, 
    requiredLevel = 28, 
    faction = "Horde", 
    description = "With most of the tasks done, I only have but a favor to ask of you, our poor peons have been wearing the same tattered clothing since we've come to this damned forest, they can't take another day in those rags and I most certainly won't be the one blamed for naked peons chopping wood! I need you to hunt and skin some bears for me, North of Splintertree Post and in its immediate vicinity to the left you will be able to find bears, grab enough for our leatherworker to craft new cloths for those poor miserable souls, but remember <name>, only hunt the eldest of the bears.", 
    objectiveText = "Collect 10 Elder Ashenvale Bear Pelts.", 
    startNPC = 70023, 
    endNPC = 70023, 
    rewards = { 
        type = "fixed", 
        items = { 
            70008 
        } 
    } 
}

Quests[70027] = { 
    name = "Farseer Grimeye", 
    questLevel = 28, 
    requiredLevel = 25, 
    faction = "Horde", 
    description = "The fields are clear, the peons seem happy and the productivity is already going way better than they used to. That's exactly why I am sending you to another mission. You seem eager to aid and frankly the Farseer needs all the help he can get. He's a cranky old orc, don't even for a second consider his frustration as weakness. He will task you with a harsh job but I do not doubt you will do well. Go now and give him this parchment. You'll find him in the keep, north-east of here.", 
    objectiveText = "Deliver Commander Grushak's report to Farseer Grimeye.", 
    startNPC = 70023, 
    endNPC = 70027 
}

Quests[70028] = { 
    name = "Demon Fall Canyon", 
    questLevel = 28, 
    requiredLevel = 25, 
    faction = "Horde", 
    description = "What do you see here <name>? I will tell you what I see; a roaming pack without its Alpha. Simple minded buffoons who lost their commander. Sometimes I ask myself what would have happened if Hellscream… doesn't matter now. Falling down into the Demon Fall Canyon you will see numerous spawns of the Burning Legion. As you should know, a great demon fell there, hence the namesake, I suppose. Your mission is clear, yet, not so simple. Wreak havoc and cull their numbers. I expect you do whatever you see fit to leave none alive.", 
    objectiveText = "Slay 10 Mannoroc Lashers, 10 Searing Infernals and 10 Felguards. Report to Farseer Grimeye.", 
    startNPC = 70027, 
    endNPC = 70027, 
    rewards = { 
        type = "choice", 
        items = { 
            70010, 
            70011 
        } 
    } 
}

Quests[70029] = { 
    name = "What We Know", 
    questLevel = 28, 
    requiredLevel = 25, 
    faction = "Horde", 
    description = "Our grunts found one of these Night Elves stalking about. The deformed creature had a letter on its corpse. I will spare you the disgust I had while trying to decipher that abomination of a language. Above the canyon you should be able to find a Barrow Den, one of the holes these knife-eared mongrels like to dig. Be mindful not to go to the Dor'Danil Barrow Den: The one you seek is found in the ridge. From what I could gather of this piece of paper, a great menace can be found at its lowest level. Find out what's hiding there and return to me as swift as the wind.", 
    objectiveText = "Discover the real menace.", 
    startNPC = 70027, 
    endNPC = 70027 
}

Quests[70030] = { 
    name = "A Very Unpleasant Troll", 
    questLevel = 28, 
    requiredLevel = 25, 
    faction = "Horde", 
    description = "We need to... <the old orc sighs> We will need the help of an old \"friend\" of mine. Nothing beats a Witch Doctor's mojo so I am sending you to Stonetalon. Find Jin'Zil and give him this letter, his mojo is potent enough to shrink the Dreadlord and weaken it enough for you to slay it. However! He will have a task for you, probably something easy and meaningless so don't waste too much time over there, we have a dreadlord to slay.", 
    objectiveText = "Find Jin'Zil and give him the letter from Grimeye.", 
    startNPC = 70027, 
    endNPC = 3995 
}

Quests[70031] = { 
    name = "Jin'Zil's Stew", 
    questLevel = 28, 
    requiredLevel = 25, 
    faction = "Horde", 
    description = "Grimeye wants my mojo to kill a Dreadlord eh? Sure mon, Jin'Zil will help you if you help Jin'Zil, this stew needs more stuff! You bring the stuff and I give you the mojo. I will need some melon juice, dwarven mild, wild hog shank and some soothing spices! Go, Jin'Zil will stir the cauldron and wait for you!", 
    objectiveText = "Collect all ingredients for Jin'Zil's stew.", 
    startNPC = 3995, 
    endNPC = 3995, 
    rewards = { 
        type = "fixed", 
        items = { 
            70009 
        } 
    } 
}

Quests[70032] = { 
    name = "The Good Mojo", 
    questLevel = 29, 
    requiredLevel = 26, 
    faction = "Horde", 
    description = "Here mon take this package and deliver it to Grimeye, Jin'Zil took the liberty of adding more than the mojo you needed for the old cranky orc. Just give him my regards and tell me he still owes me coin from when we rolled in the bones! I am never gonna forget it!", 
    objectiveText = "Deliver the package to Farseer Grimeye.", 
    startNPC = 3995, 
    endNPC = 70027 
}

Quests[70033] = { 
    name = "The Seeker's Demise", 
    questLevel = 30, 
    requiredLevel = 27, 
    faction = "Horde", 
    description = "This is it <name>, your most dangerous task yet, but I am more than sure you will succeed. You showed courage I have not seen in so long, may the ancestors guide your steps and may you return unharmed. You have my blessings and the ancestors at your side. Remember that where you stand a great warrior once stood and you too shall walk in his steps, slay them with pride in your heart!", 
    objectiveText = "Kill Diathorus the Seeker and take his head back to Farseer Grimeye.", 
    startNPC = 70027, 
    endNPC = 70027, 
    rewards = { 
        type = "choice", 
        items = { 
            70012, 
            81290 
        } 
    } 
}

