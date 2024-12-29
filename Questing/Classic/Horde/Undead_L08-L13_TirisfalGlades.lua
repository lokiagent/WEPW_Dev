-- Tirisfal Glades Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests=false
Player = GetPlayer()
Log("Current Zone ID: "..GetZoneID());
Log("Current Player Position:"..GetPlayer().Position);
--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
--At War With the Scarlet Crusade (370)
CaptainPerrine = {}; -- Table to load Captain Perrine
CaptainPerrine[1] = 1662; -- Captain Perrine
FuckUpZeCaptain = CreateObjective("KillMobsAndLoot",1,1,2,370,TableToList(CaptainPerrine));
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------


--Step 0: Setting Gathering Options
--if HasSkill(Skinning) then
--    SetGatherOptions(1,0,0,0); --Skinning
--end
if Player.Level < 8 then
    QuestGoToPoint(2108.698,1128.137,36.49763); -- Pathing to get to grind area
    GrindAreaUntilLevel(8);
end

-- Step 1: On the Road to Brill
--AcceptQuestUsingDB(5481); -- Gordo's Task --Gotta figure out this one as he pats along road
AcceptQuestUsingDB(365); CompleteEntireQuest(365); Log("Accept: Fields of GriefQuest; Objective(s): Fields of Grief --Need to Look at this, not always clicking Pumpkins about 50/50");
CompleteEntireQuest(5481); AcceptQuestUsingDB(5482);Log("Turn-in: [5]Gordo's Task. Accept: [6]Doom Weed");
AcceptQuestUsingDB(367); Log("Accept: [6]A New Plague");
CompleteObjectiveOfQuest(367,1); Log("Complete: [6]A New Plague; Objective(s): A New Plague");
TurnInQuestUsingDB(365); CompleteEntireQuest(407); -- Turn-in: Fields of Grief; Accept & Complete: Fields of Grief

--Step 1.5: Class Quest Checker
--if Player.Class() == "Priest" and not HasPlayerFinishedQuest(5651) then
--    CompleteEntireQuest(5651); CompleteEntireQuest(5650); -- In Favor of Darkness; Accept: Garments of Darkness
--end

-- Step 2: Entry in to Brill
TurnInQuestUsingDB(383); Log("Turn-in: [5]Vital Intelligence");
TurnInQuestUsingDB(8); Log("Turn-in: A Rogue's Deal"); 
TurnInQuestUsingDB(367); Log("Turn-in: [6]A New Plague"); AcceptQuestUsingDB(368); Log("Accept: A New Plague") 
AcceptQuestUsingDB(404); Log("Accept: A Putrid Task");
AcceptQuestUsingDB(375); Log("Accept: The Chill of Death --Need to figure out why this didn't run up the stairs to accept"); --Upstairs Inn Pathing Issues
AcceptQuestUsingDB(427); Log("Accept: [8]At War With The Scarlet Crusade");
AcceptQuestUsingDB(358); Log("Accept: [8]Grave Robbers"); 
AcceptQuestUsingDB(398); Log("Accept: [10]Wanted: Maggot Eye");
AcceptQuestUsingDB(362); Log("Accept: [10]The Haunted Mills");
AcceptQuestUsingDB(354); Log("Accept: [11]Deaths in the Family");

CompleteObjectiveOfQuest(404,1); Log("Complete: A Putrid Task; Objective(s): A Putrid Task");--
CompleteObjectiveOfQuest(375,1); Log("Complete: The Chill of Death");
CompleteObjectiveOfQuest(427,1); Log("Complete: At War With The Scarlet Crusade");
CompleteObjectiveOfQuest(358,1); Log("Complete: Grave Robbers");
CompleteObjectiveOfQuest(358,2); Log("Complete: Grave Robbers");
CompleteObjectiveOfQuest(358,3); Log("Complete: Grave Robbers");
CompleteObjectiveOfQuest(398,1); Log("Complete: Wanted: Maggot Eye");
CompleteObjectiveOfQuest(5482,1); Log("Complete: [6]Doom Weed; Objective(s): Doom Weed");

--Step 2.25 Grind to Level 9 before proceeding
if Player.Level < 9 then
    Log("Player is under Level 9, Proceeding to Grind at Garren's Haunt");
    QuestGoToPoint(2612.086, 446.2979, 29.90101);
    GrindAreaUntilLevel(9);
end
--Step 2.5 Brill Turn-in Extravaganza
TurnInQuestUsingDB(5482); Log("Turn-in: [6]Doom Weed"); 
TurnInQuestUsingDB(404);  Log("Turn-in: [6]A Putrid Task"); AcceptQuestUsingDB(426); Log("Accept: [8]The Mills Overrun"); 
TurnInQuestUsingDB(427);  Log("Turn-in: [8]At War With The Scarlet Crusade"); AcceptQuestUsingDB(370); Log("Accept: [9]At War With The Scarlet Crusade");
TurnInQuestUsingDB(358);  Log("Turn-in: [8]Grave Robbers"); AcceptQuestUsingDB(359); Log("Accept: [9]Forsaken Duties"); AcceptQuestUsingDB(405); Log("Accept: [9]The Prodigal Lich");
TurnInQuestUsingDB(398);  Log("Turn-in: [10]Wanted: Maggot Eye");
TurnInQuestUsingDB(375);  Log("Turn-in: [8]The Chill of Death"); --Upstairs Inn Pathing Issues

--Step 2.75 A Little Bit More Grind
if Player.Level < 11 then
    Log("Player is under Level 11, Proceeding to Grind at Coords:[56,60]");
    QuestGoToPoint(2010.679, 482.5298, 40.83972);
    GrindAreaUntilLevel(11);
end
CompleteEntireQuest(405); Log("Complete: [9]The Prodigal Lich"); AcceptQuestUsingDB(357); Log("Accept: [8]The Lich's Identity");
TurnInQuestUsingDB(357); Log("Turn-in: [8]The Lich's Identity"); AcceptQuestUsingDB(366); Log("Accept: [8]Return the Book");
TurnInQuestUsingDB(359); Log("Turn-in: [9]Forsaken Duties"); AcceptQuestUsingDB(356); Log("Accept: [11]Rear Guard Patrol");
AcceptQuestUsingDB(374); Log("Accept: [7]Proof of Demise")
AcceptQuestUsingDB(445); Log("Accept: [10]Delivery to Silverpine Forest");

--AcceptQuestUsingDB(361); Log("Accept: A Letter Undelivered");--
CompleteObjectiveOfQuest(374,1); Log("Complete: Proof of Demise; Objective(s): Proof of Demise");
CompleteEntireQuest(356); Log("Complete: [11]Rear Guard Patrol"); AcceptQuestUsingDB(363); Log("Accept: [11]The Deathstalkers");
CompleteObjectiveOfQuest(362,1); Log("Complete: The Haunted Mills");
CompleteEntireQuest(354); Log("Complete: [11]Deaths in the Family"); TurnInQuestUsingDB(362); Log("Turn-in: The Haunted Mills"); 
AcceptQuestUsingDB(355); Log("Accept: Speak with Sevren"); CompleteEntireQuest(355); Log("Turn-in: Speak with Sevren"); --L8 Quest

-- Step 2.75 Brill Turn-in Extravaganza
TurnInQuestUsingDB(361); Log("Turn-in: A Letter Undelivered");
if not HasPlayerFinishedQuest(370)  and CanTurnInQuest(370)==false then
    QuestGoToPoint(1807.022, 723.7814, 48.99041); -- Spawn Point for Captain Perrine
    DoObjective(FuckUpZeCaptain);
    CompleteEntireQuest(370); Log("Turn-in: At War With The Scarlet Crusade");
    AcceptQuestUsingDB(371); Log("Accept: At War With The Scarlet Crusade");
end;
AcceptQuestUsingDB(408); Log("Accept: The Family Crypt"); --L13 Quest
CompleteObjectiveOfQuest(426,1); CompleteObjectiveOfQuest(426,2); Log("Complete: The Mills Overrun Quest Objective(s): The Mills Overrun"); --L8 Quest
CompleteEntireQuest(408); Log("Accept: The Family Crypt"); TurnInQuestUsingDB(426); --L13 Quest
CompleteEntireQuest(368); Log("Complete: A New Plague");
CompleteObjectiveOfQuest(369,1); Log("Complete: A New Plague Quest Objective(s): A New Plague"); --L9 Quest
CompleteEntireQuest(371); Log("Turn-in: At War With The Scarlet Crusade"); AcceptQuestUsingDB(372); Log("Accept: At War With The Scarlet Crusade"); --L9 Quest
CompleteEntireQuest(355); Log("Turn-in: Speak with Sevren"); --L8 Quest
CompleteEntireQuest(372); Log("Turn-in: At War With The Scarlet Crusade");
TurnInQuestUsingDB(369); Log("Turn-in: A New Plague"); --AcceptQuestUsingDB(372); Log("Accept: A New Plague"); --L10 Quest



-- Step The Last: Final Grind

--if Player.Level >=10 and Player.Level < 14 then
--    QuestGoToPoint(3034.54,388.2232,0.4094368)
--    GrindAreaUntilLevel(14);
--    Log("Player is Level 10 or over, but under Level 14, Proceeding to Grind at Murloc's on the Coast");
--end
--QuestGoToPoint(2231.544,383.7788,44.44395)

StopQuestProfile();
