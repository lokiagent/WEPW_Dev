-- Initialize settings
--StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
Player = GetPlayer();

Log("Current Zone ID: "..GetZoneID());
Log("Current Player Position:"..GetPlayer().Position);

-- Function to set vendors for selling and repairing
function SetVendors()
    local vendorIDs = { 1234, 5678 } -- Replace with actual vendor NPC IDs
    SetQuestSellVendors(vendorIDs);
end
-- Functions to set Flight Paths


function WestfallFP() 
    QuestGoToPoint(-10627.74,1038.647,34.12702);    
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == "Thor") and (IsUnitValid(Unit)== true) then
            Log("Found flight master!");         
            InteractWithUnit(Unit);
            SleepPlugin(5000);
        end; -- IF
    end; -- For Each
end; 
function StormwindFP()
    Log("Starting StormwindFP function")
    QuestGoToPoint(-8834.801, 487.8065, 109.6138);
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == "Dungar Longdrink") and (IsUnitValid(Unit)== true) then
            Log("Found flight master!");         
            InteractWithUnit(Unit);
            SleepPlugin(5000);
        end; -- IF
    end; -- For Each
end; 
function RedridgeFP()
    Log("Starting RedridgeFP function")
    QuestGoToPoint(-9434.632, -2235.667, 69.05429);
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == "Ariena Stormfeather") and (IsUnitValid(Unit)== true) then
            Log("Found flight master!");         
            InteractWithUnit(Unit);
            SleepPlugin(5000);
        end; -- IF
    end; -- For Each
end;
function DarkshireFP()
    QuestGoToPoint(-10513.16, -1259.571, 41.42373);
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == "Felicia Maline") and (IsUnitValid(Unit)== true) then
            Log("Found flight master!");         
            InteractWithUnit(Unit);
            SleepPlugin(5000);
        end; -- IF
    end; -- For Each
end; 
function FlyToStormwind()
    Log("Flying to Stormwind");
    UseMacro("Gossip1");
    SleepPlugin(2000);
    UseMacro("Stormwind");
    SleepPlugin(2000);
    UseMacro("Stormwind");
    SleepPlugin(2000);
    UseMacro("Stormwind");
    SleepPlugin(2000);
    SleepPlugin(90000);
end;
function FlyToWestfall()
    Log("Flying to Westfall");
    UseMacro("Gossip1");
    SleepPlugin(2000);
    UseMacro("Sentinel Hill");
    SleepPlugin(2000);
    UseMacro("Sentinel Hill");
    SleepPlugin(2000);
    UseMacro("Sentinel Hill");
    SleepPlugin(2000);
    SleepPlugin(120000);
end;
function FlyToRedridgeMountains()
    Log("Flying to Redridge Mountains");
    UseMacro("Gossip1");
    SleepPlugin(2000);
    UseMacro("Lakeshire");
    SleepPlugin(2000);
    UseMacro("Lakeshire");
    SleepPlugin(2000);
    UseMacro("Lakeshire");
    SleepPlugin(2000);
    SleepPlugin(120000);
end;
function FlyToDuskwood()
    Log("Flying to Duskwood");
    UseMacro("Gossip1");
    SleepPlugin(2000);
    UseMacro("Darkshire");
    SleepPlugin(2000);
    UseMacro("Darkshire");
    SleepPlugin(2000);
    UseMacro("Darkshire");
    SleepPlugin(2000);
    SleepPlugin(120000);
end;
    

--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
--Westfall Stew--
--Vultures
Vultures = {};
Vultures[1] = 199;
KillLootVultures = CreateObjective("KillMobsAndLoot",1,3,4,38,TableToList(Vultures));
--Murlocs
Murlocs = {};
Murlocs[1] = 515;
KillLootMurlocs = CreateObjective("KillMobsAndLoot",2,3,4,38,TableToList(Murlocs));
--Goretusks
Goretusks = {};
Goretusks[1] = 454;
KillLootGoretusks = CreateObjective("KillMobsAndLoot",3,3,4,38,TableToList(Goretusks));
--Harvest Watchers
HarvestWatcher = {}; 
HarvestWatcher[1] = 480; 
OkraFarm = CreateObjective("KillMobsAndLoot",4,3,4,38,TableToList(HarvestWatcher));
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------

-- Westfall Questing Profile
Log("Starting Westfall questing profile");
-- Out of Zone Quest Pickup
AcceptQuestUsingDB(399); -- [15] Humble Beginnings

-- Level 13-15: Furlbrow and the Stew
TurnInQuestUsingDB(184); -- [9] Furlbrow's Deed
AcceptQuestUsingDB(151); -- [9] Poor Old Blanchy
AcceptQuestUsingDB(36); -- [9] Westfall Stew (Delivery)
TurnInQuestUsingDB(36); -- [9] Westfall Stew (Delivery)
CompleteEntireQuest(22); -- [9-13] Goretusk Livers (8)
if HasPlayerFinishedQuest(38)== false and CanTurnInQuest(38)==false then
    if ItemCount("Stringy Vulture Meat") < 3 then
        Log("Doing Vultures");
        KillMobsUntilItem("Stringy Vulture Meat",KillLootVultures,3);
    end;
    if ItemCount("Murloc Eye") < 3 then
        Log("Doing Murlocs");
        KillMobsUntilItem("Murloc Eye",KillLootMurlocs,3);
    end;
    if ItemCount("Goretusk Snout") < 3 then
        Log("Doing Goretusks");
        KillMobsUntilItem("Goretusk Snout",KillLootGoretusks,3);
    end;
    if ItemCount("Okra") < 3 then
        Log("Doing Harvest Watchers");
        KillMobsUntilItem("Okra",OkraFarm,3);
    end;
end;
TurnInQuestUsingDB(38); -- [9] Westfall Stew (Collecting)
-- Grind Step: To Level 15
if Player.Level < 15 then
    QuestGoToPoint(-9715.307,1088.223,15.62057);
    GrindAreaUntilLevel(15);
end
-------Level 14-15: Sentinel Hill Hub-------
-- Picking up quests
AcceptQuestUsingDB(12); -- [9] The People's Militia (Part 1)
AcceptQuestUsingDB(102); -- [15] Patrolling Westfall
AcceptQuestUsingDB(153); -- [15] Red Leather Bandanasaw
AcceptQuestUsingDB(64); -- [9] The Forgotten Heirloom
AcceptQuestUsingDB(9); -- [8] The Killing Fields


-------Completing objectives near Sentinel Hill-------
CompleteObjectiveOfQuest(399,1); -- [15] Humble Beginnings
CompleteObjectiveOfQuest(151, 1); -- [9-12] Handfuls of Oats (8)
CompleteObjectiveOfQuest(102, 1); -- [9-12] Patrolling Westfall (12)

-------Turning in quests at Sentinel Hill-------
TurnInQuestUsingDB(12); -- [9] The People's Militia (Part 1)
AcceptQuestUsingDB(109); -- [9] Report to Gryan Stoutmantle
TurnInQuestUsingDB(109); -- [9] Report to Gryan Stoutmantle
AcceptQuestUsingDB(13); -- [14] The People's Militia (Part 2)
TurnInQuestUsingDB(102); -- [15] Patrolling Westfall
TurnInQuestUsingDB(151); -- [9] Poor Old Blanchy
TurnInQuestUsingDB(399); -- [15] Humble Beginnings

-- Level 15-16: Farmlands and Fields
-- Completing objectives near the farmlands
CompleteObjectiveOfQuest(13, 1); -- [13-15] Defias Pillagers (15)
CompleteObjectiveOfQuest(13, 2); -- [13-15] Defias Looters (15)
CompleteObjectiveOfQuest(9, 1); -- [9-12] Harvest Watchers (20)
CompleteObjectiveOfQuest(64, 1); -- [9-12] Farmer Furlbrow's Watch

-- Flying to RedRidge Mountains
AcceptQuestUsingDB(120); Log("Turning in: [14]Messenger to Stormind");
if HasPlayerFinishedQuest(120)==false and GetZoneID() == 1433 then
    RedridgeFP();
    FlyToStormwind();
end;
CompleteEntireQuest(120); Log("Turning in: [14] Messenger to Stormwind"); AcceptQuestUsingDB(121); Log("Accepting: [14] Messenger to Stormwind");
if HasPlayerFinishedQuest(121)==false and GetZoneID() == 1453 then
    StormwindFP();
    FlyToRedridgeMountains();
end;
CompleteEntireQuest(121); Log("Turning in: [14] Messenger to Stormwind"); AcceptQuestUsingDB(143); Log("Accepting: [14] Messenger to Stormwind");
if HasPlayerFinishedQuest(143)==false and GetZoneID() == 1433 then
    RedridgeFP();
    FlyToWestfall();
end;
CompleteEntireQuest(143); Log("Turning in: [14] Messenger to Stormwind"); AcceptQuestUsingDB(144); Log("Accepting: [14] Messenger to Westfall");
if HasPlayerFinishedQuest(143)==false and GetZoneID() == 1436 then
    WestfallFP();
    FlyToRedridgeMountains();
end;
CompleteEntireQuest(144); Log("Turning in: [14] Messenger to Westfall");  AcceptQuestUsingDB(145); Log("Accepting: [18] Messenger to Darkshire");
if HasPlayerFinishedQuest(144)==false and GetZoneID() == 1436 then
    WestfallFP();
    FlyToRedridgeMountains();
end;
-- Grind Step: To Level 18
GrindAreaUntilLevel(18);
if HasPlayerFinishedQuest(145)==false and GetZoneID() == 1453 then
    RedridgeFP();
    FlyToDuskwood();
end;
CompleteEntireQuest(145); Log("Turning in: [18] Messenger to Darkshire"); AcceptQuestUsingDB(146); Log("Accepting: [18] Messenger to Darkshire");
if HasPlayerFinishedQuest(146)==false and GetZoneID() == 1431 then
    DarkshireFP();
    FlyToRedridgeMountains();
end;
CompleteEntireQuest(146); Log("Turning in: [18] Messenger to Darkshire");
if HasPlayerFinishedQuest(146)==true and GetZoneID() == 1433 then
    RedridgeFP();
    FlyToWestfall();
end;

-- Returning to Sentinel Hill
TurnInQuestUsingDB(13); -- [14] The People's Militia (Part 2)
AcceptQuestUsingDB(14); -- [17] The People's Militia (Part 3)
TurnInQuestUsingDB(9); -- [8] The Killing Fields
TurnInQuestUsingDB(64); -- [9] The Forgotten Heirloom

-- Level 16-17: The Dagger Hills and Lighthouse
-- Completing objectives near the Dagger Hills
CompleteObjectiveOfQuest(14, 1); -- [14-16] Defias Highwaymen (15)
CompleteObjectiveOfQuest(14, 2); -- [14-16] Defias Pathstalkers (5)
CompleteObjectiveOfQuest(14, 3); -- [14-16] Defias Knuckledusters (5)
CompleteEntireQuest(153); -- [15] Red Leather Bandanasa

---- Lighthouse quests
--AcceptQuestUsingDB(103); -- [10] Keeper of the Flame
--CompleteObjectiveOfQuest(103, 1); -- [10-14] Flasks of Oil (5)
--TurnInQuestUsingDB(103); -- [10] Keeper of the Flame
--AcceptQuestUsingDB(104); -- [15] The Coastal Menace
--CompleteObjectiveOfQuest(104, 1); -- [15-16] Old Murk-Eye
--TurnInQuestUsingDB(104); -- [15] The Coastal Menace

-- Returning to Sentinel Hill
TurnInQuestUsingDB(14); -- [17] The People's Militia (Part 3)

-- Level 17-18: The Defias Brotherhood Chain
-- Picking up and completing the Defias Brotherhood quests
AcceptQuestUsingDB(65); -- [14] The Defias Brotherhood
Log("Turning in in Lakeshire");
TurnInQuestUsingDB(65); -- [14] The Defias Brotherhood --This is trying to turn in from downstairs in the Lakeshire Inn
CompleteEntireQuest(132); -- [14] The Defias Brotherhood -- Manual run up and then pick up and Mesh DIES hardcore
AcceptQuestUsingDB(135); -- [14] The Defias Brotherhood
TurnInQuestUsingDB(135); -- [14] The Defias Brotherhood
AcceptQuestUsingDB(141); -- [14] The Defias Brotherhood
TurnInQuestUsingDB(141); -- [14] The Defias Brotherhood
CompleteEntireQuest(142); -- [14] The Defias Brotherhood

AcceptQuestUsingDB(136); -- [16] Captain Sanders' Hidden Treasure
CompleteEntireQuest(136); Log("Completing: [16] Captain Sanders' Hidden Treasure"); AcceptQuestUsingDB(138); Log("Accepting: [16] Captain Sanders' Hidden Treasure");
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
if (Player.Level < 21) then 
    Log("Grind to 21");
    QuestGoToPoint(-10984.42, 2092.964, 2.36268);
    Grind21 = {};
    Grind21[1] = 1216;
    Grind21 = CreateObjective("KillMobsAndLoot",1,10,1,152,TableToList(Grind21));
    GrindUntilLvl(21,Grind21,true);
end;
-- End of Profile
CompleteEntireQuest(104); -- [20] The Coastal Menace
CompleteEntireQuest(152); -- [21] The Coast isn't Clear
Log("This is the end of Westfall questing profile");
StopQuestProfile();

