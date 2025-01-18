--Macros needed:
--Macro Name: Stormwind
--Macro Body: /run local n="Stormwind"; for i=1, NUM_TAXI_BUTTONS do if TaxiNodeName(_G["TaxiButton"..i]:GetID()):lower():find(n:lower()) then TakeTaxiNode(i) return; end end;

-- Flight Master Data Table
local TrainerData = {
    [1426] = {Name = "Marryk Nurribit", ID = 944}, -- Dun Morogh
}

-- Flight Path Module
local GoTo = {}

function GoTo.Train()
    -- Get the current zone ID
    ZoneID = GetZoneID()
    TrainerInfo = TrainerData[ZoneID]

    -- Default to NULL if no flight master is found
    Trainer = "NULL"
    TrainerID = 9999
    TrainerLOC = {0, 0, 0}

    -- If we have flight master data for the zone, fetch it
    if TrainerInfo then
        Trainer = TrainerInfo.Name
        TrainerID = TrainerInfo.ID
        TrainerLOC = GetNPCPostionFromDB(TrainerID)
    end

    -- Decompose the flight master location
    TrainerX=TrainerLOC[0]; TrainerY=TrainerLOC[1]; TrainerZ=TrainerLOC[2];

    -- Start the navigation
    QuestGoToPoint(TrainerX, TrainerY, TrainerZ)
    Log("Starting " .. Trainer .. " flight path function")

    -- Look for the flight master in the unit list
    Units = GetUnitsList()
    foreach Unit in Units do
        Log(Unit.Name)
        if Unit.Name == Trainer and IsUnitValid(Unit) then
            Log("Found Trainer!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end
    UseMacro("Gossip1")
    SleepPlugin(2000)
    UseMacro("Gossip1")
    SleepPlugin(2000)
    UseMacro("Training")
    SleepPlugin(2000)
    UseMacro("Training")
    SleepPlugin(2000)
    -- Log if flight master not found
    Log("Flight master not found in the current zone.")
end

return GoTo