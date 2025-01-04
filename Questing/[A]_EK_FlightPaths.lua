local function HandleFlightPath(name, ID)
    Log("Starting " .. name .. " flight path function")
    FlightMaster=name; FlightMasterID=ID; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2]);
    coords = { FlightMasterX, FlightMasterY, FlightMasterZ }
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
function FlyToStormwind()
    FlyToDestination("Stormwind")
end
-- Flight Path Functions
function ArathiHighlandsFP()
    FlightMaster="Cedrik Prose"; FlightMasterID=2835;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function BlastedLandsFP()
    FlightMaster="Alexandra Constantine"; FlightMasterID=8609;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function BurningSteppesFP()
    FlightMaster="Borgus Stoutarm"; FlightMasterID=2299;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function DuskwoodFP()
    FlightMaster="Felicia Maline"; FlightMasterID=2409;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function EasternPlaguelandsFP()
    FlightMaster="Khaelyn Steelwing"; FlightMasterID=12617;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function HillsbradFoothillsFP()
    FlightMaster="Darla Harris"; FlightMasterID=2432;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function HinterlandsFP()
    FlightMaster="Guthrum Thunderfist"; FlightMasterID=8018;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function IronforgeFP()
    FlightMaster="Gryth Thurden"; FlightMasterID=1573;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function LochModanFP()
    FlightMaster="Thorgrum Borrelson"; FlightMasterID=1572;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function RedridgeMountainsFP()
    FlightMaster="Ariena Stormfeather"; FlightMasterID=931;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function SearingGorgeFP()
    FlightMaster="Lanie Reed"; FlightMasterID=2941;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function StormwindCityFP()
    FlightMaster="Dungar Longdrink"; FlightMasterID=352;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function StranglethornValeFP()
    FlightMaster="Gyll"; FlightMasterID=2859;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function WesternPlaguelandsFP()
    FlightMaster="Bibilfaz Featherwhistle"; FlightMasterID=12596;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function WestfallFP()
    FlightMaster="Thor"; FlightMasterID=523;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function WetlandsFP()
    FlightMaster="Shellei Brondir"; FlightMasterID=1571;
    HandleFlightPath(FlightMaster, FlightMasterID);
end

StormwindCityFP();
WestfallFP();
RedridgeMountainsFP();
DuskwoodFP();
StranglethornValeFP();
FlyToStormwind();
IronforgeFP();
LochModanFP();
WetlandsFP();
ArathiHighlandsFP();
HinterlandsFP();
WesternPlaguelandsFP();
EasternPlaguelandsFP();