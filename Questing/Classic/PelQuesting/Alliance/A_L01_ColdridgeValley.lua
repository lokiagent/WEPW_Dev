-- Coldridge Valley Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests = false

--Varibales--
IsHardCore = "true";

Player = GetPlayer();
Log("Current Zone ID: "..GetZoneID());
Log("Current Player Position:"..GetPlayer().Position);

--------------------------------------------------------------------------------------
-----------------------------------Flight Functions-----------------------------------
--------------------------------------------------------------------------------------
local _EK_FlightPaths = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\A_EK_FlightPaths.lua")
local FMloc -- Declare the Test variable in this scope
FMloc = _EK_FlightPaths()
local _EK_FlyTo = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\A_EK_FlyTo.lua")
local FlyTo
FlyTo = _EK_FlyTo()
--------------------------------------------------------------------------------------
----------------------------------------Go To-----------------------------------------
--------------------------------------------------------------------------------------
local _Travel = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\GoTo.lua")
local Travel
Travel = _Travel()
function GoToVendor(unitName, VendorX, VendorY, VendorZ)
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
function CheckWater()
    if GetPlayerClass() == "Mage" then
        while ItemCount("Conjured Water") < 40 do
            Log("Using Macro");
            CastSpell("Conjure Water");
            SleepPlugin(3100);
            CastSpell("Conjure Water");
            SleepPlugin(3100);
            CastSpell("Conjure Water");
            SleepPlugin(3100);
            UseItem("Conjured Water");
            SleepPlugin(18100);
        end
        SetDrink("Conjured Water",60);
    end
end
--------------------------------------------------------------------------------------
------------------------------------Class Quests--------------------------------------
--local ClassQuest = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\Class_Quests_StartingAreas.lua")
--    Log("Quest ID:", ClassQuest.GetID())
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--Step 0: Initial Grind
if GetPlayer().Level < 4 then
    Log("Player is under Level 4, Proceeding to Grind at Coldridge Valley");
    GrindAreaUntilLevel(4);
    VendorName = "Adlin Pridedrift"; VendorID=829; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    GoToVendor(VendorName,VendorX,VendorY,VendorZ);
    Travel.Train();
end
CheckWater();
--Step 1: Dwarven Outfitting and Gnomish Ingenuity
AcceptQuestUsingDB(179); --Accept: [1]Dwarven Outfitters
CompleteObjectiveOfQuest(179,1); --Complete Objective [1]Dwarven Outfitters: (8)Tough Wolf Meat
TurnInQuestUsingDB(179); --Turn-in: [1]Dwarven Outfitters

--AcceptQuestUsingDB(ClassQuestID); --Placeholder for class quest

AcceptQuestUsingDB(233); --Accept: [3]Coldridge Valley Mail Delivery
AcceptQuestUsingDB(170); --Accept: [2]A New Threat
CompleteObjectiveOfQuest(170,1); --Complete Objective [2]A New Threat: (6)Rockjaw Trogg
CompleteObjectiveOfQuest(170,2); --Complete Objective [2]A New Threat: (6)Burly Rockjaw Trogg
TurnInQuestUsingDB(170); --Turn-in: [2]A New Threat

if HasPlayerFinishedQuest(170) == true and HasPlayerFinishedQuest(233) ~= true then
    VendorName = "Adlin Pridedrift"; VendorID=829; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    GoToVendor(VendorName,VendorX,VendorY,VendorZ);
    CheckWater();
end

TurnInQuestUsingDB(233); --Turn-in: [3]Coldridge Valley Mail Delivery
AcceptQuestUsingDB(234); --Accept: [4]Coldridge Valley Mail Delivery
AcceptQuestUsingDB(183); --Accept: [3]The Boar Hunter
CompleteObjectiveOfQuest(183,1); --Complete Objective [3]The Boar Hunter: (12)Small Crag Boar
TurnInQuestUsingDB(183); --Turn-in: [3]The Boar Hunter
TurnInQuestUsingDB(234); --Turn-in: [4]Coldridge Valley Mail Delivery

AcceptQuestUsingDB(3364); --Accept: [5]Scalding Mornbrew Delivery
TurnInQuestUsingDB(3364); --Turn-in: [5]Scalding Mornbrew Delivery
AcceptQuestUsingDB(3365); --Accept: [5]Bring Back the Mug
TurnInQuestUsingDB(3365); --Turn-in: [5]Bring Back the Mug

AcceptQuestUsingDB(3361); --Accept: [3]A Refugee's Quandary
CompleteObjectiveOfQuest(3361,1); --Complete Objective [3]A Refugee's Quandary: Collect Felix's Box
CompleteObjectiveOfQuest(3361,2); --Complete Objective [3]A Refugee's Quandary: Collect Felix's Chest
CompleteObjectiveOfQuest(3361,3); --Complete Objective [3]A Refugee's Quandary: Collect Felix's Bucket of Bolts
if HasPlayerFinishedQuest(170) == true and HasPlayerFinishedQuest(233) ~= true then
    VendorName = "Adlin Pridedrift"; VendorID=829; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    GoToVendor(VendorName,VendorX,VendorY,VendorZ);
    CheckWater();
end
AcceptQuestUsingDB(182); --Accept: [4]The Troll Cave
CompleteObjectiveOfQuest(182,1); --Complete Objective [4]The Troll Cave: Kill Frostmane Troll Whelp
TurnInQuestUsingDB(182); --Turn-in: [4]The Troll Cave
if HasPlayerFinishedQuest(170) == true and HasPlayerFinishedQuest(233) ~= true then
    VendorName = "Adlin Pridedrift"; VendorID=829; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    GoToVendor(VendorName,VendorX,VendorY,VendorZ);
    CheckWater();
end
AcceptQuestUsingDB(218); --Accept: [5]The Stolen Journal
CompleteObjectiveOfQuest(218,1); --Complete Objective [5]The Stolen Journal: Retrieve Grelin Whitebeard's Journal
TurnInQuestUsingDB(218); --Turn-in: [5]The Stolen Journal
AcceptQuestUsingDB(282); --Accept: [5]Senir's Observations
-- Check if the player's level is less than 6
if HasPlayerFinishedQuest(170) == true and HasPlayerFinishedQuest(233) ~= true then
    VendorName = "Adlin Pridedrift"; VendorID=829; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    GoToVendor(VendorName,VendorX,VendorY,VendorZ);
    CheckWater();
end
if GetPlayer().Level < 6 then
    Log("Player is under Level 6, Proceeding to Grind at Coldridge Valley");
    CheckWater();
    GrindAreaUntilLevel(6); --Grind mobs in Coldridge Valley until the player reaches Level 6
    -- Go to vendor for repairs or selling items
    VendorName = "Adlin Pridedrift"; VendorID=829; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    GoToVendor(VendorName,VendorX,VendorY,VendorZ); --Navigate to the vendor's location
end

TurnInQuestUsingDB(3361); --Turn-in: [3]A Refugee's Quandary
TurnInQuestUsingDB(282); --Turn-in: [5]Senir's Observations
AcceptQuestUsingDB(420); --Accept: [5]Senir's Observations (Follow-up Quest)
AcceptQuestUsingDB(2160); --Accept: [5]Supplies to Tannok
TurnInQuestUsingDB(420); --Turn-in: [5]Senir's Observations (Follow-up Quest)

if HasPlayerFinishedQuest(170) == true and HasPlayerFinishedQuest(233) ~= true then
    VendorName = "Adlin Pridedrift"; VendorID=829; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    GoToVendor(VendorName,VendorX,VendorY,VendorZ);
    CheckWater();
end
-- Check if the player has less than 6 Crag Boar Ribs and hasn't completed quest [5]Beer Basted Boar Ribs
if (ItemCount("Crag Boar Rib") < 6) and HasPlayerFinishedQuest(384) ~= true then
    Boars = {1125}; -- List of mobs (Crag Boars) to kill for quest items
    KillBoars = CreateObjective("KillMobsAndLoot",1,6,1,999,TableToList(Boars));
    KillMobsUntilItem("Crag Boar Rib",KillBoars,6); --Kill Crag Boars until 6 Crag Boar Ribs are collected
end
-- Check if the player has less than 4 Chunks of Boar Meat and hasn't completed quest [6]]Stocking Jetstream
if (ItemCount("Chunk of Boar Meat") < 4) and HasPlayerFinishedQuest(317) ~= true then
    Boars = {1125}; -- List of mobs (Crag Boars) to kill for quest items
    KillBoars = CreateObjective("KillMobsAndLoot",1,4,1,999,TableToList(Boars));
    KillMobsUntilItem("Chunk of Boar Meat",KillBoars,4); --Kill Crag Boars until 4 Chunks of Boar Meat are collected
end
if HasPlayerFinishedQuest(384) ~= true and HasItem("Rhapsody Malt") ~= true then
    VendorName = "Innkeeper Belm"; VendorID=1247; VendorLOC=GetNPCPostionFromDB(VendorID);
    VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
    GoToVendor(VendorName,VendorX,VendorY,VendorZ); --Navigate to the vendor's location
    UseMacro("Gossip2");
    SleepPlugin(2000);
    UseMacro("384RhapsodyMalt");
    SleepPlugin(2000);
end
AcceptQuestUsingDB("384"); --Accept: [7]Beer Basted Boar Ribs
TurnInQuestUsingDB("384"); --Turn-in: [7]Beer Basted Boar Ribs

--if IsHardCore == "true" then
    GrindAreaUntilLevel(8);
--end

Log("Finished Dwarf/Gnome Starting Area, Coldridge Valley");

if HasPlayerFinishedQuest(384) == true then
	LoadAndRunQuestProfile("Classic\\PelQuesting\\AllianceQuesting_01-60.lua")
else
    StopQuestProfile();
end

