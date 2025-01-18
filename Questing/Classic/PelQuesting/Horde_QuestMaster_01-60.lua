--The Intent of this file is to level any alliance character from 1-60 without having to call any other files.
--Come in, start this file, it will detect where you're at if you're following my guides, and sit back and enjoy.
--There will be some grinding, but I am attempting to minimize any grinding needed once outside of starting zones.

UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests=false
Player = GetPlayer();
CurrentZone=GetZoneID();

--Determing Starting Zone Progression Path
if GetPlayer().RaceName == "Undead" and HasPlayerFinishedQuest() ~= true then
	Log ("Loading L01+ Undead Starting Area Profile");
	LoadAndRunQuestProfile("Classic\\PelQuesting\\Alliance\\A_L01_NorthshireAbbey.lua")
end
if (GetPlayer().RaceName == "Troll" or GetPlayer().RaceName == "Orc") and HasPlayerFinishedQuest(806) ~= true then
	Log ("Loading L01+ Orc/Troll Starting Area Profile");
	LoadAndRunQuestProfile("Classic\\PelQuesting\\Horde\\H_L01_ValleyOfTrials_SenjinVillage.lua")
end

--if Player.Level > 5 and Player.Level <=12 and HasPlayerFinishedQuest(6285) ~= true then
--	Log ("Loading Human-Elwynn Forest Profile");
--	LoadAndRunQuestProfile("Classic\\PelQuesting\\Alliance\\A_L06_ElwynnForest.lua")
--end
--if Player.Level >= 12 and Player.Level <=18 and HasPlayerFinishedQuest(139) ~= true then
--	Log ("Loading Human-Westfall Profile");
--	LoadAndRunQuestProfile("Classic\\PelQuesting\\Alliance\\A_L12_Westfall.lua")
--end



StopQuestProfile();