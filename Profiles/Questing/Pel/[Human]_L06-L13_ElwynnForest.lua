-- Elwynn Forest
StartMobAvoidance()
UseDBToRepair(true)
UseDBToSell(true)
SetQuestRepairAt(30)
SetQuestSellAt(2)
IgnoreLowLevelQuests = false
Player = GetPlayer()
--SetFood(string FoodName, int EatAt)
--SetDrink(string DrinkName, int DrinkAt)

--if HasSkill(Fishing) && SkillValue(Fishing) < 75

-- Grind Step: To Level 6
GrindAreaUntilLevel(6);

-- Quest Chains and Groups
-- Group 1: Goldshire - Part01
AcceptQuestUsingDB(62); -- The Fargodeep Mine
AcceptQuestUsingDB(60); -- Kobold Candles
AcceptQuestUsingDB(47); -- Gold Dust Exchange

-- Complete Objective of Quest 62
if HasPlayerFinishedQuest(62) ~= true then
    QuestGoToPoint(-9795.689, 160.5919, 0); -- Scout Through the Fargodeep Mine Quest Objective
end
CompleteObjectiveOfQuest(60, 1); -- Large Candle (X of 8)
CompleteObjectiveOfQuest(47, 1); -- Gold Dust (X of 10)

-- Group 2: The Farms are Calling
AcceptQuestUsingDB(106); -- Young Lovers
AcceptQuestUsingDB(85); -- Lost Necklace
AcceptQuestUsingDB(88); -- Princess Must Die!
-- Marshal Dughan
TurnInQuestUsingDB(62); -- The Fargodeep Mine
AcceptQuestUsingDB(76); -- The Jasperlode Mine
-- William Pestle
TurnInQuestUsingDB(60); -- Kobold Candles
AcceptQuestUsingDB(61); -- Shipment to Stormwind
-- Remy "Two Times"
TurnInQuestUsingDB(47); -- Gold Dust Exchange
AcceptQuestUsingDB(40); -- A Fishy Peril

-- Group 3: Stormwind Shennanigans
TurnInQuestUsingDB(61); -- Shipment to Stormwind
AcceptQuestUsingDB(332); -- Wine Shop Advert
AcceptQuestUsingDB(333); -- Harlan Needs a Resupply
TurnInQuestUsingDB(333); -- Harlan Needs a Resupply
AcceptQuestUsingDB(334); -- Package for Thurman
TurnInQuestUsingDB(332); -- Wine Shop Advert
TurnInQuestUsingDB(334); -- Package for Thurman

-- Interlude-Grind Step: To Level 8
if Player.Level < 8 then
    QuestGoToPoint(-9264.347,-513.2581,65.94548);
    GrindAreaUntilLevel(8);
end

-- Group 4: A Little Detour on the Way Back to Goldshire
if HasPlayerFinishedQuest(76) ~= true then
	QuestGoToPoint(-9097.183,-565.11,147.2519); -- Scout Through the Jasperlode Mine
end
-- Billy
TurnInQuestUsingDB(85); -- Lost Necklace
AcceptQuestUsingDB(86); -- Pie for Billy
CompleteObjectiveOfQuest(86, 1); -- Chunk of Boar Meat (X of 4)
-- Marshal Dughan
TurnInQuestUsingDB(76); -- The Jasperlode Mine
AcceptQuestUsingDB(86); -- Westbrook Garrison Needs Help!
TurnInQuestUsingDB(44); -- A Fishy Peril
AcceptQuestUsingDB(35); -- Further Concerns

--Group 5: Starcrossed Lovers and a Little Bit of Pie
--Tommy Joe Stonefield
TurnInQuestUsingDB(106); -- Young Lovers
AcceptQuestUsingDB(111); -- Speak with Gramma
--Auntie Bernice Stonefield
TurnInQuestUsingDB(86); -- Pie for Billy
AcceptQuestUsingDB(84); -- Back to Billy
--Billy
TurnInQuestUsingDB(84); -- Back to Billy
AcceptQuestUsingDB(87); -- Goldtooth
--Gramma Stonefield
TurnInQuestUsingDB(111); -- Speak with Gramma
AcceptQuestUsingDB(107); -- Note to William

CompleteObjectiveOfQuest(87, 1); -- Bernice's Necklace
TurnInQuestUsingDB(87); -- Goldtooth
TurnInQuestUsingDB(107); -- Note to William
AcceptQuestUsingDB(112); -- Collecting Kelp
CompleteEntireQuest(112); -- Collecting Kelp
AcceptQuestUsingDB(114); -- The Escape
TurnInQuestUsingDB(114); -- The Escape

--Group 6: The East Orgeon Logging Company......I mean Eastvale Logging Camp
TurnInQuestUsingDB(35); -- Further Concerns
AcceptQuestUsingDB(37); -- Find the Lost Guards
AcceptQuestUsingDB(52); -- Protect the Frontier
TurnInQuestUsingDB(37); -- Find the Lost Guards
CompleteEntireQuest(52); -- Protect the Frontier
TurnInQuestUsingDB(45); -- Discover Rolf's Fate
AcceptQuestUsingDB(83); -- Red Linen Goods
AcceptQuestUsingDB(5545); -- A Bundle of Trouble
CompleteEntireQuest(5545); -- A Bundle of Trouble
CompleteObjectiveOfQuest(83,1) -- Red Linen Goods
AcceptQuestUsingDB(184); -- Grind and Farm for "Furlbrow's Deed"
AcceptQuestUsingDB(123); -- Grind and Farm for "The Collector"

--AcceptQuestUsingDB(); -- Report to Gryan Stoutmantle
-- End the Profile
Log("This is the end of Elwynn Forest questing profile");
--LoadAndRunQuestProfile(string Name)
StopQuestProfile();
