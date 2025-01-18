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
local _EK_FlightPaths = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\A_EK_FlightPaths.lua")
local FMloc -- Declare the Test variable in this scope
FMloc = _EK_FlightPaths()
local _EK_FlyTo = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\A_EK_FlyTo.lua")
local FlyTo
FlyTo = _EK_FlyTo()
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
if (ItemCount ("Hops") < 5 and HasItem("Keg of Thunderbrew") ~= true and HasPlayerFinishedQuest(116) ~= true) then
    HarvestWatcher = {}; 
    HarvestWatcher[1] = 480; 
    HopsFarm = CreateObjective("KillMobsAndLoot",1,1,1,103,TableToList(HarvestWatcher));
    KillMobsUntilItem("Hops",HopsFarm,5);
end
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
AcceptQuestUsingDB(65); Log("Accepting: [18]The Defias Brotherhood"); --Turnin in RR
CompleteObjectiveOfQuest(14,1); Log("Completing Objective of [17]The People's Militia: Defeat 15 Defias Highwaymen, 5 Defias Pathstalkers, and 5 Defias Knuckledusters");
CompleteObjectiveOfQuest(14,2); Log("Completing Objective of [17]The People's Militia: Defeat 15 Defias Highwaymen, 5 Defias Pathstalkers, and 5 Defias Knuckledusters");
CompleteObjectiveOfQuest(14,3); Log("Completing Objective of [17]The People's Militia: Defeat 15 Defias Highwaymen, 5 Defias Pathstalkers, and 5 Defias Knuckledusters");
if ItemCount("Hops") >= 5 then
    AcceptQuestUsingDB(117);
    TurnInQuestUsingDB(117);
end
-----------
--20250114-Good Place to see about completing repeatable quest to get booze for (116)Dry Times
-----------
TurnInQuestUsingDB(14); Log("Turn-in: [17]The People's Militia");
--Step 4: And I would walk 500 miles, and I would walk 500 more
TurnInQuestUsingDB(65); Log("Turn-in: [18]The Defias Brotherhood");
AcceptQuestUsingDB(132); Log("Accepting: [18]The Defias Brotherhood"); --Turnin in WF
--While in Redridge
AcceptQuestUsingDB(244); Log("Accepting: [16]Encroaching Gnolls");
if HasPlayerFinishedQuest(3741) ~= true or HasPlayerFinishedQuest(125) ~= true then
    PopMessage("Quests (3741)Hillary's Necklace and (125)The Lost Tools Need Manual Completion.  Please complete now.");
end
TurnInQuestUsingDB(244); Log("Turn-in: [16]Encroaching Gnolls");
AcceptQuestUsingDB(246); Log("Accepting: [17]Assessing the Threat");
CompleteObjectiveOfQuest(246,1); Log("Completing Objective of [17]Assessing the Threat: Redridge Mongrel 0/10");
CompleteObjectiveOfQuest(246,2); Log("Completing Objective of [17]Assessing the Threat: Redridge Poacher 0/6");
TurnInQuestUsingDB(246); Log("Turn-in: [17]Assessing the Threat");
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
if CanTurnInQuest(132) == true then
    RedridgeFP();
    FlyToDestination("Westfall");
end
TurnInQuestUsingDB(132); Log("Turn-in: [18]The Defias Brotherhood");
AcceptQuestUsingDB(135); Log("Accepting: [18]The Defias Brotherhood"); --Turnin SW
if (CanTurnInQuest(135) == true and GetZoneID() == 1432) then
    WestfallFP();
    FlyToDestination("Stormwind");
end
TurnInQuestUsingDB(135); Log("Turn-in: [18]The Defias Brotherhood");
AcceptQuestUsingDB(142); Log("Accepting: [18]The Defias Brotherhood"); --Turnin WF
CompleteObjectiveOfQuest(142,1); Log("Completing Objective of [18]The Defias Brotherhood: Retrieve the Defias Orders");
TurnInQuestUsingDB(141); Log("Turn-in: [18]The Defias Brotherhood");
AcceptQuestUsingDB(155); Log("Accept: [18]The Defias Brotherhood");
--Step 4.5: Just to be the man who walked 1000 miles to meet you at the Deadmines
if HasPlayerFinishedQuest(155) ~= true and CanTurnInQuest(155) ~= true then    
    PopMessage("Quest 155-[18]The Defias Brotherhood: Escort the Defias Traitor needs to be done manually.");
    PopMessage("If you don't want to do this manually, then you'll need to grind to L20/L21 to make up for the rest of Westfall");
end
TurnInQuestUsingDB(155); Log("Turn-in: [18]The Defias Brotherhood");
AcceptQuestUsingDB(166); Log("Accept: [22]The Defias Brotherhood"); --Dungeon Quest: Shank Van Cleef, leaving the chain here.
--Step 5: The Lighthouse Murloc Shanking Finale
if (HasPlayerFinishedQuest(103) ~= true and ItemCount("Flask of Oil") < 5) then
    HarvestWatcher = {}; 
    HarvestWatcher[1] = 480; 
    OilFarm = CreateObjective("KillMobsAndLoot",1,1,1,103,TableToList(HarvestWatcher));
    KillMobsUntilItem("Flask of Oil",OilFarm,5);
end
if HasPlayerFinishedQuest(104) ~= true then    
    --QuestGoToPoint(-11326.05, 1789.546, 22.20564);    
    PopMessage("Captain Grayson Lighthouse Quests: Pickup and turn-in needs to be done manually.");
    PopMessage("Profile will get you to just before the swim, go pick up then swim back to shore.  Bot will then go and do its thing.  Once all are done, swim back to island manually and turn-in.");
    AcceptQuestUsingDB(104); Log("Accept: [20]The Coastal Menance");
    AcceptQuestUsingDB(103); Log("Accept: [16]Keeper of the Flame");
    TurnInQuestUsingDB(103); Log("Turn-in: [16]Keeper of the Flame");
    AcceptQuestUsingDB(152); Log("Accept: [19]The Coast Isn't Clear");
    CompleteObjectiveOfQuest(104,1); Log("Completing Objective [20]The Coastal Menance: Scale of Old Murk-Eye");
    CompleteObjectiveOfQuest(152,1); Log("Completing All Objectives: [19]The Coast Isn't Clear");
    CompleteObjectiveOfQuest(152,2); Log("Completing All Objectives: [19]The Coast Isn't Clear");
    CompleteObjectiveOfQuest(152,3); Log("Completing All Objectives: [19]The Coast Isn't Clear");
    CompleteObjectiveOfQuest(152,4); Log("Completing All Objectives: [19]The Coast Isn't Clear");
    QuestGoToPoint(-11326.05, 1789.546, 22.20564);
    PopMessage("Time to Swim Back Across to Turn-in");
    TurnInQuestUsingDB(152); Log("Turn-in: [19]The Coast Isn't Clear");
    TurnInQuestUsingDB(104); Log("Turn-in: [20]The Coastal Menance");
end
if (HasPlayerFinishedQuest(136) ~= true and HasItem("Captain Sander's Treasure Map") ~= true and IsOnQuest(136) ~= true) then 
    Murlocs={458,171};
    KillMurlocs=CreateObjective("KillMobsAndLoot",1,1,1,136,TableToList(Murlocs));
    KillMobsUntilItem("Captain Sander's Treasure Map",KillMurlocs,1);
end
if HasItem("Captain Sander's Treasure Map") == true then
    UseItem("Captain Sander's Treasure Map");
end
--AcceptQuestUsingDB(136); -- [16] Captain Sanders' Hidden Treasure
if HasPlayerFinishedQuest(136)==false then
    QuestGoToPoint(-10512.88, 2110.36, 2.696788);
    function UseFootLocker() 
        local Objects = GetObjectList();
        foreach Object in Objects do
            if Object.Name == "Captain's Footlocker" then
                Log("Found the Captain's Footlocker!");
                InteractWithObject(Object);
                SleepPlugin(5000);
            end; -- IF
        end; -- For Each
    end; -- Function
    UseFootLocker();
end;AcceptQuestUsingDB(138); Log("Accepting: [16] Captain Sanders' Hidden Treasure");
if HasPlayerFinishedQuest(138)==false then
    QuestGoToPoint(-10514.52, 1598.402, 44.1889);
    function UseBarrel() 
        local Objects = GetObjectList();
        foreach Object in Objects do
            if Object.Name == "Broken Barrel" then
                Log("Found the Barrel!");
                InteractWithObject(Object);
                SleepPlugin(5000);
            end; -- IF
        end; -- For Each
    end; -- Function
    UseBarrel();
end;
AcceptQuestUsingDB(139); Log("Accepting: [16] Captain Sanders' Hidden Treasure");
if HasPlayerFinishedQuest(139)==false then
    QuestGoToPoint(-9798.028, 1594.697, 39.77632);
    function UseJug() 
        local Objects = GetObjectList();
        foreach Object in Objects do
            if Object.Name == "Old Jug" then
                Log("Found the Jug!");
                InteractWithObject(Object);
                SleepPlugin(5000);
            end; -- IF
        end; -- For Each
    end; -- Function
    UseJug();
end;
AcceptQuestUsingDB(140); Log("Accepting: [16] Captain Sanders' Hidden Treasure");
--CompleteEntireQuest(140); Log("Completing: [16] Captain Sanders' Hidden Treasure"); -- Can't Complete at this time due to Mesh issues with water
if Player.Race == "Human" then
    FMloc.Westfall();
    FlyTo.Ironforge();
end

-- End of Profile
Log("This is the end of Westfall questing profile");
StopQuestProfile(); 