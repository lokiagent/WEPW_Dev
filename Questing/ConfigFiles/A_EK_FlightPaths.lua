--Macros needed:
--Macro Name: Stormwind
--Macro Body: /run local n="Stormwind"; for i=1, NUM_TAXI_BUTTONS do if TaxiNodeName(_G["TaxiButton"..i]:GetID()):lower():find(n:lower()) then TakeTaxiNode(i) return; end end;

-- Flight Master Data Table
local FlightMasterData = {
    [1417] = {Name = "Cedrik Prose", ID = 2835}, -- Arathi Highlands
    [1419] = {Name = "Alexandra Constantine", ID = 8609}, -- Blasted Lands
    [1435] = {Name = "Alexandra Constantine", ID = 8609}, -- Swamp of Sorrows
    [1428] = {Name = "Borgus Stoutarm", ID = 2299}, -- Burning Steppes
    [1431] = {Name = "Felicia Maline", ID = 2409}, -- Duskwood
    [1430] = {Name = "Felicia Maline", ID = 2409}, -- Deadwind Pass
    [1423] = {Name = "Khaelyn Steelwing", ID = 12617}, -- Eastern Plaguelands
    [1416] = {Name = "Darla Harris", ID = 2432}, -- Alterac Mountains
    [1424] = {Name = "Darla Harris", ID = 2432}, -- Hillsbrad Foothills
    [1421] = {Name = "Darla Harris", ID = 2432}, -- Silverpine Forest
    [1425] = {Name = "Guthrum Thunderfist", ID = 8018}, -- Hinterlands
    [1426] = {Name = "Gryth Thurden", ID = 1573}, -- Dun Morogh
    [1455] = {Name = "Gryth Thurden", ID = 1573}, -- Ironforge
    [1418] = {Name = "Thorgrum Borrelson", ID = 1572}, -- Badlands
    [1432] = {Name = "Thorgrum Borrelson", ID = 1572}, -- Loch Modan
    [1433] = {Name = "Ariena Stormfeather", ID = 931}, -- Redridge Mountains
    [1427] = {Name = "Lanie Reed", ID = 2941}, -- Searing Gorge
    [1429] = {Name = "Dungar Longdrink", ID = 352}, -- Elwynn Forest
    [1453] = {Name = "Dungar Longdrink", ID = 352}, -- Stormwind
    [1434] = {Name = "Gyll", ID = 2858}, -- Stranglethorn Vale (Booty Bay)
    [1422] = {Name = "Bibilfaz Featherwhistle", ID = 12596}, -- Western Plaguelands
    [1436] = {Name = "Thor", ID = 523}, -- Westfall
    [1437] = {Name = "Shellei Brondir", ID = 1571}, -- Wetlands
}

-- Flight Path Module
local FP = {}

function FP.ByZone()
    -- Get the current zone ID
    ZoneID = GetZoneID()
    FlightMasterInfo = FlightMasterData[ZoneID]

    -- Default to NULL if no flight master is found
    FlightMaster = "NULL"
    FlightMasterID = 9999
    FlightMasterLOC = {0, 0, 0}

    -- If we have flight master data for the zone, fetch it
    if FlightMasterInfo then
        FlightMaster = FlightMasterInfo.Name
        FlightMasterID = FlightMasterInfo.ID
        FlightMasterLOC = GetNPCPostionFromDB(FlightMasterID)
    end

    -- Decompose the flight master location
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];

    -- Start the navigation
    QuestGoToPoint(FlightMasterX, FlightMasterY, FlightMasterZ)
    Log("Starting " .. FlightMaster .. " flight path function")

    -- Look for the flight master in the unit list
    Units = GetUnitsList()
    foreach Unit in Units do
        Log(Unit.Name)
        if Unit.Name == FlightMaster and IsUnitValid(Unit) then
            Log("Found flight master!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end

    -- Log if flight master not found
    Log("Flight master not found in the current zone.")
end

return FP