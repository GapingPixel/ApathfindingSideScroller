scr_game_state();
///Particles and audio initiation
scr_player_checker();
audio_stop_all();
part_system_automatic_update(global.parsys,true);
part_system_automatic_update(global.parsys_below,true);
part_system_automatic_update(global.parsys_high,true);
part_system_automatic_update(global.parsys_deep,true);
audio_group_set_gain(audiogroup_default,global.settings_master_vol_music,1);
scr_game_set_sfx_group_gain();
clear_particles();
draw_texture_flush();

/*part_system_depth(parsys,-5000);
part_system_depth(parsys_below,5000);*/

//Results Bool
game_state_controller_var_show_results = false;
game_state_controller_pause_activated = true;

game_state_controller_super_initiator = 0;//Object Parent 

//Pause Call value to pause game
//pause_call = gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(1,gp_start) || keyboard_check_pressed(vk_escape)


alarm[4] = room_speed

