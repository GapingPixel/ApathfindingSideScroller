/// @description Script handles collision with hot or cold materials
function plyr_temp_change() {

	///Temperature Environment
	var env = instance_place(x,y,obj_env);
	var env_s = instance_place(x,y+1,obj_env_solids);
	var env_sL = instance_place(x-3,y,obj_env_solids);//Left Side
	var env_sR = instance_place(x+3,y,obj_env_solids)//Right Side
	var env_sB = instance_place(x,y-3,obj_env_solids);//Below
	var env_p = instance_place(x,y+1,obj_env_platforms);
	var heatResStat = 1;


	var crouch_offest = (var_crouching * 20);//For Particles

	if var_temp != 0
	{
	if var_temp >= 1
	{
	    var_temp -= 1;
    
	    //Visual and audio indications
	    if var_temp = 50
	    {
	        scr_play_sound(snd_common_fire_ignite_1,20,1,1);
	        scr_play_sound(snd_common_fire_sizzle,20,1,1);
	    }
    
	
	
	    if var_temp > 50//Getting Hot
	    {
	        part_particles_create(global.parsys_below,x-5*image_xscale,y+20+crouch_offest,part_var_plyr_burn_smoke,1);
	        part_particles_create(global.parsys,x+random_range(-30,30),y+random_range(-30,30)+crouch_offest,part_var_plyr_burn_flame,3);
	    }
	
	}
	else if var_temp <= -1
	{
		var_temp += 1;
	
		//Visual and audio indications
	    if var_temp = -50
	    {
	        scr_play_sound(snd_common_ice_freeze,20,2,3);
	        scr_play_sound(snd_common_fire_sizzle,20,1,1);
	    }
	
		if var_temp < -50//Getting Cold
	    {
			part_particles_create(global.parsys_below,x+random_range(-30,30),y+random_range(-30,30)+crouch_offest,part_var_plyr_freeze_cloud,1);
	        part_particles_create(global.parsys,x+random_range(-30,30),y+random_range(-30,30)+crouch_offest,part_var_plyr_freeze_flakes,1);
	    }
	}
	}

	switch(plyr_state)///Temperature change only when player state is Enabled
	{
		case playerState.enable:
			if (env != noone)
			{
			    if place_meeting(x,y,env)
			    { 
			    if env.env_dur > 0
					{
						if env.env_heat_value >= 5//Slowly burn player
				        var_temp += 3 * round(env.env_heat_value/5) * heatResStat;
						else if env.env_heat_value <= -5//Slowly cool player
						var_temp -= 3 * abs(round(env.env_heat_value/5)) * heatResStat;
					}
			    }
			}

			if (env_s != noone)
			{
			    if env_s.env_heat_value >= 5//Slowly burn player
			        var_temp += 3 * heatResStat;
				else if env_s.env_heat_value <= -5//Slowly cool player
					var_temp -= 3 * heatResStat;
			}

			if (env_sL != noone)
			{
			    if env_sL.env_heat_value >= 5//Slowly burn player
			        var_temp += 3 * heatResStat;
				else if env_sL.env_heat_value <= -5//Slowly cool player
					var_temp -= 3 * heatResStat;
			}

			if (env_sR != noone)
			{
			    if env_sR.env_heat_value >= 5//Slowly burn player
			        var_temp += 2 * heatResStat;
				else if env_sR.env_heat_value <= -5//Slowly cool player
					var_temp -= 2 * heatResStat;
			}

			if (env_sB != noone)
			{
			    if env_sB.env_heat_value >= 5//Slowly burn player
			        var_temp += 2 * heatResStat;
				else if env_sB.env_heat_value <= -5//Slowly cool player
					var_temp -= 2 * heatResStat;
			}


			if (env_p != noone)
			{
			    if env_p.env_heat_value >= 5//Slowly burn player
			        var_temp += 3 * heatResStat;
				else if env_p.env_heat_value <= -5//Slowly cool player
					var_temp -= 3 * heatResStat;;
			}
		break;
	
		default:
			//empty
		break;
	}



}
