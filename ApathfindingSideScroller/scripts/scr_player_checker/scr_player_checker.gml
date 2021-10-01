/// @description Checks player count to kill off player 2 and refill ammo and health
function scr_player_checker() {
	if global.total_players = 1
	{
	with(obj_plyr2)
	    instance_destroy();
	
	}


	global.player_count = global.total_players;
	global.raw_death_count = 0;

	//Also restore health and Chemicals here becase I'm too lazy to make another script
	global.hp[0] = global.hp_max[0];
	global.hp[1] = global.hp_max[1];




	//Refill Ammo
	for(var a = 0; a < 2; a++)//Player IDs
		for(var b = 0; b < 5; b++)//Mixtures
	{
		global.player_active_mixture[a] = 0;
	
		if global.player_weapon_slot[a][b][2] != "null"
			global.player_weapon_slot[a][b][4] = global.player_weapon_slot[a][b][5]; //chemical energy; max value = 100
	
	
		global.player_chem_blast[a][2] = 0;
	}



}
