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

--------------------------------------------------
-- Ormer's Revenge (1)
--------------------------------------------------

Quests[294] = {
    name =
        "Ormer's Revenge",

    questLevel = 24,
    requiredLevel = 22,

    faction =
        "Alliance",

    startNPC = 1078,
    endNPC = 1078,

    objectiveText =
        "Ormer Ironbraid at the Whelgar Excavation Site wants you to kill 10 Mottled Screechers and 10 Mottled Raptors.",

    description =
        "The situation is severe, that much is for sure. When we uncovered these bones it attracted the Raptors. These filthy beasts killed my brethren and trapped me, Merrin and the poor Prospector up here. Help clear the Wetlands of these Raptors, <name>. Mottled Raptors and Mottled Screechers are just West of the bluff there. Kill 10 of each, if you can. That will be a good start to the vengeance I have planned for them."
}

--------------------------------------------------
-- Ormer's Revenge (2)
--------------------------------------------------

Quests[295] = {
    name =
        "Ormer's Revenge",

    questLevel = 27,
    requiredLevel = 22,

    faction =
        "Alliance",

    startNPC = 1078,
    endNPC = 1078,

    objectiveText =
        "Ormer Ironbraid wants you to kill 10 Mottled Scytheclaw raptors and 10 Mottled Razormaw raptors then return to him at the Whelgar Excavation Site.",

    description =
        "Now it's time to really make those dreaded Raptors regret their blood-thirst. Just down below there are scores of Mottled Scytheclaws and Mottled Razormaws. Make those rotten creatures pay by slaying 10 of each!"
}

--------------------------------------------------
-- Worgen in the Woods (1)
--------------------------------------------------

Quests[173] = {
    name =
        "Worgen in the Woods",

    questLevel = 28,
    requiredLevel = 23,

    faction =
        "Alliance",

    startNPC = 663,
    endNPC = 663,

    objectiveText =
        "Kill 6 Nightbane Shadow Weaver worgen for Calor in Darkshire.",

    description =
        "Darkness seems drawn inexorably to Duskwood. Master Carevin's quest is the expulsion of evil and heresy. Through our efforts are the people of Darkshire kept safe. You believe yourself worthy to join us? I once thought as you. Disillusioned by the complacency of the Watch, I joined Master Carevin. If you wish to prove yourself, it will not be through words. Test your skills against the Nightbane Shadow Weaver worgen in Brightwood Grove--bright, hah!--and the Rotting Orchard."
}

--------------------------------------------------
-- Worgen in the Woods (2)
--------------------------------------------------

Quests[221] = {
    name =
        "Worgen in the Woods",

    questLevel = 29,
    requiredLevel = 23,

    faction =
        "Alliance",

    startNPC = 663,
    endNPC = 663,

    objectiveText =
        "Kill 12 Nightbane Dark Runner worgen for Calor in Darkshire.",

    description =
        "You might have noticed some larger worgen wandering around with the Shadow Weavers in the woods? From what we can tell, these Dark Runners make up the bulk of the worgen numbers. On my rangings, I've also noticed that they have overrun the Rotting Orchard southwest of town. These worgen are a bit tougher than the last you faced. Be on your guard."
}

--------------------------------------------------
-- Worgen in the Woods (3)
--------------------------------------------------

Quests[222] = {
    name =
        "Worgen in the Woods",

    questLevel = 31,
    requiredLevel = 23,

    faction =
        "Alliance",

    startNPC = 663,
    endNPC = 663,

    objectiveText =
        "Kill 8 Nightbane Vile Fang and 8 Nightbane Tainted One worgen for Calor in Darkshire.",

    description =
        "Your previous accomplishments have convinced me that you are ready to take on the toughest worgen infesting the woods. Of the worgen that have made their new home here, the Vile Fangs and the Tainted Ones have proven the most dangerous. They've settled down near some of the caves and in the mine to the south. From far away you can even see the light from their bonfires..."
}

--------------------------------------------------
-- Crushridge Bounty
--------------------------------------------------

Quests[500] = {
    name =
        "Crushridge Bounty",

    questLevel = 36,
    requiredLevel = 30,

    faction =
        "Alliance",

    startNPC = 2263,
    endNPC = 2263,

    objectiveText =
        "Gather 9 Dirty Knucklebones from Crushridge ogres in the Alterac Mountains. Bring them to Marshal Redpath in Southshore.",

    description =
        "Crushridge ogres have dug an ogre mound up in the Alterac Mountains near the ruined city of Alterac. And my scouts tell me they've taken over those ruins as well. We can't let them get cozy up there; if they think they're safe where they are, then their next step will be to move down into the foothills, which will put them right at our front door! Go north to the Alterac Mountains and hunt ogres. Bring me the Dirty Knucklebones they carry and you will earn a nice bounty."
}

--------------------------------------------------
-- Sunken Treasure (1)
--------------------------------------------------

Quests[665] = {
    name =
        "Sunken Treasure",

    questLevel = 40,
    requiredLevel = 35,

    faction =
        "Both",

    startNPC = 2768,
    endNPC = 2774,

    objectiveText =
        "Escort Professor Phizzlethorpe to the cave and back.",

    description =
        "Now that we are full-fledged Blackwater Raiders it is our job to help Mr. O'Breen locate the lost elven treasure. It is next to impossible to find the gems in the dark sea without aid. The doctor has constructed some goggles that will help. He needs the goggles charged with the energy derived from the enchanted stone in the cave just up the hill. But the cave is cursed! When we get close, we get ambushed. Defend me and I can harness the energy from the stone into the goggles."
}

--------------------------------------------------
-- Caught!
--------------------------------------------------

Quests[4449] = {
    name =
        "Caught!",

    questLevel = 45,
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

    objectiveText =
        "Kill 8 Dark Iron Geologists and bring 15 pieces of Silk Cloth to the person locked in the outhouse in Searing Gorge.",

    description =
        "Hey! Hey, you! Get over here! Ya gotta help me out. I was runnin' from them Dark Iron dwarves, and I hid in here to get out of sight. Damn bastard geologists and their magic ways! They musta seen me hide, cause next thing I knew, they locked the door and stuck me in here. Teach them geologists a lesson! Oh... an' can ya get me some pieces of silk cloth for... for... nothin'."
}

--------------------------------------------------
-- That's Asking A Lot
--------------------------------------------------

Quests[6026] = {
    name =
        "That's Asking A Lot",

    questLevel = 58,
    requiredLevel = 54,

    faction =
        "Both",

    startNPC = 11033,
    endNPC = 11033,

    objectiveText =
        "Smokey LaRue wants you to get 2 Thorium Bars, 1 Golden Rod, 8 Hi-Explosive Bombs, and 8 Unstable Triggers.",

    description =
        "These here Argent Dawn people commissioned ol' Smokey to do a little demolition work for 'em. Smokey's mammy ain't raised no dummy. When gold coin is slapped on the table, Smokey's services are available. That's my motto! Now I'd be willing to split the commission with you if you're willing to do a little legwork. Here's the deal: I'm going to head over to Plaguewood and mark the buildings we need destroyed. You gather the components for the bombs. Meet back here when you've got everything. Deal?"
}

--------------------------------------------------
-- The Howling Vale
--------------------------------------------------

Quests[1022] = {
    name =
        "The Howling Vale",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 3880,
    endNPC = 3880,

    objectiveText =
        "Go to the Howling Vale and study the Tome of Mel'Thandris, then return to Sentinel Melyria Frostshadow at the Shrine of Aessina.",

    description =
        "Though we have put many resources and much effort into driving the remaining demons from the Felwood to the north, our successes have been few. We have been able to keep much of the demonic presence from Ashenvale. To the north, near the Felwood border, the ruined shrine of Mel'Thandris has been overtaken by mysterious wolf-men. Their chilling calls have led the area to be known as the Howling Vale. The Tome of Mel'Thandris kept at the shrine may shed some light on why these wolf-men have come."
}

--------------------------------------------------
-- Velinde Starsong
--------------------------------------------------

Quests[1037] = {
    name =
        "Velinde Starsong",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 3880,
    endNPC = 8026,

    objectiveText =
        "Speak with Thyn'tel Bladeweaver at the Warrior's Terrace in Darnassus.",

    description =
        "Velinde Starsong was my predecessor here in Ashenvale Forest. At first it seemed she had the situation in Felwood under control, but little by little her efforts faltered. One day, she simply disappeared. I was sent here to continue her work. I'm afraid I know nothing of the priestess, however. Perhaps Thyn'tel Bladeweaver, one of the commanders of the Sentinels, knows further details of her disappearance that I was not a party to. Surely she will understand the import of such information."
}

--------------------------------------------------
-- Velinde's Effects
--------------------------------------------------

Quests[1038] = {
    name =
        "Velinde's Effects",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 8026,
    endNPC = 8026,

    objectiveText =
        "Search through Velinde's chest for her journal, then return it along with the key to Thyn'tel Bladeweaver in Darnassus.",

    description =
        "The Tome of Mel'Thandris showed you this? I suppose there would be little harm in allowing you to examine her belongings. This key will allow you to open the chest where we stored her things in the Sentinels' bunkhouse. She kept a journal of her duties, if there is anything to be learned, it will be from that. I should tell you, the Sentinels believe that she had her own reasons for leaving, and expect that she could return at any time. The priestess has done much in the past to earn our trust."
}

--------------------------------------------------
-- The Barrens Port
--------------------------------------------------

Quests[1039] = {
    name =
        "The Barrens Port",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 8026,
    endNPC = 3453,

    objectiveText =
        "Speak with Wharfmaster Dizzywig in Ratchet.",

    description =
        "Ratchet is the only port in the Barrens. Most likely Velinde found a trading vessel in Ratchet to take her to Blackwater Cove in Azeroth. We've had limited dealings with the goblins that run the port, but the master of the dock should have information about the comings and goings of ship passengers. Follow the road southeast through Ashenvale and you will find yourself in the Barrens. Watch your step, <name>, warriors of the Horde patrol the land. You will be safe at the port, though."
}

--------------------------------------------------
-- Passage to Booty Bay
--------------------------------------------------

Quests[1040] = {
    name =
        "Passage to Booty Bay",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 3453,
    endNPC = 3945,

    objectiveText =
        "Take a boat to Booty Bay and speak with Caravaneer Ruzzgot.",

    description =
        "Ah yes, finally found it. Should have told me she passed through here that long ago. Let's see. Velinde. Booked passage to Booty Bay on the Black Osprey. I don't have anything here saying otherwise, so I'd assume it arrived in port safely. Not much more help I can be to you, but she asked about overland travel over on that side of the world, and I mentioned Ruzzgot, a caravan driver based out of Booty Bay. Might be that this Velinde traveled with him. Move along, now. I haven't all day for you."
}

--------------------------------------------------
-- The Caravan Road
--------------------------------------------------

Quests[1041] = {
    name =
        "The Caravan Road",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 3945,
    endNPC = 267,

    objectiveText =
        "Speak with Clerk Daltry in Darkshire.",

    description =
        "Turns out I was wrong about you, and that isn't something that happens everyday. It just so happens that I remember this Velinde you're looking for. Isn't every day that a night elf priestess that wants to travel with a dirty old--but great for your shipping needs!--caravan like my own. We split up on the way north, she was headed for Darkshire. The clerk there keeps all sorts of records. Might know something useful. Be careful in the jungle, it is a deadly place even at the best of times."
}

--------------------------------------------------
-- The Carevin Family
--------------------------------------------------

Quests[1042] = {
    name =
        "The Carevin Family",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 267,
    endNPC = 661,

    objectiveText =
        "Speak with Jonathan Carevin in Darkshire.",

    description =
        "No, I don't have any records of a Velinde Starsong staying in Darkshire... though, if you don't mind me saying, I can hardly imagine a night elf priestess taking a room in the inn, if you get my meaning? These wolf-men you mentioned though, that's something I've heard about. Just the other day, Calor came into town with a string of their heads. He works with the Carevin family. Hunters of demons, undead, and other monstrosities. Speak with Jonathan, he's the head of the household."
}

--------------------------------------------------
-- The Scythe of Elune
--------------------------------------------------

Quests[1043] = {
    name =
        "The Scythe of Elune",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Alliance",

    startNPC = 661,
    endNPC = 661,

    objectiveText =
        "Look for signs of the Scythe of Elune then return to Jonathan Carevin in Darkshire.",

    description =
        "Your story rings true... I do not entirely understand your motives, but if your business here in Duskwood involves ridding the forest of worgen in any number, then I can forgo understanding for results. There is a mine to the south that has been overrun with worgen... They appeared out of nowhere, but from what we know, that is where they first were found. Go about your business, but I would ask that if you find anything of import, you share it with me. We will accept any aid in our war against evil."
}

--------------------------------------------------
-- In Search of Knowledge
--------------------------------------------------

Quests[2939] = {
    name =
        "In Search of Knowledge",

    questLevel = 47,
    requiredLevel = 42,

    faction =
        "Alliance",

    startNPC = 7764,
    endNPC = 7907,

    objectiveText =
        "Talk to Daryn Lightwind in Rut'theran Village.",

    description =
        "While the ruins of Feralas can be quite dangerous, they have much to tell of what has happened here. Searching through the rubble to the south a few days ago, I discovered what appears to be a normal stave. However, I just can't shake the feeling that there is something more to it. Angelas and I have been poring over our books here, but we can't find a thing about it. I have a colleague in Darnassus that may be able to tell us what this is, <name>. Why don't you go talk to her and see if she can help us?"
}

--------------------------------------------------
-- Feralas: A History
--------------------------------------------------

Quests[2940] = {
    name =
        "Feralas: A History",

    questLevel = 47,
    requiredLevel = 42,

    faction =
        "Alliance",

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

    objectiveText =
        "Ask Daryn Lightwind if you may borrow her book.",

    description =
        "This book looks as if no one has opened it for quite a long time. Its covers are quite worn, and its pages yellowed, but after examining it, you notice that it might be just what Troyas is looking for. You pick it up, but realize you should probably ask before borrowing it."
}

--------------------------------------------------
-- The Borrower
--------------------------------------------------

Quests[2941] = {
    name =
        "The Borrower",

    questLevel = 48,
    requiredLevel = 42,

    faction =
        "Alliance",

    startNPC = 7907,
    endNPC = 7763,

    objectiveText =
        "Take the letter to Curgle Cranklehop in Tanaris.",

    description =
        "I have studied many subjects in my time, and my latest fascination is with the snapjaw that occupy the beach in the Hinterlands. There's one in particular I'd like to see, a giant snapjaw named Gammerita. I'd like to go myself, but my research keeps me here. I think a picture of her would be the next best thing. Take this letter to Curgle Cranklehop in Tanaris. She has created an invention for me that can capture a picture. She called it a \"snapshot,\" I think..."
}

--------------------------------------------------
-- The Super Snapper FX
--------------------------------------------------

Quests[2944] = {
    name =
        "The Super Snapper FX",

    questLevel = 48,
    requiredLevel = 42,

    faction =
        "Alliance",

    startNPC = 7763,
    endNPC = 7907,

    objectiveText =
        "Use the Super Snapper FX to take a snapshot of Gammerita, then return to Daryn Lightwind in Rut'theran Village.",

    description =
        "Have the first look at my new invention, <name>. All you need to do is target whatever it is you'd like to take a picture of, and push the button. What was that creature from the Hinterlands that you mentioned? Gammerita? Well, good luck finding her. I'm sure Daryn will be quite pleased with the snapshot you return to her. In any case, here's the Super Snapper. Have fun!"
}

--------------------------------------------------
-- Return to Troyas
--------------------------------------------------

Quests[2943] = {
    name =
        "Return to Troyas",

    questLevel = 48,
    requiredLevel = 42,

    faction =
        "Alliance",

    startNPC = 7907,
    endNPC = 7764,

    objectiveText =
        "Deliver the book to Troyas Moonbreeze in Feathermoon Stronghold.",

    description =
        "Here it is, <name>. Please, take care of my book. Now, hurry along. I'm sure Troyas is eager for your return."
}

--------------------------------------------------
-- The Stave of Equinex
--------------------------------------------------

Quests[2879] = {
    name =
        "The Stave of Equinex",

    questLevel = 50,
    requiredLevel = 42,

    faction =
        "Alliance",

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

    objectiveText =
        "Energize Troyas' Stave and find the Equinex Monolith.",

    description =
        "This stave might be the Stave of Equinex! The Stave of Equinex is actually a key, used to unlock the Equinex Monolith in the Ruins of Ravenwind, on the mainland west of the Dream Bough. Find the four flames that still burn in those ruins: Samha, Imbel, Byltan, and Lahassa. Retrieve their essence and then while standing by the Equinex Monolith, use the essences to energize the stave. If this is truly is the Stave of Equinex, you will be able to unlock the Monolith and gather a sacred artifact from it.",

    rewards = {
        type =
            "fixed",

        items = {
            9307
        }
    }
}

--------------------------------------------------
-- The People's Militia (1)
--------------------------------------------------

Quests[12] = {
    name =
        "The People's Militia",

    questLevel = 12,
    requiredLevel = 9,

    faction =
        "Alliance",

    startNPC = 234,
    endNPC = 234,

    objectiveText =
        "Gryan Stoutmantle wants you to kill 15 Defias Trappers and 15 Defias Smugglers then return to him on Sentinel Hill.",

    description =
        "The People's Militia has but one goal: To defend the lands of Westfall and return peace to our surroundings. Unfortunately, the price of peace is often blood. One of my scouts has brought word of a band of Defias Trappers wreaking havoc nearby. I have reports of Defias Trapper sightings near the Jangolode Mine to the Northwest as well as at the Molsen Farm and Furlbrow's Pumpkin Farm. If you seek to join our ranks, slay 15 Defias Trappers and 15 Defias Smugglers then return to me."
}

--------------------------------------------------
-- The People's Militia (2)
--------------------------------------------------

Quests[13] = {
    name =
        "The People's Militia",

    questLevel = 14,
    requiredLevel = 9,

    faction =
        "Alliance",

    startNPC = 234,
    endNPC = 234,

    objectiveText =
        "Gryan Stoutmantle wants you to kill 15 Defias Pillagers and 15 Defias Looters and return to him on Sentinel Hill.",

    description =
        "A band of vicious Defias Pillagers has been seen plundering the Gold Coast Quarry, Moonbrook and the Alexston Farmstead. The People's Militia will not stand for such behavior. Dispatch immediately, <name>, and make the Light's presence known in Westfall. The Gold Coast Quarry is near the shore, to the West of the tower. As the next step of your training, I want you to kill 15 of those foul Defias Pillagers and 15 Defias Looters."
}

--------------------------------------------------
-- How Big a Threat?
--------------------------------------------------

Quests[984] = {
    name =
        "How Big a Threat?",

    questLevel = 14,
    requiredLevel = 10,

    faction =
        "Alliance",

    startNPC = 3693,
    endNPC = 3693,

    objectiveText =
        "Find a corrupt furbolg camp in Darkshore and return to Terenthis in Auberdine.",

    description =
        "Some of my brethren were rescued from a corrupt furbolg in Teldrassil, and I've vowed to stop any more atrocities before more of our kind are injured... or worse. I have seen a couple hints of corruption in Darkshore already, but I have yet to find any widespread signs. I think it would be logical if the investigation continued with the furbolgs. Would you find one of their camps, and return to me if you see any signs of corruption?"
}

--------------------------------------------------
-- Thundris Windweaver
--------------------------------------------------

Quests[4761] = {
    name =
        "Thundris Windweaver",

    questLevel = 15,
    requiredLevel = 11,

    faction =
        "Alliance",

    startNPC = 3693,
    endNPC = 3649,

    objectiveText =
        "Speak with Thundris Windweaver in Auberdine.",

    description =
        "Your scouting of the furbolg camp is information that Thundris Windweaver should be made aware of. He graciously serves as the elder of Auberdine, offering sage and just stewardship of the day to day affairs of the village. Please - share with him your findings to date on the furbolg situation. I believe he has some ideas of his own on the reasons behind their corruption. Perhaps you can work with him to enact a plan to restore the balance of nature here!"
}

--------------------------------------------------
-- The Cliffspring River
--------------------------------------------------

Quests[4762] = {
    name =
        "The Cliffspring River",

    questLevel = 15,
    requiredLevel = 11,

    faction =
        "Alliance",

    startNPC = 3649,
    endNPC = 3649,

    objectiveText =
        "Travel north of Auberdine to the first waterfall along the Cliffspring River and draw a sample from the pool there.",

    description =
        "The Cliffspring River has begun turning foul and corrupted. It empties into the Mist's Edge, and I fear the wash will affect Auberdine soon. I suspect the Blackwood furbolgs up-river are the cause of the taint, but I also suspect that they aren't the true root of it. Take this sampling tube and go to the mouth of the river to our north. Proceed inland to the first waterfall and draw a sample from the pool there. You'll see a bridge overhead. Once you have a sample, return to me in Auberdine."
}

--------------------------------------------------
-- Speak with Shoni
--------------------------------------------------

Quests[2041] = {
    name =
        "Speak with Shoni",

    questLevel = 15,
    requiredLevel = 15,

    faction =
        "Alliance",

    startNPC = 6569,
    endNPC = 6579,

    objectiveText =
        "Speak with Shoni the Shilent in Stormwind.",

    description =
        "Perhaps... Perhaps you can help us in the battle for Gnomeregan. In Stormwind you will find the commander of our underground assault crew, Shoni the Shilent. Shoni needs assistance with her gyrodrillmatic excavationators. You will probably find her amongst the dwarves in Stormwind. Good luck, <name>."
}

--------------------------------------------------
-- Branding Rod - Sergra Darkthorn chain
--------------------------------------------------

Quests[860] = {
    name =
        "Sergra Darkthorn",

    questLevel = 10,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3441,
    endNPC = 3338,

    objectiveText =
        "Speak with Sergra Darkthorn at the Crossroads.",

    description =
        "Speak with Sergra Darkthorn at the Crossroads."
}

Quests[844] = {
    name =
        "Plainstrider Menace",

    questLevel = 12,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3338,
    endNPC = 3338,

    objectiveText =
        "Collect 7 Plainstrider Beaks and return them to Sergra Darkthorn in the Crossroads.",

    description =
        "Collect 7 Plainstrider Beaks and return them to Sergra Darkthorn in the Crossroads."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5087,
            amount = 1
        }
    }
}

Quests[845] = {
    name =
        "The Zhevra",

    questLevel = 13,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3338,
    endNPC = 3338,

    objectiveText =
        "Slay Zhevra Runners to collect 4 Zhevra Hooves for Sergra Darkthorn in the Crossroads.",

    description =
        "Slay Zhevra Runners to collect 4 Zhevra Hooves for Sergra Darkthorn in the Crossroads."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5086,
            amount = 1
        }
    }
}

Quests[903] = {
    name =
        "Prowlers of the Barrens",

    questLevel = 15,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3338,
    endNPC = 3338,

    objectiveText =
        "Collect 7 Prowler Claws from Savannah Prowlers for Sergra Darkthorn in the Crossroads.",

    description =
        "Collect 7 Prowler Claws from Savannah Prowlers for Sergra Darkthorn in the Crossroads."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5096,
            amount = 1
        }
    }
}

Quests[881] = {
    name =
        "Echeyakee",

    questLevel = 16,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3338,
    endNPC = 3338,

    objectiveText =
        "Bring Echeyakee's Hide to Sergra Darkthorn at the Crossroads.",

    description =
        "Bring Echeyakee's Hide to Sergra Darkthorn at the Crossroads."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5100,
            amount = 1
        }
    }
}

Quests[905] = {
    name =
        "The Angry Scytheclaws",

    questLevel = 17,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3338,
    endNPC = 3338,

    objectiveText =
        "Kill Sunscale raptors and collect their feathers. Use the feathers on the 3 Scytheclaw nests. Return to Sergra Darkthorn in the Crossroads.",

    description =
        "Kill Sunscale raptors and collect their feathers. Use the feathers on the 3 Scytheclaw nests. Return to Sergra Darkthorn in the Crossroads."
}

Quests[3261] = {
    name =
        "Jorn Skyseer",

    questLevel = 18,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3338,
    endNPC = 3387,

    objectiveText =
        "Speak with Jorn Skyseer at Camp Taurajo.",

    description =
        "Speak with Jorn Skyseer at Camp Taurajo."
}

Quests[882] = {
    name =
        "Ishamuhale",

    questLevel = 19,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3387,
    endNPC = 3387,

    objectiveText =
        "Bring Ishamuhale's Fang to Jorn at Camp Taurajo.",

    description =
        "Bring Ishamuhale's Fang to Jorn at Camp Taurajo."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5101,
            amount = 1
        }
    }
}

Quests[907] = {
    name =
        "Enraged Thunder Lizards",

    questLevel = 18,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3387,
    endNPC = 3387,

    objectiveText =
        "Bring 3 Thunder Lizard Blood to Jorn Skyseer at Camp Taurajo.",

    description =
        "Bring 3 Thunder Lizard Blood to Jorn Skyseer at Camp Taurajo."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5143,
            amount = 1
        }
    }
}

Quests[913] = {
    name =
        "Cry of the Thunderhawk",

    questLevel = 20,
    requiredLevel = 10,

    faction =
        "Horde",

    startNPC = 3387,
    endNPC = 3387,

    objectiveText =
        "Find and slay a Thunderhawk, return its wings to Jorn Skyseer at Camp Taurajo.",

    description =
        "Find and slay a Thunderhawk, return its wings to Jorn Skyseer at Camp Taurajo."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5164,
            amount = 1
        }
    }
,

    rewards = {
        type =
            "choice",

        items = {
            5302,
            5299,
            5306
        }
    }
}

Quests[874] = {
    name =
        "Mahren Skyseer",

    questLevel = 27,
    requiredLevel = 9,

    faction =
        "Horde",

    startNPC = 3387,
    endNPC = 3388,

    objectiveText =
        "Speak with Mahren Skyseer.",

    description =
        "Speak with Mahren Skyseer."
}


--------------------------------------------------
-- Dancing Flame - Test of Faith chain
--------------------------------------------------

Quests[1149] = {
    name =
        "Test of Faith",

    questLevel = 26,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 2986,
    endNPC = 2986,

    objectiveText =
        "If you have faith, leap from the planks overlooking Thousand Needles.",

    description =
        "If you have faith, leap from the planks overlooking Thousand Needles."
}

Quests[1150] = {
    name =
        "Test of Endurance",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 2986,
    endNPC = 2986,

    objectiveText =
        "Bring Grenka's Claw to Dorn Plainstalker in Thousand Needles.",

    description =
        "Bring Grenka's Claw to Dorn Plainstalker in Thousand Needles."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5843,
            amount = 1
        }
    }
}

Quests[1151] = {
    name =
        "Test of Strength",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 2986,
    endNPC = 2986,

    objectiveText =
        "Bring Fragments of Rok'Alim to Dorn Plainstalker in Thousand Needles.",

    description =
        "Bring Fragments of Rok'Alim to Dorn Plainstalker in Thousand Needles."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5844,
            amount = 1
        }
    }
}

Quests[1152] = {
    name =
        "Test of Lore",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 2986,
    endNPC = 4489,

    objectiveText =
        "Find Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains.",

    description =
        "Find Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains."
}

Quests[1154] = {
    name =
        "Test of Lore",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 4489,
    endNPC = 4489,

    objectiveText =
        "Find the Legacy of the Aspects and return it to Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains.",

    description =
        "Find the Legacy of the Aspects and return it to Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5860,
            amount = 1
        }
    }
}

Quests[6627] = {
    name =
        "Test of Lore",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 4489,
    endNPC = 4489,

    objectiveText =
        "Answer Braug Dimspirit's question successfully and then speak to him again. He will remain in Stonetalon Mountains when you are ready.",

    description =
        "Answer Braug Dimspirit's question successfully and then speak to him again. He will remain in Stonetalon Mountains when you are ready."
}

Quests[1159] = {
    name =
        "Test of Lore",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 4489,
    endNPC = 4488,

    objectiveText =
        "Find Parqual Fintallas in Undercity.",

    description =
        "Find Parqual Fintallas in Undercity."
}

Quests[1160] = {
    name =
        "Test of Lore",

    questLevel = 36,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 4488,
    endNPC = 4488,

    objectiveText =
        "Find The Beginnings of the Undead Threat, and return it to Parqual Fintallas in Undercity.",

    description =
        "Find The Beginnings of the Undead Threat, and return it to Parqual Fintallas in Undercity."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5861,
            amount = 1
        }
    }
}

Quests[6628] = {
    name =
        "Test of Lore",

    questLevel = 30,
    requiredLevel = 25,

    faction =
        "Horde",

    startNPC = 4488,
    endNPC = 4488,

    objectiveText =
        "Answer Parqual Fintallas' question successfully and then speak to him again. He will remain in the Undercity until you are ready.",

    description =
        "Answer Parqual Fintallas' question successfully and then speak to him again. He will remain in the Undercity until you are ready."
}


--------------------------------------------------
-- Eyepoker - Lieutenant Paval Reethe chain
--------------------------------------------------

Quests[1269] = {
    name =
        "Lieutenant Paval Reethe",

    questLevel = 37,
    requiredLevel = 30,

    faction =
        "Horde",

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

    objectiveText =
        "Bring Reethe's Badge to Krog in Brackenwall Village.",

    description =
        "Bring Reethe's Badge to Krog in Brackenwall Village."
,

    objectives = {
        {
            type =
                "item",

            itemID = 5950,
            amount = 1
        }
    }
}
