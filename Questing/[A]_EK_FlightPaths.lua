--local M = {};

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


function WestfallFP() 
    QuestGoToPoint(-10627.74,1038.647,34.12702);    
    Units = GetUnitsList();
      foreach Unit in Units do
            Log(Unit.Name);
         if (Unit.Name == "Thor") and (IsUnitValid(Unit)== true) then
             Log("Found flight master!");         
             InteractWithUnit(Unit);
             SleepPlugin(5000);
          end; -- IF
       end; -- For Each
    end; 
function StormwindFP()
    Log("Starting StormwindFP function")
    QuestGoToPoint(-8843.952, 493.1302, 109.6061)
    Log("Moved to coordinates")
    
    local Units = GetUnitsList()
    if not Units then
        Log("GetUnitsList() returned nil!")
        return
    end

    for _, Unit in ipairs(Units) do
        Log("Checking unit: " .. (Unit.Name or "unknown"))
        if Unit.Name == "Dungar Longdrink" and IsUnitValid(Unit) then
            Log("Found flight master!")
            InteractWithUnit(Unit)
            SleepPlugin(5000)
        end
    end
end
function M.RedridgeFP() 
    Units = GetUnitsList();
      foreach Unit in Units do
            Log(Unit.Name);
         if (Unit.Name == "Ariena Stormfeather") and (IsUnitValid(Unit)== true) then
             Log("Found flight master!");         
             InteractWithUnit(Unit);
             SleepPlugin(5000);
          end; -- IF
       end; -- For Each
end; 
function M.DarkshireFP() 
    Units = GetUnitsList();
    foreach Unit in Units do
        Log(Unit.Name);
        if (Unit.Name == "Felicia Maline") and (IsUnitValid(Unit)== true) then
            Log("Found flight master!");         
            InteractWithUnit(Unit);
            SleepPlugin(5000);
        end; -- IF
    end; -- For Each
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

function FlyToWestfall()
    Log("Flying to Westfall");
    UseMacro("Gossip1");
    SleepPlugin(2000);
    UseMacro("Sentinel Hill");
    SleepPlugin(2000);
    UseMacro("Sentinel Hill");
    SleepPlugin(2000);
    UseMacro("Sentinel Hill");
    SleepPlugin(2000);
    SleepPlugin(120000);
end;