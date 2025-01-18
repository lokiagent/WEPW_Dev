local Gather = {}

function Gather.Herbalism()
    Herbalism = false;
    if HasSkill("Herbalism") == true then
        Herbalism = true;
        HerbalismSkill = SkillValue("Herbalism");
    end
end
function Gather.Mining()
    Mining = false;
    if HasSkill("Mining") == true then
        Mining = true;
        MiningSkill = SkillValue("Mining");
    end
end
function Gather.Skinning()
    Skinning = false;
    if HasSkill("Skinning") == true then
        Skinning = true;
        SkinningSkill = SkillValue("Skinning");
    end
end

return Gather

