/// @description Shock Script
///@param Player_P1=0_P2=1
///@param Damage
function plyr_shock(argument0, argument1) {
	/*
	applies only to players
	arg0 = player variables called (global)
	arg1 = HP lost (from variables of object)
	*/
	var plyr = argument0;
	var hpLost = argument1;

	if (var_inv = 0 && var_dead = 0 && var_hit = 0
	&& var_inv_cooldown = 0  && var_i_frame_count <= 0 && plyr_state = playerState.enable 
	&& global.game_state != GameState.clear)
	{
		scr_play_sound(snd_common_electric_bang_2,5,0.9,1.1);
		scr_play_sound(snd_common_electric_explosion_1,0,1,1.1);
		audio_sound_pitch(snd_plyr_damage,choose(0.8,1,1.2));
	    audio_play_sound(snd_plyr_damage,0,false);
		
	    image_index = 0;
	    part_particles_create(global.parsys_below,x,y,part_var_plyr_deadsmoke,5);
		part_particles_create(global.parsys_below,x,y,part_var_plyr_dmgstars,15);
	    part_particles_create(global.parsys_below,x,y,part_var_plyr_dmgburst,15);
		part_particles_create(global.parsys_below,x,y,part_var_plyr_shock_bang,120);
	    //Rumble
	    if gamepad_is_connected(plyr) && global.game_state != GameState.paused
	    {
	        gamepad_set_vibration(plyr,0.55,0.55);
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
	                    HUD_hurt_prompt = irandom_range(0,3);
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
	                    HUD_hurt_prompt = irandom_range(0,3);
	                }
	    }
	
    
    
	    global.hp[plyr] -= hpLost;
    
	    if round((global.hp[plyr]/global.hp_max[plyr])*100) <= 25 && (global.hp[plyr] > 0)//Low HP alert
	        audio_play_sound(snd_plyr_low_hp,0,0);
    
    
	    //Interupt actions
	    var_chemball_creating = 0;
	    var_chemball_throw = 0;
	    var_chem_blast = 0;
	    var_aiming = 0;
		var_aim_buffer = 0
	    var_hit = 1; //initiate player hitstun
	    var_inv = 1;//initiate player invincibility
    
	    alarm[2] = room_speed; //invincibility time
            
	    //handles death
	    if global.hp[plyr] <= 0
	    {
	        if plyr = 0
	            instance_create_depth(x,y,-10000,p1_death_head);
	        else
	            instance_create_depth(x,y,-10000,p2_death_head); //shoots player character head
	    //var_dead = 1;
	    instance_destroy();
	    }
	
		plyr_state = playerState.statusShock;
	}



}
