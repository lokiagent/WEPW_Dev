-- Tirisfal Glades Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests=false
Player = GetPlayer()

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
AcceptQuestUsingDB(365); CompleteObjectiveOfQuest(365,1); Log("Accept: Fields of GriefQuest; Objective(s): Fields of Grief --Need to Look at this, not always clicking Pumpkins about 50/50");
CompleteEntireQuest(5481); AcceptQuestUsingDB(5482); -- Complete: Gordo's Task; Accept: Doom Weed
AcceptQuestUsingDB(367); Log("Accept: A New Plague");
TurnInQuestUsingDB(365); CompleteEntireQuest(407); -- Turn-in: Fields of Grief; Accept & Complete: Fields of Grief

--Step 1.5: Class Quest Checker
--if Player.Class() == "Priest" and not HasPlayerFinishedQuest(5651) then
--    CompleteEntireQuest(5651); CompleteEntireQuest(5650); -- In Favor of Darkness; Accept: Garments of Darkness
--end

-- Step 2: Entry in to Brill
TurnInQuestUsingDB(8); Log("Turn-in: A Rogue's Deal"); 
TurnInQuestUsingDB(367); Log("Turn-in: A New Plague"); AcceptQuestUsingDB(368); Log("Accept: A New Plague") --L5 Quest
AcceptQuestUsingDB(404); Log("Accept: A Putrid Task"); --L6 Quest
AcceptQuestUsingDB(375); Log("Accept: The Chill of Death --Need to figure out why this didn't run up the stairs to accept"); --L8 Quest
AcceptQuestUsingDB(427); Log("Accept: At War With The Scarlet Crusade"); -- L8 Quest
AcceptQuestUsingDB(358); Log("Accept: Grave Robbers"); --L8 Quest
AcceptQuestUsingDB(398); Log("Accept: Wanted: Maggot Eye"); --L10 Quest
AcceptQuestUsingDB(362); Log("Accept: The Haunted Mills"); --L10 Quest
AcceptQuestUsingDB(354); Log("Accept: Deaths in the Family"); --L11 Quest

CompleteObjectiveOfQuest(404,1); Log("Complete: A Putrid Task; Objective(s): A Putrid Task");--
CompleteObjectiveOfQuest(375,1); Log("Complete: The Chill of Death");
CompleteObjectiveOfQuest(427,1); Log("Complete: At War With The Scarlet Crusade");
CompleteObjectiveOfQuest(5482,1); Log("Complete: Doom Weed");
CompleteObjectiveOfQuest(358,1); Log("Complete: Grave Robbers");
CompleteObjectiveOfQuest(358,2); Log("Complete: Grave Robbers");
CompleteObjectiveOfQuest(358,3); Log("Complete: Grave Robbers");
CompleteObjectiveOfQuest(398,1); Log("Complete: Wanted: Maggot Eye");

--Step 2.25 Grind to Level 10 before proceeding
if Player.Level < 10 then
    Log("Player is under Level 10, Proceeding to Grind at Garren's Haunt");
    QuestGoToPoint(2707.948,401.5566,24.97458)
    GrindAreaUntilLevel(1013);
end

CompleteEntireQuest(368); Log("Complete: A New Plague");
--AcceptQuestUsingDB(361); Log("Accept: A Letter Undelivered");--
CompleteObjectiveOfQuest(362,1); Log("Complete: The Haunted Mills");
CompleteEntireQuest(354); Log("Complete: Deaths in the Family"); TurnInQuestUsingDB(362); Log("Turn-in: The Haunted Mills"); 
AcceptQuestUsingDB(355); Log("Accept: Speak with Sevren"); CompleteEntireQuest(355); Log("Turn-in: Speak with Sevren"); --L8 Quest

-- Step 2.75 Brill Turn-in Extravaganza
TurnInQuestUsingDB(361); Log("Turn-in: A Letter Undelivered");
TurnInQuestUsingDB(404); Log("Turn-in: A Putrid Task"); AcceptQuestUsingDB(426); Log("Accept: The Mills Overrun"); --L8 Quest
AcceptQuestUsingDB(359); Log("Accept: Forsaken Duties"); --L9 Quest
AcceptQuestUsingDB(405); Log("Accept: The Prodigal Lich");  --L9 Quest
CompleteEntireQuest(370); Log("Turn-in: At War With The Scarlet Crusade"); AcceptQuestUsingDB(371); Log("Accept: At War With The Scarlet Crusade"); --L9 Quest
CompleteObjectiveOfQuest(369,1); Log("Complete: A New Plague Quest Objective(s): A New Plague"); --L9 Quest
CompleteEntireQuest(371); Log("Turn-in: At War With The Scarlet Crusade"); AcceptQuestUsingDB(372); Log("Accept: At War With The Scarlet Crusade"); --L9 Quest
CompleteEntireQuest(355); Log("Turn-in: Speak with Sevren"); --L8 Quest
AcceptQuestUsingDB(408); Log("Accept: The Family Crypt"); --L13 Quest
CompleteObjectiveOfQuest(426,1); CompleteObjectiveOfQuest(426,2); Log("Complete: The Mills Overrun Quest Objective(s): The Mills Overrun"); --L8 Quest
CompleteEntireQuest(408); Log("Accept: The Family Crypt"); TurnInQuestUsingDB(426); --L13 Quest
TurnInQuestUsingDB(375); Log("Turn-in: The Chill of Death");
TurnInQuestUsingDB(5482); Log("Turn-in: Doom Weed"); 
TurnInQuestUsingDB(358); Log("Turn-in: Grave Robbers"); --L9 Quest
CompleteEntireQuest(372); Log("Turn-in: At War With The Scarlet Crusade");
TurnInQuestUsingDB(369); Log("Turn-in: A New Plague"); --AcceptQuestUsingDB(372); Log("Accept: A New Plague"); --L10 Quest
TurnInQuestUsingDB(398); Log("Turn-in: Wanted: Maggot Eye");



-- Step The Last: Final Grind

--if Player.Level >=10 and Player.Level < 14 then
--    QuestGoToPoint(3034.54,388.2232,0.4094368)
--    GrindAreaUntilLevel(14);
--    Log("Player is Level 10 or over, but under Level 14, Proceeding to Grind at Murloc's on the Coast");
--end
--QuestGoToPoint(2231.544,383.7788,44.44395)

StopQuestProfile();
