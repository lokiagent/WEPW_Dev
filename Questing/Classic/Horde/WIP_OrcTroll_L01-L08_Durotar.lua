-- Durotar Questing Profile with Class Quests
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests = false
Player = GetPlayer()

-- Grind Step: To Level 3
GrindAreaUntilLevel(3)

-- Player Spell Training Check
if GetPlayerClass() == "Shaman" and not HasSpell(8075) then
    Log("Player does not have spell ID 8075, Rockbiter Weapon: Rank 1 training!")
    TrainAtNearestClassTrainer()
end

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
CompleteObjectiveOfQuest(5441, 1); -- Wake Lazy Peons with the Foreman's axe
TurnInQuestUsingDB(789); -- Sting of the Scorpid
TurnInQuestUsingDB(5441); -- Lazy Peons

-- Group 3: Sarkoth and Burning Blade Medallion
AcceptQuestUsingDB(790); -- Sarkoth
AcceptQuestUsingDB(794); -- Burning Blade Medallion
CompleteObjectiveOfQuest(790, 1); -- Kill Sarkoth and collect his claw
TurnInQuestUsingDB(790); -- Sarkoth
CompleteObjectiveOfQuest(794, 1); -- Retrieve the Burning Blade Medallion from the cave
TurnInQuestUsingDB(794); -- Burning Blade Medallion

-- Class-Specific Quests at Level 4
if Player.Level >= 4 then
    if GetPlayerClass() == "Warrior" and not HasPlayerFinishedQuest(1505) then
        AcceptQuestUsingDB(1505); -- Veteran Uzzek
        TurnInQuestUsingDB(1505); -- Veteran Uzzek
        AcceptQuestUsingDB(1506); -- Gan'rul's Summons
    elseif GetPlayerClass() == "Shaman" and not HasPlayerFinishedQuest(1516) then
        AcceptQuestUsingDB(1516); -- Call of Earth (Part 1)
        CompleteObjectiveOfQuest(1516, 1); -- Earth Sapta
        TurnInQuestUsingDB(1516); -- Call of Earth
    elseif GetPlayerClass() == "Hunter" and not HasPlayerFinishedQuest(6062) then
        AcceptQuestUsingDB(6062); -- Taming the Beast
        CompleteObjectiveOfQuest(6062, 1); -- Tame Adult Plainstrider
        TurnInQuestUsingDB(6062); -- Taming the Beast
        AcceptQuestUsingDB(6063); -- Taming the Beast (Part 2)
    elseif GetPlayerClass() == "Rogue" and not HasPlayerFinishedQuest(3088) then
        AcceptQuestUsingDB(3088); -- Encrypted Tablet
        TurnInQuestUsingDB(3088); -- Encrypted Tablet
    elseif GetPlayerClass() == "Priest" and not HasPlayerFinishedQuest(5649) then
        AcceptQuestUsingDB(5649); -- In Favor of the Light
        CompleteObjectiveOfQuest(5649, 1); -- Heal Peasants
        TurnInQuestUsingDB(5649); -- In Favor of the Light
    elseif GetPlayerClass() == "Warlock" and not HasPlayerFinishedQuest(1506) then
        AcceptQuestUsingDB(1506); -- Gan'rul's Summons
        TurnInQuestUsingDB(1506); -- Gan'rul's Summons
        AcceptQuestUsingDB(1507); -- Devourer of Souls
    end
end

-- Group 4: Report to Sen'jin Village
AcceptQuestUsingDB(805); -- Report to Sen'jin Village
TurnInQuestUsingDB(805); -- Report to Sen'jin Village
AcceptQuestUsingDB(817); -- Practical Prey
AcceptQuestUsingDB(818); -- A Solvent Spirit
CompleteObjectiveOfQuest(817, 1); -- Collect tiger fur
CompleteObjectiveOfQuest(818, 1); -- Collect frog legs and crawler mucus
TurnInQuestUsingDB(817); -- Practical Prey
TurnInQuestUsingDB(818); -- A Solvent Spirit

-- Grind Step: To Level 6
GrindAreaUntilLevel(6)

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

-- Grind Step: To Level 08
GrindAreaUntilLevel(08);

Log("[Durotar] Questing completed!");
StopQuestProfile();

--LoadAndRunQuestProfile([Orc]L06-12_RazorHill.lua)
