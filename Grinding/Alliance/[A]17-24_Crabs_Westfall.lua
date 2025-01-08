StartMobAvoidance();
UseDBToRepair(true)
UseDBToSell(true)
SkinMobs = (false);
SetQuestRepairAt(30)
SetQuestSellAt(2)
--Varibales--
Player = GetPlayer();
Log("Player Name: " .. Player.Name)
Log("Player Level: " .. Player.Level)
Log("Player Class: " .. Player.Class)
Log("Player Race: " .. Player.Race)
----------Fun Time Functions----------
function PreferredVendor(unitName, VendorX, VendorY, VendorZ)
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
--
--Begin Profile
Westfall17_24= CreateObjective("KillMobsAndLoot",1,1,1,999,TableToList{1216});
--Westfall17_24[1]=1216; --Shore Crawler

while Player.Level >=17 and Player.Level < 24 do
    GrindUntilLvl(24,Westfall17_24,true,true);
    if FreeBagSpace < 4 then
        VendorName = "Kriggon Talsone"; VendorID=4305; VendorLOC=GetNPCPostionFromDB(VendorID);
        VendorX=VendorLOC[0]; VendorY=VendorLOC[1]; VendorZ=VendorLOC[2];
        PreferredVendor(VendorName, VendorX, VendorY, VendorZ); Log("Vendor: "..VendorName);
    end
end