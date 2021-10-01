/// @description Freeze
///@param Player_P1=0_P2=1
function plyr_freeze(argument0) {
	/*
	applies only to players
	arg0 = player variables called (global)
	*/
	var plyr = argument0;

	if (var_inv = 0 && var_dead = 0 && var_hit = 0
	&& var_inv_cooldown = 0 && var_i_frame_count <= 0 && plyr_state = playerState.enable 
	&& global.game_state != GameState.clear)
	{
		scr_play_sound(snd_common_ice_cloud,0,0.9,1);
		scr_play_sound(snd_common_ice_freeze,0,0.9,1);
		part_particles_create(global.parsys,x,y,part_var_plyr_frozen_clouds,60);
	    image_index = 0;
    
	
	    //Rumble
	    if gamepad_is_connected(plyr) && !global.game_state = GameState.paused
	    {
	        gamepad_set_vibration(plyr,0.1,0.1);
	    }
	    else
	        gamepad_set_vibration(plyr,0,0);
    
    
	    //Destroys bullet source upon taking damage and HUD Effects
	    if plyr = 0
	    {
	        if instance_exists(shoot_source_p1)
	            instance_destroy(shoot_source_p1);
        
	        if instance_exists(chem_source_p1)
	            instance_destroy(chem_source_p1);
            
	    }
	    else
	    {
	        if instance_exists(shoot_source_p2)
	            instance_destroy(shoot_source_p2);
        
	        if instance_exists(chem_source_p2)
	            instance_destroy(chem_source_p2);
            
	    }
	
	
	    //Interupt actions
	    var_chemball_creating = 0;
	    var_chemball_throw = 0;
	    var_chem_blast = 0;
	    var_aiming = 0;
		var_aim_buffer = 0;
    
	
		plyr_state = playerState.statusFrozen;
	}



}
