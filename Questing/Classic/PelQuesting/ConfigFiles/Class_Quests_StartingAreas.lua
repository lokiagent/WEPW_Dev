local ClassQuestData = {
    Dwarf = {
        Warrior = 3106,
        Rogue = 3109,
        Priest = 3110,
        Paladin = 3107,
        Hunter = 3108,
    },
    Gnome = {
        Mage = 3114,
        Warrior = 3112,
        Warlock = 3115,
        Rogue = 3113,
    },
}

local ClassQuest = {}

function ClassQuest.GetID()
    local race = GetPlayer().RaceName
    local class = GetPlayerClass()
    --Log("QuestID: "..ClassQuestData[race][class]);
    return ClassQuestData[race][class]
end


--StopQuestProfile();
return ClassQuest

--accept Simple Rune##3106 |goto Dun Morogh 29.93,71.20		|only Dwarf Warrior
--accept Encrypted Rune##3109 |goto Dun Morogh 29.93,71.20		|only Dwarf Rogue
--accept Hallowed Rune##3110 |goto Dun Morogh 29.93,71.20		|only Dwarf Priest
--accept Consecrated Rune##3107 |goto Dun Morogh 29.93,71.20		|only Dwarf Paladin
--accept Etched Rune##3108 |goto Dun Morogh 29.93,71.20		|only Dwarf Hunter
--accept Glyphic Memorandum##3114 |goto Dun Morogh 29.93,71.20	|only Gnome Mage
--accept Simple Memorandum##3112 |goto Dun Morogh 29.93,71.20	|only Gnome Warrior
--accept Tainted Memorandum##3115 |goto Dun Morogh 29.93,71.20	|only Gnome Warlock
--accept Encrypted Memorandum##3113 |goto Dun Morogh 29.93,71.20	|only Gnome Rogue