-- Initialize settings
StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
Player = GetPlayer();
------------------------------------------------------------------
--------------------Loading External Functions--------------------
------------------------------------------------------------------
local _EK_FlightPaths = loadfile("Profiles\\Questing\\ConfigFiles\\A_EK_FlightPaths.lua")
local FMloc -- Declare the Test variable in this scope
FMloc = _EK_FlightPaths()
local _EK_FlyTo = loadfile("Profiles\\Questing\\ConfigFiles\\A_EK_FlyTo.lua")
local FlyTo
FlyTo = _EK_FlyTo()

-- Function to set vendors for selling and repairing
function SetVendors()
    local vendorIDs = { 1234, 5678 } -- Replace with actual vendor NPC IDs
    SetQuestSellVendors(vendorIDs);
end
----------------Begin Redridge Mountains Questing Profile----------------
--Step 0: Getting Out of Zone Starting Quests
if GetPlayerClass() == "Warrior" then
    AcceptQuestUsingDB(1698); Log("Accept: [20]Yura's Barleybrew");
end
AcceptQuestUsingDB(94); Log("Accept: [21]A Watchful Eye");
--Step 1: Entering Redridge Mountains
AcceptQuestUsingDB(20); Log("Accept: [21]Blackrock Menace");
AcceptQuestUsingDB(125); Log("Accept: [26]The Lost Tools");
AcceptQuestUsingDB(122); Log("Accept: [18]Undeerbelly Scales");
AcceptQuestUsingDB(124); Log("Accept: [20]A Baying of Gnolls");
AcceptQuestUsingDB(127); Log("Accept: [21]Selling Fish");
AcceptQuestUsingDB(150); Log("Accept: [20]Murloc Poachers");
AcceptQuestUsingDB(92); Log("Accept: [18]Redridge Goulash");
AcceptQuestUsingDB(89); Log("Accept: [20]The Everstill Bridge");
AcceptQuestUsingDB(1097); Log("Accept: [15]Elmore's Task");
AcceptQuestUsingDB(118); Log("Accept: [18]The Price of Shoes");
AcceptQuestUsingDB(91); Log("Accept: [23]Solomon's Law");
AcceptQuestUsingDB(120); Log("Accept: [14]Messenger to Stormwind");
AcceptQuestUsingDB(34); Log("Accept: [24]An Unwelcome Guest");

--Step 2: Stormwind HO!!!!!!!!!!!!!!!!!
if (HasPlayerFinishedQuest(120) ~= true or HasPlayerFinishedQuest(1097) ~= true or HasPlayerFinishedQuest(118) ~= true) then
    FMloc.Redridge();
    FlyTo.Stormwind();
    --******NOTE******--
    --Quest 120-[14]Messenger to Stormwind
    --If someone is turning in the Ony quest to him he'll either disappear or
    --be kneeling for anywhere between 5-20 minutes and the bot will just sit
    --until he resets.  It may even crash.....Yes, its stupid. Very Stupid.
    TurnInQuestUsingDB(120); Log("Turn-in: [14]Messenger to Stormwind"); 
    AcceptQuestUsingDB(121); Log("Accept: [14]Messenger to Stormwind");
    -----------
    --20250114-Good Place to see about buying booze for (116)Dry Times.
    -----------
    TurnInQuestUsingDB(1097); Log("Turn-in: [15]Elmore's Task");
    TurnInQuestUsingDB(118); Log("Turn-in: [18]The Price of Shoes");
    AcceptQuestUsingDB(119); Log("Accept: [18]Return to Verner");
    -----------
    --20250114-Good Place to see about buying booze for (116)Dry Times.
    -----------
    FMloc.Stormwind();
    FlyTo.Redridge();
end
TurnInQuestUsingDB(119); Log("Turn-in: [18]Return to Verner");
TurnInQuestUsingDB(121); Log("Turn-in: [14]Messenger to Stormwind");
AcceptQuestUsingDB(143); Log("Accept: [14]Messenger to Westfall");
if (HasPlayerFinishedQuest(143) ~= true and IsOnQuest(143) == true) then
    FMloc.Redridge();
    FlyTo.Westfall();
end
TurnInQuestUsingDB(143); Log("Turn-in: [14]Messenger to Westfall");
AcceptQuestUsingDB(144); Log("Accept: [14]Messenger to Westfall");
if (HasPlayerFinishedQuest(144) ~= true and IsOnQuest(144) == true) then
    FMloc.Westfall();
    FlyTo.Redridge();
end
TurnInQuestUsingDB(144); Log("Turn-in: [14]Messenger to Westfall");
AcceptQuestUsingDB(145); Log("Accept: [18]Messenger to Darkshire");
if (HasPlayerFinishedQuest(144) ~= true and IsOnQuest(144) == true) then
    FMloc.Redridge();
    FlyTo.Duskwood();
end
TurnInQuestUsingDB(145); Log("Turn-in: [14]Messenger to Darkshire");
AcceptQuestUsingDB(146); Log("Accept: [18]Messenger to Darkshire");
-----------
--20250114-Good Place to see about buying booze for (116)Dry Times.
-----------
if (IsOnQuest(146) == true and IsOnQuest(163) ~= true) then
    --FMloc.Duskwood();
end
--Step 2: The evening chill settles in Duskwood
AcceptQuestUsingDB(163); Log("Accept: [20]Raven Hill");
AcceptQuestUsingDB(164); Log("Accept: [23]Deliveries to Sven");
AcceptQuestUsingDB(245); Log("Accept: [21]Eight-Legged Menances");
TurnInQuestUsingDB(163); Log("Turn-in: [20]Raven Hill");
AcceptQuestUsingDB(5); Log("Accept: [20]Jitter's Growling Gut");
TurnInQuestUsingDB(164); Log("Turn-in: [23]Deliveries to Sven");
AcceptQuestUsingDB(226); Log("Accept: [21]Wolves At Our Heels");
----------------------------------------------------------------
-------Pre-gathering Gooey Spider Legs for Upcoming Quest-------
----------------------------------------------------------------
if ItemCount("Gooey Spider Leg") < 6 then
    Spiders = {539,569,930,217,565}; -- Table to load ShamWow Guy in Jail does Spiders
    KillSpiders = CreateObjective("KillMobsAndLoot",1,10,1,93,TableToList(Spiders));
    KillMobsUntilItem("Gooey Spider Leg",KillSpiders,6);
end
CompleteObjectiveOfQuest(245,1); Log("Completing Objective [21]Eight-Legged Menances: (15)Pygmy Venom Web Spider");
CompleteObjectiveOfQuest(226,1); Log("Completing Objective [21]Wolves At Our Heels: (12) Starving Dire Wolf");
CompleteObjectiveOfQuest(226,2); Log("Completing Objective [21]Wolves At Our Heels: (8) Rabid Dire Wolf");
TurnInQuestUsingDB(226);Log("Turn-in: [21]Wolves At Our Heels");
TurnInQuestUsingDB(245);Log("Turn-in: [21]Eight-Legged Menances");
TurnInQuestUsingDB(5); Log("Turn-in: [20]Jitter's Growling Gut");
AcceptQuestUsingDB(93); Log("Accept: [20]Dusky Crab Cakes");
TurnInQuestUsingDB(93); Log("Turn-in: [20]Dusky Crab Cakes");
-----Check for more Pickups
FP.Duskwood();
--Step 3: What happens in the Mountains stays in the Mountains
TurnInQuestUsingDB(119); Log("Turn-in: [18]Return to Verner");
CompleteObjectiveOfQuest(92,1); Log("Completing Objective [18]Redridge Goulash: (5)Great Goretusk Snout");
CompleteObjectiveOfQuest(92,2); Log("Completing Objective [18]Redridge Goulash: (5)Tough Condor Meat");
CompleteObjectiveOfQuest(92,3); Log("Completing Objective [18]Redridge Goulash: (5)Crisp Spider Meat");
CompleteObjectiveOfQuest(122,1); Log("Completing Objective [18]Undeerbelly Scales: (6)Underbelly Whelp Scale");
CompleteObjectiveOfQuest(89,1); Log("Completing Objective [20]The Everstill Bridge: (5)Iron Pike");
CompleteObjectiveOfQuest(89,2); Log("Completing Objective [20]The Everstill Bridge: (5)Iron Rivet");
CompleteObjectiveOfQuest(124,1); Log("Completing Objective [20]A Baying of Gnolls: (10)Redridge Brute");
CompleteObjectiveOfQuest(124,2); Log("Completing Objective [20]A Baying of Gnolls: (8)Redridge Mystic");
--Step 3.5: Back in Town, NOT discussing what happened in the Mountains
TurnInQuestUsingDB(92); Log("Turn-in: [18]Redridge Goulash");
TurnInQuestUsingDB(122); Log("Turn-in: [18]Undeerbelly Scales");
TurnInQuestUsingDB(89); Log("Turn-in: [20]The Everstill Bridge");
TurnInQuestUsingDB(124); Log("Turn-in: [20]A Baying of Gnolls");




--Step 2: Completing Quest Objectives





StopQuestProfile(); -- Stop the quest profile