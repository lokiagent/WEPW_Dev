-- Desc: Contains functions for handling flight paths in Eastern Kingdoms

-- Function to ensure folder and file structure
local function EnsureFolderAndFile(functionName)
    local characterName = GetPlayer.Name()
    local baseFolder = "CharacterInfo/" .. characterName
    local subFolder = baseFolder .. "/DiscoveredFlightPaths"
    local fileName = subFolder .. "/" .. functionName .. ".txt"

    -- Create base folder if it doesn't exist
    if not DirectoryExists(baseFolder) then
        CreateDirectory(baseFolder)
    end

    -- Create subfolder "DiscoveredFlightPaths" if it doesn't exist
    if not DirectoryExists(subFolder) then
        CreateDirectory(subFolder)
    end

    -- Create the file "<FunctionName>.txt" if it doesn't exist
    if not FileExists(fileName) then
        local file = io.open(fileName, "w")
        if file then
            file:close()
        end
    end
end

-- Function to handle flight paths
local function HandleFlightPath(name, coords)
    -- Ensure folder and file structure
    local functionName = debug.getinfo(2, "n").name -- Get the calling function's name
    EnsureFolderAndFile(functionName)

    Log("Starting " .. name .. " flight path function")
    QuestGoToPoint(table.unpack(coords))
    for _, unit in ipairs(GetUnitsList()) do
        Log(unit.Name)
        if unit.Name == name and IsUnitValid(unit) then
            Log("Found flight master!")
            InteractWithUnit(unit)
            SleepPlugin(5000)
            return
        end
    end
end

-- Function to fly to destinations
local function FlyToDestination(destination, sleepTime)
    Log("Flying to " .. destination)
    for _ = 1, 3 do
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro(destination)
        SleepPlugin(2000)
    end
    SleepPlugin(sleepTime or 90000)
end

-- Flight Master Locations
function WestfallFP()
    HandleFlightPath("Thor", { -10627.74, 1038.647, 34.12702 })
end

function StormwindFP()
    HandleFlightPath("Dungar Longdrink", { -8834.801, 487.8065, 109.6138 })
end

function RedridgeFP()
    HandleFlightPath("Ariena Stormfeather", { -9434.632, -2235.667, 69.05429 })
end

function DarkshireFP()
    HandleFlightPath("Felicia Maline", { -10513.16, -1259.571, 41.42373 })
end

function ThoriumFP()
    HandleFlightPath("Lanie Reed", { -6558.581, -1168.815, 309.8231 })
end

-- Fly to specific destinations
function FlyToStormwind()
    FlyToDestination("Stormwind")
end

function FlyToWestfall()
    FlyToDestination("Sentinel Hill")
end

function FlyToRedridgeMountains()
    FlyToDestination("Lakeshire")
end

function FlyToDuskwood()
    FlyToDestination("Darkshire")
end
