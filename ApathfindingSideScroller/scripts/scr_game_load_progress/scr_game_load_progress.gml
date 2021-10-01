function scr_game_load_progress() {
	var sav_file = global.game_file;
	var ini_to_write;
	switch(sav_file)//Determine which ini file to write in
	{
	
		default: ini_to_write = "game_file_a.sav"; break;
		case 1: ini_to_write = "game_file_b.sav"; break;
		case 2: ini_to_write = "game_file_c.sav"; break;
	}

	ini_open(ini_to_write);

	
	#region Main Progress
	global.game_total_play_time = ini_read_real("main_progress","game_play_time",0);
	global.game_total_nano_mods = ini_read_real("main_progress","game_total_nanomods",0);
	global.counter_death = ini_read_real("main_progress","game_counter_deaths",0);
	global.counter_extractions = ini_read_real("main_progress","game_counter_extractions",0);
	#endregion
	
	#region Map Values
	//global.game_map_room = ini_read_real("map","room",room_map_1);
	global.game_map_playerPos_x = ini_read_real("map","pos_x",-1);
	global.game_map_playerPos_y = ini_read_real("map","pos_x",-1);
	
	//Enemy Patrol Values
	for(var i = 0; i < 100; i++)
	{
		//First cell of array stores the id of the enemy patrol
		global.game_map_enemyPatrol_data[i,0] = ini_read_real("map","mapEnemy_"+string(i),0);//Coins Taken from player if gauntlet is failed
		global.game_map_enemyPatrol_data[i,1] = ini_read_real("map","mapEnemy_"+string(i)+"_xPos",-1);//X Position of enemy on map
		global.game_map_enemyPatrol_data[i,2] = ini_read_real("map","mapEnemy_"+string(i)+"_yPos",-1);//Y Position of enemy on map
		global.game_map_enemyPatrol_data[i,3] = ini_read_real("map","mapEnemy_"+string(i)+"_defeat",false);//Check when enemy is defeated
		global.game_map_enemyPatrol_data[i,4] = ini_read_real("map","mapEnemy_"+string(i)+"_killed",false);//Permenantly destroy enemy
	}
	#endregion
	
	#region Event Flags
	for(var i = 0; i <= 5000; i++)
	{
		global.event_flag[i] = ini_read_real("event_flags",string(i),0);
	}
	#endregion
	
	#region Player Stats and Equipment
	for(var p = 0; p <= 1; p++)
	{
		
	#region Stats
	global.nano_mods[p] = ini_read_real("player_stats_" + string(p+1),"nano_mods",0);
	global.hp_max[p] = ini_read_real("player_stats_" + string(p+1),"hp",10);
	global.stat_mix[p] = ini_read_real("player_stats_" + string(p+1),"mixture",0);
	global.stat_energy_extract[p] = ini_read_real("player_stats_" + string(p+1),"extract_gain",0.05);
	
	global.stat_bond_all[p] = ini_read_real("player_stats_" + string(p+1),"bond_alloy",0);
	global.stat_bond_di[p] = ini_read_real("player_stats_" + string(p+1),"bond_di",0);
	global.stat_bond_tri[p] = ini_read_real("player_stats_" + string(p+1),"bond_tri",0);
	global.stat_bond_tet[p] = ini_read_real("player_stats_" + string(p+1),"bond_tetra",0);
	
	global.character[p] = ini_read_real("player_stats_" + string(p+1),"char_skin",p);
	global.character_alt[p] = ini_read_real("player_stats_" + string(p+1),"char_alt",0);
	#endregion
	
	#region Equipment
	/*global.active_mixture[p] = ini_read_real("player_equipment_" + string(p+1),"equip_active_mixture",0);
	
	global.elem_slot[0,p+(p*1)] = ini_read_string("player_equipment_" + string(p+1),"equip_elem_slot_1_1","null");
	global.elem_slot[0,p+1+(p*1)] = ini_read_string("player_equipment_" + string(p+1),"equip_elem_slot_1_2","null");
	global.elem_slot[1,p+(p*1)] = ini_read_string("player_equipment_" + string(p+1),"equip_elem_slot_2_1","null");
	global.elem_slot[1,p+1+(p*1)] = ini_read_string("player_equipment_" + string(p+1),"equip_elem_slot_2_2","null");
	global.elem_slot[2,p+(p*1)] = ini_read_string("player_equipment_" + string(p+1),"equip_elem_slot_3_1","null");
	global.elem_slot[2,p+1+(p*1)] = ini_read_string("player_equipment_" + string(p+1),"equip_elem_slot_3_2","null");
	global.elem_slot[3,p+(p*1)] = ini_read_string("player_equipment_" + string(p+1),"equip_elem_slot_4_1","null");
	global.elem_slot[3,p+1+(p*1)] = ini_read_string("player_equipment_" + string(p+1),"equip_elem_slot_4_2","null");

	global.comp[p,0] = ini_read_string("player_equipment_" + string(p+1),"equip_chem_1","null");
	global.comp[p,1] = ini_read_string("player_equipment_" + string(p+1),"equip_chem_2","null");
	global.comp[p,2] = ini_read_string("player_equipment_" + string(p+1),"equip_chem_3","null");
	global.comp[p,3] = ini_read_string("player_equipment_" + string(p+1),"equip_chem_4","null");

	global.heavy_comp[p,0] = ini_read_real("player_equipment_" + string(p+1),"equip_chem_attack_1",0);
	global.heavy_comp[p,1] = ini_read_real("player_equipment_" + string(p+1),"equip_chem_attack_2",0);
	global.heavy_comp[p,2] = ini_read_real("player_equipment_" + string(p+1),"equip_chem_attack_3",0);
	global.heavy_comp[p,3] = ini_read_real("player_equipment_" + string(p+1),"equip_chem_attack_4",0);
	
	global.chem_energy_max[p,0] = ini_read_real("player_equipment_" + string(p+1),"equip_chem_energy_1",1);
	global.chem_energy_max[p,1] = ini_read_real("player_equipment_" + string(p+1),"equip_chem_energy_2",1);
	global.chem_energy_max[p,2] = ini_read_real("player_equipment_" + string(p+1),"equip_chem_energy_3",1);
	global.chem_energy_max[p,3] = ini_read_real("player_equipment_" + string(p+1),"equip_chem_energy_4",1);*/
	#endregion
	
	}
	#endregion
	
	#region Level Records
	//First loop is stages / worlds
	//Second loop is levels in worlds
	for(var s = 0; s <= 10; s += 1)
	    for(var l = 0; l <= 15; l +=1)
	{
	        global.stage_rank[s,l] = ini_read_string("stage_ranks","map_" + string(s) + "_level_" + string(l),"-")
			global.stage_time[s,l] = ini_read_real("stage_times","map_" + string(s) + "_level_" + string(l),0);
			global.stage_points[s,l] = ini_read_real("stage_points","map_" + string(s) + "_level_" + string(l),0);
			global.stage_nanoMod_collected[s][l][0] = ini_read_real("stage_coin1_get","map_" + string(s) + "_level_" + string(l),false);
			global.stage_nanoMod_collected[s][l][1] = ini_read_real("stage_coin2_get","map_" + string(s) + "_level_" + string(l),false);
			global.stage_nanoMod_collected[s][l][2] = ini_read_real("stage_coin3_get","map_" + string(s) + "_level_" + string(l),false);
	}
	#endregion
	
	ini_close();


}
