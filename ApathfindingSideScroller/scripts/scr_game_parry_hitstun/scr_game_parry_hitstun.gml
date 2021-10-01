// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_parry_hitstun(){
	
	if instance_exists(obj_game_state_controller)
		with(obj_game_state_controller)
			alarm[6] = 1;
}