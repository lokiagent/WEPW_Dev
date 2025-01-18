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
local _Travel = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\GoTo.lua")
local Travel
Travel = _Travel()
--Determing Starting Zone Progression Path
if GetPlayer().RaceName == "Human" then 
	if HasPlayerFinishedQuest(2158) ~= true then
		Log ("Loading Human-Northshire Abbey Profile");
		LoadAndRunQuestProfile("Classic\\PelQuesting\\Alliance\\A_L01_NorthshireAbbey.lua")
	end
	if HasPlayerFinishedQuest(6285) ~= true then
		Log ("Loading Human-Elwynn Forest Profile Part 01");
		LoadAndRunQuestProfile("Classic\\PelQuesting\\Alliance\\A_L06_ElwynnForest.lua")
	end
end

if (GetPlayer().RaceName == "Dwarf" or GetPlayer().RaceName == "Gnome") then
	if HasPlayerFinishedQuest(384) ~= true then
		Log ("Loading Dwarf/Gnome Dun Morogh Profile");
		LoadAndRunQuestProfile("Classic\\PelQuesting\\Alliance\\A_L01_ColdridgeValley.lua")
	end
	--if HasPlayerFinishedQuest() ~= true then
		Log ("Loading Dwarf/Gnome Coldridge Valley Profile");
		LoadAndRunQuestProfile("Classic\\PelQuesting\\Alliance\\A_L06_DunMorogh.lua")
	--end
end


if Player.Level >= 12 and Player.Level <=18 and HasPlayerFinishedQuest(139) ~= true then
	Log ("Loading Human-Westfall Profile");
	LoadAndRunQuestProfile("Classic\\PelQuesting\\Alliance\\A_L12_Westfall.lua")
end



StopQuestProfile();

