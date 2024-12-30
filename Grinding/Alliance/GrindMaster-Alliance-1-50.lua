	Author = "Lawl edit of Speedy for Alliance";
	

	--Varibales--
	Player = GetPlayer();
	Log("Player Name: " .. Player.Name)
	Log("Player Level: " .. Player.Level)
	Log("Player Class: " .. Player.Class)
	Log("Player Race: " .. Player.Race)
	
	-- Date Checker
-- Calculate the expiration date as October 25th of the current year


StartMobAvoidance();
UseDBToRepair(true)
UseDBToSell(true)
SkinMobs = (false);
SetQuestRepairAt(30)
SetQuestSellAt(2)






	Elwynn4 = CreateObjective("KillMobsAndLoot",1,1,1,999,TableToList{299,257,6});
	Elwynn6 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{38}); 
	Elwynn8 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{113}); 
	Elwynn11 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{524,822});
    Westfall13 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{834,480,454,199});
    Westfall17 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{830});
	Westfall21 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{154,547});
	Duskwood25 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{569,565});
	Duskwood31 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{930});
	Duskwood33 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{212,1251});
	Arathi38 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{2562,2552});	
	Arathi42 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{2579,2561,2565});
	Tanaris46 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{5422,5419,5428});
	Tanaris48 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{5420,5423,5429});
	Tanaris52 = CreateObjective("KillMobsAndLoot",1,1,1,998,TableToList{5475,5471,5472});


if(Player.Level < 3) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 4..");
		GrindUntilLvl(4,Elwynn4,true,true);
	end
if(Player.Level < 6) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 6..");
		GrindUntilLvl(6,Elwynn6,true,true);
	end
if(Player.Level < 8) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 8..");
		GrindUntilLvl(8,Elwynn8,true,true);
	end	
if(Player.Level < 11) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 11..");
		GrindUntilLvl(11,Elwynn11,true,true);
	end

    if(Player.Level < 13) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 13..");
		GrindUntilLvl(13,Westfall13,true,true);
	end

    if(Player.Level < 17) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 17..");
		GrindUntilLvl(17,Westfall17,true,true);
	end

    if(Player.Level < 21) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 21..");
		GrindUntilLvl(21,Westfall21,true,true);
	end


	if(Player.Level < 25) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 25..");
		GrindUntilLvl(25,Duskwood25,true,true);
	end

	if(Player.Level < 31) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 31..");
		GrindUntilLvl(31,Duskwood31,true,true);
	end

	if(Player.Level < 33) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 33..");
		GrindUntilLvl(33,Duskwood33,true,true);
	end

	if(Player.Level < 38) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 38..");
		GrindUntilLvl(38,Arathi38,true,true);
	end

	if(Player.Level < 42) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 42..");
		GrindUntilLvl(42,Arathi42,true,true);
	end	

	if(Player.Level < 46) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 46..");
		GrindUntilLvl(46,Tanaris46,true,true);
	end	
	
	if(Player.Level < 48) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 48..");
		GrindUntilLvl(48,Tanaris48,true,true);
	end	

	if(Player.Level < 52) then
		
		--Startup(x2,y2,z2,npc);
		Log("Grinding to 52..");
		GrindUntilLvl(52,Tanaris52,true,true);
	end	

    StopQuestProfile();

