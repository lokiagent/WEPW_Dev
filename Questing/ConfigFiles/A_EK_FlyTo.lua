--Macros needed:
--Macro Name: Ashenvale
--Macro Body: /run local n="Astranaar"; for i=1, NUM_TAXI_BUTTONS do if TaxiNodeName(_G["TaxiButton"..i]:GetID()):lower():find(n:lower()) then TakeTaxiNode(i) return; end end;
--Macro Name: Felwood
--Macro Body: /run local n="Talonbranch Glade"; for i=1, NUM_TAXI_BUTTONS do if TaxiNodeName(_G["TaxiButton"..i]:GetID()):lower():find(n:lower()) then TakeTaxiNode(i) return; end end;

local FlyTo = {}

function FlyTo.Duskwood()
    Log("Flying to Duskwood")
    for _ = 1, 3 do
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro(FPDuskwood)
        SleepPlugin(2000)
    end
end
function FlyTo.Redridge()
    Log("Flying to Redridge")
    for _ = 1, 3 do
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro(FPRedridge)
        SleepPlugin(2000)
    end
end
function FlyTo.Stormwind()
    Log("Flying to Stormwind")
    for _ = 1, 3 do
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro(FPStormwind)
        SleepPlugin(2000)
    end
end
function FlyTo.Westfall()
    Log("Flying to Westfall")
    for _ = 1, 3 do
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro("Gossip1")
        SleepPlugin(2000)
        UseMacro(FPWestfall)
        SleepPlugin(2000)
    end
end

return FlyTo