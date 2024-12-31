Author = "Lawl edit of Speedy for Alliance";
-----List of Zone IDs for easy reference----
--TirisfalGlades=1420
--Durotar=1411
--Mulgore=1412
--------------End Zone ID List--------------
--------------Vendor Blacklist--------------
BlackListSellVendorByName("Kayla Smithe"); --Warlock Vendor PoS that no one cal really sell too
BlackListSellVendorByName("Kitha"); --Warlock Vendor PoS that no one cal really sell too
------------End Vendor Blacklist------------

--------------------------------------------------------------------------------------
---------  Setting Manual Training as Training isn't working for some parts  ---------
--------------------------------------------------------------------------------------
function TrainUnit(unitName, x, y, z)
    -- Go to the specified location
    QuestGoToPoint(x, y, z); 
    -- Get the list of units
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        -- Check if the unit matches the given name and is valid
        if (Unit.Name == unitName) and (IsUnitValid(Unit) == true) then
            Log("Found the unit: " .. unitName);
            -- Interact with the unit
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


--Varibales--
Player = GetPlayer();
Log("Player Name: " .. Player.Name)
Log("Player Level: " .. Player.Level)
Log("Player Class: " .. Player.Class)
Log("Player Race: " .. Player.Race)

-- Date Checker
-- Calculate the expiration date as October 25th of the current year


StartMobAvoidance();
UseDBToRepair(true)
UseDBToSell(true)
SkinMobs = (false);
SetQuestRepairAt(30)
SetQuestSellAt(2)

-- Setting Grinding Mobs Based on Level
Tirisfal4 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 999, TableToList{1501,1502,1890});
--Durotar4 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 999, TableToList{3098,3124});
Durotar4 = GrindAndGather(TableToList{3098,3124},500,TableToFloatArray({-604.5, -4393.5, 38.5}), true)
Mulgore4 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 999, TableToList{2955});
Tirisfal7 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{1506,1507});
--Durotar7 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{3101});
Durotar7 = GrindAndGather(TableToList{3101},500,TableToFloatArray({-604.5, -4393.5, 38.5}), true)
Mulgore7 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{2961,2966});
Tirisfal10 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{1547,1553});
--Durotar10 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{3099,3125});
Durotar10 = GrindAndGather(TableToList{3099,3125},500,TableToFloatArray({401.85,-4347.332,27.32475}), true)
Mulgore10 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{2956,2958});
Tirisfal13 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{1536,1537,1662});
Barrens11 = GrindAndGather(TableToList{3244},500,TableToFloatArray({-262.0276, -2732.77, 91.99313}), true)
Durotar13 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{3100,3223});
Mulgore13 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{2957,2960});
Barrens16 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{3254,3415,3244});

-- Grinding to Level 4
if Player.Level < 4 then
    Log("Grinding to 4...");
    if GetZoneID() == 1420 then
        GrindUntilLvl(4, Tirisfal4, true, true);
    elseif GetZoneID() == 1411 then
        GrindUntilLvl(4, Durotar4, true, true);
    elseif GetZoneID() == 1412 then
        GrindUntilLvl(4, Mulgore4, true, true);
    end;
elseif Player.Level == 4 then
    -- Training for Level 4 Priests
    if Player.Class == "Priest" then
        if GetZoneID() == 1411 then
            TrainUnit("Ken'jai", -617.2904, -4203.487, 38.13395);
        elseif GetZoneID() == 1420 then
            TrainUnit("Dark Cleric Duesten", 1847.427, 1627.835, 96.93383);
        end;
        Training();
    end;
end;

-- Grinding to Level 7
if Player.Level >= 4 and Player.Level < 7 then
    Log("Grinding to 7...");
    if GetZoneID() == 1420 then
        GrindUntilLvl(7, Tirisfal7, true, true);
    elseif GetZoneID() == 1411 then
        GrindUntilLvl(7, Durotar7, true, true);
    elseif GetZoneID() == 1412 then
        GrindUntilLvl(7, Mulgore7, true, true);
    end;
end;
-- Grinding to Level 10
if Player.Level >= 7 and Player.Level < 10 then
    Log("Grinding to 10...");
    if GetZoneID() == 1420 then
        GrindUntilLvl(10, Tirisfal10, true, true);
    elseif GetZoneID() == 1411 then
        GrindUntilLvl(10, Durotar10, true, true);
    elseif GetZoneID() == 1412 then
        GrindUntilLvl(10, Mulgore10, true, true);
    end;
end;
-- Grinding to Level 12
Log("Grinding to 13...");
while Player.Level >= 10 and Player.Level < 12 do
    DoObjective(Durotar10);
end;
-- Grinding to Level 16
if Player.Level >= 12 and Player.Level < 16 then
    Log("Grinding to 16...");
    DoObjective(Barrens11);
end;

StopQuestProfile();


