/// @description Insert description here
// You can write your code in this editor

	
if keyboard_check_pressed(vk_escape)//Immediately Destroy if we press escape key
{
	instance_destroy();
}
else
{
	if variable_instance_exists(id,"rebind_type")
	{
		if rebind_type = 2 && keyboard_check_pressed(vk_anykey) //Keyboard Binding 
		{
			keyboard_string = string_upper(keyboard_string);
			switch(rebind_action)
			{
				case 3: global.config_left_k[rebind_playerID] = keyboard_lastkey; break;
				case 4: global.config_right_k[rebind_playerID] = keyboard_lastkey; break;
				case 5: global.config_up_k[rebind_playerID] = keyboard_lastkey; break;
				case 6: global.config_down_k[rebind_playerID] = keyboard_lastkey; break;
				case 7: global.config_jump_k[rebind_playerID] = keyboard_lastkey; break;
				case 8: global.config_shoot_k[rebind_playerID] = keyboard_lastkey; break;
				case 9: global.config_chem_blast_k[rebind_playerID] = keyboard_lastkey; break;
				case 10: global.config_dash_k[rebind_playerID] = keyboard_lastkey; break;
				case 11: global.config_switch_k[rebind_playerID] = keyboard_lastkey; break;
				case 12: global.config_aim_k[rebind_playerID] = keyboard_lastkey; break;
				case 13: global.config_chem_ball_k[rebind_playerID] = keyboard_lastkey; break;
				case 14: global.config_mix_switch_k[rebind_playerID] = keyboard_lastkey; break;
			}
			var _cn = ord(string(keyboard_string));
			#region Set duplicate input as -1
			if (global.config_left_k[rebind_playerID] = _cn and rebind_action != 3) global.config_left_k[rebind_playerID] = -1;
			if (global.config_right_k[rebind_playerID] = _cn and rebind_action != 4) global.config_right_k[rebind_playerID] = -1;
			if (global.config_up_k[rebind_playerID] = _cn and rebind_action != 5) global.config_up_k[rebind_playerID] = -1;
			if (global.config_down_k[rebind_playerID] = _cn and rebind_action != 6) global.config_down_k[rebind_playerID] = -1;
			if (global.config_jump_k[rebind_playerID] = _cn and rebind_action != 7) global.config_jump_k[rebind_playerID] = -1;
			if (global.config_shoot_k[rebind_playerID] = _cn and rebind_action != 8) global.config_shoot_k[rebind_playerID] = -1;
			if (global.config_chem_blast_k[rebind_playerID] = _cn and rebind_action != 9) global.config_chem_blast_k[rebind_playerID] = -1;
			if (global.config_dash_k[rebind_playerID] = _cn and rebind_action != 10) global.config_dash_k[rebind_playerID] = -1;
			if (global.config_switch_k[rebind_playerID] = _cn and rebind_action != 11) global.config_switch_k[rebind_playerID] = -1;
			if (global.config_aim_k[rebind_playerID] = _cn and rebind_action != 12) global.config_aim_k[rebind_playerID] = -1;
			if (global.config_chem_ball_k[rebind_playerID] = _cn and rebind_action != 13) global.config_chem_ball_k[rebind_playerID] = -1;
			if (global.config_mix_switch_k[rebind_playerID] = _cn and rebind_action != 14) global.config_mix_switch_k[rebind_playerID] = -1;
			#endregion
			keyboard_string = "";
			instance_destroy();
		}
		else if rebind_type < 2 && scr_gp_any_button()//Game Pad Binding
		{
			switch(rebind_action)
			{
				case 3: global.config_left[rebind_playerID] = scr_control_rebind(); break;
				case 4: global.config_right[rebind_playerID] = scr_control_rebind();break;
				case 5: global.config_up[rebind_playerID] = scr_control_rebind(); break;
				case 6: global.config_down[rebind_playerID] = scr_control_rebind(); break;
				case 7: global.config_jump[rebind_playerID] = scr_control_rebind(); break;
				case 8: global.config_shoot[rebind_playerID] = scr_control_rebind(); break;
				case 9: global.config_chem_blast[rebind_playerID] = scr_control_rebind(); break;
				case 10: global.config_dash[rebind_playerID] = scr_control_rebind(); break;
				case 11: global.config_switch[rebind_playerID] = scr_control_rebind(); break;
				case 12: global.config_aim[rebind_playerID] = scr_control_rebind(); break;
				case 13: global.config_chem_ball[rebind_playerID] = scr_control_rebind(); break;
				case 14: global.config_mix_switch[rebind_playerID] = scr_control_rebind();
			}
			var _cn = scr_control_rebind();
			#region Set duplicate input as -1
			if (global.config_left[rebind_playerID] = _cn and rebind_action != 3) global.config_left[rebind_playerID] = -1;
			if (global.config_right[rebind_playerID] = _cn and rebind_action != 4) global.config_right[rebind_playerID] = -1;
			if (global.config_up[rebind_playerID] = _cn and rebind_action != 5) global.config_up[rebind_playerID] = -1;
			if (global.config_down[rebind_playerID] = _cn and rebind_action != 6) global.config_down[rebind_playerID] = -1;
			if (global.config_jump[rebind_playerID] = _cn and rebind_action != 7) global.config_jump[rebind_playerID] = -1;
			if (global.config_shoot[rebind_playerID] = _cn and rebind_action != 8) global.config_shoot[rebind_playerID] = -1;
			if (global.config_chem_blast[rebind_playerID] = _cn and rebind_action != 9) global.config_chem_blast[rebind_playerID] = -1;
			if (global.config_dash[rebind_playerID] = _cn and rebind_action != 10) global.config_dash[rebind_playerID] = -1;
			if (global.config_switch[rebind_playerID] = _cn and rebind_action != 11) global.config_switch[rebind_playerID] = -1;
			if (global.config_aim[rebind_playerID] = _cn and rebind_action != 12) global.config_aim[rebind_playerID] = -1;
			if (global.config_chem_ball[rebind_playerID] = _cn and rebind_action != 13) global.config_chem_ball[rebind_playerID] = -1;
			if (global.config_mix_switch[rebind_playerID] = _cn and rebind_action != 14) global.config_mix_switch[rebind_playerID] = -1;
			#endregion
			keyboard_string = "";
			instance_destroy();
		}
	}
}
