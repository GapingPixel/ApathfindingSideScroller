function scr_game_save_progress() {
	var sav_file = global.game_file;
	var ini_to_write;
	
	switch(sav_file)//Determine which ini file to write in
	{
	
		default: ini_to_write = "game_file_a.sav"; break;
		case 1: ini_to_write = "game_file_b.sav"; break;
		case 2: ini_to_write = "game_file_c.sav"; break;
	}

	ini_open(ini_to_write);
	
	#region Game File Written
	ini_write_real("game_file","written",true);
	#endregion
	
	#region Main Progress
	ini_write_real("main_progress","game_play_time",global.game_total_play_time);
	ini_write_real("main_progress","game_total_nanomods",global.game_total_nano_mods);
	ini_write_real("main_progress","game_counter_deaths",global.counter_death);
	ini_write_real("main_progress","game_counter_extractions",global.counter_extractions);
	#endregion
	
	#region Map Values
	ini_write_real("map","room",global.game_map_room);
	ini_write_real("map","pos_x",global.game_map_playerPos_x);
	ini_write_real("map","pos_y",global.game_map_playerPos_y);
	
	//Enemy Patrol Values
	for(var i = 0; i < 100; i++)
	{
		//First cell of array stores the id of the enemy patrol
		ini_write_real("map","mapEnemy_"+string(i),global.game_map_enemyPatrol_data[i,0]);//Coins Taken from player if gauntley is failed
		ini_write_real("map","mapEnemy_"+string(i)+"_xPos",global.game_map_enemyPatrol_data[i,1]);//X Position of enemy on map
		ini_write_real("map","mapEnemy_"+string(i)+"_yPos",global.game_map_enemyPatrol_data[i,2]);//Y Position of enemy on map
		ini_write_real("map","mapEnemy_"+string(i)+"_defeat",global.game_map_enemyPatrol_data[i,3]);//Check when enemy is defeated
		ini_write_real("map","mapEnemy_"+string(i)+"_killed",global.game_map_enemyPatrol_data[i,4]);//Permenantly destroy enemy
	}
	#endregion
	
	#region Event Flags
	for(var i = 0; i <= 5000; i++)
	{
		ini_write_real("event_flags",string(i),global.event_flag[i]);
	}
	#endregion
	
	#region Player Stats and Equipment
	for(var p = 0; p <= 1; p++)
	{
		
	#region Stats
	ini_write_real("player_stats_" + string(p+1),"nano_mods",global.nano_mods[p]);
	ini_write_real("player_stats_" + string(p+1),"hp",global.hp_max[p]);
	ini_write_real("player_stats_" + string(p+1),"mixture",global.stat_mix[p]);
	ini_write_real("player_stats_" + string(p+1),"extract_gain",global.stat_energy_extract[p]);

	ini_write_real("player_stats_" + string(p+1),"bond_alloy",global.stat_bond_all[p]);
	ini_write_real("player_stats_" + string(p+1),"bond_di",global.stat_bond_di[p]);
	ini_write_real("player_stats_" + string(p+1),"bond_tri",global.stat_bond_tri[p]);
	ini_write_real("player_stats_" + string(p+1),"bond_tetra",global.stat_bond_tet[p]);
	
	ini_write_real("player_stats_" + string(p+1),"char_skin",global.character[p]);
	ini_write_real("player_stats_" + string(p+1),"char_alt",global.character_alt[p]);
	#endregion
	
	#region Equipment
	/*
	ini_write_real("player_equipment_" + string(p+1),"equip_active_mixture",global.active_mixture[p]);
	
	ini_write_string("player_equipment_" + string(p+1),"equip_elem_slot_1_1",global.elem_slot[0,p+(p*1)]);//slot 1 Mix 1
	ini_write_string("player_equipment_" + string(p+1),"equip_elem_slot_1_2",global.elem_slot[0,p+1+(p*1)]);//slot 2 Mix 1
	ini_write_string("player_equipment_" + string(p+1),"equip_elem_slot_2_1",global.elem_slot[1,p+(p*1)]);//slot 1 Mix 2
	ini_write_string("player_equipment_" + string(p+1),"equip_elem_slot_2_2",global.elem_slot[1,p+1+(p*1)]);//slot 2 Mix 2
	ini_write_string("player_equipment_" + string(p+1),"equip_elem_slot_3_1",global.elem_slot[2,p+(p*1)]);//slot 1 Mix 3
	ini_write_string("player_equipment_" + string(p+1),"equip_elem_slot_3_2",global.elem_slot[2,p+1+(p*1)]);//slot 2 Mix 3
	ini_write_string("player_equipment_" + string(p+1),"equip_elem_slot_4_1",global.elem_slot[3,p+(p*1)]);//slot 1 Mix 4
	ini_write_string("player_equipment_" + string(p+1),"equip_elem_slot_4_2",global.elem_slot[3,p+1+(p*1)]);//slot 2 Mix 4

	ini_write_string("player_equipment_" + string(p+1),"equip_chem_1",global.comp[p,0]);
	ini_write_string("player_equipment_" + string(p+1),"equip_chem_2",global.comp[p,1]);
	ini_write_string("player_equipment_" + string(p+1),"equip_chem_3",global.comp[p,2]);
	ini_write_string("player_equipment_" + string(p+1),"equip_chem_4",global.comp[p,3]);

	ini_write_real("player_equipment_" + string(p+1),"equip_chem_attack_1",global.heavy_comp[p,0]);
	ini_write_real("player_equipment_" + string(p+1),"equip_chem_attack_2",global.heavy_comp[p,1]);
	ini_write_real("player_equipment_" + string(p+1),"equip_chem_attack_3",global.heavy_comp[p,2]);
	ini_write_real("player_equipment_" + string(p+1),"equip_chem_attack_4",global.heavy_comp[p,3]);
	
	ini_write_real("player_equipment_" + string(p+1),"equip_chem_energy_1",global.chem_energy_max[p,0]);
	ini_write_real("player_equipment_" + string(p+1),"equip_chem_energy_2",global.chem_energy_max[p,1]);
	ini_write_real("player_equipment_" + string(p+1),"equip_chem_energy_3",global.chem_energy_max[p,2]);
	ini_write_real("player_equipment_" + string(p+1),"equip_chem_energy_4",global.chem_energy_max[p,3]);*/
	#endregion
	
	}
	#endregion
	
	#region Level Records
	//First loop is worlds
	//Second loop is levels in that world
	for(var s = 0; s <= 10; s += 1)
	    for(var l = 0; l <= 15; l +=1)
	{
	        ini_write_string("stage_ranks","map_" + string(s) + "_level_" + string(l),global.stage_rank[s,l]);
			ini_write_real("stage_times","map_" + string(s) + "_level_" + string(l),global.stage_time[s,l]);
			ini_write_real("stage_points","map_" + string(s) + "_level_" + string(l),global.stage_points[s,l]);
			ini_write_real("stage_coin1_get","map_" + string(s) + "_level_" + string(l),global.stage_nanoMod_collected[s][l][0]);
			ini_write_real("stage_coin2_get","map_" + string(s) + "_level_" + string(l),global.stage_nanoMod_collected[s][l][1]);
			ini_write_real("stage_coin3_get","map_" + string(s) + "_level_" + string(l),global.stage_nanoMod_collected[s][l][2]);
			ini_write_real("stage_coin4_get","map_" + string(s) + "_level_" + string(l),global.stage_nanoMod_collected[s][l][3]);
	}
	#endregion
	
	ini_close();


}
