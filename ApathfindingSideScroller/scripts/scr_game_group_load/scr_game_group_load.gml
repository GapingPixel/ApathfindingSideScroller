/// @description Initialize Global Variables and Enums for Groups, Particles, and Enemies
function scr_game_group_load() {
	//globalvar game_file;
	global.game_file = 0;

	//Room Enum State
	enum roomState
	{
		OnFoot,//Foot Levels
		Flight,//Flight Levels
		Gauntlet,//Special on Foot Levels
		Map,//For Overworld traveling
		Cutscene,//For Cutscenes with no player input
		Menu//For main menu or shop rooms
	}
	global.game_room_state = roomState.OnFoot;


	#region Particle system
	//globalvar parsys, parsys_below, parsys_deep, parsys_high, parsys_menus;
	global.parsys = part_system_create();//particle system for above objects
	part_system_depth(global.parsys,-50);

	global.parsys_below = part_system_create();//particle system for below objects
	part_system_depth(global.parsys_below,50);

	global.parsys_high = part_system_create();//particle system for objects with higher depth
	part_system_depth(global.parsys_high,-100);

	global.parsys_deep = part_system_create();//particle system for objects with lower depth
	part_system_depth(global.parsys_deep,100);

	global.parsys_menus = part_system_create();//particle system unaffected by pause
	part_system_depth(global.parsys_menus,-1000);
	#endregion
	
	#region Object States; for terrain and bullets
	enum objectState
	{
		normal,
		wet,
		onFire,
		electrified,
		frozen,
	}
	#endregion

	#region Enemy States and Values
	
	enum enemyState
	{
	NORMAL,
	FROZEN,
	SHOCKED,
	HITSTUN
	}
	
		#region Enemy AI Macros
	
		//Idle States 0 - 9
		#macro enemy_IDLE 0
		#macro enemy_WAIT 1
		#macro enemy_SPAWN 2
		#macro enemy_TURN 3
		#macro enemy_AIM 4
		#macro enemy_BLOCK 5
		#macro enemy_TAUNT 6 
	
		//Movement States 10 - 19
		#macro enemy_PATROL 10
		#macro enemy_RUN 11
		#macro enemy_PURSUE 12
		#macro enemy_FLY 13
		#macro enemy_LEAVE 14
		#macro enemy_ZIGZAG 15
		#macro enemy_FLEE_AWAY 16
	
		//Jumping / Aerial States 20 - 29
		#macro enemy_JUMP 20
		#macro enemy_RISE 21
		#macro enemy_FALL 22
	
		//Attack States 30 - xx
		#macro enemy_ATTACK_1 30
		#macro enemy_ATTACK_2 31
		#macro enemy_ATTACK_3 32
	
		#macro enemy_KO 99
	
		#endregion
	
	
		#region Enemy Spawner Macros
			#macro enemyEdgeSpawner_horizontal 0
			#macro enemyEdgeSpawner_vertical 1
		#endregion
	#endregion

	#region Wave Spawn Enum
	enum waveSpawner
	{
	WAVE,//Wave Number
	TYPE,//Enemy to Spawn
	SPAWN,//Spawn Position
	SCALE_X,//X Scale
	SCALE_Y,//Y Scale
	DELAY,//Delay time to spawn
	DROP//Manages what the enemy drops upon death
	}
	#endregion

	#region Audio
	audio_group_load(audiogroup_default);//Music here
	audio_group_load(audiogroup_sfx_player);
	audio_group_load(audiogroup_sfx_enemy);
	audio_group_load(audiogroup_sfx_UI);
	audio_group_load(audiogroup_sfx_common);
	audio_group_load(audiogroup_sfx_NPC);
	audio_group_load(audiogroup_sfx_bullets);
	#endregion



	//Set display
	display_reset(global.settings_aa,global.settings_vsync);
	//display_set_windows_vertex_buffer_method(vertex);



	//Initiate game state vars
	scr_game_state();




}
