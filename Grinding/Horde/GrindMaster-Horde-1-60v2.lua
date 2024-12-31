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
local EnableGathering = true;
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

-- Grinding to Level 4
while Player.Level < 4 do
    Log("Current Level: " .. Player.Level .. " Grinding to 4...");
    GrindAndGather(TableToList{3098, 3124}, 500, TableToFloatArray({-604.5, -4393.5, 38.5}), EnableGathering);
end
-- Grinding to Level 7
while Player.Level >= 4 and Player.Level < 7 do
    Log("Current Level: " .. Player.Level .. " Grinding to 7...");
    GrindAndGather(TableToList{3101}, 500, TableToFloatArray({-604.5, -4393.5, 38.5}), EnableGathering);
end
-- Grinding to Level 10
while Player.Level >= 7 and Player.Level < 10 do
    Log("Current Level: " .. Player.Level .. " Grinding to 10...");
    GrindAndGather(TableToList{3099,3125},500,TableToFloatArray({401.85,-4347.332,27.32475}), true);
end;


StopQuestProfile();


