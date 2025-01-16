--Macros needed:
--Macro Name: Stormwind
--Macro Body: /run local n="Stormwind"; for i=1, NUM_TAXI_BUTTONS do if TaxiNodeName(_G["TaxiButton"..i]:GetID()):lower():find(n:lower()) then TakeTaxiNode(i) return; end end;

local FP = {}

function FP.Duskwood()
    FlightMaster="Felicia Maline"; FlightMasterID=2409; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
    Log("Starting " .. name .. " flight path function")
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name)
        if Unit.Name == FlightMaster and IsUnitValid(Unit) then
            Log("Found flight master!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end
end
function FP.Ironforge()
    FlightMaster="Gryth Thurden"; FlightMasterID=1573; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
    Log("Starting " .. name .. " flight path function")
        Units = GetUnitsList();
        foreach Unit in Units do
            Log(Unit.Name)
            if Unit.Name == FlightMaster and IsUnitValid(Unit) then
            Log("Found flight master!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end
end
function FP.LochModan()
    FlightMaster="Thorgrum Borrelson"; FlightMasterID=1572; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
    Log("Starting " .. name .. " flight path function")
        Units = GetUnitsList();
        foreach Unit in Units do
        Log(Unit.Name)
        if Unit.Name == FlightMaster and IsUnitValid(Unit) then
            Log("Found flight master!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end
end
function FP.Redridge()
    FlightMaster="Ariena Stormfeather"; FlightMasterID=931; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
    Log("Starting " .. name .. " flight path function")
        Units = GetUnitsList();
        foreach Unit in Units do
        Log(Unit.Name)
            if Unit.Name == FlightMaster and IsUnitValid(Unit) then
            Log("Found flight master!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end
end
function FP.Stormwind()
    FlightMaster="Gyll"; FlightMasterID=2859; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
    Log("Starting " .. name .. " flight path function")
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name)
        if Unit.Name == FlightMaster and IsUnitValid(Unit) then
            Log("Found flight master!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end
end
function FP.Westfall()
    FlightMaster="Thor"; FlightMasterID=523; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
    Log("Starting " .. name .. " flight path function")
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name)
        if Unit.Name == FlightMaster and IsUnitValid(Unit) then
            Log("Found flight master!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
            return
        end
    end
end

return FP