-- Durotar Questing Profile with Class Quests
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests = false
Player = GetPlayer()

--------------------------------------------------------------------------------------
-----------------------------------Flight Functions-----------------------------------
--------------------------------------------------------------------------------------
local FMlocc = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\A_EK_FlightPaths.lua")
local FlyTo = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\A_EK_FlyTo.lua")
--------------------------------------------------------------------------------------
----------------------------------------Go To-----------------------------------------
--------------------------------------------------------------------------------------
local GoTo = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\GoTo.lua")
--------------------------------------------------------------------------------------
------------------------------------Class Quests--------------------------------------
--local ClassQuest = loadfile("Profiles\\Questing\\Classic\\PelQuesting\\ConfigFiles\\Class_Quests_StartingAreas.lua")
--    Log("Quest ID:", ClassQuest.GetID())
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--Step 0: Initial Grind
--if GetPlayer().Level < 8 then
--    Log("Player is under Level 8, Proceeding to Grind at Northshire Abbey");
--    GrindAreaUntilLevel(8);
--end



Log("[Durotar] Questing completed!");
StopQuestProfile();

--LoadAndRunQuestProfile([Orc]L06-12_RazorHill.lua)
