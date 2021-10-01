/// @description ///////Initialize Global Variables for game progression
function scr_game_progress() {

	//Total Game Time
	//globalvar game_time, game_nano_mods_total;
	global.game_total_play_time = 0;
	global.game_total_nano_mods = 0;
	
	///Map Values
	//global.game_map_room = room_map_1;
	global.game_map_playerPos_x = -1;
	global.game_map_playerPos_y = -1;
	for(var i = 0; i < 100; i++)
	{
		//First cell of array stores the id of the enemy patrol
		global.game_map_enemyPatrol_data[i,0] = 0;//Coins Taken from player if gauntley is failed
		global.game_map_enemyPatrol_data[i,1] = -1;//X Position of enemy on map
		global.game_map_enemyPatrol_data[i,2] = -1;//Y Position of enemy on map
		global.game_map_enemyPatrol_data[i,3] = false;//Check when enemy is defeated
		global.game_map_enemyPatrol_data[i,4] = false;//Permenantly destroy enemy
	}
	
	//Global Values that handle storing of level data
	/*
	example
	stage[curr_world,curr_level] = Stage X - Y
	Only 4 values for curr_stage
	1 for Map 1
	2 for Map 2
	3 for Map 3
	10 for Boss Levels
	*/
	global.curr_world = 0;
	global.curr_level = 0;
	global.curr_gauntlet = 0;//Takes value of Map Enemy Id number to handle when a gauntlet is completed


	//Level Records
	for(var s = 0; s <= 10; s += 1)
	    for(var l = 0; l <= 15; l +=1)
	{
	        global.stage_rank[s,l] = "-";//Letter Rank
			global.stage_time[s,l] = 0;//Time
			global.stage_points[s,l] = 0;//Score
			//Checks for Coins Collected in stages
			global.stage_nanoMod_collected[s][l][0] = false;//Coin 1
			global.stage_nanoMod_collected[s][l][1] = false;//Coin 2
			global.stage_nanoMod_collected[s][l][2] = false;//Coin 3
	}

	
	//Counters
	//Misc records
	global.counter_death = 0;
	global.counter_extractions = 0;


	//Event/flag variables
	/*
	event trigger flag array
	
	1XXX = Universal Event Flags
		11XX = NPC Flags
		12XX = Map Completion
		13XX = Cutscenes Watched
	2XXX = Map Blockades Destroyed
	3XXX = Nano Mods picked up in Map
	*/
	for(var f = 0; f < 5000; f++)
		global.event_flag[f] = 0;





}
