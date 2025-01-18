-- Coldridge Valley Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests = false

--Varibales--
require("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\_ConfigOptions.lua")
if IsHardCore == true then
    PopMessage("Character is set as Hard Core.  Extra Grinding and steps will be enabled.  Pleae make sure to attend the bot as it levels as guarantee of multi-pull or other situations can't be guaranteed 100% of the time'");
end
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
----------------------------------------Travel----------------------------------------
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
            UseMacro("Conjure Water");
            SleepPlugin(3100);
        end
        SetDrink("Conjured Water",60);
    end
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
------------------------------------Class Quests--------------------------------------
--local ClassQuest = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\Class_Quests_StartingAreas.lua")
--    Log("Quest ID:", ClassQuest.GetID())
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--Step 1: A Night at the Prancing Pony.....wait, there's no Hobbits in Azeroth!
TurnInQuestUsingDB(2160); --Accept: [5]Supplies to Tannok
if HasPlayerFinishedQuest(2160) == true and HasPlayerFinishedQuest(400) ~= true then
    InnkeeperID = 1247; InnkeeperName = "Innkeeper Belm"; InnkeeperLOC = GetNPCPostionFromDB(InnkeeperID);
    InnkeeperX = InnkeeperLOC[0]; InnkeeperY = InnkeeperLOC[1]; InnkeeperZ = InnkeeperLOC[2];
    SetHearthstone(InnkeeperName,InnkeeperX,InnkeeperY,InnkeeperZ);
end
GrindAreaUntilLevel(8);
AcceptQuestUsingDB(400); --Accept: [5]Tools for Steelgrill
AcceptQuestUsingDB(317); --Accept: [6]Stocking Jetstream
AcceptQuestUsingDB(313); --Accept: [7]The Grizzled Den
AcceptQuestUsingDB(5541); --Accept: [6]Ammo for Rumbleshoot
TurnInQuestUsingDB(400); --Turn-in: [5]Tools for Steelgrill
CompleteObjectiveOfQuest(317,2); --Complete Objective [6]Stocking Jetstream: (2)Thick Bear Fur
CompleteObjectiveOfQuest(5541,1); --Complete Objective [6]Ammo for Rumbleshoot: 
CompleteObjectiveOfQuest(313.1); --Commplete Objective [7]The Grizzled Den: (8)Wendigo Mane
TurnInQuestUsingDB(5541); --Turn-in: [6]Ammo for Rumbleshoot
AcceptQuestUsingDB(287); --Accept: [9]Frostmane Hold
TurnInQuestUsingDB(317); --Turn-in: [6]Stocking Jetstream
AcceptQuestUsingDB(318); --Accept: [7]Evershine
TurnInQuestUsingDB(313); --Turn-in: [7]The Grizzled Den
--Bag Check Logic?

UseHearthstone();
--if HasPlayerFinishedQuest(384) == true then
--	LoadAndRunQuestProfile("Classic\\PelQuesting\\AllianceQuesting_01-60.lua")
--else
    StopQuestProfile();