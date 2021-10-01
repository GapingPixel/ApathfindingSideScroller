/// @description Load Game Controls
function scr_game_save_controls() {
	ini_open("game_controls.ini")
	//Player 1 Gamepad
	ini_write_real("p1_gp", "right", global.config_right[0]);
	ini_write_real("p1_gp", "left", global.config_left[0]);
	ini_write_real("p1_gp", "up", global.config_up[0]);
	ini_write_real("p1_gp", "down", global.config_down[0]);
	ini_write_real("p1_gp", "jump", global.config_jump[0]);
	ini_write_real("p1_gp", "dash", global.config_dash[0]);
	ini_write_real("p1_gp", "aim", global.config_aim[0]);
	ini_write_real("p1_gp", "shoot", global.config_shoot[0]);
	ini_write_real("p1_gp", "switch", global.config_switch[0]);
	ini_write_real("p1_gp", "chem_blast", global.config_chem_blast[0]);
	ini_write_real("p1_gp", "chem_ball", global.config_chem_ball[0]);
	ini_write_real("p1_gp", "mix_switch", global.config_mix_switch[0]);
	ini_write_real("p1_gp", "vibration", global.config_vibration[0]);

	//Player 1 Keyboard
	ini_write_real("p1_key", "right", global.config_right_k[0]);
	ini_write_real("p1_key", "left", global.config_left_k[0]);
	ini_write_real("p1_key", "up", global.config_up_k[0]);
	ini_write_real("p1_key", "down", global.config_down_k[0]);
	ini_write_real("p1_key", "jump", global.config_jump_k[0]);
	ini_write_real("p1_key", "dash", global.config_dash_k[0]);
	ini_write_real("p1_key", "aim", global.config_aim_k[0]);
	ini_write_real("p1_key", "shoot", global.config_shoot_k[0]);
	ini_write_real("p1_key", "switch", global.config_switch_k[0]);
	ini_write_real("p1_key", "chem_blast", global.config_chem_blast_k[0]);
	ini_write_real("p1_key", "chem_ball", global.config_chem_ball_k[0]);
	ini_write_real("p1_key", "mix_switch", global.config_mix_switch_k[0]);

	//Player 2 Gamepad
	ini_write_real("p2_gp", "right", global.config_right[1]);
	ini_write_real("p2_gp", "left", global.config_left[1]);
	ini_write_real("p2_gp", "up", global.config_up[1]);
	ini_write_real("p2_gp", "down", global.config_down[1]);
	ini_write_real("p2_gp", "jump", global.config_jump[1]);
	ini_write_real("p2_gp", "dash", global.config_dash[1]);
	ini_write_real("p2_gp", "aim", global.config_aim[1]);
	ini_write_real("p2_gp", "shoot", global.config_shoot[1]);
	ini_write_real("p2_gp", "switch", global.config_switch[1]);
	ini_write_real("p2_gp", "chem_blast", global.config_chem_blast[1]);
	ini_write_real("p2_gp", "chem_ball", global.config_chem_ball[1]);
	ini_write_real("p2_gp", "mix_switch", global.config_mix_switch[1]);
	ini_write_real("p2_gp", "vibration", global.config_vibration[1]);

	//Player 2 Keyboard
	ini_write_real("p2_key", "right", global.config_right_k[1]);
	ini_write_real("p2_key", "left", global.config_left_k[1]);
	ini_write_real("p2_key", "up", global.config_up_k[1]);
	ini_write_real("p2_key", "down", global.config_down_k[1]);
	ini_write_real("p2_key", "jump", global.config_jump_k[1]);
	ini_write_real("p2_key", "dash", global.config_dash_k[1]);
	ini_write_real("p2_key", "aim", global.config_aim_k[1]);
	ini_write_real("p2_key", "shoot", global.config_shoot_k[1]);
	ini_write_real("p2_key", "switch", global.config_switch_k[1]);
	ini_write_real("p2_key", "chem_blast", global.config_chem_blast_k[1]);
	ini_write_real("p2_key", "chem_ball", global.config_chem_ball_k[1]);
	ini_write_real("p2_key", "mix_switch", global.config_mix_switch_k[1]);
	ini_close();


}
