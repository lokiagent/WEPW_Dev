--Macros needed:
--Macro Name: Stormwind
--Macro Body: /run local n="Stormwind"; for i=1, NUM_TAXI_BUTTONS do if TaxiNodeName(_G["TaxiButton"..i]:GetID()):lower():find(n:lower()) then TakeTaxiNode(i) return; end end;

local FP = {}

function FP.Duskwood()
    FlightMaster="Felicia Maline"; FlightMasterID=2409; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
end
function FP.Redridge()
    FlightMaster="Ariena Stormfeather"; FlightMasterID=931; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
end
function FP.Stormwind()
    FlightMaster="Gyll"; FlightMasterID=2859; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
end
function FP.Westfall()
    FlightMaster="Thor"; FlightMasterID=523; FlightMasterLOC=GetNPCPostionFromDB(FlightMasterID);
    FlightMasterX=FlightMasterLOC[0]; FlightMasterY=FlightMasterLOC[1]; FlightMasterZ=FlightMasterLOC[2];
    QuestGoToPoint(FlightMasterX,FlightMasterY,FlightMasterZ);
end

return FP