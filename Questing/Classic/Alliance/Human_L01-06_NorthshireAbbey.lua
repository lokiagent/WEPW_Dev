-- Northshire Abbey Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests=false
Player = GetPlayer()

-- Grind Step: To Level 3
GrindAreaUntilLevel(3)

-- Player Spell Training Check
if GetPlayerClass() == "Paladin" and not HasSpell(465) then
    Log("Player does not have spell ID 465, Devotion Aura: Rank 1 training!")
    TrainAtNearestClassTrainer()
end

-- Class Quest Checker
if GetPlayerClass() == "Paladin" and not HasPlayerFinishedQuest(3101) then
	AcceptQuestUsingDB(783); -- Consecrated Letter 
	TurnInQuestUsingDB(783); -- Consecrated Letter
end 

-- Quest Chains and Groups
-- Group 1: Initial Quest Acceptance
AcceptQuestUsingDB(783); -- A Threat Within
TurnInQuestUsingDB(783); -- A Threat Within
AcceptQuestUsingDB(5261); -- Eagan Peltskinner
-- Group 2: Killing Quests
AcceptQuestUsingDB(7); -- Kobold Camp Cleanup
AcceptQuestUsingDB(33); -- Wolves Across the Border
--KillMobsUntilItem("Tough Wolf Meat",
CompleteObjectiveOfQuest(7, 1); -- Kill Kobold Vermin
CompleteObjectiveOfQuest(33, 1); -- Collect wolf pelts

-- Group 3: Follow-up Quests
TurnInQuestUsingDB(7); -- Kobold Camp Cleanup
AcceptQuestUsingDB(15); -- Investigate Echo Ridge
TurnInQuestUsingDB(33); -- Wolves Across the Border

-- Complete Group 3 Objectives
CompleteObjectiveOfQuest(15, 1); -- Investigate Echo Ridge

-- Report back and accept next quests
TurnInQuestUsingDB(15); -- Investigate Echo Ridge
AcceptQuestUsingDB(21); -- Skirmish at Echo Ridge
CompleteObjectiveOfQuest(21, 1); -- Defeat Kobold Workers

TurnInQuestUsingDB(21); -- Skirmish at Echo Ridge
AcceptQuestUsingDB(54); -- Report to Goldshire

-- Group 4: Thieves and Harvest
AcceptQuestUsingDB(18); -- Brotherhood of Thieves
CompleteObjectiveOfQuest(18, 1); -- Kill Defias Thugs

-- Group 5: Follow-up Quests
TurnInQuestUsingDB(18); -- Brotherhood of Thieves
AcceptQuestUsingDB(6); -- Bounty on Garrick Padfoot

AcceptQuestUsingDB(3903); -- Milly Osworth
--CompleteObjectiveOfQuest(3903, 1); -- Speak to Milly
TurnInQuestUsingDB(3903); -- Milly Osworth
AcceptQuestUsingDB(3904); -- Milly's Harvest

-- Grind Step: To Level 6
GrindAreaUntilLevel(6)

CompleteObjectiveOfQuest(6, 1); -- Kill Garrick Padfoot
CompleteObjectiveOfQuest(3904, 1); -- Collect Milly's Harvest

TurnInQuestUsingDB(3904); -- Milly's Harvest
AcceptQuestUsingDB(3905); -- Grape Manifest
TurnInQuestUsingDB(6); -- Bounty on Garrick Padfoot
--QuestGoToPoint(-8902,-181,113); -- Pathing to Turn-in for Grape Manifest
--TurnInQuestUsingDB(3905); -- Grape Manifest

-- Group 6: Priest-Specific Chain
if Player.Class == "PRIEST" then
    AcceptQuestUsingDB(5623); -- Garments of the Light
    CompleteObjectiveOfQuest(5623, 1); -- Heal and Fortify Guard
    TurnInQuestUsingDB(5623); -- Garments of the Light
    AcceptQuestUsingDB(5624); -- In Favor of the Light
    CompleteObjectiveOfQuest(5624, 1); -- Heal Peasants
    TurnInQuestUsingDB(5624); -- In Favor of the Light
end



-- Group 7: Final Reporting
AcceptQuestUsingDB(2158); -- Rest and Relaxation
TurnInQuestUsingDB(54); -- Report to Goldshire
TurnInQuestUsingDB(2158); -- Rest and Relaxation

Log("[Northshire Abbey] Questing completed!");

StopQuestProfile();

--LoadAndRunQuestProfile(Human_L06-13_ElwynnForest.lua)
