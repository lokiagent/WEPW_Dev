local Gather = {}

function Gather.Herbalism()
    Herbs = {}
    if HasSkill("Herbalism") == true then
        Herbalism = true;
        Herbs[1] = 1186
        Herbs[2] = 1618
        Herbs[3] = 1617
        Herbs[4] = 3725
        Herbs[5] = 1619

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

