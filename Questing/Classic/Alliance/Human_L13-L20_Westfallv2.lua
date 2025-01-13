-- Westfall Questing Profile
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
    QuestGoToPoint(table.unpack(coords))
    foreach Unit in Units do
    Log(unit.Name)
        if unit.Name == name and IsUnitValid(unit) then
            Log("Found flight master!")
            InteractWithUnit(unit)
            SleepPlugin(5000)
            return
        end
    end
end
local function FlyToDestination(Destination)
    Log("Flying to " .. Destination)
    for _ = 1, 3 do
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro(Destination)
        SleepPlugin(2000)
    end
    --SleepPlugin( or 90000)
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

--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--------------------------Potential Vendor Blacklist Section--------------------------
--------------------------------------------------------------------------------------
if GetPlayerClass() ~= "Warlock" then
    BlackListSellVendorByName("Cylina Darkheart");
end
--BlackListSellVendorByName(string Name);
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
GuardRoberts = {80}; -- Table to load Guard Roberts
HealGuardRoberts = CreateObjective("KillMobsAndLoot",1,12,1,21,TableToList(GuardRoberts));
DefiasRogueWizard = {474}; -- Table to load Defias Rogue Wizards
--KillDefiasRogueWizard = CreateObjective("GrindAndGather",TableToList(DefiasRogueWizard), 100, TableToFloatArray({-9122.16,-1019.184,72.52368}), false);
RiverpawGnolls = {97,478}; -- Table to load Riverpaw Gnolls
--KillRiverpawGnolls = CreateObjective("GrindAndGather",TableToList(RiverpawGnolls),100,TableToFloatArray({-8904.62,-800.6655,69.99609}),false);
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------
--Step 1: Entry in to Westfall
AcceptQuestUsingDB(64); Log("Accepting: [12]The Forgotten Heirloom");
AcceptQuestUsingDB(36); Log("Accepting: [14]Westfall Stew");
AcceptQuestUsingDB(151); Log("Accepting: [14]Poor Old Blanchy");
AcceptQuestUsingDB(9); Log("Accepting: [14]The Killing Fields");
CompleteObjectiveOfQuest(151,1); Log("Completing Objective of [14]Poor Old Blanchy: Gather 8 bundles of oats");
TurnInQuestUsingDB(36); Log("Turn-in: [14]Westfall Stew");
AcceptQuestUsingDB(22); Log("Accepting: [12]Goretusk Liver Pie");
AcceptQuestUsingDB(38); Log("Accepting: [14]Westfall Stew");
--DiscoverFlightPoint("Sentinel Hill"); Log("Discovering Flight Point: Sentinel Hill");
AcceptQuestUsingDB(153); Log("Accepting: [12]Red Leather Bandanas");
TurnInQuestUsingDB(109); Log("Turn-in: [12]Report to Gryan Stoutmantle");
AcceptQuestUsingDB(12); Log("Accepting: [12]The People's Militia");
AcceptQuestUsingDB(102); Log("Accepting: [14]Patrolling Westfall");
CompleteObjectiveOfQuest(64,1); Log("Completing Objective of [12]The Forgotten Heirloom: Retrieve the pocket watch");
if ((CanTurnInQuest(153) ~= true) and (HasPlayerFinishedQuest(153) ~= true)) then
    QuestGoToPoint(-10007.86, 1406.651, 40.75225);
    CompleteObjectiveOfQuest(153,1); Log("Completing Objective of [12]Red Linen Bandanas: Collect 6 Red Leather Bandanas");
end
CompleteObjectiveOfQuest(12,1); Log("Completing Objective of [12]The People's Militia: Defeat 15 Defias Bandits");
CompleteObjectiveOfQuest(12,2); Log("Completing Objective of [12]The People's Militia: Defeat 15 Defias Bandits");
CompleteObjectiveOfQuest(22,1); Log("Completing Objective of [12]Goretusk Liver Pie: Collect 8 Goretusk Livers");
CompleteObjectiveOfQuest(38,1); Log("Completing Objective of [14]Westfall Stew: Gather ingredients");
CompleteObjectiveOfQuest(38,2); Log("Completing Objective of [14]Westfall Stew: Gather ingredients");
CompleteObjectiveOfQuest(38,3); Log("Completing Objective of [14]Westfall Stew: Gather ingredients");
CompleteObjectiveOfQuest(38,4); Log("Completing Objective of [14]Westfall Stew: Gather ingredients");

CompleteObjectiveOfQuest(102,1); Log("Completing Objective of [14]Patrolling Westfall: Defeat Gnolls");
TurnInQuestUsingDB(12); Log("Turn-in: [12]The People's Militia");
AcceptQuestUsingDB(13); Log("Accepting: [14]The People's Militia");
TurnInQuestUsingDB(153); Log("Turn-in: [15]Red Leather Bandanas");
----------------------------------------------------------------------------------------
----------------Vendorman, Vendorman, Does whatever a Vendorman Can.....----------------
----------------------------------------------------------------------------------------
Log("Player Quest Status 64:"..IsOnQuest(64));
Log("Player Quest Status 153:"..IsOnQuest(153));
if (IsOnQuest(64) == true and IsOnQuest(153) ~= true) then
    VendorName = "William MacGregor"; VendorID=1668; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
end
----------------------------------------------------------------------------------------
--Cheesing it from Vendorman. You can't end Vendorman as only Vendorman can end you...--
----------------------------------------------------------------------------------------
--Step 2: Zoom zoom zoom zoom, Stormwind HO!!!!!!!!!!
AcceptQuestUsingDB(6181); Log("Accepting: [10]A Swift Message");
TurnInQuestUsingDB(6181); Log("Turn-in: [10]A Swift Message");
AcceptQuestUsingDB(6281); Log("Accepting: [10]Continue to Stormwind");
--FlyTo("Stormwind"); Log("Flying to: Stormwind");
TurnInQuestUsingDB(6281); Log("Turn-in: [10]Continue to Stormwind");
AcceptQuestUsingDB(6261); Log("Accepting: [10]Dungar Longdrink");
--TrainSkills(); Log("Training class skills in Stormwind");
TurnInQuestUsingDB(6261); Log("Turn-in: [10]Dungar Longdrink");
AcceptQuestUsingDB(6285); Log("Accepting: [10]Return to Lewis");
--Step 2.5: Whoops, still stuck on the plains of Westfall
--FlyTo("Westfall"); Log("Flying to: Westfall");
TurnInQuestUsingDB(6285); Log("Turn-in: [10]Return to Lewis");
TurnInQuestUsingDB(64); Log("Turn-in: [12]The Forgotten Heirloom");
TurnInQuestUsingDB(151); Log("Turn-in: [14]Poor Old Blanchy");
CompleteObjectiveOfQuest(9,1); Log("Completing Objective of [14]The Killing Fields: Destroy Harvest Watchers");
TurnInQuestUsingDB(9); Log("Turn-in: [14]The Killing Fields");
TurnInQuestUsingDB(22); Log("Turn-in: [12]Goretusk Liver Pie");
TurnInQuestUsingDB(38); Log("Turn-in: [14]Westfall Stew");
TurnInQuestUsingDB(102); Log("Turn-in: [14]Patrolling Westfall");
--Its the Eye of the Grinder its the Thrill of the Fight, gonna shank crabs until Level 19!
-------if Player.Level >= 15 and Player.Level < 19 then
-------    Log("Current Level: " .. Player.Level .. " Grinding to 19...");
-------AddNameToAvoidWhiteList("Sea Crawler")
-------    local InRangeSpawns = {}
-------    local IDs = {}
-------    IDs[1] = 831
-------    --Starting Point--
-------    local StartingPoint = {}
-------    StartingPoint[1] = -9942.369; StartingPoint[2] = 1884.301; StartingPoint[3] = 6.735732
-------    StartingFloat = TableToFloatArray(StartingPoint)
-------    GrindAndGather(TableToList(IDs),50,StartingFloat)
-------end
--
--Step 3: The Militant People
CompleteObjectiveOfQuest(13,1); Log("Completing Objective of [14]The People's Militia: Defeat 15 Defias Pillagers and 15 Defias Looters");
CompleteObjectiveOfQuest(13,2); Log("Completing Objective of [14]The People's Militia: Defeat 15 Defias Pillagers and 15 Defias Looters");
TurnInQuestUsingDB(13); Log("Turn-in: [14]The People's Militia");
AcceptQuestUsingDB(14); Log("Accepting: [17]The People's Militia");
AcceptQuestUsingDB(65); Log("Accepting: [18]The Defias Brotherhood");
CompleteObjectiveOfQuest(14,1); Log("Completing Objective of [17]The People's Militia: Defeat 15 Defias Highwaymen, 5 Defias Pathstalkers, and 5 Defias Knuckledusters");
CompleteObjectiveOfQuest(14,2); Log("Completing Objective of [17]The People's Militia: Defeat 15 Defias Highwaymen, 5 Defias Pathstalkers, and 5 Defias Knuckledusters");
CompleteObjectiveOfQuest(14,3); Log("Completing Objective of [17]The People's Militia: Defeat 15 Defias Highwaymen, 5 Defias Pathstalkers, and 5 Defias Knuckledusters");
TurnInQuestUsingDB(14); Log("Turn-in: [17]The People's Militia");
--Step 4: And I would walk 500 miles, and I would walk 500 more
TurnInQuestUsingDB(65); Log("Turn-in: [18]The Defias Brotherhood");
AcceptQuestUsingDB(132); Log("Accepting: [18]The Defias Brotherhood");
TurnInQuestUsingDB(132); Log("Turn-in: [18]The Defias Brotherhood");
--While in Redridge
AcceptQuestUsingDB(116); Log("Accepting: [15]Dry Times"); --Need to think on this one......
--CompleteObjectiveOfQuest(116,1); --(1262)Keg of Thunderbrew, Quest Reward from (117)Thunderbrew, in Westfall (5 Hops)
--CompleteObjectiveOfQuest(116,2); --(1941)Cask of Merlot, Sold by (277)Roberto Pupellyverbos, in SW
--CompleteObjectiveOfQuest(116,3); --(1942)Bottle of Moonshine, Sold by (274)Barkeep Hann, in Darkshire Inn
--CompleteObjectiveOfQuest(116,4); --(1939)Skin of Sweet Rum, Sold by (465)Barkeep Dobbins, In Goldshire Inn
AcceptQuestUsingDB(129); Log("Accepting: [15]A Free Lunch");
TurnInQuestUsingDB(129); Log("Turn-in: [15]A Free Lunch");
AcceptQuestUsingDB(130); Log("Accepting: [15]Visit the Herbalist");
TurnInQuestUsingDB(130); Log("Turn-in: [15]Visit the Herbalist");
AcceptQuestUsingDB(131); Log("Accepting: [15]Delivering Daffodils");
TurnInQuestUsingDB(131); Log("Turn-in: [15]Delivering Daffodils");
--What the Redridge
AcceptQuestUsingDB(135); Log("Accepting: [18]The Defias Brotherhood");
TurnInQuestUsingDB(135); Log("Turn-in: [18]The Defias Brotherhood");
AcceptQuestUsingDB(141); Log("Accepting: [18]The Defias Brotherhood");
CompleteObjectiveOfQuest(141,1); Log("Completing Objective of [18]The Defias Brotherhood: Retrieve the Defias Orders");
TurnInQuestUsingDB(141); Log("Turn-in: [18]The Defias Brotherhood");
AcceptQuestUsingDB(155); Log("Accept: [18]The Defias Brotherhood");
--Step 4.5: Just to be the man who walked 1000 miles to meet you at the Deadmines
if HasPlayerFinishedQuest(141) == true and CanTurnInQuest(141) ~= true then    
    PopMessage("Quest 155-[18]The Defias Brotherhood: Escort the Defias Traitor needs to be done manually.");
    PopMessage("If you don't want to do this manually, then you'll need to grind to L20/L21 to make up for the rest of Westfall");
end
TurnInQuestUsingDB(141); Log("Turn-in: [18]The Defias Brotherhood");


Log("Westfall Now Complete");
    
StopQuestProfile();