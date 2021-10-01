function liquid_contact() {
	//liquid collision and splash effects

	/*
	need values from objEntity
	lqd     = 0; //liquid
	prvlqd  = 0; //prevLiquid
	slqd    = 0; //ShallowLiquid
	sprvlqd = 0; //prevShallowLiquid
	splashdelay = 4;
	*/
	    var obj  = liquid_nearest_bbox(parEnv_water_body);
	    //collide with liquid
	    lqd  = place_meeting(x, y, parEnv_water_body) && !place_meeting(x, y, parEnv_water_shallow);// && !collision_rectangle(bbox_left, y, bbox_right, y + 64, oFloater, true, true) && !place_meeting(x, y, oShallowWaterMask);
	    slqd = place_meeting(x, y, parEnv_water_shallow); 
    
    #region// Jump in liquid
	    if (!slqd) {
	    if (lqd != prvlqd) {
	            //realise current liquid state
				prvlqd = lqd;
	            //apply manipulation to liquid
	            liquid_apply_force_x(obj, x, vy * 1.2);
			
			
				//Splash Effects particles
				if vy != 0
					with(obj)
					{
						part_particles_create(global.parsys,other.x,y,part_var_env_water_splash,1);
						part_particles_create(global.parsys,other.x,y,part_var_env_water_splash_sparkle,15);
					
						repeat(15)
						{
						var ent_width = random_range(-(other.sprite_width/4),other.sprite_width/4);
						part_particles_create(global.parsys,other.x + ent_width,y,part_var_env_water_splash_blobs,1);
						}
						audio_sound_pitch(snd_common_liquid_splash,random_range(0.85,1.15));
						audio_play_sound(snd_common_liquid_splash,0,0);
					}
			
	            //liquid_splash_create(obj, x, liquid_point_y(obj, x), -abs(vy * 0.25), 16, 4, 4, 0.25, c_white, 0.5, bm_normal);
            
	            //speed up on liquid exit/slowdown on entrace
	            /*if (!lqd) 
				{ vy *= 2.5; }
				else 
				{ vy *= 0.25; }*/
            
	        }
	    }
	#endregion

    #region// Jump in shallow water
	    if (slqd != sprvlqd)
	    {
	        //realise current liquid state
	        sprvlqd = slqd;
	    }
	#endregion

	#region// Walk in shallow water
	    if (slqd) {
	        if (vx != 0) {
	            liquid_apply_force_x(obj, x, vx * 0.2);
	            if (--splashdelay <= 0) {
	                splashdelay = 6;
	                //liquid_splash_create(obj, x, liquid_point_y(obj, x), -abs(h * 0.1), 4, 4, 4, 0.25, c_white, 0.5, bm_normal); 
	            }       
	        }
        
	        if (vy != 0) {
	            liquid_apply_force_x(obj, x, vy * 0.25);
	            //liquid_splash_create(obj, x, liquid_point_y(obj, x), -abs(v * 0.2), 4, 4, 4, 0.25, c_white, 0.5, bm_normal);        
	        }    
	    }
	#endregion


}
