-- Initialize settings
StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
Player = GetPlayer();

-- Function to set vendors for selling and repairing
function SetVendors()
    local vendorIDs = { 1234, 5678 } -- Replace with actual vendor NPC IDs
    SetQuestSellVendors(vendorIDs);
end

----
--- Quest Objectives
----
HarvestWatcher = {}; -- New Table to store Harvest Watcher IDs
HarvestWatcher[1] = 480; -- Rusty Harvest Gloem ID
OkraFarm = CreateObjective("KillMobsAndLoot",4,3,4,38,TableToList(HarvestWatcher)); -- Harvest Watchers

----Level 10-12: Initial Quests----
--[10] Westfall Stew (Quest ID: 36)
--[10] Westfall Stew (Quest ID: 38)
--[10] Poor Old Blanchy (Quest ID: 151)
--[10] The Forgotten Heirloom (Quest ID: 64)
--[10] The Killing Fields (Quest ID: 9)
----Level 12-14: The People's Militia Chain----
--[12] The People's Militia Part 1 (Quest ID: 12)
--[13] The People's Militia Part 2 (Quest ID: 13)
--[14] The People's Militia Part 3 (Quest ID: 14)
----Level 14-16: The Defias Brotherhood Chain----
--[14] The Defias Brotherhood Part 1 (Quest ID: 65)
--[14] The Defias Brotherhood Part 2 (Quest ID: 132)
--[14] The Defias Brotherhood Part 3 (Quest ID: 135)
----Level 15-16: Additional Quests----
--[15] Patrolling Westfall (Quest ID: 102)
--[15] Red Leather Bandanas (Quest ID: 153)
--[15] The Coast Isn't Clear (Quest ID: 152)
--[15] Keeper of the Flame (Quest ID: 103)
--[15] The Coastal Menace (Quest ID: 104)
----Level 16-18: Final Quests----
--[16] The Collector (Quest ID: 123)
--[16] Oh Brother... (Quest ID: 167)

-- Westfall Questing Profile
Log("Starting Westfall questing profile");
-- Out of Zone Quest Pickup
AcceptQuestUsingDB(399); -- [15] Humble Beginnings

-- Level 13-15: Furlbrow and the Stew
TurnInQuestUsingDB(184); -- [9] Furlbrow's Deed
AcceptQuestUsingDB(151); -- [9] Poor Old Blanchy
AcceptQuestUsingDB(36); -- [9] Westfall Stew (Delivery)
TurnInQuestUsingDB(36); -- [9] Westfall Stew (Delivery)
CompleteEntireQuest(22); -- [9-13] Goretusk Livers (8)
CompleteEntireQuest(38); -- [10] Westfall Stew (Collecting Ingredients)
--CompleteObjectiveOfQuest(38,1); -- [10] Westfall Stew (Collecting Ingredients)
--CompleteObjectiveOfQuest(38,2); -- [10] Westfall Stew (Collecting Ingredients)
--CompleteObjectiveOfQuest(38,3); -- [10] Westfall Stew (Collecting Ingredients)
--CompleteObjectiveOfQuest(38,4); -- [10] Westfall Stew (Collecting Ingredients)
--KillMobsUntilItem("Okra",OkraFarm,3);

-- Grind Step: To Level 15
QuestGoToPoint(-9715.307,1088.223,15.62057);
GrindAreaUntilLevel(15);

-- Level 14-15: Sentinel Hill Hub
-- Picking up quests
AcceptQuestUsingDB(12); -- [9] The People's Militia (Part 1)
AcceptQuestUsingDB(102); -- [15] Patrolling Westfall
AcceptQuestUsingDB(153); -- [15] Red Leather Bandanasaw
AcceptQuestUsingDB(64); -- [9] The Forgotten Heirloom
AcceptQuestUsingDB(9); -- [8] The Killing Fields


-- Completing objectives near Sentinel Hill

CompleteObjectiveOfQuest(399,1); -- [15] Humble Beginnings
CompleteObjectiveOfQuest(151, 1); -- [9-12] Handfuls of Oats (8)

-- Turning in quests at Sentinel Hill
TurnInQuestUsingDB(12); -- [9] The People's Militia (Part 1)
AcceptQuestUsingDB(109); -- [9] Report to Gryan Stoutmantle
TurnInQuestUsingDB(109); -- [9] Report to Gryan Stoutmantle
AcceptQuestUsingDB(13); -- [14] The People's Militia (Part 2)
TurnInQuestUsingDB(151); -- [9] Poor Old Blanchy
TurnInQuestUsingDB(399); -- [15] Humble Beginnings

-- Level 15-16: Farmlands and Fields
-- Completing objectives near the farmlands
CompleteObjectiveOfQuest(13, 1); -- [13-15] Defias Pillagers (15)
CompleteObjectiveOfQuest(13, 2); -- [13-15] Defias Looters (15)
CompleteObjectiveOfQuest(9, 1); -- [9-12] Harvest Watchers (20)
CompleteObjectiveOfQuest(64, 1); -- [9-12] Farmer Furlbrow's Watch

-- Grind Step: To Level 18
GrindAreaUntilLevel(18);

-- Returning to Sentinel Hill
TurnInQuestUsingDB(13); -- [14] The People's Militia (Part 2)
AcceptQuestUsingDB(14); -- [17] The People's Militia (Part 3)
TurnInQuestUsingDB(9); -- [8] The Killing Fields
TurnInQuestUsingDB(64); -- [9] The Forgotten Heirloom

-- Level 16-17: The Dagger Hills and Lighthouse
-- Completing objectives near the Dagger Hills
CompleteObjectiveOfQuest(14, 1); -- [14-16] Defias Highwaymen (15)
CompleteObjectiveOfQuest(14, 2); -- [14-16] Defias Pathstalkers (5)
CompleteObjectiveOfQuest(14, 3); -- [14-16] Defias Knuckledusters (5)

-- Lighthouse quests
AcceptQuestUsingDB(103); -- [10] Keeper of the Flame
CompleteObjectiveOfQuest(103, 1); -- [10-14] Flasks of Oil (5)
TurnInQuestUsingDB(103); -- [10] Keeper of the Flame
AcceptQuestUsingDB(104); -- [15] The Coastal Menace
CompleteObjectiveOfQuest(104, 1); -- [15-16] Old Murk-Eye
TurnInQuestUsingDB(104); -- [15] The Coastal Menace

-- Returning to Sentinel Hill
TurnInQuestUsingDB(14); -- [17] The People's Militia (Part 3)

-- Level 17-18: The Defias Brotherhood Chain
-- Picking up and completing the Defias Brotherhood quests
AcceptQuestUsingDB(65); -- [14] The Defias Brotherhood
TurnInQuestUsingDB(65); -- [14] The Defias Brotherhood
AcceptQuestUsingDB(132); -- [14] The Defias Brotherhood
TurnInQuestUsingDB(132); -- [14] The Defias Brotherhood
AcceptQuestUsingDB(135); -- [14] The Defias Brotherhood
TurnInQuestUsingDB(135); -- [14] The Defias Brotherhood
AcceptQuestUsingDB(141); -- [14] The Defias Brotherhood
TurnInQuestUsingDB(141); -- [14] The Defias Brotherhood
AcceptQuestUsingDB(142); -- [14] The Defias Brotherhood
CompleteObjectiveOfQuest(142, 1); -- [15-16] Defias Messenger
TurnInQuestUsingDB(142); -- [14] The Defias Brotherhood
AcceptQuestUsingDB(155); -- [14] The Defias Brotherhood
CompleteObjectiveOfQuest(155, 1); -- [15-16] Escort Defias Traitor
TurnInQuestUsingDB(155); -- [14] The Defias Brotherhood
AcceptQuestUsingDB(166); -- [14] The Defias Brotherhood
CompleteObjectiveOfQuest(166, 1); -- [16-20] Edwin VanCleef
TurnInQuestUsingDB(166); -- [14] The Defias Brotherhood

-- Interlude: Grind to Level 18
if Player.Level < 18 then
    GrindAreaUntilLevel(18);
end

-- End of Profile
Log("This is the end of Westfall questing profile");
StopQuestProfile();

