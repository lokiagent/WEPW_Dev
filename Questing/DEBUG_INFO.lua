--Call this by adding the following to a file:
--local debug = dofile("Profiles\\Questing\\DEBUG_INFO.lua");


Log("Current Zone ID: "..GetZoneID());
Log("Current Player Position:"..GetPlayer().Position);


function ThoriumFP()
    QuestGoToPoint(-6558.581, -1168.815, 309.8231);
    Units = GetUnitsList();
    foreach Unit in Units do
        if Unit.Name == "Lanie Reed" and IsUnitValid(Unit) then
            InteractWithUnit(Unit);
            SleepPlugin(5000);
        end;
    end;
end;
function FlyToStormwind()
    Log("Flying to Stormwind");
    UseMacro("Gossip1");
    SleepPlugin(2000);
    UseMacro("Stormwind");
    SleepPlugin(2000);
    UseMacro("Stormwind");
    SleepPlugin(2000);
    UseMacro("Stormwind");
    SleepPlugin(2000);
    SleepPlugin(90000);
end;

ThoriumFP();
FlyToStormwind();

StopQuestProfile();