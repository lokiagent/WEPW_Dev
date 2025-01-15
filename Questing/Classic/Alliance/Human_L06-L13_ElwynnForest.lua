-- Elwynn Forest Questing Profile
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

--Profession Choices, Off by Default.  Set to True to enable these options.
TrainHerbalism = false;
TrainSkinning = false;
TrainMining = false;
TrainFirstAid = false;
TrainFishing = false;
TrainCooking = false;
-----------------------------------Flight Functions-----------------------------------
local function HandleFlightPath(name, coords)
    Log("Starting " .. name .. " flight path function")
    Units = GetUnitsList();
    QuestGoToPoint(table.unpack(coords))
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == name) and (IsUnitValid(Unit)== true) then
            Log("Found flight master!");         
            InteractWithUnit(Unit);
            SleepPlugin(5000);
        end; -- IF
    end; -- For Each
end; 
local function FlyToDestination(destination, sleepTime)
    Log("Flying to " .. destination)
    for _ = 1, 3 do
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro(destination)
        SleepPlugin(2000)
    end
    SleepPlugin(sleepTime or 90000)
end
-- Flight Path Functions
function WestfallFP()
    HandleFlightPath("Thor", { -10627.74, 1038.647, 34.12702 })
end
function StormwindFP()
    HandleFlightPath("Dungar Longdrink", { -8834.801, 487.8065, 109.6138 })
end
function RedridgeFP()
    HandleFlightPath("Ariena Stormfeather", { -9434.632, -2235.667, 69.05429 })
end
function DarkshireFP()
    HandleFlightPath("Felicia Maline", { -10513.16, -1259.571, 41.42373 })
end
function FlyToStormwind()
    FlyToDestination("Stormwind")
end
function FlyToWestfall()
    FlyToDestination("Sentinel Hill")
end
function FlyToRedridgeMountains()
    FlyToDestination("Lakeshire")
end
function FlyToDuskwood()
    FlyToDestination("Darkshire")
end


---------------------------Class Quest Check and setting IDs--------------------------
Log("Player Class: " .. Player.Class);
if GetPlayerClass() == "Mage" then
    ClassTrainer = "Zaldar Wefellt"; ClassTrainerX = -9471.374; ClassTrainerY = 33.34243; ClassTrainerZ = 63.82144;
end
if GetPlayerClass() == "Paladin" then
    ClassTrainer = "Brother Wilhelm"; ClassTrainerID=927; TrainerLOC=GetNPCPostionFromDB(ClassTrainerID);
    ClassTrainerX=TrainerLOC[0]; ClassTrainerY=TrainerLOC[1]; ClassTrainerZ=TrainerLOC[2];
    --ClassTrainerX = -9468.029; ClassTrainerY = 110.4681; ClassTrainerZ = 57.54885;
end
if GetPlayerClass() == "Priest" then
    ClassQuest2ID = 5623; ClassQuest2Name = "[4]In Favor of the Light";
    ClassQuest4ID = 5624; ClassQuest4Name = "[4]Garments of the Light";
    ClassTrainer = "Priestess Josetta"; ClassTrainerX = 9460.959; ClassTrainerY = 31.91691; ClassTrainerZ = 63.82146;
    SWClassTrainer = "High Priestess Laurena"; SWClassTrainerX = -8512.978; SQClassTrainerY = 863.5026; SWClassTrainerZ = 109.84;
end
if GetPlayerClass() == "Rogue" then
    ClassTrainer = "Keryn Sylvius"; ClassTrainerX = -9465.168; ClassTrainerY = 13.91039; ClassTrainerZ = 63.82156
end
if GetPlayerClass() == "Warlock" then
    ClassTrainer = "Maximillian Crowe"; ClassTrainerX = -9470.861; ClassTrainerY = -6.041564; ClassTrainerZ = 49.79477;
end
if GetPlayerClass() == "Warrior" then
    ClassTrainer = "Lyria Du Lac"; ClassTrainerX = -9461.679; ClassTrainerY = 110.8836; ClassTrainerZ = 57.78799;
end
FirstAidTrainer="Michelle Belle"; FirstAidTrainerX=-9457.135; FirstAidTrainerY=28.47216; FirstAidTrainerZ=63.82029;
CookingTrainer="Tomas"; CookingTrainerX=-9467.531; CookingTrainerY=-2.986725; CookingTrainerZ=56.95;
FishingTrainer="Lee Brown"; FishingTrainerX=-9382.862; FishingTrainerY=-116.7068; FishingTrainerZ=58.814;
FishingLocation="Elwynn Forest"; FishingLocationX=-9387.996; FishingLocationY=-120.6893; FishingLocationZ=58.28284;
SkinningTrainer="Helene Peltskinner"; SkinningTrainerX=-9380.401; SkinningTrainerY=-70.4082; SkinningTrainerZ=64.43704;
HerbalismTrainer="Herbalist Pomeroy"; HerbalismTrainerX=-9058.348; HerbalismTrainerY=150.7797; HerbalismTrainerZ=115.033;
MiningTrainer="Gelman Stonehand"; MiningTrainerX=-8433.104; MiningTrainerY=694.3175; MiningTrainerZ=103.3633;
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
function PreferredVendor(unitName, VendorX, VendorY, VendorZ)
    QuestGoToPoint(VendorX, VendorY, VendorZ); -- Pathing to get to specified location
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == VendorName) and (IsUnitValid(Unit)== true) then
            Log("Found Vendor!"..unitName);         
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
function BundleOfWood()
    if ItemCount("Bundle of Wood") == 8 then
        return false
    end
end
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--------------------------Potential Vendor Blacklist Section--------------------------
--------------------------------------------------------------------------------------
if GetPlayerClass() ~= "Warlock" then
    BlackListSellVendorByName("Cylina Darkheart");
end
BlackListSellVendorByName("Dawn Brightstar"); --Why? Becuase I don't like the F'ing Tower of Azora.
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
GuardRoberts = {80}; -- Table to load Guard Roberts
HealGuardRoberts = CreateObjective("KillMobsAndLoot",1,12,1,21,TableToList(GuardRoberts));
DefiasRogueWizard = {474}; -- Table to load Defias Rogue Wizards
RiverpawGnolls = {97,478}; -- Table to load Riverpaw Gnolls

Wood = {176793}
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------
--Step 0: Set Hearthstone to Lion's Pride Inn, Priest Class Quest 1
--if GetPlayerClass() == "Priest" and not HasPlayerFinishedQuest(ClassQuest2ID) then
--    GoToTrainer(ClassTrainer, ClassTrainerX, ClassTrainerY, ClassTrainerZ); Log("Go to Trainer: "..ClassTrainer);
--    TurnInQuestUsingDB(ClassQuest2ID); Log("Completing: "..ClassQuest2Name);
--    CompleteEntireQuest(ClassQuest4ID); Log("Completing: "..ClassQuest4Name);
--end
--Step 0.5: Getting Configured Profession Training
Log("Player Herbalism Status:" ..HasSkill(182));
if TrainHerbalism and not HasSkill(182) then
    GoToTrainer(HerbalismTrainer, HerbalismTrainerX, HerbalismTrainerY, HerbalismTrainerZ); Log("Go to Trainer: Herbalism");
    Training(); Log("Training Herbalism");
end
Log("Player Skinning Status:" ..SkillValue(393));
if TrainSkinning and not HasSkill(393) then
    GoToTrainer(SkinningTrainer, SkinningTrainerX, SkinningTrainerY, SkinningTrainerZ); Log("Go to Trainer: Skinning");
    Training(); Log("Training Skinning");
end
--Log("Player Mining Status:" ..HasSkill(186));
--if TrainMining and not HasSkill(186)then
--    GoToTrainer(MiningTrainer, MiningTrainerX, MiningTrainerY, MiningTrainerZ); Log("Go to Trainer: Mining");
--    Training(); Log("Training Mining");
--end
Log("Player First Aid Status:" ..HasSkill(129));
if TrainFirstAid and not HasSkill(129) then
    GoToTrainer(FirstAidTrainer, FirstAidTrainerX, FirstAidTrainerY, FirstAidTrainerZ); Log("Go to Trainer: First Aid");
    Training(); Log("Training First Aid");
end
Log("Player Fishing Status:" ..HasSkill(356));
if TrainFishing and not HasSkill(356) then
    GoToTrainer(FishingTrainer, FishingTrainerX, FishingTrainerY, FishingTrainerZ); Log("Go to Trainer: Fishing");
    Training(); Log("Training Fishing");
end
Log("Player Cooking Status:" ..HasSkill(185));
if TrainCooking and not HasSkill(185) then
    GoToTrainer(CookingTrainer, CookingTrainerX, CookingTrainerY, CookingTrainerZ); Log("Go to Trainer: Cooking");
    Training(); Log("Training Cooking");
end
-- Grinding to Level 9
while Player.Level >= 7 and Player.Level < 9 do
    Log("Current Level: " .. Player.Level .. " Grinding to 9...");
    GrindAndGather(TableToList{40,475,1731}, 100, TableToFloatArray({-9827.172, 173.0875, 8.603938}), false); Log("Grinding");
    --GrindAreaUntilLevel(9,TableToList{30,113},true);
end
----Step 1: Questing So Massive you wouldn't believe it
AcceptQuestUsingDB(62); Log("Accepting: [7]The Fargodeep Mine");
AcceptQuestUsingDB(60); Log("Accepting: [7]Kobold Candles");
AcceptQuestUsingDB(47); Log("Accepting: [7]Gold Dust Exchange");
if (IsOnQuest(47) == true and IsOnQuest(85) ~= true) then
    VendorName = "Corina Steele"; VendorID=54; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end 
AcceptQuestUsingDB(85); Log("Accepting: [6]Lost Necklace");
TurnInQuestUsingDB(85); Log("Completing: [6]Lost Necklace");
AcceptQuestUsingDB(86); Log("Accepting: [6]Pie for Billy");
AcceptQuestUsingDB(106); Log("Accepting: [6]Young Lovers");
CompleteObjectiveOfQuest(86,1); Log("Completing Objective: [6]Pie for Billy");
TurnInQuestUsingDB(86); Log("Completing: [6]Pie for Billy");
AcceptQuestUsingDB(84); Log("Accepting: [6]Back to Billy");
AcceptQuestUsingDB(88); Log("Accepting: [9]Princess Must Die!");
TurnInQuestUsingDB(106); Log("Completing: [6]Young Lovers");
AcceptQuestUsingDB(111); Log("Accepting: [6]Speak with Gramma");
TurnInQuestUsingDB(111); Log("Completing: [6]Speak with Gramma");
AcceptQuestUsingDB(107); Log("Accepting: [6]Note to William");
TurnInQuestUsingDB(84); Log("Completing: [6]Back to Billy");
AcceptQuestUsingDB(87); Log("Accepting: [8]Goldtooth");
if HasPlayerFinishedQuest(62) ~= true then
    QuestGoToPoint(-9795.689, 160.5919, 0); -- Scout Through the Fargodeep Mine Quest Objective
end
CompleteObjectiveOfQuest(87,1); Log("Completing Objective: [8]Goldtooth");
CompleteObjectiveOfQuest(60,1); Log("Completing Objective: [7]Kobold Candles");
CompleteObjectiveOfQuest(47,1); Log("Completing Objective: [7]Gold Dust Exchange");
TurnInQuestUsingDB(87); Log("Completing: [8]Goldtooth");
TurnInQuestUsingDB(47); Log("Completing: [7]Gold Dust Exchange");
AcceptQuestUsingDB(40); Log("Accepting: [10]A Fishy Peril");
TurnInQuestUsingDB(40); Log("Completing: [10]A Fishy Peril");
AcceptQuestUsingDB(35); Log("Accepting: [10]Further Concerns");
TurnInQuestUsingDB(62); Log("Completing: [7]The Fargodeep Mine");
AcceptQuestUsingDB(76); Log("Accepting: [10]The Jasperlode Mine");
TurnInQuestUsingDB(60); Log("Completing: [7]Kobold Candles");
if (IsOnQuest(35) == true and IsOnQuest(37) ~= true) then
    VendorName = "Corina Steele"; VendorID=54; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end 
AcceptQuestUsingDB(61); Log("Accepting: [7]Shipment to Stormwind");
----Step 2: On the Road to Stormwind
TurnInQuestUsingDB(61); Log("Completing: [7]Shipment to Stormwind");
AcceptQuestUsingDB(332); Log("Accepting: [2]Wine Shop Advert");
AcceptQuestUsingDB(333); Log("Accepting: [2]Harlan Needs a Resupply");
TurnInQuestUsingDB(333); Log("Completing: [2]Harlan Needs a Resupply");
AcceptQuestUsingDB(334); Log("Accepting: [2]Package for Thurman");
TurnInQuestUsingDB(332); Log("Completing: [2]Wine Shop Advert");
TurnInQuestUsingDB(334); Log("Completing: [2]Package for Thurman");
--Step 3: Some Murloc Genocide with a Good Dose of Taxidermy Afterwards
TurnInQuestUsingDB(107); Log("Completing: [6]Note to William");
AcceptQuestUsingDB(112); Log("Accepting: [7]Collecting Kelp");
if ((HasPlayerFinishedQuest(112) == true) and (HasPlayerFinishedQuest(112) ~= true)) then
    CompleteEntireQuest(112); Log("Completing Objective: [7]Collecting Kelp");
    SleepPlugin(10000);
end
if (IsOnQuest(35) == true and IsOnQuest(37) ~= true) then
    VendorName = "Corina Steele"; VendorID=54; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end 
if (IsOnQuest(35) == true and IsOnQuest(37) ~= true) then
    GoToTrainer(ClassTrainer, ClassTrainerX, ClassTrainerY, ClassTrainerZ); Log("Go to Trainer: "..ClassTrainer);
    Training(); Log("Training: "..Player.Class);
end
if (HasPlayerFinishedQuest(76) ~= true and CanTurnInQuest(76) ~= true) then
    QuestGoToPoint(-9096.079, -564.0419, 62.24914); -- Scout Through the Jasperlode Mine
end
TurnInQuestUsingDB(35); Log("Completing: [10]Further Concerns");
AcceptQuestUsingDB(37); Log("Accepting: [10]Find the Lost Guards");
AcceptQuestUsingDB(52); Log("Accepting: [10]Protect the Frontier");
TurnInQuestUsingDB(37); Log("Completing: [10]Find the Lost Guards");
AcceptQuestUsingDB(45); Log("Accepting: [10]Discover Rolf's Fate");
AcceptQuestUsingDB(5545); Log("Accepting: [9]A Bundle of Trouble");
if (IsOnQuest(5545) == true and IsOnQuest(71) ~= true) then
    VendorName = "Katie Hunter"; VendorID=384; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end 
TurnInQuestUsingDB(45); Log("Completing: [10]Discover Rolf's Fate");
AcceptQuestUsingDB(71); Log("Accepting: [10]Report to Thomas");
--Custom Gather for [9]A Bundle of Trouble
GrindAndGather(TableToList(Wood),250,TableToFloatArray({-9431.718,-1304.944,47.10697}),false,"BundleOfWood"); Log("Gathering Bundles of Wood for [9]A Bundle of Trouble")
--CompleteObjectiveOfQuest(5545,1); Log("Completing Objective: [9]A Bundle of Trouble");
CompleteEntireQuest(52); Log("Completing: [10]Protect the Frontier:Killing Forest Bears");
if (IsOnQuest(5545) == true and IsOnQuest(83) ~= true) then
    VendorName = "Katie Hunter"; VendorID=384; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end 
TurnInQuestUsingDB(5545); Log("Completing: [9]A Bundle of Trouble");
AcceptQuestUsingDB(83); Log("Accepting: [9]Red Linen Goods");
TurnInQuestUsingDB(52); Log("Completing: [10]Protect the Frontier");
TurnInQuestUsingDB(71); Log("Completing: [10]Report to Thomas");
AcceptQuestUsingDB(39); Log("Accepting: [10]Deliver Thomas' Report");
AcceptQuestUsingDB(109); Log("Accepting: [10]Report to Gyran Stoutmantle");
CompleteObjectiveOfQuest(88,1); Log("Completing Objective: [9]Princess Must Die!");
--Step 3: Getting your Drop Quest On
--if HasPlayerFinishedQuest(184) ~= true then
--    if (HasItem("Furlbrow's Deed") ~= true and HasItem("Westfall Deed") ~= true) then
--        GrindAndGather(TableToList(DefiasRogueWizard), 100, TableToFloatArray({-9122.16,-1019.184,72.52368}), false); Log("Grinding to get: Westfall Deed");
--    end
--    if HasItem("Westfall Deed") == true then
--        UseItem("Westfall Deed");
--    end
--end
--if HasPlayerFinishedQuest(123) ~= true then
--    if (HasItem("Gold Pickup Schedule") ~= true and HasItem("The Collector's Schedule") ~= true) then
--        GrindAndGather(TableToList(RiverpawGnolls), 200, TableToFloatArray({-8989.872, -764.0568, 74.30352}), false); Log("Grinding to get: Gold Pickup Schedule");
--    if HasItem("Gold Pickup Schedule") == true then
--        UseItem("Gold Pickup Schedule");
--    end
--end
--Step 3.5: A litte bit more Grinding
-- Grinding to Level 11
if Player.Level >= 9 and Player.Level < 11 then
    Log("Current Level: " .. Player.Level .. " Grinding to 12...");
    QuestGoToPoint(-9122.16,-1019.184,72.52368);
    GrindAreaUntilLevel(11,TableToList{DefiasRogueWizard}, true);
end
--Step 4: The Long and Winding Turn in Road
TurnInQuestUsingDB(83); Log("Completing: [9]Red Linen Goods");
if HasPlayerFinishedQuest(39) ~= true then
    RedridgeFP(); Log("Discover and Use the Redrdige Mountains FP");
    FlyToStormwind(); Log("Flying to Stormwind");
end
AcceptQuestUsingDB(399); Log("Accepting: [15]Humble Beginnings");
TurnInQuestUsingDB(39); Log("Completing: [10]Deliver Thomas' Report'");
TurnInQuestUsingDB(123); Log("Completing: [10]The Collector");
TurnInQuestUsingDB(76); Log("Completing: [10]The Jasperlode Mine");
AcceptQuestUsingDB(147); Log("Accepting [10]Manhunt");
AcceptQuestUsingDB(239); Log("Accepting: [10]Westbrook Garrison Needs Help!");
AcceptQuestUsingDB(114); Log("Accepting: [7]The Escape");
TurnInQuestUsingDB(114); Log("Completing: [7]The Escape");
TurnInQuestUsingDB(88); Log("Completing: [9]Princess Must Die!");
TurnInQuestUsingDB(239); Log("Completing: [10]Westbrook Garrison Needs Help!");
AcceptQuestUsingDB(11); Log("Accepting: [10]Riverpaw Gnoll Bounty");
if (IsOnQuest(11) == true and IsOnQuest(64) ~= true) then
    VendorName = "Corina Steele"; VendorID=54; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end 
--Step 5: Its Westfall Time......Sorta
TurnInQuestUsingDB(184); Log("Completing: [9]Furlbrow's Deed'");
AcceptQuestUsingDB(64); Log("Accepting: [12]The Forgotten Heirloom");
AcceptQuestUsingDB(36); Log("Accepting: [10]Westfall Stew");
AcceptQuestUsingDB(151); Log("Accepting: [14]Poor Old Blanchy");
--Step 5.25: Let's make some stew!
TurnInQuestUsingDB(36); Log("Completing: [10]Westfall Stew");
AcceptQuestUsingDB(38); Log("Accepting: [10]Westfall Stew");
AcceptQuestUsingDB(22); Log("Goretusk Liver Pie");
TurnInQuestUsingDB(109); Log("Completing: [10]Report to Gryan Stoutmountle");
CompleteEntireQuest(6181); Log("Accepting: [10]A Swift Message");
AcceptQuestUsingDB(6281); Log("Continue to Stormwind");
if HasPlayerFinishedQuest(6281)==false and GetZoneID() == 1436 then
    WestfallFP();
    FlyToStormwind();
end
TurnInQuestUsingDB(6281); Log("Completing: [10]Continue to Stormwind");
AcceptQuestUsingDB(6261); Log("Accepting: [10]Dungar Longdrink");
GoToTrainer(SWClassTrainer, SWClassTrainerX, SWClassTrainerY, SWClassTrainerZ); Log("Go to Trainer: "..SWClassTrainer);
Training(); Log("Training: "..Player.Class);
TurnInQuestUsingDB(6261); Log("Completing: [10]Dungar Longdrink");
AcceptQuestUsingDB(6285); Log("Return To Lewis");
if HasPlayerFinishedQuest(59)==false and GetZoneID() == 1453 then
    StormwindFP();
    FlyToRedridgeMountains();
end
TurnInQuestUsingDB(59); Log("Completing: Cloth and Leather Armor");
CompleteObjectiveOfQuest(147,1); Log("Completing Objective: [10]Manhunt");
AcceptQuestUsingDB(46); Log("Accepting: [10]Bounty On Murlocs");
CompleteObjectiveOfQuest(46,1); Log("Completing Objective: [10]Bounty On Murlocs");
CompleteObjectiveOfQuest(11,1); Log("Completing Objective: [10]Riverpaw Gnoll Bounty");
TurnInQuestUsingDB(46); Log("Completing: [10]Bounty On Murlocs");
TurnInQuestUsingDB(147); Log("Completing: [10]Manhunt");
TurnInQuestUsingDB(11); Log("Completing: [10]Riverpaw Gnoll Bounty");
TurnInQuestUsingDB(6285); Log("Completing: [10]Return to Lewis");

Log("Elwynn Forest Now Complete");
    
StopQuestProfile();
