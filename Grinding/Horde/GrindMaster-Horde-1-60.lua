Author = "Lawl edit of Speedy for Alliance";
-----List of Zone IDs for easy reference----
--TirisfalGlades=1420
--Durotar=1411
--------------End Zone ID List--------------
--------------Vendor Blacklist--------------
BlackListSellVendorByName("Kayla Smithe"); --Warlock Vendor PoS that no one cal really sell too
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
Tirisfal4 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 999, TableToList{1501, 1502, 1890});
Durotar4 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 999, TableToList{3098, 3124});
Tirisfal7 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{1506, 1507});
Durotar7 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{3101});
Tirisfal10 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{1547,1553});
Durotar10 = CreateObjective("KillMobsAndLoot", 1, 1, 1, 998, TableToList{3099,3125});


-- Grinding to Level 4
if Player.Level < 4 then
    Log("Grinding to 4...");
    if GetZoneID() == 1420 then
        GrindUntilLvl(4, Tirisfal4, true, true);
    elseif GetZoneID() == 1411 then
        GrindUntilLvl(4, Durotar4, true, true);
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
    end;
end;
-- Grinding to Level 10
if Player.Level >= 7 and Player.Level < 10 then
    Log("Grinding to 7...");
    if GetZoneID() == 1420 then
        GrindUntilLvl(10, Tirisfal10, true, true);
    elseif GetZoneID() == 1411 then
        GrindUntilLvl(10, Durotar10, true, true);
    end;
end;

StopQuestProfile();


