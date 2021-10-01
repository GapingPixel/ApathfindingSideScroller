/// @description Damage Script
///@param Player_P1=0_P2=1
///@param Damage
function plyr_damage(argument0, argument1) {
	/*
	applies only to players
	arg0 = player variables called (global)
	arg1 = HP lost (from variables of object)
	*/
	var plyr = argument0;
	var hpLost = argument1;
	var totalDMG = 0;

	if hpLost > 0 && var_inv = 0 && var_dead = 0 && var_hit = 0
	&& var_inv_cooldown = 0 && var_i_frame_count <= 0 && global.game_state != GameState.clear
	{
	    audio_sound_pitch(snd_plyr_damage,choose(0.8,1,1.2));
	    audio_play_sound(snd_plyr_damage,0,false);
		var flair = choose(0,0,0,snd_plyr_damage_flair_1,snd_plyr_damage_flair_2);
		if flair != 0
		audio_play_sound(flair,0,0);
	
		part_particles_create(global.parsys_below,x,y,part_var_plyr_deadsmoke,5);
		part_particles_create(global.parsys_below,x,y,part_var_plyr_dmgstars,15);
	    part_particles_create(global.parsys_below,x,y,part_var_plyr_dmgburst,15);
	    image_index = 0;
    
	    //Rumble
	    if gamepad_is_connected(plyr) && !global.game_state = GameState.paused
	    {
	        gamepad_set_vibration(plyr,0.5,0.5);
	    }
	    else
	        gamepad_set_vibration(plyr,0,0);
    
	    //For scoring
	    global.scoring_hits += 1;

	    //Destroys bullet source upon taking damage and HUD Effects
	    if plyr = 0
	    {
	        if instance_exists(shoot_source_p1)
	            instance_destroy(shoot_source_p1);
        
	        if instance_exists(chem_source_p1)
	            instance_destroy(chem_source_p1);
            
	        if instance_exists(obj_hud_p1)
	                with(obj_hud_p1)  
	                {
	                    HUD_hp_bar_pulse_y = 1.5;
	                    HUD_hurt_prompt = irandom_range(0,7);
						HUD_caution_shake = 1;
						alarm[1] = 60;
	                }
	    }
	    else
	    {
	        if instance_exists(shoot_source_p2)
	            instance_destroy(shoot_source_p2);
        
	        if instance_exists(chem_source_p2)
	            instance_destroy(chem_source_p2);
            
	        if instance_exists(obj_hud_p2)
	                with(obj_hud_p2)  
	                {
	                    HUD_hp_bar_pulse_y = 1.5;
	                    HUD_hurt_prompt = irandom_range(0,7);
						HUD_caution_shake = 1;
						alarm[1] = 60;
	                }
	    }
	
		///Damage affected by status
		switch(plyr_state)
		{
			default:
				totalDMG = hpLost * 1; 
			break;
		
			case playerState.statusFrozen:
				totalDMG = floor(hpLost * 1.5); 
				plyr_state = playerState.enable;
			break;
		
			case playerState.statusShock:
				totalDMG = floor(hpLost * 1.25); 
				plyr_state = playerState.enable;
			break;
		}
	
    
		global.hp[plyr] -= totalDMG;

    
	    if round((global.hp[plyr]/global.hp_max[plyr])*100) <= 25 && (global.hp[plyr] > 0)//Low HP alert
	        audio_play_sound(snd_plyr_low_hp,0,0);
    
    
	    //Interupt actions
	    var_chemball_creating = 0;
	    var_chemball_throw = 0;
	    var_chem_blast = 0;
	    var_aiming = 0;
		var_aim_buffer = 0
		var_mash_count = 0;
	    var_hit = 1; //initiate player hitstun
	    var_inv = 1;//initiate player invincibility
    
	    alarm[2] = room_speed*2; //invincibility time
            
	    //handles death
	    if global.hp[plyr] <= 0
	    {
	        if plyr = 0
	            instance_create_depth(x,y,depth-300,p1_death_head);
	        else
	            instance_create_depth(x,y,depth-300,p2_death_head); //shoots player character head
	    //var_dead = 1;
	    instance_destroy();
	    }
	}



}
