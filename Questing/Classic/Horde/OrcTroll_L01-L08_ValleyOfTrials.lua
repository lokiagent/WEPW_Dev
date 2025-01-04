-- Valley of Trials Questing Profile
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

--Profession Choices, Off by Default.  Set to True to enable these options.
TrainHerbalism = false;
TrainSkinning = false;
TrainMining = false;
TrainFirstAid = false;
TrainFishing = false;
TrainCooking = false;

---------------------------Class Quest Check and setting IDs--------------------------
Log("Player Class: " .. Player.Class);
if GetPlayerClass() == "Hunter" then
    if Player.Race == "Orc" then ClassQuest1ID = 3087; ClassQuest1Name = "[1]Etched Parchment"; end
    if Player.Race == "Troll" then ClassQuest1ID = 3082; ClassQuest1Name = "[1]Etched Tablet"; end
    ClassTrainer = "Jen'Shan"; ClassTrainerX = -634.9662; ClassTrainerY = -4227.633; ClassTrainerZ = 38.13416;
end
if GetPlayerClass() == "Mage" then
    if Player.Race == "Troll" then ClassQuest1ID = 3086; ClassQuest1Name = "[1]Glyphic Tablet"; end
    ClassTrainer = "Khelden Bremen"; ClassTrainerX = -624.3073; ClassTrainerY = -4210.566; ClassTrainerZ = 38.13391;
end
if GetPlayerClass() == "Priest" then
    if Player.Race == "Troll" then ClassQuest1ID = 3085; ClassQuest1Name = "[1]Hallowed Tablet"; end
    ClassTrainer = "Priestess Anetta"; ClassTrainerX = -616.542; ClassTrainerY = -4203.116; ClassTrainerZ = 38.13399;
end
if GetPlayerClass() == "Rogue" then
    Log("race:"..Player.Race);
    if Player.Race == "Orc" then ClassQuest1ID = 3088; ClassQuest1Name = "[1]Encrypted Parchment"; Log("Rogue Class Quest"); end
    if Player.Race == "Troll" then ClassQuest1ID = 3083; ClassQuest1Name = "[1]Encrypted Tablet"; end
    ClassTrainer = "Rwag"; ClassTrainerX = -589.6391; ClassTrainerY = -4144.914; ClassTrainerZ = 41.06564;
    ClassTrainer2Posistion = GetNPCPostionFromDB(3170); ClassTrainer2 = "Kaplak";
    ClassTrainer2X = ClassTrainer2Posistion[0]; ClassTrainer2Y = ClassTrainer2Posistion[1]; ClassTrainer2Z = ClassTrainer2Posistion[2];
end
if GetPlayerClass() == "Shaman" then
    if Player.Race == "Orc" then ClassQuest1ID = 3089; ClassQuest1Name = "[1]Rune-Inscribed Parchment"; end
    if Player.Race == "Troll" then ClassQuest1ID = 3084; ClassQuest1Name = "[1]Rune-Inscribed Tablet"; end
    ClassTrainer = "Shikrik"; ClassTrainerX = -622.6997; ClassTrainerY = -4204.333; ClassTrainerZ = 38.13391;
end
if GetPlayerClass() == "Warlock" then
    if Player.Race == "Orc" then ClassQuest1ID = 3090; ClassQuest1Name = "[1]Tainted Parchment"; end
    ClassTrainer = "Nartok"; ClassTrainerX = -605.1796; ClassTrainerY = -4111.446; ClassTrainerZ = 43.22225;
end
if GetPlayerClass() == "Warrior" then
    if Player.Race == "Orc" then ClassQuest1ID = 2383; ClassQuest1Name = "[1]Simple Parchment"; end
    if Player.Race == "Troll" then ClassQuest1ID = 3065; ClassQuest1Name = "[1]Simple Tablet"; end
    ClassTrainer = "Frang"; ClassTrainerX = -637.7752; ClassTrainerY = -4231.013; ClassTrainerZ = 38.13416;
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

--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------
--Step 0: Initial Grind
while Player.Level < 3 do
    Log("Current Level: " .. Player.Level .. " Grinding to 3...");
    GrindAndGather(TableToList{3098,3124}, 150, TableToFloatArray({-462.2097, -4266.723, 47.2359}), false);
end
--Step 0.5: Having some Class
--if not HasPlayerFinishedQuest(ClassQuest1ID) then
--    CompleteEntireQuest(ClassQuest1ID); Log("Accept&Complete: "..ClassQuest1Name);
--    GoToTrainer(ClassTrainer, ClassTrainerX, ClassTrainerY, ClassTrainerZ); Log("Go to Trainer: "..ClassTrainer);
--    Training(); Log("Training: "..Player.Class);
--end
--Step 1: Dying of Thirst in a Parched Land
AcceptQuestUsingDB(4641); Log("Accept: [1]Your Place In The World");
TurnInQuestUsingDB(4641); Log("TurnIn: [1]Your Place In The World");
AcceptQuestUsingDB(788); Log("Accept: [2]Cutting Teeth");
DoObjective(KillMottledBoars); Log("Complete: [2]Cutting Teeth; Objective(s): Cutting Teeth");
AcceptQuestUsingDB(790); Log("Accept: [5]Sarkoth");
CompleteEntireQuest(790); Log("Complete: [5]Sarkoth");
AcceptQuestUsingDB(804); Log("Accept: [5]Sarkoth");
TurnInQuestUsingDB(788); Log("TurnIn: [2]Cutting Teeth");
TurnInQuestUsingDB(804); Log("TurnIn: [5]Sarkoth");
AcceptQuestUsingDB(789); Log("Accept: [3]Sting of the Scorpid");
AcceptQuestUsingDB(4402); Log("Accept: [3]Galgar's Cactus Apple Surprise");
if (IsOnQuest(4402) == true and IsOnQuest(792) ~= true) then
    VendorName = "Huklah"; VendorX = -582.9638; VendorY = -4111.203; VendorZ = 43.41181;
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end
--Step 2: Level 5 is the lonliest number
while Player.Level >= 3 and Player.Level < 5 do
    Log("Current Level: " .. Player.Level .. " Grinding to 5...");
    GrindAndGather(TableToList{3098,3124}, 150, TableToFloatArray({-462.2097, -4266.723, 47.2359}), false);
end
--Step 3: The Valley of Trials
AcceptQuestUsingDB(792); Log("Accept: [4]Vile Familiars");
AcceptQuestUsingDB(5441); Log("Accept: [4]Lazy Peons");
if HasPlayerFinishedQuest(804) == true and HasPlayerFinishedQuest(792) ~= true then
    GoToTrainer(ClassTrainer, ClassTrainerX, ClassTrainerY, ClassTrainerZ); Log("Go to Trainer: "..ClassTrainer);
    Training(); Log("Training: "..Player.Class);
end
---------------------------Quests Not Working Properly--------------------------------
----------As of 01/03/2024, the following quests are not working properly-------------
---------------------------Completion Must Be done Manually---------------------------
 if HasPlayerFinishedQuest(5441) ~= true then
    if CanTurnInQuest(5441) ~= true then
        PopMessage("The following quest is not working correctly and need to be completed manually. [4]Lazy Peons");
    end
end
--CompleteEntireQuest(5441); Log("Complete: [4]Lazy Peons");
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
CompleteObjectiveOfQuest(4402,1); Log("Complete: [3]Galgar's Cactus Apple Surprise; Objective(s): Galgar's Cactus Apple");
CompleteObjectiveOfQuest(792,1); Log("Complete: [4]Vile Familiars; Objective(s): Vile Familiar");
if HasPlayerFinishedQuest(804) == true and HasPlayerFinishedQuest(792) ~= true then
    VendorName = "Huklah"; VendorX = -582.9638; VendorY = -4111.203; VendorZ = 43.41181;
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end
TurnInQuestUsingDB(4402); Log("TurnIn: [3]Galgar's Cactus Apple Surprise");
TurnInQuestUsingDB(789); Log("TurnIn: [3]Sting of the Scorpid");
TurnInQuestUsingDB(792); Log("TurnIn: [4]Vile Familiars");
AcceptQuestUsingDB(794); Log("Accept: [5]Burning Blade Medallion");
TurnInQuestUsingDB(5441); Log("TurnIn: [4]Lazy Peons");
AcceptQuestUsingDB(6394); Log("Accept: [4]Thazz'ril's Pick");
CompleteObjectiveOfQuest(6394,1); Log("Complete: [4]Thazz'ril's Pick; Objective(s): Thazz'ril's Pick");
CompleteObjectiveOfQuest(794,1); Log("Complete: [5]Burning Blade Medallion; Objective(s): Burning Blade Medallion");
if HasPlayerFinishedQuest(5441) == true and HasPlayerFinishedQuest(794) ~= true then
    VendorName = "Huklah"; VendorX = -582.9638; VendorY = -4111.203; VendorZ = 43.41181;
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end
TurnInQuestUsingDB(6394); Log("TurnIn: [4]Thazz'ril's Pick");
AcceptQuestUsingDB(805); Log("Accept: [5]Report to Sen'jin Village");
TurnInQuestUsingDB(794); Log("TurnIn: [5]Burning Blade Medallion");
AcceptQuestUsingDB(2161); Log("Accept: [5]A Peon's Burden");
AcceptQuestUsingDB(786); Log("Accept: [5]Thwarting Kolkar Aggression");
AcceptQuestUsingDB(817); Log("Accept: [8]Practical Prey");
AcceptQuestUsingDB(818); Log("Accept: [8]A Solvent Spirit");
TurnInQuestUsingDB(805); Log("TurnIn: [5]Report to Sen'jin Village");
AcceptQuestUsingDB(808); Log("Accept: [8]Minshina's Skull");
AcceptQuestUsingDB(826); Log("Accept: [10]Zalazane");
AcceptQuestUsingDB(823); Log("Accept: [7]Report to Orgnil");
while Player.Level >= 6 and Player.Level < 10 do
    Log("Current Level: " .. Player.Level .. " Grinding to 10...");
    GrindAndGather(TableToList{3099,3125}, 300, TableToFloatArray({-98.56424,-4755.883,10.71403}), false);
    VendorName = "Trayexir"; VendorX = -771.6943; VendorY = -4947.621; VendorZ = 22.88062;
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);  
    GoToTrainer(ClassTrainer2, ClassTrainer2X, ClassTrainer2Y, ClassTrainer2Z); Log("Go to Trainer: "..ClassTrainer2);  
    Training(); Log("Training: "..Player.Class);    
end
---------------------------Quests Not Working Properly--------------------------------
----------As of 01/03/2024, the following quests are not working properly-------------
---------------------------Completion Must Be done Manually---------------------------
if (HasPlayerFinishedQuest(786) ~= true or HasPlayerFinishedQuest(818) ~= true) then
    if(CanTurnInQuest(786) ~= true or CanTurnInQuest(818) ~= true) then
        PopMessage("The following 2 quests are not working correctly and need to be completed manually. [5]Thwarting Kolkar Aggression, [8]A Solvent Spirit.");
    end
end
--CompleteEntireQuest(786); Log("Complete: [5]Thwarting Kolkar Aggression");
--CompleteEntireQuest(818); Log("Complete: [8]A Solvent Spirit");
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
if HasPlayerFinishedQuest(5441) == true and HasPlayerFinishedQuest(794) ~= true then
    VendorName = "Trayexir"; VendorX = -771.6943; VendorY = -4947.621; VendorZ = 22.88062;
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end
---------------------------Quests Not Working Properly--------------------------------
----------As of 01/03/2024, the following quests are not working properly-------------
---------------------------Completion Must Be done Manually---------------------------
if (HasPlayerFinishedQuest(817) ~= true or HasPlayerFinishedQuest(808) ~= true or HasPlayerFinishedQuest(826) ~= true) then
    if (CanTurnInQuest(817) ~= true or CanTurnInQuest(808) ~= true or CanTurnInQuest(826) ~= true) then
        PopMessage("The following 3 quests are on Islands and pathing to the Islands isn't working well. [8]Practical Prey, [9]Minshina's Skull, [10]Zalazane.  You can skip (default), or you can complete manually, or you can swim to island, uncomment the following lines, and the bot will complete the quests for you.  You will then have to manually travel back and restart the bot when back on the main land.");
    end
end
--CompleteObjectiveOfQuest(817,1); Log("Complete: [8]Practical Prey");
--CompleteObjectiveOfQuest(808,1); Log("Complete: [9]Minshina's Skull")
--CompleteObjectiveOfQuest(826,1); Log("Complete: [10]Zalazane; Objective(s): Hexxed Troll")
--CompleteObjectiveOfQuest(826,2); Log("Complete: [10]Zalazane; Objective(s): VoodooTroll")
--CompleteObjectiveOfQuest(826,3); Log("Complete: [10]Zalazane; Objective(s): Zalazane's Head")
--GrindAndGather({3205,3206,3207},150,TableToFloatArray({-1232.172,-5470.871,5.932333}),false);
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
TurnInQuestUsingDB(786); Log("TurnIn: [5]Thwarting Kolkar Aggression");
TurnInQuestUsingDB(818); Log("TurnIn: [8]A Solvent Spirit");
TurnInQuestUsingDB(817); Log("TurnIn: [8]Practical Prey");
TurnInQuestUsingDB(808); Log("TurnIn: [9]Minshina's Skull");
TurnInQuestUsingDB(826); Log("TurnIn: [10]Zalazane");
--Step 4: Occam's Razor Hill
TurnInQuestUsingDB(823); Log("TurnIn: [7]Report to Orgnil");
AcceptQuestUsingDB(806); Log("Accept: [12]Dark Storms");
AcceptQuestUsingDB(784); Log("Accept: [7]Vanquish the Betrayers");
AcceptQuestUsingDB(837); Log("Accept: [10]Encroachment");
AcceptQuestUsingDB(815); Log("Accept: [8]Break a Few Eggs");
AcceptQuestUsingDB(791); Log("Accept: [7]Carry Your Weight");
TurnInQuestUsingDB(2161); Log("TurnIn: [5]A Peon's Burden");
--Set Hearthstone to Razor Hill
CompleteObjectiveOfQuest(784,1); Log("Complete: [7]Vanquish the Betrayers; Objective(s): Vanquish the Betrayers");
CompleteObjectiveOfQuest(784,2); Log("Complete: [7]Vanquish the Betrayers; Objective(s): Vanquish the Betrayers");
CompleteObjectiveOfQuest(784,3); Log("Complete: [7]Vanquish the Betrayers; Objective(s): Vanquish the Betrayers");
CompleteObjectiveOfQuest(791,1); Log("Complete: [7]Carry Your Weight; Objective(s): Carry Your Weight");
CompleteEntireQuest(830); Log("Complete: [7]The Admiral's Orders");
TurnInQuestUsingDB(784); Log("TurnIn: [7]Vanquish the Betrayers");
TurnInQuestUsingDB(791); Log("TurnIn: [7]Carry Your Weight");
QuestGoToPoint(338.9756, -4688.464, 16.4587); -- Pathing to get to specified location

StopQuestProfile();
