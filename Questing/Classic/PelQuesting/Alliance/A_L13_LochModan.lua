-- Loch Modan Questing Profile
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests(false)
Player = GetPlayer();

-----------------------------------Flight Functions-----------------------------------
local _EK_FlightPaths = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\A_EK_FlightPaths.lua")
local FMloc = _EK_FlightPaths()
local _EK_FlyTo = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\A_EK_FlyTo.lua")
local FlyTo = _EK_FlyTo()
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

--------------------------------------------------------------------------------------
---                          End Manual Quest Objectives                           ---
--------------------------------------------------------------------------------------
--Step 0: Picking up and Completing Pre-Qests for those filty tall peoples who don't live under the mountain
AcceptQuestUsingDB(353); Log("Accept: [15]Stormpike's Delivery");
if IsOnQuest(353) == true and IsOnQuest(2039) ~= true then
    if GetZoneID() == 1453 then
        FMloc.Stormwind();
        FlyTo.Ironforge();
    elseif GetZoneID() == 1455 then
    else
        PopMessage("Please Manually Navigate to the Deeprun Tram.  If you already have the Ironforge Flightpoint, that is fine too");
    end
end
AcceptQuestUsingDB(2039); Log("Accept: [15]Find Bingles");
if IsOnQuest(467) ~= true and (GetZoneID() == 1455 or GetZoneID() == 1426) and HasPlayerFinishedQuest(467) ~= true then
    QuestGiver467="Pilot Longbeard"; QuestGiver467ID=2092; LOC467=GetNPCPostionFromDB(QuestGiver467ID);
    QuestGiver467X=LOC467[0]; QuestGiver467Y=LOC467[1]; QuestGiver467Z=LOC467[2];
    QuestGoToPoint(QuestGiver467X,QuestGiver467Y,QuestGiver467Z);
    Log("Pathing and Accepting [23]Stonegear's Search from " .. QuestGiver467);
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name)
        if Unit.Name == QuestGiver467 and IsUnitValid(Unit) then
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end
    UseMacro("Gossip01")
    SleepPlugin(2000)
    UseMacro("Gossip01")
    SleepPlugin(2000)
else
    AcceptQuestUsingDB(467); Log("Accept: [23]Stonegear's Search");
end
TurnInQuestUsingDB(467); Log("Turn-in: [23]Stonegear's Search");
AcceptQuestUsingDB(466); Log("Accept: [22]Search for Incendicite");
if Player.Level > 17 then
    AcceptQuestUsingDB(314); Log("Accept: [12+]Protecting the Herd");
    CompleteObjectiveOfQuest(314,1); Log("Completing Objective of [12+]Protecting the Herd: (1)Fang of Vagash");
    TurnInQuestUsingDB(314); Log("Turn-in: [12+]Protecting the Herd");
end
AcceptQuestUsingDB(432); Log("Accept: [9]Those Blasted Troggs!");
AcceptQuestUsingDB(433); Log("Accept: [11]The Public Servant");
CompleteObjectiveOfQuest(432,1); Log("Completing Objective of [9]Those Blasted Troggs!: (6)Rockjaw Skullthumpers");
CompleteObjectiveOfQuest(433,1); Log("Completing Objective of [11]The Public Servant: (10)Rockjaw Bonesnappers");
TurnInQuestUsingDB(432); Log("Turn-in: [9]Those Blasted Troggs!");
TurnInQuestUsingDB(433); Log("Turn-in: [11]The Public Servant");
AcceptQuestUsingDB(419); Log("Accept: [10]The Lost Pilot");
TurnInQuestUsingDB(419); Log("Turn-in: [10]The Lost Pilot");
AcceptQuestUsingDB(417); Log("Accept: [11]A Pilot's Revenge");
CompleteObjectiveOfQuest(417,1); Log("Completing Objective of [11]A Pilot's Revenge: (1)");
TurnInQuestUsingDB(417); Log("Turn-in: [11]A Pilot's Revenge");
--Step 2: Now on to the real bear meat and spider ichor and boar intestines of the situation
TurnInQuestUsingDB(353); Log("Turn-in: [15]Stormpike's Delivery");
AcceptQuestUsingDB(307); Log("Accept: [15]Filthy Paws");
if (ItemCount("Bear Meat") < 3) and HasPlayerFinishedQuest(418) ~= true then
    ElderBlackBear = {1186,1195,1190}; --I can Bearly stand the sheer animal murder anymore, or can I?
    KillElderBlackBear = CreateObjective("KillMobsAndLoot",1,10,1,418,TableToList(ElderBlackBear));
    KillMobsUntilItem("Bear Meat",KillElderBlackBear,3);
end
if (ItemCount("Boar Intestines") < 3) and HasPlayerFinishedQuest(418) ~= true then
    MountainBoar = {1190,1195,1186}; --Do you have the Intestinal Fortitude to seperate a boar from his family? Do you punk?
    KillMountainBoar = CreateObjective("KillMobsAndLoot",1,10,1,418,TableToList(MountainBoar));
    KillMobsUntilItem("Boar Intestines",KillMountainBoar,3);
end
if (ItemCount("Spider Ichor") < 3) and HasPlayerFinishedQuest(418) ~= true then
    ForestLurker = {1195,1190,1186}; --Its the Eye of the Spider is the thrill of the bite
    KillForestLurker = CreateObjective("KillMobsAndLoot",1,10,1,418,TableToList(ForestLurker));
    KillMobsUntilItem("Spider Ichor",KillForestLurker,3);
end
AcceptQuestUsingDB(418); Log("Accept: [11]Thelsamar Blood Sausages");
TurnInQuestUsingDB(418); Log("Turn-in: [11]Thelsamar Blood Sausages");
AcceptQuestUsingDB(1339); Log("Accept: [15]Mountaineer Stormpike's Task");
AcceptQuestUsingDB(416); Log("Accept: [11]Rat Catching"); --THis is trying to use Option 2 even though there's no option 2 available....
--See if I can drop quest 
AcceptQuestUsingDB(1339); Log("Accept: [15]Mountaineer Stormpike's Task");
CompleteObjectiveOfQuest(416,1); Log("Complete Obective [11]Rat Catching: (12)Tunnel Rat Ears");
CompleteObjectiveOfQuest(307,1); Log("Complete Obective [15]Filthy Paws: (4)Miners' Gear");
if ItemCount("Linen Cloth") < 7 then
    KillKobolds = CreateObjective("KillMobsAndLoot",1,1,1,999,TableToList({1201,1172}));
    KillMobsUntilItem("Linen Cloth",KillKobolds,7);
end
TurnInQuestUsingDB(307); Log("Turn-in [15]Filthy Paws");
TurnInQuestUsingDB(416); Log("Turn-in: [15]Mountaineer Stormpike's Task");
AcceptQuestUsingDB(1338); Log("Accept: [14]Stormpike's Order");
TurnInQuestUsingDB(416); Log("Turn-in: [11]Rat Catching");


--Step 3: Troggs on the King's Land, meh....I guess they're worth XP and rep
AcceptQuestUsingDB(267); Log("Accept: [12]The Trogg Threat");
AcceptQuestUsingDB(224); Log("Accept: [12]In Defense of the King's Land");
CompleteObjectiveOfQuest(267,1); Log("Completing Objective [12]The Trogg Threat: (8)Trogg Stone Tooth");
CompleteObjectiveOfQuest(224,1); Log("Completing Objective [12]In Defense of the King's Land: (10)Stonesplinter Trogg slain");
CompleteObjectiveOfQuest(224,2); Log("Completing Objective [12]In Defense of the King's Land: (10)Stonesplinter Scout slain");
TurnInQuestUsingDB(267); Log("Turn-in: [12]The Trogg Threat");
TurnInQuestUsingDB(224); Log("Turn-in: [12]In Defense of the King's Land");
AcceptQuestUsingDB(237); Log("Accept: [15]In Defense of the King's Land");
CompleteObjectiveOfQuest(237,1); Log("Completing Objective [15]In Defense of the King's Land: (10)Stonesplinter Skullthumper slain");
CompleteObjectiveOfQuest(237,2); Log("Completing Objective [15]In Defense of the King's Land: (10)Stonesplinter Seer slain");
TurnInQuestUsingDB(237); Log("Turn-in: [15]In Defense of the King's Land");
AcceptQuestUsingDB(263); Log("Accept: [15]In Defense of the King's Land");
Troggs = {}; -- Table to load Troggs
Troggs[1] = 1197; Troggs[2] = 1164; --Stonesplinter Shaman -- Stonesplinter Bonesnapper
TroggsShaman = CreateObjective("KillMobsAndLoot",1,10,2,263,TableToList(Troggs));
TroggsBonesnapper = CreateObjective("KillMobsAndLoot",2,10,2,263,TableToList(Troggs));
DoObjective(TroggsShaman); DoObjective(TroggsBonesnapper);-- Quest Objective(s):Log("Completing Objective [15]In Defense of the King's Land
TurnInQuestUsingDB(263); Log("Turn-in: [15]In Defense of the King's Land");
AcceptQuestUsingDB(217); Log("Accept: [17]In Defense of the King's Land");
CompleteObjectiveOfQuest(217,1); Log("Completing Objective [17]In Defense of the King's Land: Grawmug slain");
CompleteObjectiveOfQuest(217,2); Log("Completing Objective [17]In Defense of the King's Land: Gnasher slain");
CompleteObjectiveOfQuest(217,3); Log("Completing Objective [17]In Defense of the King's Land: Brawler slain");
TurnInQuestUsingDB(217); Log("Turn-in: [17]In Defense of the King's Land");

--Step 4: A Brief Flight to Stormwind for some R&R
if IsOnQuest(1338) then
    FMloc.ByZone();
    FlyTo.Stormwind();
end
TurnInQuestUsingDB(1338); Log("Turn-in: [14]Stormpike's Orders");
TurnInQuestUsingDB(2041); Log("Turn-in: [15]Shoni the Silent");
AcceptQuestUsingDB(343); Log("Accept: [24]Speaking of Fortitude");
TurnInQuestUsingDB(343); Log("Turn-in: [24]Speaking of Fortitude");
AcceptQuestUsingDB(344); Log("Accept: [24]Brother Paxton");
TurnInQuestUsingDB(343); Log("Turn-in: [24]Brother Paxton");
AcceptQuestUsingDB(345); Log("Accept: [24]Ink Supplies");
if IsOnQuest(2039) then
    FMloc.ByZone();
    FlyTo.LochModan();
end

--Step 5: Back in Loch Step
AcceptQuestUsingDB(255); Log("Accept: [19+]Mercenaries");
AcceptQuestUsingDB(256); Log("Accept: [22+]WANTED: Chok'sul");
AcceptQuestUsingDB(436); Log("Accept: [18]Ironband's Excavation");
TurnInQuestUsingDB(2039); Log("Turn-in: [15]Find Bingles");
AcceptQuestUsingDB(2038); Log("Accept: [15]Bingles' Missing Supplies");
CompleteObjectiveOfQuest(2038,1); Log("Completing Objective [15]Bingles' Missing Supplies: Bingles' Wrench");
CompleteObjectiveOfQuest(2038,2); Log("Completing Objective [15]Bingles' Missing Supplies: Bingles' Screwdriver");
CompleteObjectiveOfQuest(2038,3); Log("Completing Objective [15]Bingles' Missing Supplies: Bingles' Hammer");
CompleteObjectiveOfQuest(2038,4); Log("Completing Objective [15]Bingles' Missing Supplies: Bingles' Blastencapper");
TurnInQuestUsingDB(2038); Log("Turn-in: [15]Bingles' Missing Supplies");
TurnInQuestUsingDB(436); Log("Turn-in: [18]Ironband's Excavation");
AcceptQuestUsingDB(297); Log("Accept: [18]Gathering Idols");
AcceptQuestUsingDB(298); Log("Accept: [15]Excavation Progress Report");
CompleteObjectiveOfQuest(297,1); Log("Completing Objective [18]Gathering Idols: (8)Carved Stone Idol");
TurnInQuestUsingDB(297); Log("Turn-in: [18]Gathering Idols");
AcceptQuestUsingDB(385); Log("Accept: [15]Crockolisk Hunting");
AcceptQuestUsingDB(257); Log("Accept: [16]A Huntet's Boast");
CompleteObjectiveOfQuest(385,1); 
CompleteObjectiveOfQuest(385,2);
CompleteObjectiveOfQuest(257,1);
TurnInQuestUsingDB(257);
TurnInQuestUsingDB(385);
AcceptQuestUsingDB(258);
CompleteObjectiveOfQuest(258,1);
TurnInQuestUsingDB(258);

StopQuestProfile(); -- Stop the quest profile