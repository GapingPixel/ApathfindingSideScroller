// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_control_reset(player_id){

	//GamePad
	global.config_right[player_id] = gp_padr;
	global.config_left[player_id] = gp_padl;
	global.config_up[player_id] = gp_padu;
	global.config_down[player_id] = gp_padd;
	global.config_jump[player_id] = gp_face1;
	global.config_dash[player_id] = gp_face4;
	global.config_aim[player_id] = gp_shoulderr;
	global.config_shoot[player_id] = gp_face3;
	global.config_switch[player_id] = gp_shoulderl;
	global.config_chem_blast[player_id] = gp_face2;
	global.config_chem_ball[player_id] =  -1;
	global.config_mix_switch[player_id] = -1;
	global.config_vibration[player_id] =  true;

	//Keyboard
	if player_id = 0
	{
		global.config_right_k[player_id] = vk_right;
		global.config_left_k[player_id] = vk_left;
		global.config_up_k[player_id] = vk_up;
		global.config_down_k[player_id] =  vk_down;
		global.config_jump_k[player_id] =  ord("C");
		global.config_dash_k[player_id] =  ord("F");
		global.config_aim_k[player_id] = ord("G");
		global.config_shoot_k[player_id] = ord("V");
		global.config_switch_k[player_id] = ord("D");
		global.config_chem_blast_k[player_id] = ord("B");
		global.config_chem_ball_k[player_id] =  -1;
		global.config_mix_switch_k[player_id] = -1;
	}
	else
	{
		global.config_right_k[player_id] = -1;
		global.config_left_k[player_id] = -1;
		global.config_up_k[player_id] = -1;
		global.config_down_k[player_id] =  -1;
		global.config_jump_k[player_id] =  -1;
		global.config_dash_k[player_id] =  -1;
		global.config_aim_k[player_id] = -1;
		global.config_shoot_k[player_id] = -1;
		global.config_switch_k[player_id] = -1;
		global.config_chem_blast_k[player_id] = -1;
		global.config_chem_ball_k[player_id] =  -1;
		global.config_mix_switch_k[player_id] = -1;	
	}

}