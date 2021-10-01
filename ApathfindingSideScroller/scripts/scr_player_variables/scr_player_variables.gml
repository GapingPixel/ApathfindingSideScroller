/// @description Initialize Global Variables for players
function scr_player_variables() {
	//globalvar total_players;//max player count
	global.total_players = 1;

	//globalvar player_count;//Determines total players in-game (used for camera, death cases, etc)
	global.player_count = global.total_players;

	//globalvar raw_death_count;//Global variable to check death count during play for revival mechanic
	global.raw_death_count = 0;

	//Player Variables are set in arrays
	//Primarily 0 for P1 and 1 for P2

	//Nano Mods count for P1 and P2
	//globalvar nano_mods;
	global.nano_mods[0] = 0;
	global.nano_mods[1] = 0;


	////Player Stats
	//globalvar hp_max, hp, stat_mix, stat_energy_extract,
	//stat_res_heat, stat_res_cold, stat_res_shock,
	//stat_chemball_detract, stat_dash, stat_attack_discharge, stat_attack_blade;

	//Player 1
	global.hp_max[0] = 10;//Max HP
	global.hp[0] = global.hp_max[0];
	global.stat_mix[0] = 1;//Mixture Total
	global.stat_energy_extract[0] = 0.05;//Energy Extraction

	//Player 2
	global.hp_max[1] = 10;
	global.hp[1] = global.hp_max[1];
	global.stat_mix[1] = 1;
	global.stat_energy_extract[1] = 0.05;


	////Cosmetics
	//globalvar character, character_alt;
	/*
	"character" for character selection
	0 for Antom
	1 for Microl

	"character_alt" determines palette
	0 to 3
	*/
	global.character[0] = 0;
	global.character[1] = 1;
	global.character_alt[0] = 0;
	global.character_alt[1] = 0;

	//Enum States

	//Player States 
	enum playerState
	{
		//active states
		enable,
		disable,
		//status States
		statusFrozen,
		statusShock,
		statusDead,
		//Special States
		animIntro,
		autoRun,
		sad
	}

	//Chemical Ball states
	enum ballState
	{
		HELD,
		THROW,
		RETURN,
		CLAP
	}

	//Map Player Character States
	enum playerMapState
	{
		idle,
		move,
		stop
	}

	////Bonding Stats; for Chemical Forming
	//globalvar bond_all, bond_di, bond_tri, bond_tet;

	//Player 1
	global.stat_bond_all[0] = 0;
	global.stat_bond_di[0] = 0;
	global.stat_bond_tri[0] = 0;
	global.stat_bond_tet[0] = 0;

	//Player 2
	global.stat_bond_all[1] = 0;
	global.stat_bond_di[1] = 0;
	global.stat_bond_tri[1] = 0;
	global.stat_bond_tet[1] = 0;

	////Elements and Chemicals Storage
	
	/*
	//Player 1
	global.active_mixture[0] = 0;
	//Elements first part of array is active mixture, second is element
	global.elem_slot[0,0] = "null";//slot 1 Mix 1
	global.elem_slot[0,1] = "null";//slot 2 Mix 1
	global.elem_slot[1,0] = "null";//slot 1 Mix 2
	global.elem_slot[1,1] = "null";//slot 2 Mix 2
	global.elem_slot[2,0] = "null";//slot 1 Mix 3
	global.elem_slot[2,1] = "null";//slot 2 Mix 3
	global.elem_slot[3,0] = "null";//slot 1 Mix 4
	global.elem_slot[3,1] = "null";//slot 2 Mix 4

	//Chemicals second part of array is active mixture
	global.comp[0,0] = "null"; //Chemical 1
	global.comp[0,1] = "null"; //Chemical 2
	global.comp[0,2] = "null";	//Chemical 3
	global.comp[0,3] = "null";	//Chemical 4

	//switch to handle heavy shots from chemical blast
	
	//0 for none
	//1 for heavy
	//2 for omnidirectional
	//3 for special attack
	
	global.heavy_comp[0,0] = 0;
	global.heavy_comp[0,1] = 0;
	global.heavy_comp[0,2] = 0;
	global.heavy_comp[0,3] = 0;

	global.elem_switch[0] = 0; //switch to handle weapon swapping
	global.active_elem_slot[0] = global.elem_slot[global.active_mixture[0],0];

	//Chemical Energy arrays
	global.chem_energy_max[0,0] = 1;
	global.chem_energy_max[0,1] = 1;
	global.chem_energy_max[0,2] = 1;
	global.chem_energy_max[0,3] = 1;
	
	global.chem_energy_decayRate[0,0] = 0.01;
	global.chem_energy_decayRate[0,1] = 0.01;
	global.chem_energy_decayRate[0,2] = 0.01;
	global.chem_energy_decayRate[0,3] = 0.01;

	global.chem_energy[0,0] = global.chem_energy_max[0,0];
	global.chem_energy[0,1] = global.chem_energy_max[0,1];
	global.chem_energy[0,2] = global.chem_energy_max[0,2];
	global.chem_energy[0,3] = global.chem_energy_max[0,3];

	//Player 2
	global.active_mixture[1] = 0;

	global.elem_slot[0,2] = "null";//slot 1 Mix 1
	global.elem_slot[0,3] = "null";//slot 2 Mix 1
	global.elem_slot[1,2] = "null";//slot 1 Mix 2
	global.elem_slot[1,3] = "null";//slot 2 Mix 2
	global.elem_slot[2,2] = "null";//slot 1 Mix 3
	global.elem_slot[2,3] = "null";//slot 2 Mix 3
	global.elem_slot[3,2] = "null";//slot 1 Mix 4
	global.elem_slot[3,3] = "null";//slot 2 Mix 4

	global.comp[1,0] = "null";//Chemical 1
	global.comp[1,1] = "null";//Chemical 2
	global.comp[1,2] = "null";//Chemical 3
	global.comp[1,3] = "null";//Chemical 4

	global.heavy_comp[1,0] = 0;
	global.heavy_comp[1,1] = 0;
	global.heavy_comp[1,2] = 0;
	global.heavy_comp[1,3] = 0;

	global.elem_switch[1] = 0; //switch to handle weapon swapping
	global.active_elem_slot[1] = global.elem_slot[global.active_mixture[1],2];

	//Chemical Energy array
	global.chem_energy_max[1,0] = 1;
	global.chem_energy_max[1,1] = 1;
	global.chem_energy_max[1,2] = 1;
	global.chem_energy_max[1,3] = 1;
	
	global.chem_energy_decayRate[1,0] = 0.01;
	global.chem_energy_decayRate[1,1] = 0.01;
	global.chem_energy_decayRate[1,2] = 0.01;
	global.chem_energy_decayRate[1,3] = 0.01;
	
	global.chem_energy[1,0] = global.chem_energy_max[1,0];
	global.chem_energy[1,1] = global.chem_energy_max[1,1];
	global.chem_energy[1,2] = global.chem_energy_max[1,2];
	global.chem_energy[1,3] = global.chem_energy_max[1,3];
	*/

	//Weapon Slots
	/*
	player_weapon_slot[player_id][mixture number][data reference]
	*/
	
	for(var a = 0; a < 2; a++)//Player IDs
		for(var b = 0; b < 5; b++)//Mixtures
	{
	global.player_active_mixture[a] = 0;
	global.player_weapon_slot[a][b][0] = "null"; //element slot 1
	global.player_weapon_slot[a][b][1] = "null"; //element slot 2
	global.player_weapon_slot[a][b][2] = "null"; //compound slot
	global.player_weapon_slot[a][b][3] = 6; //compound damage type (reference damage output system and for HUD information)
	
	
	global.player_weapon_slot[a][b][4] = 0; //compound ammo
	global.player_weapon_slot[a][b][5] = 1; //Max commpound ammo
	
	global.player_active_weapon_slot[a] = 0; //manages which shot is active (from 0 to 2)
	
	//global.player_weapon_switch[a] = 0; //switch to handle weapon swapping
	
	
	//Chem Blast Slot
	//player_chem_blast[player_id][data reference]
	global.player_chem_blast[a][0] = 0; //Super Type
	global.player_chem_blast[a][1] = 1; //Mega Super Type
	global.player_chem_blast[a][2] = 0; //Gauge; Maxes out @ 100
	
	//Gear Slot
	//player_gear[player_id]
	//0 = None
	//global.player_gear[a] = 0;//Gear Type
	
	}


}
