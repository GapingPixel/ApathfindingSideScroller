function plyr_initialize() {
	//Player Health
	global.hp[0] = global.hp_max[0];
	global.hp[1] = global.hp_max[1];


	//Refill Ammo
	/*global.elem_switch[0] = 0; //switch to handle weapon swapping
	global.active_elem_slot[0] = global.elem_slot[global.active_mixture[0],0];

	global.elem_switch[1] = 0; //switch to handle weapon swapping
	global.active_elem_slot[1] = global.elem_slot[global.active_mixture[1],2];

	global.chem_energy[0,0] = global.chem_energy_max[0,0];
	global.chem_energy[0,1] = global.chem_energy_max[0,1];
	global.chem_energy[0,2] = global.chem_energy_max[0,2];
	global.chem_energy[0,3] = global.chem_energy_max[0,3];

	global.chem_energy[1,0] = global.chem_energy_max[1,0];
	global.chem_energy[1,1] = global.chem_energy_max[1,1];
	global.chem_energy[1,2] = global.chem_energy_max[1,2];
	global.chem_energy[1,3] = global.chem_energy_max[1,3];*/

	//reset player counter for play state
	global.player_count = global.total_players;




}
