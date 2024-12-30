-- Deathknell Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests=false
Player = GetPlayer()

Log("Current Zone ID: "..GetZoneID());
Log("Current Player Position:"..GetPlayer().Position);

--------------------------------------------------------------------------------------
---------  Setting Manual Training as Training isn't working for some parts  ---------
--------------------------------------------------------------------------------------
function TrainRogue() 
    QuestGoToPoint(1859.822, 1562.821, 94.30527); -- Pathing to get to Trainer    
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == "David Trias") and (IsUnitValid(Unit)== true) then
            Log("Found Rogue Trainer!");         
            InteractWithUnit(Unit);
            SleepPlugin(5000);
        end; -- IF
    end; -- For Each
end; 
local function Training()
    Log("Training " .. Player.Name)
    UseMacro("Gossip1")
    SleepPlugin(2000)
    UseMacro("TrainMe")
    SleepPlugin(2000)
end
--------------------------------------------------------------------------------------
---  Setting Manual Quest Objectives as Autoquesting isn't working for some parts  ---
--------------------------------------------------------------------------------------
--The Mindless Ones
Zombies = {}; -- Table to load Zombies
Zombies[1] = 1501; Zombies[2] = 1502; -- Mindless Zombie -- Wretched Zombie
MindlessZ = CreateObjective("KillMobsAndLoot",1,8,2,364,TableToList(Zombies));
MindlessW = CreateObjective("KillMobsAndLoot",2,8,2,364,TableToList(Zombies));

NightWeb = {}; -- Table to load Night Web Spiders
NightWeb[1] = 1504; -- Night Web Spider
NightWeb[2] = 1505; -- Night Web Spider
KillNightYWeb = CreateObjective("KillMobsAndLoot",1,10,2,380,TableToList(NightWeb));
KillNightWeb = CreateObjective("KillMobsAndLoot",2,8,2,380,TableToList(NightWeb));

--Marla's Last Wish
SamuelFipps = {}; -- Table to load Samuel Fipps as Autoquesting options aren't working
SamuelFipps[1] = 1919; -- Samuel Fipps
FuckUpSamuelFipps = CreateObjective("KillMobs",1,1,2,6395,TableToList(SamuelFipps));
--BurySamuelFipps = CreateObjective("UseItemName",2,1,2,6395,TableToList(SamuelFipps));
--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------

--Vendor Black and White Lists (i.e. don't try and use Warlock Demon Vendor for shit)
BlackListSellVendorByName("Kayla Smithe"); --Warlock Vendor PoS that no one cal really sell too

--Setting Level Appropriate Food and Drink
--SetFood("Tough Hunk of Bread", 50)
--SetDrink("Refreshing Spring Water", 25)

-- Grind Step: To Level 3
if Player.Level < 3 then
    GrindAreaUntilLevel(3); 
end
-- Quest Chains and Groups
-- Group 1: Initial Quest Acceptance
AcceptQuestUsingDB(363); TurnInQuestUsingDB(363); AcceptQuestUsingDB(364); -- Accept: Rude Awakening; Turn-in; Rude Awakening; Accept: The Mindless Ones
AcceptQuestUsingDB(376); -- Accept: The Damned
DoObjective(MindlessZ); DoObjective(MindlessW);-- Quest Objective(s): The Mindless Ones
CompleteObjectiveOfQuest(376, 1); CompleteObjectiveOfQuest(376, 2); -- Quest Objective(s): The Damned
TurnInQuestUsingDB(364); AcceptQuestUsingDB(3901); -- Turn-in: The Mindless Ones; Accept: Rattling the Rattle Cages
TurnInQuestUsingDB(376); AcceptQuestUsingDB(6395);-- Turn-in: The Damned; Accept: Marla's Last Wish

-- Group 2: Killing Quests
AcceptQuestUsingDB(3902); -- Accept: Scavenging Deathknell
AcceptQuestUsingDB(380); -- Accept: Nightweb's Hollow
CompleteEntireQuest(3902); -- Complete: Scavenging Deathknell
CompleteEntireQuest(380); -- Complete: Nightweb's Hollow
--DoObjective(KillNightYWeb); DoObjective(KillNightWeb); -- Quest Objective(s): Nightweb's Hollow

--Group 2.5: Grind the Ensure Level 5 and accept Class Quest
GrindAreaUntilLevel(5);
--if Player.Class == 1 and not HasPlayerFinishedQuest(5651) then --Warrior
--    AcceptQuestUsingDB(); -- 
--end
if Player.Class == 4 and not HasPlayerFinishedQuest(3096) then --Rogue
    AcceptQuestUsingDB(3096); -- [1] Encrypted Scroll
    TurnInQuestUsingDB(3096); -- [1] Encrypted Scroll
end
--if Player.Class == 5 and not HasPlayerFinishedQuest(5651) then --Priest
--    AcceptQuestUsingDB(5651); -- In Favor of Darkness
--end
--if Player.Class == 8 and not HasPlayerFinishedQuest(5651) then --Mage
--    AcceptQuestUsingDB(); -- 
--end
--if Player.Class == 9 and not HasPlayerFinishedQuest(5651) then --Warlock
--    AcceptQuestUsingDB(); -- 
--end
CompleteEntireQuest(3901); AcceptQuestUsingDB(380); -- Turn-in: Rattling the Rattle Cages; 
CompleteEntireQuest(380); AcceptQuestUsingDB(381); -- Turn-in: Nightweb's Hollow; Accept: The Scarlet Crusade
----------------------------------------Marla's Last Wish-----------------------------
if not HasPlayerFinishedQuest(6395) then
    QuestGoToPoint(1982,1376,63); -- Spawn Point for Samuel Fipps
    KillMobsUntilItem("Samuel's Remains",FuckUpSamuelFipps,1);
    QuestGoToPoint(1875.951,1623.005,95.0472); -- Pathing to get to Marla's Grave
    CompleteEntireQuest(6395); -- Quest Objective(s): Marla's Last Wish
end;
--------------------------------------------------------------------------------------
CompleteEntireQuest(381); -- Complete: The Scarlet Crusade
CompleteEntireQuest(382); AcceptQuestUsingDB(383); -- Complete: The Red Messenger; Aceept: Vital Intelligence

--if GetPlayerClass() == "Rogue" and Player.Level >= 6 then --Rogue
--    QuestGoToPoint(1859.822, 1562.821, 94.30527); -- Pathing to get to Trainer
--    TrainRogue();
--    Training();
--end

CompleteEntireQuest(8); -- Accept: A Rogue's Deal
CompleteEntireQuest(590); -- A Rogue's Deal

--Going to Brill and Training

if (Player.Level < 8) then 
    Log("Grind to 8");
    --QuestGoToPoint(1789.029, 1279.251, 112.0708);
    Grind08 = {};
    Grind08[1] = 1506;
    Grind08[2] = 1507;
    Grind08[3] = 1667;
    Grind08 = CreateObjective("KillMobsAndLoot",1,10,1,590,TableToList(Grind08));
    GrindUntilLvl(8,Grind08,true);
end;

QuestGoToPoint(2239.364, 251.1285, 34.24391); -- Pathing to Brill Inn

-- QED: Deathknell
StopQuestProfile();