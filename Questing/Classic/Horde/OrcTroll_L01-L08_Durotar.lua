-- Durotar Questing Profile with Class Quests
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests = false
Player = GetPlayer()

--function SlapTheBitchPeons2()
--    print("Attempting to target Lazy Peon...");
--    TargetUnit("Lazy Peon");
--    print("Using item 16114 on target...");
--    UseItem(16114);
--    print("Action completed.");
--end;

--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
--Lazy Peons
--LazyPeons = {}; -- Table to load Lazy Peons
--LazyPeons[1] = 10556; -- Lazy Peon
--LazyPeons[2] = 16114; -- Foreman's Blackjack
--TargetTheBitchPeons = CreateObjective("TargetUnit",1,5,2,5441,TableToList(LazyPeons));
--SlapTheBitchPeons = CreateObjective("UseItem",2,5,2,5441,TableToList(LazyPeons));

--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------

-- Grind Step: To Level 3
GrindAreaUntilLevel(3)
-- Player Spell Training Check
--if GetPlayerClass() == "Shaman" and not HasSpell(8075) then
--    Log("Player does not have spell ID 8075, Rockbiter Weapon: Rank 1 training!");
--    TrainAtNearestClassTrainer();
--end
--if Player.Class == 1 and not HasPlayerFinishedQuest(5651) then --Warrior
--    AcceptQuestUsingDB(); -- 
--end
--if Player.Class == 4 and not HasPlayerFinishedQuest(3096) then --Rogue
--    AcceptQuestUsingDB(3096); -- [1] Encrypted Scroll
--    TurnInQuestUsingDB(3096); -- [1] Encrypted Scroll
--end
--if Player.Class == 5 and not HasPlayerFinishedQuest(5651) then --Priest
--    AcceptQuestUsingDB(5651); -- In Favor of Darkness
--end
if Player.Class == 8 and not HasPlayerFinishedQuest(3086) then --Mage
    CompleteEntireQuest(3086); -- Glyphic Tablet
end
--if Player.Class == 9 and not HasPlayerFinishedQuest(5651) then --Warlock
--    AcceptQuestUsingDB(); -- 
--end


-- Class Quest Checker
if GetPlayerClass() == "Shaman" and not HasPlayerFinishedQuest(3082) then
    AcceptQuestUsingDB(3082); -- Etched Tablet
    TurnInQuestUsingDB(3082); -- Etched Tablet
end

-- Quest Chains and Groups
-- Group 1: Initial Quest Acceptance
AcceptQuestUsingDB(4641); -- Your Place In The World
TurnInQuestUsingDB(4641); -- Your Place In The World
AcceptQuestUsingDB(788); -- Cutting Teeth
CompleteObjectiveOfQuest(788, 1); -- Kill boars around Valley of Trials
TurnInQuestUsingDB(788); -- Cutting Teeth

-- Group 2: Scorpid and Peon Quests
AcceptQuestUsingDB(789); -- Sting of the Scorpid
AcceptQuestUsingDB(5441); -- Lazy Peons
CompleteObjectiveOfQuest(789, 1); -- Collect Scorpid Worker tails
--if CompleteObjectiveOfQuest(5441, 1); then SlapTheBitchPeons(); end -- Wake Lazy Peons with the Foreman's axe
--DoObjective(SlapTheBitchPeons);  -- Wake Lazy Peons with the Foreman's axe
--DoObjective(TargetTheBitchPeons); DoObjective(SlapTheBitchPeons); -- Wake Lazy Peons with the Foreman's axe
TurnInQuestUsingDB(789); -- Sting of the Scorpid
TurnInQuestUsingDB(5441); -- Lazy Peons
CompleteEntireQuest(4402); -- Galgar's Cactus Apple Surprise

-- Group 3: Sarkoth and Burning Blade Medallion
AcceptQuestUsingDB(790); -- Sarkoth
AcceptQuestUsingDB(792); -- Vile Familiars
CompleteObjectiveOfQuest(790, 1); -- Kill Sarkoth and collect his claw
CompleteEntireQuest(792); -- Vile Familiars
AcceptQuestUsingDB(794); -- Burning Blade Medallion
TurnInQuestUsingDB(790); -- Sarkoth
AcceptQuestUsingDB(804); -- Sarkoth
AcceptQuestUsingDB(6394); -- Thazz'ril's Pick
CompleteObjectiveOfQuest(6394, 1); -- Collect Thazz'ril's Pick
CompleteEntireQuest(794); -- Retrieve the Burning Blade Medallion from the cave
TurnInQuestUsingDB(6394); -- Thazz'ril's Pick
TurnInQuestUsingDB(804); -- Sarkoth

-- Spell Training Check
--if Player.Level < 9 then
    QuestGoToPoint(-976.9368,-4471.776,51.91344);
    GrindAreaUntilLevel(9);
--end

-- Group 4: Report to Sen'jin Village
AcceptQuestUsingDB(2161); -- A Peon's Burden
AcceptQuestUsingDB(805); -- Report to Sen'jin Village
TurnInQuestUsingDB(805); -- Report to Sen'jin Village
AcceptQuestUsingDB(817); -- Practical Prey
AcceptQuestUsingDB(818); -- A Solvent Spirit
AcceptQuestUsingDB(786); -- Thwarting Kolkar Aggression
--CompleteObjectiveOfQuest(817, 1); -- Collect tiger fur
--CompleteEntireQuest(786); -- Attack Plan1
--CompleteEntireQuest(818); -- Collect frog legs and crawler mucus
--TurnInQuestUsingDB(817); -- Practical Prey

-- Grind Step: To Level 11
GrindAreaUntilLevel(11);

-- Group 5: Echo Isles Preparation
AcceptQuestUsingDB(826); -- Zalazane
AcceptQuestUsingDB(818); -- Minshina's Skull
AcceptQuestUsingDB(784); -- Vanquish the Betrayers
CompleteObjectiveOfQuest(826, 1); -- Kill Zalazane and his minions
CompleteObjectiveOfQuest(818, 1); -- Retrieve Minshina's Skull
CompleteObjectiveOfQuest(784, 1); -- Kill Kul Tiras sailors and marines

TurnInQuestUsingDB(826); -- Zalazane
TurnInQuestUsingDB(818); -- Minshina's Skull
TurnInQuestUsingDB(784); -- Vanquish the Betrayers

-- Group 6: Journey to Razor Hill
AcceptQuestUsingDB(806); -- Dark Storms
AcceptQuestUsingDB(823); -- Report to Orgnil
TurnInQuestUsingDB(823); -- Report to Orgnil
CompleteObjectiveOfQuest(806, 1); -- Collect Thunder Lizard blood
TurnInQuestUsingDB(806); -- Dark Storms

-- Grind Step: To Level 13
GrindAreaUntilLevel(13);

Log("[Durotar] Questing completed!");
StopQuestProfile();

--LoadAndRunQuestProfile([Orc]L06-12_RazorHill.lua)
