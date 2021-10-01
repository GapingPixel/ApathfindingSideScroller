/// @description Flush elements
function plyr_flush_elements(player_id) {

	//Flushes ammo and voids weapons
	
	var mm = global.player_active_mixture[player_id];

	global.player_weapon_slot[player_id][mm][0] = "null"; //element slot 1
	global.player_weapon_slot[player_id][mm][1] = "null"; //element slot 2
	global.player_weapon_slot[player_id][mm][2] = "null"; //compound slot
	global.player_weapon_slot[player_id][mm][3] = 6; //damage type
	global.player_weapon_slot[player_id][mm][4] = 0; //ammo
	global.player_weapon_slot[player_id][mm][5] = 0; //ammo Max
	
	global.player_active_weapon_slot[player_id] = 0;//Set active shot to slot 1


}
