-- Northshire Abbey Questing Profile
AddNameToAvoidWhiteList("Kobold Vermin")
AddNameToAvoidWhiteList("Kobold Worker")
AddNameToAvoidWhiteList("Kobold Laborer")
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests = false

--Varibales--
Player = GetPlayer();

Log("Current Zone ID: "..GetZoneID());
Log("Current Player Position:"..GetPlayer().Position);

---------------------------Class Quest Check and setting IDs--------------------------
Log("Player Class: " .. Player.Class);
if GetPlayerClass() == "Mage" then
    ClassQuest1ID = 3104; ClassQuest1Name = "[1]Glyphic Letter";
    ClassTrainer = "Khelden Bremen"; ClassTrainerX = -8851.707; ClassTrainerY = -187.7086; ClassTrainerZ = 89.31435;
end
if GetPlayerClass() == "Paladin" then
    ClassQuest1ID = 3101; ClassQuest1Name = "[1]Consecrated Letter";
    ClassTrainer = "Brother Sammuel"; ClassTrainerX = -8913.942; ClassTrainerY = -214.4656; ClassTrainerZ = 81.94245;
end
if GetPlayerClass() == "Priest" then
    ClassQuest1ID = 3103; ClassQuest1Name = "[1]Hallowed Letter";
    ClassQuest2ID = 5623; ClassQuest2Name = "[4]In Favor of the Light";
    ClassTrainer = "Priestess Anetta"; ClassTrainerX = -8854.434; ClassTrainerY = -194.2633; ClassTrainerZ = 81.93079;
end
if GetPlayerClass() == "Rogue" then
    ClassQuest1ID = 3102; ClassQuest1Name = "[1]Encrypted Letter";
    ClassTrainer = "Jorik Kerridan"; ClassTrainerX = -8863.42; ClassTrainerY = -212.8476; ClassTrainerZ = 80.69799;
end
if GetPlayerClass() == "Warlock" then
    ClassQuest1ID = 3105; ClassQuest1Name = "[1]Tainted Letter";
    ClassTrainer = "Drusilla La Salle"; ClassTrainerX = -8927.591; ClassTrainerY = -196.1319; ClassTrainerZ = 80.55058;
end
if GetPlayerClass() == "Warrior" then
    ClassQuest1ID = 3100; ClassQuest1Name = "[1]Simple Letter";
    ClassTrainer = "Llane Beshere"; ClassTrainerX = -8917.627; ClassTrainerY = -207.6275; ClassTrainerZ = 82.11898;
end
Log("Class Quest ID: "..ClassQuest1ID.." Name: "..ClassQuest1Name);
Log("ClassTrainer: "..ClassTrainer.." X: "..ClassTrainerX.." Y: "..ClassTrainerY.." Z: "..ClassTrainerZ);
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--------------------------local Functions to be Used Elswhere-------------------------
--------------------------------------------------------------------------------------
function GoToTrainer(unitName, targetX, targetY, targetZ)
    QuestGoToPoint(targetX, targetY, targetZ); -- Pathing to get to specified location
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == unitName) and (IsUnitValid(Unit)== true) then
            Log("Found "..Player.Class.. " Trainer!");         
            InteractWithUnit(Unit);
            SleepPlugin(2000);
        end; -- IF
    end; -- For Each
end
function PreferredVendor()
    VendorName = "Godric Rothgar"; VendorX = -8899.428; VendorY = -121.2275; VendorZ = 81.85623;
    QuestGoToPoint(VendorX, VendorY, VendorZ); -- Pathing to get to specified location
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == VendorName) and (IsUnitValid(Unit)== true) then
            Log("Found Vendor!");         
            InteractWithUnit(Unit);
            SleepPlugin(2000);
        end; -- IF
    end; -- For Each
end
function SetHearthstone(unitName, targetX, targetY, targetZ)
    QuestGoToPoint(targetX, targetY, targetZ); -- Pathing to get to specified location
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == unitName) and (IsUnitValid(Unit)== true) then
            Log("Found "..Player.Class.. " Innkeeper!");         
            InteractWithUnit(Unit);
            SleepPlugin(2000);
            UseMacro("Gossip1");
        end; -- IF
    end; -- For Each
end
function Training()
    Log("Training " .. Player.Name)
    UseMacro("Gossip1")
    SleepPlugin(2000)
    UseMacro("TrainMe")
    SleepPlugin(2000)
end
function UseHearthstone()
    Log("Using Hearthstone");
    UseItem("Hearthstone");
    while Player.IsCasting or Player.isChanneling do
        SleepPlugin(100);
    end
    while InGame == false do
        SleepPlugin(100);
    end
end

--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--------------------------Potential Vendor Blacklist Section--------------------------
--------------------------------------------------------------------------------------
if GetPlayerClass() ~= "Warlock" then
    BlackListSellVendorByName("Dane Winslow");
end
--BlackListSellVendorByName(string Name);
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
--[2]Kobold Camp Cleanup (7)
KoboldVermin = {6}; -- Table to load Kobold Vermin
KillKoboldVermin = CreateObjective("KillMobsAndLoot",1,10,1,7,TableToList(KoboldVermin));
KoboldWorker = {257}; -- Table to load Kobold Workers
KillKoboldWorkers = CreateObjective("KillMobsAndLoot",1,10,1,15,TableToList(KoboldWorker));
KoboldLaborer = {80}; -- Table to load Kobold Laborers
KillKoboldLaborers = CreateObjective("KillMobsAndLoot",1,12,1,21,TableToList(KoboldLaborer));
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------
--Step 0: Initial Grind
if GetPlayer().Level < 4 then
    Log("Player is under Level 4, Proceeding to Grind at Northshire Abbey");
    GrindAreaUntilLevel(4);
end
--Step 1: A Noob's First Quests
AcceptQuestUsingDB(783); Log("Accept: [1]A Threat Within");
TurnInQuestUsingDB(783); Log("Turn-in: [1]A Threat Within");
AcceptQuestUsingDB(5261); Log("Accept: [2]Eagan Peltskinner");
TurnInQuestUsingDB(5261); Log("Turn-in: [2]Eagan Peltskinner");
AcceptQuestUsingDB(7); Log("Accept: [2]Kobold Camp Cleanup");
AcceptQuestUsingDB(33); Log("Accept: [2]Wolves Across the Border");
CompleteObjectiveOfQuest(33,1); Log("Complete: [2]Wolves Across the Border; Objective(s): Wolves Across the Border");
DoObjective(KillKoboldVermin); Log("Complete: [2]Kobold Camp Cleanup; Objective(s): Kobold Camp Cleanup");
TurnInQuestUsingDB(33); Log("Turn-in: [2]Wolves Across the Border");
TurnInQuestUsingDB(7); Log("Turn-in: [2]Kobold Camp Cleanup");
AcceptQuestUsingDB(15); Log("Accept: [3]Investigate Echo Ridge");
--Step 1.5: Class Quests and Training
if not HasPlayerFinishedQuest(ClassQuest1ID) then
    CompleteEntireQuest(ClassQuest1ID); Log("Accept&Complete: "..ClassQuest1Name);
    GoToTrainer(ClassTrainer, ClassTrainerX, ClassTrainerY, ClassTrainerZ); Log("Go to Trainer: "..ClassTrainer);
    Training(); Log("Training: "..Player.Class);
end
--Step 2: Ah, We've Grown a wee little bit
DoObjective(KillKoboldWorkers); Log("Complete: [3]Investigate Echo Ridge; Objective(s): Investigate Echo Ridge");
TurnInQuestUsingDB(15); Log("Turn-in: [3]Investigate Echo Ridge");
AcceptQuestUsingDB(21); Log("Accept: [5]Skirmish at Echo Ridge");
AcceptQuestUsingDB(18); Log("Accept: [4]Brotherhood of Thieves");
CompleteObjectiveOfQuest(18,1); Log("Complete: [4]Brotherhood of Thieves; Objective(s): Brotherhood of Thieves");
TurnInQuestUsingDB(18); Log("Turn-in: [4]]Brotherhood of Thieves");
AcceptQuestUsingDB(6); Log("Accept: [5]Bounty on Garrick Padfoot");
AcceptQuestUsingDB(3903); Log("Accept: [4]Milly Osworth");
-----Add Vendor Step here
DoObjective(KillKoboldLaborers); Log("Complete: [4]Skirmish at Echo Ridge; Objective(s): Skirmish at Echo Ridge");
--Step 2.5: So you think you're Rocky Balboa? Adrian gonna make you train harder
if Player.Level < 6 then
    Log("Player is under Level 6, Proceeding to Grind at Northshire Abbey");
    GrindAreaUntilLevel(6);
    PreferredVendor(); Log("Preferred Vendor: Godric Rothgar");
    GoToTrainer(ClassTrainer, ClassTrainerX, ClassTrainerY, ClassTrainerZ); Log("Go to Trainer: "..ClassTrainer);
    Training(); Log("Training: "..Player.Class);
end
--Step 3: My Grapes! My Harvest! My Quests! Oh, and Padfoot needs to be shanked
TurnInQuestUsingDB(3903); Log("Turn-in: [4]Milly Osworth");
AcceptQuestUsingDB(3904); Log("Accept: [4]Milly's Harvest");
CompleteObjectiveOfQuest(3904,1); Log("Complete: [4]Milly's Harvest; Objective(s): Milly's Harvest");
--GrindAndGather(TableToList(11119),250,TableToFloatArray({-9055.347,-337.7026,74.02544}), false);
CompleteObjectiveOfQuest(6,1); Log("Complete: [5]Bounty on Garrick Padfoot; Objective(s): Bounty on Garrick Padfoot");
--Step 3.5: Bad Deku! Bad! No secret training when All Might said quest!
if Player.Level < 6 then
    Log("Player is under Level 6, Proceeding to Grind at Northshire Abbey");
    --BlackListUnitGUID(103); --Adding Padfoot to the Blacklist so we don't interfere with other's questing
    GrindAreaUntilLevel(6);
    PreferredVendor(); Log("Preferred Vendor: Godric Rothgar");
end
--Step 4: Eurupe's: The Final (Class)Questdown
TurnInQuestUsingDB(3904); Log("Turn-in: [4]Milly's Harvest");
AcceptQuestUsingDB(3905); Log("Accept: [4]Grape Manifest");
TurnInQuestUsingDB(6); Log("Turn-in: [5]Bounty on Garrick Padfoot");
TurnInQuestUsingDB(21); Log("Turn-in: [5]Skirmish at Echo Ridge");
PopMessage("Pathing to turn in [4]Grape Manifest is not working. Feel free to turn in manually");
AcceptQuestUsingDB(54); Log("Accept: [5]Report to Goldshire");
if GetPlayerClass() == "Priest" and not HasPlayerFinishedQuest(ClassQuest2ID) then
    AcceptQuestUsingDB(ClassQuest2ID); Log("Accept: "..ClassQuest2Name);
end
--See if I can get 3905[4]Grape Manifest to work
--Step 5: Wear your sweats Little Mac, we're going to Goldshire and Doc Louis is riding his bike to make sure we get there.
AcceptQuestUsingDB(2158); Log("Accept: [5]Rest and Relaxation");
TurnInQuestUsingDB(54); Log("Turn-in: [5]Report to Goldshire");
AcceptQuestUsingDB(62); Log("Accept: [7]The Jasperlode Mine");
TurnInQuestUsingDB(2158); Log("Turn-in: [5]Rest and Relaxation");

--QED Northshire Abbey 
--(For those that read this shit and actually want to know what QED means: https://en.wikipedia.org/wiki/Q.E.D.)
Log("[Northshire Abbey] Questing completed!");

if HasPlayerFinishedQuest(2158) == true then
	LoadAndRunQuestProfile("Classic\\PelQuesting\\AllianceQuesting_01-60.lua")
else
    StopQuestProfile();
end


