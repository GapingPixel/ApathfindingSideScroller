/// @description Script checks if players are dead
function scr_death_check() {

	if global.player_count = 0
	{
	    //generate death prompt, stop music, pan out HUD
	    if !instance_exists(obj_prompt_dead)
	    {
	    instance_create_layer(global.cam_x + global.cam_width/2,global.cam_y + global.cam_height/2,"Menu",obj_prompt_dead);
	    audio_group_stop_all(audiogroup_default);
		with(parHUD)
			HUD_pan_in = false;
	    }
	}



}
