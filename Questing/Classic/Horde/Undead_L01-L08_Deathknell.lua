-- Deathknell Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests=false
Player = GetPlayer()

--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
--The Mindless Ones
Zombies = {}; -- Table to load Zombies
Zombies[1] = 1501; Zombies[2] = 1502; -- Mindless Zombie -- Wretched Zombie
MindlessZ = CreateObjective("KillMobsAndLoot",1,8,2,364,TableToList(Zombies));
MindlessW = CreateObjective("KillMobsAndLoot",2,8,2,364,TableToList(Zombies));

NightWeb = {}; -- Table to load Night Web Spiders
NightWeb[1] = 1504; -- Night Web Spider
NightWeb[2] = 1505; -- Night Web Spider
KillNightYWeb = CreateObjective("KillMobsAndLoot",1,10,2,380,TableToList(NightWeb));
KillNightWeb = CreateObjective("KillMobsAndLoot",2,8,2,380,TableToList(NightWeb));

--Marla's Last Wish
SamuelFipps = {}; -- Table to load Samuel Fipps as Autoquesting options aren't working
SamuelFipps[1] = 1919; -- Samuel Fipps
FuckUpSamuelFipps = CreateObjective("KillMobs",1,1,2,6395,TableToList(SamuelFipps));
--BurySamuelFipps = CreateObjective("UseItemName",2,1,2,6395,TableToList(SamuelFipps));
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------

--Vendor Black and White Lists (i.e. don't try and use Warlock Demon Vendor for shit)
BlackListSellVendorByName("Kayla Smithe"); --Warlock Vendor PoS that no one cal really sell too

--Setting Level Appropriate Food and Drink
--SetFood("Tough Hunk of Bread", 50)
--SetDrink("Refreshing Spring Water", 25)

-- Grind Step: To Level 3
GrindAreaUntilLevel(3);

-- Quest Chains and Groups
-- Group 1: Initial Quest Acceptance
AcceptQuestUsingDB(363); TurnInQuestUsingDB(363); AcceptQuestUsingDB(364); -- Accept: Rude Awakening; Turn-in; Rude Awakening; Accept: The Mindless Ones
AcceptQuestUsingDB(376); -- Accept: The Damned
DoObjective(MindlessZ); DoObjective(MindlessW);-- Quest Objective(s): The Mindless Ones
CompleteObjectiveOfQuest(376, 1); CompleteObjectiveOfQuest(376, 2); -- Quest Objective(s): The Damned
TurnInQuestUsingDB(364); AcceptQuestUsingDB(3901); -- Turn-in: The Mindless Ones; Accept: Rattling the Rattle Cages
TurnInQuestUsingDB(376); AcceptQuestUsingDB(6395);-- Turn-in: The Damned; Accept: Marla's Last Wish

-- Group 2: Killing Quests
AcceptQuestUsingDB(3902); -- Accept: Scavenging Deathknell
AcceptQuestUsingDB(380); -- Accept: Nightweb's Hollow
CompleteEntireQuest(3902); -- Complete: Scavenging Deathknell
DoObjective(KillNightYWeb); DoObjective(KillNightWeb); -- Quest Objective(s): Nightweb's Hollow

--Group 2.5: Grind the Ensure Level 5 and accept Class Quest
GrindAreaUntilLevel(5);
--if Player.Class == 1 and not HasPlayerFinishedQuest(5651) then --Warrior
--    AcceptQuestUsingDB(); -- 
--end
if Player.Class == 4 and not HasPlayerFinishedQuest(3096) then --Rogue
    AcceptQuestUsingDB(3096); -- [1] Encrypted Scroll
    TurnInQuestUsingDB(3096); -- [1] Encrypted Scroll
end
--if Player.Class == 5 and not HasPlayerFinishedQuest(5651) then --Priest
--    AcceptQuestUsingDB(5651); -- In Favor of Darkness
--end
--if Player.Class == 8 and not HasPlayerFinishedQuest(5651) then --Mage
--    AcceptQuestUsingDB(); -- 
--end
--if Player.Class == 9 and not HasPlayerFinishedQuest(5651) then --Warlock
--    AcceptQuestUsingDB(); -- 
--end
CompleteEntireQuest(3901); AcceptQuestUsingDB(380); -- Turn-in: Rattling the Rattle Cages; 
CompleteEntireQuest(380); AcceptQuestUsingDB(381); -- Turn-in: Nightweb's Hollow; Accept: The Scarlet Crusade
----------------------------------------Marla's Last Wish-----------------------------
QuestGoToPoint(1982,1376,63); -- Spawn Point for Samuel Fipps
KillMobsUntilItem("Samuel's Remains",FuckUpSamuelFipps,1);
QuestGoToPoint(1875.951,1623.005,95.0472); -- Pathing to get to Marla's Grave
CompleteEntireQuest(6395); -- Quest Objective(s): Marla's Last Wish
--------------------------------------------------------------------------------------
CompleteEntireQuest(381); -- Complete: The Scarlet Crusade
CompleteEntireQuest(382); AcceptQuestUsingDB(383); -- Complete: The Red Messenger; Aceept: Vital Intelligence
AcceptQuestUsingDB(8); -- Accept: A Rogue's Deal

QuestGoToPoint(2108.698,1128.137,36.49763); -- Pathing to get to grind area
GrindAreaUntilLevel(8);

-- QED: Deathknell
StopQuestProfile();