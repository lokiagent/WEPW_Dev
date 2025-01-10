-- Red Cloud Mesa Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests(false)

--Varibales--
Player = GetPlayer();
Log("Current Zone ID: "..GetZoneID());
Log("Current Player Position:"..GetPlayer().Position);
Log("Current Player Race: "..Player.Race);
-----------------------------------------------------------------------------------------
--------Profession Choices, Off by Default.  Set to True to enable these options.--------
TrainHerbalism = false;
TrainSkinning = false;
TrainMining = false;
TrainFirstAid = false;
TrainFishing = false;
TrainCooking = false;
--------------------------------End of Profession Choices--------------------------------
-----------------------------------------------------------------------------------------
-------------------------------------------------Profession Trainers--------------------------------------------------
FirstAidTrainer="Arnok"; FirstAidTrainerID=3373; FirstAidLOC=GetNPCPostionFromDB(FirstAidTrainerID);
FirstAidTrainerX=FirstAidLOC[0]; FirstAidTrainerY=FirstAidLOC[1]; FirstAidTrainerZ=FirstAidLOC[2];
CookingTrainer="Zamja"; CookingTrainerID=3399; CookingLOC=GetNPCPostionFromDB(CookingTrainerID);
CookingTrainerX=CookingLOC[0]; CookingTrainerY=CookingLOC[1]; CookingTrainerZ=CookingLOC[2];
FishingTrainer="Lumak"; FishingTrainerID=3332; FishingLOC=GetNPCPostionFromDB(FishingTrainerID);
FishingTrainerX=FishingLOC[0]; FishingTrainerY=FishingLOC[1]; FishingTrainerZ=FishingLOC[2];
FishingLocation="Durotar"; FishingLocationX=-9387.996; FishingLocationY=-120.6893; FishingLocationZ=58.28284;
SkinningTrainer="Thuwd"; SkinningTrainerID=7088; SkinningLOC=GetNPCPostionFromDB(SkinningTrainerID);
SkinningTrainerX=SkinningLOC[0]; SkinningTrainerY=SkinningLOC[1]; SkinningTrainerZ=SkinningLOC[2];
HerbalismTrainer="Jandi"; HerbalismTrainerID=3404; HerbalismLOC=GetNPCPostionFromDB(HerbalismTrainerID);
HerbalismTrainerX=HerbalismLOC[0]; HerbalismTrainerY=HerbalismLOC[1]; HerbalismTrainerZ=HerbalismLOC[2];
MiningTrainer="Makaru"; MiningTrainerID=3357; MiningLOC=GetNPCPostionFromDB(MiningTrainerID);
MiningTrainerX=MiningLOC[0]; MiningTrainerY=MiningLOC[1]; MiningTrainerZ=MiningLOC[2];
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
------------------------------------------Class Quest Check and setting IDs------------------------------------------
Log("Player Class: " .. Player.Class);
--if GetPlayerClass() == "Druid" then
--   ClassQuestID = 3094; ClassQuestName = "[1]Verdant Note"; 
--   ClassTrainer = "Gart Mistrunner"; ClassTrainerID=3060; ClassTrainerLOC=GetNPCPostionFromDB(ClassTrainerID);
--   ClassTrainerX = ClassTrainerLOC[0]; ClassTrainerY = ClassTrainerLOC[1]; ClassTrainerLOC[2];
--end
--f GetPlayerClass() == "Hunter" then
--   ClassQuestID = 3092; ClassQuestName = "[1]Etched Note"; 
--   ClassTrainer = "Lanka Farshot"; ClassTrainerID=3061; ClassTrainerLOC=GetNPCPostionFromDB(ClassTrainerID);
--   ClassTrainerX = ClassTrainerLOC[0]; ClassTrainerY = ClassTrainerLOC[1]; ClassTrainerLOC[2];
--end
--if GetPlayerClass() == "Shaman" then
--   ClassQuestID = 3093; ClassQuestName = "[1]Rune-Inscribed Note"; 
--   ClassTrainer = "Meela Dawnstrider"; ClassTrainerID=3062; ClassTrainerLOC=GetNPCPostionFromDB(ClassTrainerID);
--   ClassTrainerX = ClassTrainerLOC[0]; ClassTrainerY = ClassTrainerLOC[1]; ClassTrainerLOC[2];
--end
--if GetPlayerClass() == "Warrior" then
--   ClassQuestID = 3091; ClassQuestName = "[1]Simple Note"; 
--   ClassTrainer = "Harutt Thunderhorn"; ClassTrainerID=3059; ClassTrainerLOC=GetNPCPostionFromDB(ClassTrainerID);
--   ClassTrainerX = ClassTrainerLOC[0]; ClassTrainerY = ClassTrainerLOC[1]; ClassTrainerLOC[2];
--end
--Log("Class Quest ID: "..ClassQuestID.." Name: "..ClassQuestName);
--Log("ClassTrainer: "..ClassTrainer.." X: "..ClassTrainerX.." Y: "..ClassTrainerY.." Z: "..ClassTrainerZ);
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

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
function Training()
    Log("Training " .. Player.Name)
    UseMacro("Gossip1")
    SleepPlugin(2000)
    UseMacro("TrainMe")
    SleepPlugin(2000)
end
function PreferredVendor(unitName, VendorX, VendorY, VendorZ)
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
----------------------End of local Functions to be Used Elswhere----------------------

--------------------------------------------------------------------------------------
--------------------------Potential Vendor Blacklist Section--------------------------
--------------------------------------------------------------------------------------
if GetPlayerClass() ~= "Warlock" then
    BlackListSellVendorByName("Cylina Darkheart");
end
BlackListSellVendorByName(Zjolnir);
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
MottledBoars = {3098}; -- Table to load Riverpaw Gnolls
KillMottledBoars = CreateObjective("KillMobsAndLoot",1,10,1,788,TableToList(MottledBoars));
function BenedictChest()
    local Objects = GetObjectList();
    foreach Object in Objects do
        if Object.Name == "Benedict's Chest" then
            Log("Benedict's Chest");
            InteractWithObject(Object);
            SleepPlugin(3000);
        end; -- IF
    end; -- For Each
end;
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------
--Step 0: A New Calf's First Grind
if Player.Level < 4 then
    Log("Current Level: " .. Player.Level .. " Grinding to 4...");
    GrindAreaUntilLevel(4,TableToList{2955,2961},true); --2955(Plainstrider); --2961(Mountain Cougar);
    --Training
end
--Step 1: Out from the Earth Mother's Womb
AcceptQuestUsingDB(747); Log("Accept: [2]The Hunt Begins");
CompleteEntireQuest(752); Log("Accept: [2]A Humble Task");
AcceptQuestUsingDB(753);  Log("Accept: [3]A Humble Task");
CompleteObjectiveOfQuest(753,1); Log("Complete Objective: [3]A Humble Task: Collect Water Pitcher");
CompleteEntireQuest(747); Log("Complete Objective(s) and Turn-In: [2]The Hunt Begins");
--Step 1.5: Class Quests and Training
--if not HasPlayerFinishedQuest(ClassQuestID) then
--    CompleteEntireQuest(ClassQuestID); Log("Accept&Complete: "..ClassQuestName);
--    GoToTrainer(ClassTrainer, ClassTrainerX, ClassTrainerY, ClassTrainerZ); Log("Go to Trainer: "..ClassTrainer);
--    Training(); Log("Training: "..Player.Class);
--end
-- Step 2: The Neverending Hunt Continues....
AcceptQuestUsingDB(750); Log("Accept: [3]The Hunt Continues");
TurnInQuestUsingDB(753); Log("Turn-In: [3]A Humble Task");
AcceptQuestUsingDB(755); Log("Accept: Rites of the Earthmother");
CompleteObjectiveOfQuest(750,1); Log("Complete Objective(s): [3]The Hunt Continues: Collect Mountain Couger Pelts");
TurnInQuestUsingDB(755); Log("Turn-In: Rites of the Earthmother");
AcceptQuestUsingDB(757); Log("Accept [4]Rite of Strength");
TurnInQuestUsingDB(750); Log("Turn-In: [3]The Hunt Continues");
--Step 3: Don't be so Rash, Zitz not like they're Battle Toads
AcceptQuestUsingDB(780); Log("Accept: [4]The Battleboars");
AcceptQuestUsingDB(3376); Log("Accept: [5]Break Sharptusk!");
CompleteObjectiveOfQuest(780,1); Log("Complete Objective(s): [4]The Battleboars: Collect Battleboar Snouts");
CompleteObjectiveOfQuest(3376,1); Log("Complete Objective(s): [5]Break Sharptusk!: Collect Chief Sharptusk Thornmantle's Head");
AcceptQuestUsingDB(781); Log("Accept: [4]Attack on Camp Narache");
if (HasItem("Dirt-stained Map") and IsOnQuest(781) ~= true) then
    UseItem("Dirt-stained Map");
end
CompleteObjectiveOfQuest(757,1); Log("Complete Objective(s): [4]Rite of Strength: Bristleback Belt");
TurnInQuestUsingDB(780); Log("Turn-in: [4]The Battleboars");
TurnInQuestUsingDB(3376); Log("Turn-in: [5]Break Sharptusk!");
TurnInQuestUsingDB(781); Log("Turn-in: [4]Attack on Camp Narache");
TurnInQuestUsingDB(757); Log("Turn-in: [4]Rite of Strength");
AcceptQuestUsingDB(763); Log("Accept: [5]Rites of the Earthmother");
AcceptQuestUsingDB(1656); Log("Accept: [5]A Task Unfinished");
--Step 4: Headed to Camp, Never to see your (Earth)Mother again... ;(
if Player.Level < 8 then
    Log("Current Level: " .. Player.Level .. " Grinding to 8...");
    GrindAreaUntilLevel(8,TableToList{2985,2969,2956},true); --2958(Prarie Wolf); --2969(Wiry Swoop); --2956(Adult Plainstrider);
    --Training
end

TurnInQuestUsingDB(763); Log("Turn-in: [5]Rites of the Earthmother");
TurnInQuestUsingDB(1656); Log("Turn-in: [5]A Task Unfinished");

StopQuestProfile();
