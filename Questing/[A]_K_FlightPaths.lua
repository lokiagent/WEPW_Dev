--Macros needed:
--Macro Name: Ashenvale
--Macro Body: /run local n="Astranaar"; for i=1, NUM_TAXI_BUTTONS do if TaxiNodeName(_G["TaxiButton"..i]:GetID()):lower():find(n:lower()) then TakeTaxiNode(i) return; end end;
--Macro Name: Felwood
--Macro Body: /run local n="Talonbranch Glade"; for i=1, NUM_TAXI_BUTTONS do if TaxiNodeName(_G["TaxiButton"..i]:GetID()):lower():find(n:lower()) then TakeTaxiNode(i) return; end end;
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
function FlyToAshenvale()
    FlyToDestination("Ashenvale")
end
function FlyToFelwood()
    FlyToDestination("Felwood")
end
-- Flight Path Functions
function AshenvaleFP()
    FlightMaster="Daelyshia"; FlightMasterID=4267;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function AzsharaFP()		
    FlightMaster="Jarrodenus"; FlightMasterID=12577;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function DarkshoreFP()		
    FlightMaster="Caylais Moonfeather"; FlightMasterID=3841;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function DesolaceFP()		
    FlightMaster="Baritanas Skyriver"; FlightMasterID=6706;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function DustwallowMarshFP()		
    FlightMaster="Baldruc"; FlightMasterID=4321;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function FelwoodFP()	
    FlightMaster="Mishellena"; FlightMasterID=12578;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function FeathermoonStrongholdFP()		
    FlightMaster="Fyldren Moonfeather"; FlightMasterID=8019;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function FeralasFP()		
    FlightMaster="Thyssiana"; FlightMasterID=4319;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function MoongladeFP()		
    FlightMaster="Sindrayl"; FlightMasterID=10897;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function SilithusFP()		
    FlightMaster="Cloud Skydancer"; FlightMasterID=15177;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function StonetalonMountainsFP()		
    FlightMaster="Teloren"; FlightMasterID=4407;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function TanarisFP()		
    FlightMaster="Bera Stonehammer"; FlightMasterID=7823;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function TeldrassilFP()	
    FlightMaster="Vesprystus"; FlightMasterID=3838;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function TheBarrensFP()		
    FlightMaster="Bragok"; FlightMasterID=16227;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function UngoroCraterFP()		
    FlightMaster="Gryfe"; FlightMasterID=10583;
    HandleFlightPath(FlightMaster, FlightMasterID);
end
function WinterspringFP()		
    FlightMaster="Maethrya"; FlightMasterID=11138;
    HandleFlightPath(FlightMaster, FlightMasterID);
end

TeldrassilFP();
DarkshoreFP();
AshenvaleFP();
FelwoodFP();
MoongladeFP();
FlyToFelwood();
WinterspringFP();
FlyToFelwood();
FelwoodFP();
FlyToAshenvale();
AzsharaFP();
FlyToAshenvale();
DustwallowMarshFP();
TheBarrensFP();
StonetalonMountainsFP();
DesolaceFP();
FeathermoonStrongholdFP();
FeralasFP();
TanarisFP();
UnGoroCraterFP();
SilithusFP();

StopQuestProfile();