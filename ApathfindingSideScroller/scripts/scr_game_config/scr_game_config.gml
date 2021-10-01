///Initialize Game Configurations
function scr_game_config() {

	#region///Debug Booleans
	
	global.debugger_disable_HUD = false; //For Debug only
	global.debugger_enable_overlay = false;//For Debug only
	global.debugger_enable_detect_show = false;//For Debug Only, shows detection boxes

	//globalvar debugger_enabled;
	global.debugger_enabled = DEVBUILD;
	if global.debugger_enabled == true
	{
	show_debug_overlay(true);
	global.debugger_enable_overlay = true;
	}
	
	#endregion

#region///Options
	///Master Volume (range from 0 to 1)
	ini_open("game_settings.ini");
	//globalvar master_vol_music;
	//globalvar master_vol_sfx;
	global.settings_master_vol_music = ini_read_real("volume", "vol_music", 0.5);
	global.settings_master_vol_sfx = ini_read_real("volume", "vol_sfx", 0.5);

	//globalvar language;
	global.settings_language = ini_read_real("language", "lang", 0);


	///Display
	//globalvar base_dis_W, base_dis_H, res_setting, res_W, res_H, fullscreen, vertex, vsync, aa, screen_shake;
	global.settings_base_display_W = 1280; //Base display Resolution
	global.settings_base_display_H = 720; //Base display Resolution
	global.settings_res_main = ini_read_real("display","res_setting",0); //For display options
	/*
	-2 = 800x480
	-1 = 1024x768
	0 = 1280x720
	1 = 1366x768
	2 = 1400x1050
	3 = 1600x900
	4 = 1920x1080
	*/
	switch(global.settings_res_main)
	{
	case -2: global.settings_res_W = 800; global.settings_res_H = 400; break;
	case -1: global.settings_res_W = 1024; global.settings_res_H = 768; break;
	case 0: global.settings_res_W = 1280; global.settings_res_H = 720; break;
	case 1: global.settings_res_W = 1366; global.settings_res_H = 768; break;
	case 2: global.settings_res_W = 1400; global.settings_res_H = 1050; break;
	case 3: global.settings_res_W = 1600; global.settings_res_H = 900; break;
	case 4: global.settings_res_W = 1920; global.settings_res_H = 1080; break;
	}
	global.settings_fullscreen =  ini_read_real("display", "fullscreen", 0);

	global.settings_vsync = ini_read_real("display", "vsync", 0);
	//aa = ini_read_real("display", "aa", 0);
	global.settings_aa = 0;

	//Screen Shake Setting
	/*
	1 = default
	0.5 = low
	0 = off
	*/
	global.settings_screen_shake = ini_read_real("display","screenshake",1);
	ini_close();
#endregion

	//Set the Game's Setting to the Options
	scr_game_set_display();
	scr_game_set_resolution();

#region////Controls
	/*
	Format
	config_action[0 for P1, 1 for P2] = gamepad button
	config_action_k[] = keyboard; keyboard values should be set to -1 if not assigned!
	*/
	/*globalvar config_right, config_left,
	config_up, config_down, config_jump,
	config_dash, config_aim, config_shoot, config_switch,
	config_flush, config_shoot, config_chem_blast, config_chem_ball, config_mix_switch;

	globalvar config_right_k, config_left_k,
	config_up_k, config_down_k, config_jump_k,
	config_dash_k, config_aim_k, config_shoot_k, config_switch_k,
	config_flush_k, config_shoot_k, config_chem_blast_k, config_chem_ball_k, config_mix_switch_k;*/

	//Made for debugging
	global.config_flush[0] = -1;
	global.config_flush_k[0] = -1;
	global.config_flush[1] = -1;
	global.config_flush_k[1] = -1;

	//globalvar lsHor, lsVer, lsVerRelease, lsHorRelease; // Variables used for left thumbstick

	//ini_close();
	ini_open("game_controls.ini")
	//Player 1 Game Pad
	global.config_right[0] = ini_read_real("p1_gp", "right", gp_padr);
	global.config_left[0] = ini_read_real("p1_gp", "left", gp_padl);
	global.config_up[0] = ini_read_real("p1_gp", "up", gp_padu);
	global.config_down[0] = ini_read_real("p1_gp", "down", gp_padd);
	global.config_jump[0] = ini_read_real("p1_gp", "jump", gp_face1);
	global.config_dash[0] = ini_read_real("p1_gp", "dash", gp_face4);
	global.config_aim[0] = ini_read_real("p1_gp", "aim", gp_shoulderr);
	global.config_shoot[0] = ini_read_real("p1_gp", "shoot", gp_face3);
	global.config_switch[0] = ini_read_real("p1_gp", "switch", gp_shoulderl);
	global.config_chem_blast[0] = ini_read_real("p1_gp", "chem_blast", gp_face2);
	global.config_chem_ball[0] = ini_read_real("p1_gp", "chem_ball", -1);
	global.config_mix_switch[0] = ini_read_real("p1_gp", "mix_switch", -1);
	global.config_vibration[0] = ini_read_real("p1_gp", "vibration", true);

	//Player 2 Game Pad
	global.config_right[1] = ini_read_real("p2_gp", "right", gp_padr);
	global.config_left[1] = ini_read_real("p2_gp", "left", gp_padl);
	global.config_up[1] = ini_read_real("p2_gp", "up", gp_padu);
	global.config_down[1] = ini_read_real("p2_gp", "down", gp_padd);
	global.config_jump[1] = ini_read_real("p2_gp", "jump", gp_face1);
	global.config_dash[1] = ini_read_real("p2_gp", "dash", gp_face4);
	global.config_aim[1] = ini_read_real("p2_gp", "aim", gp_shoulderr);
	global.config_shoot[1] = ini_read_real("p2_gp", "shoot", gp_face3);
	global.config_switch[1] = ini_read_real("p2_gp", "switch", gp_shoulderl);
	global.config_chem_blast[1] = ini_read_real("p2_gp", "chem_blast", gp_face2);
	global.config_chem_ball[1] = ini_read_real("p2_gp", "chem_ball", -1);
	global.config_mix_switch[1] = ini_read_real("p2_gp", "mix_switch", -1);
	global.config_vibration[1] = ini_read_real("p2_gp", "vibration", true);

	//Player 1 Keyboard
	global.config_right_k[0] = ini_read_real("p1_key", "right", vk_right);
	global.config_left_k[0] = ini_read_real("p1_key", "left", vk_left);
	global.config_up_k[0] = ini_read_real("p1_key", "up", vk_up);
	global.config_down_k[0] = ini_read_real("p1_key", "down", vk_down);
	global.config_jump_k[0] = ini_read_real("p1_key", "jump", ord("C"));
	global.config_dash_k[0] = ini_read_real("p1_key", "dash", ord("F"));
	global.config_aim_k[0] = ini_read_real("p1_key", "aim", ord("G"));
	global.config_shoot_k[0] = ini_read_real("p1_key", "shoot", ord("V"));
	global.config_switch_k[0] = ini_read_real("p1_key", "switch", ord("D"));
	global.config_chem_blast_k[0] = ini_read_real("p1_key", "chem_blast", ord("B"));
	global.config_chem_ball_k[0] = ini_read_real("p1_key", "chem_ball", -1);
	global.config_mix_switch_k[0] = ini_read_real("p1_key", "mix_switch", -1);

	//Player 2 Keyboard
	global.config_right_k[1] = ini_read_real("p2_key", "right", -1);
	global.config_left_k[1] = ini_read_real("p2_key", "left", -1);
	global.config_up_k[1] = ini_read_real("p2_key", "up", -1);
	global.config_down_k[1] = ini_read_real("p2_key", "down", -1);
	global.config_jump_k[1] = ini_read_real("p2_key", "jump", -1);
	global.config_dash_k[1] = ini_read_real("p2_key", "dash", -1);
	global.config_aim_k[1] = ini_read_real("p2_key", "aim", -1);
	global.config_shoot_k[1] = ini_read_real("p2_key", "shoot", -1);
	global.config_switch_k[1] = ini_read_real("p2_key", "switch", -1);
	global.config_chem_blast_k[1] = ini_read_real("p2_key", "chem_blast", -1);
	global.config_chem_ball_k[1] = ini_read_real("p2_key", "chem_ball", -1);
	global.config_mix_switch_k[1] = ini_read_real("p2_key", "mix_switch", -1);
	ini_close();

#endregion


}
