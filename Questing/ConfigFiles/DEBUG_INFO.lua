-- Call this by adding the following to a file:
-- local debug = dofile("Profiles\\Questing\\DEBUG_INFO.lua");

-- Load the external file
local chunk = loadfile("Profiles\\Questing\\ConfigFiles\\[A]_EK_FlightPaths.lua")
local Test -- Declare the Test variable in this scope
Test = chunk()

-- Call popmessage again
ArathiHighlandsFP();

-- Additional functionality
-- Log("Current Zone ID: "..GetZoneID())
-- Log("Current Player Position:"..GetPlayer().Position())

StopQuestProfile()
