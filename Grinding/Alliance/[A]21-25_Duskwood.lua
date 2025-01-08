--[
--  {
--    "ProfileType": "Gather",
--    "GatherDistance": 200,
--    "GatherWhiteList": "Copper Vein,Tin Vein,Silver Vein,Solid Chest",
--    "CombatWhiteList": "Starving Dire Wolf,Rabid Dire Wolf,Green Recluse,Pygmy Venom Web Spider,Venom Web Spider",
--    "CombatRadius": 40,
--    "AutoTarget": true,
--    "AutoLoot": true,
--    "AutoSkin": true,
--
--
Author = "Lawl edit of Speedy for Alliance";
--Varibales--
Player = GetPlayer();
Log("Player Name: " .. Player.Name)
Log("Player Level: " .. Player.Level)
Log("Player Class: " .. Player.Class)
Log("Player Race: " .. Player.Race)
--
StartMobAvoidance();
UseDBToRepair(true)
UseDBToSell(true)
SkinMobs = (false);
SetQuestRepairAt(30)
SetQuestSellAt(2)

--Begin Profile
Duskwood21_25={}
Duskwood21_25[1]=213; --Starving Dire Wolf
Duskwood21_25[2]=565; --Rabid Dire Wolf
Duskwood21_25[3]=569; --Green Recluse
Duskwood21_25[4]=539; --Pygmy Venom Web Spider
Duskwood21_25[5]=217; --Venom Web Spider
Duskwood21_25[6]=2850; --Solid Chest

CreateObjective("KillMobsAndLoot", 1, 1, 1, 999, TableToList{Duskwood21_25});



--1731-Copper Vein 
--1732-Tin Vein
--1733-Silver Vein

