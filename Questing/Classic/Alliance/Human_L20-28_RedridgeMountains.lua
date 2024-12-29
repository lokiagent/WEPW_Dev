-- Initialize settings
StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
Player = GetPlayer();
--dofile("Profiles\\Questing\\[A]_EK_FlightPaths.lua");

Log("Current Zone ID: "..GetZoneID());
Log("Current Player Position:"..GetPlayer().Position);

-- Function to set vendors for selling and repairing
function SetVendors()
    local vendorIDs = { 1234, 5678 } -- Replace with actual vendor NPC IDs
    SetQuestSellVendors(vendorIDs);
end
-- Functions to set Flight Paths
-- Function to handle flight paths
local function HandleFlightPath(name, coords)
    Log("Starting " .. name .. " flight path function")
    QuestGoToPoint(table.unpack(coords))
    for _, unit in ipairs(GetUnitsList()) do
        Log(unit.Name)
        if unit.Name == name and IsUnitValid(unit) then
            Log("Found flight master!")
            InteractWithUnit(unit)
            SleepPlugin(5000)
            return
        end
    end
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
-- Function to fly to destinations
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
-- Fly to specific destinations
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

----------------Begin Redridge Mountains Questing Profile----------------
--Step 0: Getting Out of Zone Starting Quests
if GetPlayerClass() == "Warrior" then
    AcceptQuestUsingDB(1698); Log("Accepting quest: [20]Yura's Barleybrew");
end
AcceptQuestUsingDB(94); Log("Accepting quest: [21]A Watchful Eye");
--Step 1: Entering Redridge Mountains
AcceptQuestUsingDB(246); Log("Accepting quest: [17]Assessing the Threat");
AcceptQuestUsingDB(20); Log("Accepting quest: [21]Blackrock Menace");
AcceptQuestUsingDB(125); Log("Accepting quest: [26]The Lost Tools");
AcceptQuestUsingDB(122); Log("Accepting quest: [18]Undeerbelly Scales");
AcceptQuestUsingDB(124); Log("Accepting quest: [20]A Baying of Gnolls");
AcceptQuestUsingDB(116); Log("Accepting quest: [15]Dry Times");
AcceptQuestUsingDB(127); Log("Accepting quest: [21]Selling Fish");
AcceptQuestUsingDB(150); Log("Accepting quest: [20]Murloc Poachers");
AcceptQuestUsingDB(92); Log("Accepting quest: [18]Redridge Goulash");
AcceptQuestUsingDB(3741); Log("Accepting quest: [15]Hillary's Necklace");

CompleteObjectiveOfQuest(3741,1); Log("Completing Quest Objective: [15]Hillary's Necklace");
CompleteObjectiveOfQuest(125,1); Log("Completing Quest Objective: [26]The Lost Tools");
TurnInQuestUsingDB(125); Log("Turning in Quest: [26]The Lost Tools"); 
AcceptQuestUsingDB(89); Log("Accepting quest: [20]The Everstill Bridge");
TurnInQuestUsingDB(3741); Log("Turning in Quest: [15]Hillary's Necklace");
--Step 1.5: Grind to Level 24 before proceeding


--Step 2: Completing Quest Objectives
CompleteObjectiveOfQuest(246,1); Log("Completing Quest Objective: [17]Assessing the Threat");
CompleteObjectiveOfQuest(246,2); Log("Completing Quest Objective: [17]Assessing the Threat");
CompleteObjectiveOfQuest(122,1); Log("Completing Quest Objective: [18]Underbelly Scales");
CompleteObjectiveOfQuest(127,1); Log("Completing Quest Objective: [21]Selling Fish");
CompleteObjectiveOfQuest(150,1); Log("Completing Quest Objective: [20]Murloc Poachers");
CompleteObjectiveOfQuest(92,1); Log("Completing Quest Objective: [18]Redridge Goulash");

if Player.Level < 24 then
    Log("Player is under Level 24, Proceeding to Grind at Lake Everstill");
    QuestGoToPoint(-9079.715, -2359.222, 132.7907);
    GrindAreaUntilLevel(24);
end

StopQuestProfile(); -- Stop the quest profile