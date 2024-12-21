-- Deathknell Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
--SetQuestRepairAt(30)
--SetQuestSellAt(2)
IgnoreLowLevelQuests=false
Player = GetPlayer()

--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
SamuelFipps = {}; -- Table to load Samuel Fipps as Autoquesting options aren't working
SamuelFipps[1] = 1919; -- Samuel Fipps
FuckUpSamuelFipps = CreateObjective("KillMobs",1,1,1,6935,TableToList(SamuelFipps));
LootSamuelFipps = CreateObjective("LootItem",1,1,1,6935,TableToList(SamuelFipps));
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------


--Vendor Black and White Lists (i.e. don't try and use Warlock Demon Vendor for shit)
BlackListSellVendorByName("Kayla Smithe"); --Warlock Vendor PoS that no one cal really sell too

--Setting Level Appropriate Food and Drink
--SetFood("Tough Hunk of Bread", 50)
SetDrink("Refreshing Spring Water", 25)

-- Grind Step: To Level 3
GrindAreaUntilLevel(3);

-- Quest Chains and Groups
-- Group 1: Initial Quest Acceptance
AcceptQuestUsingDB(363); TurnInQuestUsingDB(363); AcceptQuestUsingDB(364); -- Accept: Rude Awakening; Turn-in; Rude Awakening; Accept: The Mindless Ones
AcceptQuestUsingDB(376); -- Accept: The Damned
CompleteObjectiveOfQuest(364, 1); CompleteObjectiveOfQuest(364, 2); -- Quest Objective(s): The Mindless Ones
CompleteObjectiveOfQuest(376, 1); CompleteObjectiveOfQuest(376, 2); -- Quest Objective(s): The Damned
TurnInQuestUsingDB(364); AcceptQuestUsingDB(3901); -- Turn-in: The Mindless Ones; Accept: Rattling the Rattle Cages
TurnInQuestUsingDB(376); AcceptQuestUsingDB(6395);-- Turn-in: The Damned; Accept: Marla's Last Wish

-- Group 1.5: Class Quest Checker
if GetPlayerClass() == "Priest" and not HasPlayerFinishedQuest(3097) then
    CompleteEntireQuest(3097); -- Hallowed Scroll
end

-- Group 2: Killing Quests
AcceptQuestUsingDB(3902); -- Accept: Scavenging Deathknell
AcceptQuestUsingDB(380); -- Accept: Nightweb's Hollow
CompleteEntireQuest(3902); -- Complete: Scavenging Deathknell
CompleteObjectiveOfQuest(380, 1); CompleteObjectiveOfQuest(380, 2); -- Quest Objective(s): Nightweb's Hollow
--CompleteObjectiveOfQuest(3901,1); -- Quest Objective(s): Rattling the Rattle Cages


--Group 2.5: Grind the Ensure Level 5 and accept Class Quest
GrindAreaUntilLevel(5);
if GetPlayerClass() == "Priest" and not HasPlayerFinishedQuest(5651) then
    AcceptQuestUsingDB(5651); -- In Favor of Darkness
end

CompleteEntireQuest(3901); AcceptQuestUsingDB(380); -- Turn-in: Rattling the Rattle Cages; 
CompleteEntireQuest(380); AcceptQuestUsingDB(381); -- Turn-in: Nightweb's Hollow; Accept: The Scarlet Crusade
--Manual Objective as automated isn't working
--QuestGoToPoint(1982,1376,63); -- Spawn Point for Samuel Fipps
------------I don't know WTF is going on here, I can't get Samuel Killed and Looted----------------

CompleteEntireQuest(381); -- Complete: The Scarlet Crusade
CompleteEntireQuest(382); AcceptQuestUsingDB(383); -- Complete: The Red Messenger; Aceept: Vital Intelligence
AcceptQuestUsingDB(8); -- Accept: A Rogue's Deal

QuestGoToPoint(2108.698,1128.137,36.49763); -- Pathing to get to grind area
--QuestGoToPoint(2272.231,1288.223,33.77267) -- Pathing to get to grind area
GrindAreaUntilLevel(8);

-- QED: Deathknell
StopQuestProfile();

--AcceptQuestUsingDB(<QuestID>); -- 
--CompleteObjectiveOfQuest(<QuestID>, <Objective #>); -- 
--CompleteEntireQuest(<QuestID>); -- 
--TurnInQuestUsingDB(<QuestID>); -- 
