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
    name =
        "In Search of Thaelrid",

    questLevel = 24,
    requiredLevel = 18,

    faction =
        "Alliance",

    instanceID = 719,

    startNPC = 4786,
    endNPC = 4787,

    objectiveText =
        "Find Argent Guard Thaelrid inside Blackfathom Deeps.",

    summary =
        "Dawnwatcher Shaedlass asks you to locate the missing Argent Dawn scout Thaelrid inside Blackfathom Deeps and assist him.",

    gains = {
        experience = 240,

        reputation = {
            {
                name =
                    "Argent Dawn",

                amount = 150
            },

            {
                name =
                    "Darnassus",

                amount = 150
            }
        }
    }
}

--------------------------------------------------
-- Ignition
--------------------------------------------------

Quests[858] = {
    name =
        "Ignition",

    questLevel = 18,
    requiredLevel = 13,

    faction =
        "Both",

    startNPC = 3439,
    endNPC = 3439,

    objectiveText =
        "Get the Ignition Key and bring it to Wizzlecrank.",

    description =
        "I don't suppose Sputtervalve sent you? I'm in a bind here. I hopped in without realizing that I need a key to unlock the shredder's movement column. One of the other shredder operators asked me if everything was okay, and I panicked! Instead of telling him that I was missing my key, I told him there was some sort of mechanical problem. We need to get out of here on the double. Go up to the control room at the top of the derrick, the supervisor should have a key for this shredder. Help me out here!",

    gains = {
        experience = 140,

        reputation = {
            {
                name =
                    "Ratchet",

                amount = 100
            }
        }
    }
}

--------------------------------------------------
-- The Escape
--------------------------------------------------

Quests[863] = {
    name =
        "The Escape",

    questLevel = 18,
    requiredLevel = 13,

    faction =
        "Both",

    startNPC = 3439,
    endNPC = 3442,

    requires = {
        858
    },

    objectiveText =
        "Protect Wizzlecrank and the stolen goblin shredder on the way to Sputtervalve in Ratchet.",

    description =
        "I suppose I'll learn as we go... Couldn't be too hard. Just some buttons here, and a lever or two... Well, are you ready to go?",

    rewards = {
        type =
            "choice",

        items = {
            5326, -- Flaring Baton
            5327  -- Greasy Tinker's Pants
        }
    },

    gains = {
        experience = 170,

        reputation = {
            {
                name =
                    "Ratchet",

                amount = 150
            }
        }
    }
}

--------------------------------------------------
-- Blackfathom Villainy - Alliance
--------------------------------------------------

Quests[1200] = {
    name =
        "Blackfathom Villainy",

    questLevel = 27,
    requiredLevel = 18,

    faction =
        "Alliance",

    instanceID = 719,

    startNPC = 4787,
    endNPC = 4783,

    objectiveText =
        "Defeat Twilight Lord Kelris and bring his head to Dawnwatcher Selgorm in Darnassus.",

    summary =
        "Thaelrid explains that Twilight's Hammer cultists in Blackfathom Deeps serve Aku'Mai and asks you to end Twilight Lord Kelris' activities.",

    objectives = {
        {
            type =
                "item",

            itemID = 5881,
            amount = 1
        }
    },

    rewards = {
        type =
            "choice",

        items = {
            7001, -- Gravestone Scepter
            7002  -- Arctic Buckler
        }
    },

    gains = {
        experience = 330,

        reputation = {
            {
                name =
                    "Argent Dawn",

                amount = 200
            },

            {
                name =
                    "Darnassus",

                amount = 200
            }
        }
    }
}

--------------------------------------------------
-- Blackfathom Villainy - Horde
--------------------------------------------------

Quests[6561] = {
    name =
        "Blackfathom Villainy",

    questLevel = 27,
    requiredLevel = 18,

    faction =
        "Horde",

    instanceID = 719,

    startNPC = 4787,
    endNPC = 9087,

    objectiveText =
        "Defeat Twilight Lord Kelris and bring his head to Bashana Runetotem in Thunder Bluff.",

    summary =
        "Thaelrid asks you to stop Twilight Lord Kelris and the Twilight's Hammer activity surrounding Aku'Mai in Blackfathom Deeps.",

    objectives = {
        {
            type =
                "item",

            itemID = 5881,
            amount = 1
        }
    },

    rewards = {
        type =
            "choice",

        items = {
            7001, -- Gravestone Scepter
            7002  -- Arctic Buckler
        }
    },

    gains = {
        experience = 330,

        reputation = {
            {
                name =
                    "Argent Dawn",

                amount = 200
            },

            {
                name =
                    "Thunder Bluff",

                amount = 200
            }
        }
    }
}

--------------------------------------------------
-- The People's Militia
--------------------------------------------------

Quests[14] = {
    name =
        "The People's Militia",

    questLevel = 17,
    requiredLevel = 9,

    faction =
        "Alliance",

    startNPC = 234,
    endNPC = 234,

    objectiveText =
        "Gryan Stoutmantle wants you to kill 15 Defias Highwaymen, 5 Defias Pathstalkers and 5 Defias Knuckledusters then return to him on Sentinel Hill.",

    description =
        "Some Defias have eluded us. My most trusted scout reports that these Defias have been looting and pillaging the countryside, all the way into Southern Westfall. We believe they are hiding out in the Dagger Hills, plotting their next move. Slay the wretches in the name of The People's Militia.",

    rewards = {
        type =
            "choice",

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
    name =
        "The Blackwood Corrupted",

    questLevel = 18,
    requiredLevel = 15,

    faction =
        "Alliance",

    startNPC = 3649,
    endNPC = 3649,

    objectiveText =
        "Fill the Empty Cleansing Bowl at the Auberdine Moonwell.",

    description =
        "We've learned that a source of furbolg corruption is from the satyr. They hold sway via talismans that they channel magic through. If the furbolg have a chance at salvation, we must lure out the satyr corruptor and take that talisman! Fill this bowl at our moonwell and take samples of the furbolgs' food from their northern camp. Mix them and place it near the bonfire by the river; any furbolgs who eat will be cleansed just long enough to lure out the satyr corruptor... who then you must slay!",

    rewards = {
        type =
            "choice",

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
    name =
        "The Coastal Menace",

    questLevel = 20,
    requiredLevel = 15,

    faction =
        "Both",

    startNPC = 392,
    endNPC = 392,

    objectiveText =
        "Bring a scale of Old Murk-Eye to Captain Grayson at the Westfall Lighthouse.",

    description =
        "When my life was ended upon the rocks, I had no clue what the afterlife held for me. The Lighthouse was black that night because Old Murk-Eye had scared the keeper's family off. They returned and re-lit the flame but Old Murk-Eye coerced the weaker minded murlocs to raid the Lighthouse with him once again. The second time the family was not so lucky and before my eyes they perished helplessly. Slay Old Murk-Eye if you see him along the shore and bring me one of his scales and I shall reward you.",

    rewards = {
        type =
            "choice",

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
    name =
        "Underground Assault",

    questLevel = 20,
    requiredLevel = 15,

    faction =
        "Alliance",

    instanceID = 1581,
    startNPC = 6579,
    endNPC = 6579,

    objectiveText =
        "Retrieve the Gnoam Sprecklesprocket from the Deadmines and return it to Shoni the Shilent in Stormwind.",

    description =
        "Gnomeregan has fallen under the control of those dastardly troggs! The situation is grave but perhaps you can help, <name>. Deep in the Deadmines is a functional goblin shredder. Find that shredder and bring back the intact power supply. With the shredder's power supply, we can give our gyrodrillmatic excavationators the power they need to break through the rocky underground borders of Gnomeregan, opening the way for a gnomish assault!",

    rewards = {
        type =
            "choice",

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
    name =
        "Beren's Peril",

    questLevel = 21,
    requiredLevel = 16,

    faction =
        "Horde",

    startNPC = 2121,
    endNPC = 2121,

    objectiveText =
        "Locate Beren's Peril, then kill 6 Ravenclaw Drudgers and 6 Ravenclaw Guardians, then return to Shadow Priest Allister at the Sepulcher.",

    description =
        "I have received reports that a group of undead are holing up to prepare for an attack against us. Armed with this information, we can turn the tables and attack them first, nipping their little plan in the bud. Unfortunately, my information is spotty, at best. They are reported to be hiding in a location known as Beren's Peril. The exact location is unknown, but it appears to be a cave in the hills, near a pocket of Dalaran wizards. I trust your resourcefulness. Find them, and put them down.",

    rewards = {
        type =
            "fixed",

        items = {
            5252
        }
    }
}

--------------------------------------------------
-- Deviate Eradication
--------------------------------------------------

Quests[1487] = {
    name =
        "Deviate Eradication",

    questLevel = 21,
    requiredLevel = 15,

    faction =
        "Both",

    instanceID = 43,
    startNPC = 5768,
    endNPC = 5768,

    objectiveText =
        "Ebru in the Wailing Caverns wants you to kill 7 Deviate Ravagers, 7 Deviate Vipers, 7 Deviate Shamblers and 7 Deviate Dreadfangs.",

    description =
        "Naralex had a noble goal. Our great leader aspired to enter the Emerald Dream and help regrow these harsh lands back into the lush forest it once was. But something went terribly wrong. Naralex's dream turned into a nightmare and corrupt creatures began to inhabit the caverns. While some Disciples of Naralex seek to awake our master, my concern is with ridding these caves of the evil beasts. Brave the caverns, <name>, and eradicate the deviate spawn.",

    rewards = {
        type =
            "choice",

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
    name =
        "Retrieval for Mauren",

    questLevel = 26,
    requiredLevel = 17,

    faction =
        "Alliance",

    startNPC = 4078,
    endNPC = 4078,

    objectiveText =
        "Bring 8 Crystalized Scales to Collin Mauren in Stormwind.",

    description =
        "Travelers keep asking me about the Stonetalon Mountains. It seems to be a popular place for adventure--it doesn't matter if you're seeking wyvern, elementals, or you have business with the Venture Co. Within the Charred Vale, deep in Stonetalon, there used to be a species of basilisks whose scales, when ground to dust, made a wonderful reagent for some spells I've created. If those basilisks still live, I would love to have a few of their scales. Take your time, it is no rush, but I can pay well.",

    rewards = {
        type =
            "fixed",

        items = {
            6677
        }
    }
}

--------------------------------------------------
-- Isha Awak
--------------------------------------------------

Quests[873] = {
    name =
        "Isha Awak",

    questLevel = 27,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3388,
    endNPC = 3388,

    objectiveText =
        "Bring the Heart of Isha Awak to Mahren Skyseer.",

    description =
        "The grand Isha Awak is lord of these waters. Great is his strength, and solemn his pride. The humans on the coast fear him, for he has consumed many of their number. But I do not fear him. I am grateful he is here. He is a worthy challenge, and honorable prey. If you are ready, then swim out and search for Isha Awak, the Deep Doom. His spirit dwells in his heart, and to hear its beat is to know your fate.",

    rewards = {
        type =
            "choice",

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
    name =
        "Ormer's Revenge",

    questLevel = 29,
    requiredLevel = 22,

    faction =
        "Alliance",

    startNPC = 1078,
    endNPC = 1078,

    objectiveText =
        "Ormer Ironbraid at the Whelgar Excavation Site wants you to kill Sarltooth and return to him with one of his talons once the task is fulfilled.",

    description =
        "While you were down there I happened to notice that one of those beasts stood out from the rest. He was bigger and more menacing. I bet he's the one who led the others here to cause the disruption to the dig site. I ask of you now one final task, <name>. See to it that Sarltooth is brought to justice. And considering the gravity of his crimes, justice in this case means death! Bring me one of his talons as proof of his death.",

    rewards = {
        type =
            "choice",

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
    name =
        "Worgen in the Woods",

    questLevel = 31,
    requiredLevel = 23,

    faction =
        "Alliance",

    startNPC = 663,
    endNPC = 661,

    objectiveText =
        "Bring Calor's note to Jonathan Carevin.",

    description =
        "Here you go, <name>. Bring this message to Master Carevin. <He quickly removes a piece of faded parchment and offers it to you.> A few more like you, and we will outnumber the Night Watch! Perhaps then we could complete the work that we few carry on today.",

    rewards = {
        type =
            "choice",

        items = {
            2902,
            1547
        }
    }
}

--------------------------------------------------
-- Answered Questions
--------------------------------------------------

Quests[1044] = {
    name =
        "Answered Questions",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 661,
    endNPC = 8026,

    objectiveText =
        "Return to Thyn'tel Bladeweaver in Darnassus.",

    description =
        "We shall rein in the worgen problem, have no worry of that. This evil that your friend introduced to our woods will be contained, and I bear her no ill will for her actions. Strange events are afoot in these times, <name>, and the darkness knows no respite. I will keep you no longer. I suspect that there are others that should hear of what you have found in the mines of Duskwood.",

    rewards = {
        type =
            "choice",

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
    name =
        "Dangerous!",

    questLevel = 28,
    requiredLevel = 19,

    faction =
        "Horde",

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

    objectiveText =
        "High Executor Darthalia of Tarren Mill is offering a bounty on Clerk Horrace Whitesteed, Citizen Wilkes, Miner Hackett and Farmer Kalaba.",

    description =
        "Dangerous! The following humans of Hillsbrad have been deemed dangerous and are marked for bounty by High Executor Darthalia: Clerk Horrace Whitesteed. Wanted for the murder of Deathguard Toma. Citizen Wilkes. Wanted for the murder of Apothecary Eli. Miner Hackett. Wanted for the murder of Deathstalker Fry. Farmer Kalaba. Wanted for the ambush of supplies from the Undercity. All of these enemies are hiding and will be hard to find. A reward will be granted upon notice of their death.",

    rewards = {
        type =
            "choice",

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
    name =
        "Final Passage",

    questLevel = 36,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 4488,
    endNPC = 2986,

    objectiveText =
        "Speak to Dorn Plainstalker in Thousand Needles.",

    description =
        "You have done well, <name>. You have passed my test, and the tests before mine. Return to Dorn in Thousand Needles. He will sense the change within you, and see that your mind, body and spirit are strong enough that you should be rewarded for your efforts. Stay true to the balance you've shown throughout these trials, <name>. Dorn will test you again in the future if you do.",

    rewards = {
        type =
            "choice",

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
    name =
        "Claim Rackmore's Treasure!",

    questLevel = 36,
    requiredLevel = 30,

    faction =
        "Both",

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

    objectiveText =
        "Find Rackmore's Silver Key. Find Rackmore's Golden Key. Find and open Rackmore's Chest.",

    description =
        "Rackmore's log tells of how his ship was sailing for Feathermoon Stronghold when it was attacked by seafaring creatures. To prevent his treasure from falling into enemy hands, he hid his chest on Ranazjar Isle. To open the chest requires two keys, a silver and a gold. These keys were lost, but if the keys and the chest are found, a treasure awaits!",

    rewards = {
        type =
            "fixed",

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
    name =
        "Wanted! Otto and Falconcrest",

    questLevel = 40,
    requiredLevel = 30,

    faction =
        "Alliance",

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

    objectiveText =
        "Bring Otto's Head and Falconcrest's Head to Captain Nials at Refuge Pointe.",

    description =
        "The Stromgarde Militia has placed bounties on the heads of Lord Falconcrest, and his bodyguard Otto. Falconcrest heads the Syndicate's efforts in the Arathi Highlands, and his death would cause a major disruption in those efforts. His bodyguard Otto, although not a strategic target, is a fierce opponent and has killed dozens of our defenders. Their bounties may be collected from Captain Nials.",

    rewards = {
        type =
            "choice",

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
    name =
        "Crushridge Warmongers",

    questLevel = 40,
    requiredLevel = 30,

    faction =
        "Alliance",

    startNPC = 2263,
    endNPC = 2263,

    objectiveText =
        "Slay 15 Crushridge Warmongers, then return to Marshal Redpath in Southshore.",

    description =
        "Now that you've had a taste of the Crushridge ogres, I want you to really bloody their noses... Go into the Ruins of Alterac and seek out the Crushridge Warmongers. I want you to cut down a good number of them - that's the only way those brutes will learn to keep their distance from Alliance territory.",

    rewards = {
        type =
            "choice",

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
    name =
        "Pearl Diving",

    questLevel = 37,
    requiredLevel = 30,

    faction =
        "Both",

    startNPC = 2817,
    endNPC = 2817,

    objectiveText =
        "Bring 9 Blue Pearls to Rigglefuzz in the Badlands.",

    description =
        "The Badlands is a harsh place, filled with vicious predators and bold scavengers. Scary, especially for a short little goblin. To survive, I have to be tricky! I know the recipe for flash bombs. I use those to scare away wildlife. But I'm running low on one of the ingredients: crushed blue pearl powder. Get me some and I'll make it worth your efforts. Heh, and I hope you have good boots on. The Blue Pearls I need are found from clams at the Vile Reef. Yep, the Vile Reef in Stranglethorn!",

    rewards = {
        type =
            "choice",

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
    name =
        "Questioning Reethe",

    questLevel = 37,
    requiredLevel = 30,

    faction =
        "Horde",

    startNPC = 4983,
    endNPC = 4926,

    objectiveText =
        "Go with Ogron to speak with Reethe, then return to Krog in Brackenwall Village.",

    description =
        "It took a long time, but I found Reethe. He hide good for a human. Ogron worried that he might be crazy after so much time in swamp. You come with me for we go get answers from him.",

    rewards = {
        type =
            "choice",

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
    name =
        "Gizelton Caravan",

    questLevel = 38,
    requiredLevel = 32,

    faction =
        "Both",

    startNPC = 11626,
    endNPC = 11596,

    objectiveText =
        "Escort the Gizelton Caravan through Mannoroc Coven. Talk with Smeed at Scrabblescrew's Camp for your reward.",

    description =
        "You look like a capable <race>. Perhaps you're looking to make some money? Cork and I started this caravan to make a bundle of money; little did we know the dangers of turning a buck! Up ahead is Mannoroc Coven... normally the demons ignore us but something has the kodos spooked this time. I'll pay you to protect the caravan past Mannoroc Coven. Once we are safely past you can receive your reward from our business associate Smeed at Scrabblescrew's Camp.",

    rewards = {
        type =
            "choice",

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
    name =
        "Sunken Treasure",

    questLevel = 40,
    requiredLevel = 35,

    faction =
        "Both",

    startNPC = 2774,
    endNPC = 2774,

    objectiveText =
        "Doctor Draxlegauge in Faldir's Cove wants you to collect 10 Elven Gems and return the Goggles of Gem Hunting once you are done.",

    description =
        "The treasure has been on the sea floor so long that the gems have calcified into thick stone. But the power harnessed in these goggles will allow you to locate them easily. A little gnomish ingenuity goes a long way! So borrow the Goggles of Gem Hunting, <name>, and see if you can collect some of the lost treasure for Captain O'Breen. I'd swim down there myself but...um...well, I have important scientific business to tend to up on the safe, dry land....er, yeah.",

    rewards = {
        type =
            "choice",

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
    name =
        "Venture Company Mining",

    questLevel = 41,
    requiredLevel = 30,

    faction =
        "Both",

    startNPC = 2498,
    endNPC = 2498,

    objectiveText =
        "Bring 10 Singing Blue Crystals to Crank Fizzlebub in Booty Bay.",

    description =
        "The Venture Company has a string of operations through Stranglethorn which keeps hard-working goblins, like me, from making honest gold! Please, you must help me! The Venture Company is mining near the Crystalvein Mine to the north. They can't get into the mine because of all the basilisks, but they're still able to dig up Singing Crystals from the surrounding hills. Take their crystals from them, and show them they don't have the run of the jungle. And... um... bring me those crystals as proof!",

    rewards = {
        type =
            "choice",

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
    name =
        "The Morrow Stone",

    questLevel = 50,
    requiredLevel = 42,

    faction =
        "Alliance",

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

    objectiveText =
        "Return the Sparkling Stone and the Stave of Equinex to Troyas Moonbreeze in Feathermoon Stronghold.",

    description =
        "The moment the artifact is removed from the Monolith, you feel the energy in the Stave of Equinex begin to fade.",

    rewards = {
        type =
            "choice",

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
    name =
        "Ledger from Tanaris",

    questLevel = 46,
    requiredLevel = 43,

    faction =
        "Both",

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

    objectiveText =
        "Take the copy of Goodsteel's Ledger and then find the items listed in it before seeking Krinkle Goodsteel in Tanaris.",

    description =
        "Oh, you know what? That reminds me. You wanna finish up a little job I took up while I was in Tanaris? It's easy... Krinkle Goodsteel in Gadgetzan was lookin' for some stuff found here in Searing Gorge and a few other places. Maybe you could take a look at the list and then bring it all to him? I'll just slide his ledger under the door if you're interested. Take that, and the stuff he wants back to him after ya collected it all.",

    rewards = {
        type =
            "choice",

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
    name =
        "Dark Vessels",

    questLevel = 50,
    requiredLevel = 46,

    faction =
        "Horde",

    instanceID = 47,
    startNPC = 14736,
    endNPC = 14736,

    objectiveText =
        "Primal Torntusk at Revantusk Village in the Hinterlands wants you to recover 10 Vessels of Tainted Blood from Jintha'alor. Return to Primal Torntusk when this task is complete.",

    description =
        "The Vilebranch fight with supernatural ferocity. This is due to the foul magical weavings of the Vile Priestess Hexx. Throughout Jintha'alor you will find dark vessels of tainted blood. The vessels radiate the foul magic of the faceless blood God, empowering the Vilebranch and also driving them to madness. Steal those vessels and return them to me so that I may remove the taint and ultimately loosen the grip of the blood God.",

    rewards = {
        type =
            "fixed",

        items = {
            19118
        }
    }
}

--------------------------------------------------
-- When Smokey Sings, I Get Violent
--------------------------------------------------

Quests[6041] = {
    name =
        "When Smokey Sings, I Get Violent",

    questLevel = 58,
    requiredLevel = 54,

    faction =
        "Both",

    startNPC = 11033,
    endNPC = 11033,

    objectiveText =
        "Travel to Plaguewood, northwest of Light's Hope. Destroy 8 Scourge Structures by using Smokey's Special Compound at the Mark of Detonation planted inside each building. Smokey has had the Ziggurats and Slaughterhouses marked.",

    description =
        "While you were gathering the supplies, I had some of my people handle marking the Scourge buildings we need demolished. Here's the plan: I'm going to give you ten sticks of my special compound. You're going to take them over to Plaguewood and plant them inside the Scourge structures that I've had marked for detonation. <Smokey snaps his fingers.> Bing! It's just that easy.",

    rewards = {
        type =
            "choice",

        items = {
            16992,
            16993
        }
    }
}
