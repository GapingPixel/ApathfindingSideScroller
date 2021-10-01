/// @description //////////Movement
function plyr_movement() {
	//var control = argument0;//based on player; 0 for p1, 1 for p2


#region///Cooldown Variables
	var_inv_cooldown -= 1;

	if var_inv_cooldown < 0
	    var_inv_cooldown = 0;
    
	cool_down_shoot -= 1;

	if cool_down_shoot < 0
	    cool_down_shoot = 0

	cool_down_switch -= 1;

	if cool_down_switch < 0
	    cool_down_switch = 0
    
	cool_down_chem_blast -= 1;

	if cool_down_chem_blast < 0
	    cool_down_chem_blast = 0;
	
#endregion

#region///Apply the correct form of acceleration and friction
	if (onGround) {  
	    tempAccel = groundAccel;
	    tempFric  = groundFric;
	} else {
	    tempAccel = airAccel;
	    tempFric  = airFric;
	}
#endregion

#region///Water manipulation of physics
	if lqd = 0//out of water
	{

		airAccel    = 0.75;
		airFric     = 0.25;
		vxMax       = 8;
		vyMax       = 30;
		jumpHeight  = 25.00;
		gravNorm    = 1.5;
		gravSlide   = 0.25;
		SlipperyTerrain();//Alter friction when on Ice
	}
	else//in water
	{
		airAccel    = 1;
		airFric     = 0.25;
		vxMax       = 4;
		vyMax       = 30;
		jumpHeight  = 25.00;
		gravNorm    = 0.5;
		gravSlide   = 0.1; 
	}
#endregion

#region///Wall Grabbing and Sliding
	//Nullify wall grab when on ground

	if ((!cRight && !cLeft) || onGround) {
	    var_wallgrab = 0;
	}   

	//Grab Wall
	if (((cLeft && facing = -1) ||  (cRight && facing = 1)) && !onGround && var_chemball_hold = 0 && var_hit = 0) {
		alarm[8] = 15;
	    if var_wallslide = 0
	    {
	        var_wallgrab = 1;
			
			//Wall Grab Particles and Sound
			image_index = 0;
			//audio_play_sound(snd_plyr_wallgrab,0,false);
		
	        vx = 0;
	        vy = 0;
	    }
	    else
	    {
	        var_jumping = 0;
	    }
	    cool_down_air_move = 0;//Recover aerial move after we cling to wall
		var_parry = 0;//Cancel parry window
		var_coyote_jump_frame = 0;//Reset coyote timer
    
	    //reset stretch
	    stretch_y = 1;
	    stretch_x = 1;
	}

	if var_jumping = 1
	{
	    //negate wallslide when we jump
	    var_wallslide = 0;  
	}



	// Swap facing during wall slide
	if (cRight && !onGround)
	    facing = -1;
	else if (cLeft && !onGround)
	    facing = 1;
#endregion

#region///Handle Gravity
	if (!onGround and var_wallgrab = 0) {
		//contacting with cLeft or cRight with negative vy and not holding a Chemical Ball initiates slide gravity
	    if ((cLeft || cRight) && vy >= 0 && var_chemball_hold = 0) {
	        // Wall slide
	        vy = Approach(vy, vyMax, gravSlide);
	    } else {
	        // Fall normally
	        vy = Approach(vy, vyMax, gravNorm);
	    }
	}


#endregion

#region///Hit Box Manipulation
	if (var_crouching = 1 || var_rolling = 1)//Crouch or Roll initiates small hit box
	    mask_index = plyr_hitbox_crouch;
	else
	{
	    mask_index = plyr_hitbox;
	}
#endregion

	//Player State
	switch(plyr_state)
	{
	#region //Enabled; input available
		case playerState.enable:
	
		//Movement
		if (var_dashing = 0 and (var_aiming = 0 || !onGround) and var_rolling = 0) 
		{
		
		// Left 
		if (left_inp && !right_inp && var_wallgrab = 0) {
	    facing = -1;
	    // Apply acceleration left
	    if (vx > 0)
	        vx = Approach(vx, 0, tempFric);   
		
		if var_crouching = 0
	    vx = Approach(vx, -vxMax, tempAccel);
	
		// Right
		} else if (right_inp && !left_inp && var_wallgrab = 0) {
	    facing = 1;
	    // Apply acceleration right
	    if (vx < 0)
	        vx = Approach(vx, 0, tempFric);
			
		if var_crouching = 0
	    vx = Approach(vx, vxMax, tempAccel);
		}
	
		}

		//Lock and Aim
		if var_aiming = 1 && onGround
		{
			vx = 0;
		}

		//Lock in Place when throwing or blasting chemicals / getting hit
		if var_chemball_creating = 1 || var_chem_blast = 1 || var_chemball_throw = 1 || var_hit = 1 || var_super = 1
		{
			vx = 0
			vy = 0
			var_aiming = 0;
			var_wallgrab = 0;
			var_wallslide = 0;
		}



		//Reset air move and parry when on ground as well as manage coyote jump
		if onGround
		{
	    cool_down_air_move = 0;
	    var_wallslide = 0;
	    var_wallgrab = 0;
	    var_parry = 0;
		}
		else//Values negated when in the air
		{
		var_rolling = 0;	
		}

		//Dash
		if (var_dashing = 1)
		{
			// Left 
			if (facing = -1 && var_wallgrab = 0) {
		    facing = -1;
		    var_running = 0;
		    vx = -vxMax * dash_speed;
		
			// Right
			} else if (facing = 1 && var_wallgrab = 0) {
		    facing = 1;
		    var_running = 0;
		    vx = vxMax * dash_speed
			}

			//lock gravity
			vy = 0;
		}


		//Roll
		if (var_rolling = 1)
		{
			
			// Left 
			if (facing = -1 && var_wallgrab = 0) {
		    facing = -1;
		    var_running = 0;
		    vx = -vxMax * dash_speed/1.2;
		
			// Right
			} else if (facing = 1 && var_wallgrab = 0) {
		    facing = 1;
		    var_running = 0;
		    vx = vxMax * dash_speed/1.2;
			}
			
		}


		// Friction
		if (!right_inp && !left_inp && var_dashing = 0 && var_rolling = 0) {
			vx = Approach(vx, 0, tempFric);
		} 

		//SlipperyTerrain();
       
		// Wall jump
		if (jump_inp && cLeft && !onGround && var_chemball_hold = 0)
		{
	        vy = -jumpHeight * 1.1;
	        vx =  vxMax;
	        facing = 1;
	        alarm[10] = 1;//negate parry
	        image_xscale = facing;
	        //audio_play_sound(snd_plyr_jump,0,false);
	        //cool_down_air_move = 0;//Recover aerial move after walljump
		}

		if (jump_inp && cRight && !onGround && var_chemball_hold = 0) {
	        vy = -jumpHeight * 1.1;
	        vx = -vxMax;
	        facing = -1
	        alarm[10] = 1;//negate parry
	        image_xscale = facing;
	        //audio_play_sound(snd_plyr_jump,0,false);
	        //cool_down_air_move = 0;//Recover aerial move after walljump
		}
 
		// Jump 
		if (jump_inp)
		{
			if (onGround)
			{
				// Fall thru platform
				if (down_inp && var_crouching = 1) || (down_inp && var_chemball_hold = 1) {
				 if (place_meeting(x, y + 1, parJumpThru) && !place_meeting(x,y+1,parSolid))
	                y++;
					else
					{
					vy = -jumpHeight;//Here to allow jumping while crouching
					}
				} else {
					vy = -jumpHeight;
				
				}
			}
	
		} 
		else if (jumpRelease_inp) //Short Hop 
		{
	     if (vy < 0)
	        vy *= 0.25;
		}
	
		break;
	#endregion
	
	#region //Status
		case playerState.statusFrozen:
	
		vx = 0;

		var_crouching = 0;
	    var_jumping = 0;
	    var_running = 0;
	    var_dashing = 0;
		var_rolling = 0;
	    var_shooting = 0;
	    var_chem_blast = 0;
	    var_wallgrab = 0;
	    var_wallslide = 0;
	    var_aiming = 0;
	    var_parry = 0;
	
		//Mash to break free
		if mash_inp
		{
			var_mash_count++;	
		}
	
		//Break free
		if var_mash_count >= var_mash_freeze_max
		{
			//Full control is back after the end of break out animation
			var_i_frame_count = 60;
		}
	
		break;
	
	
		case playerState.statusShock:
	
		vx = 0;
		//vy = 0;
	
		var_crouching = 0;
	    var_jumping = 0;
	    var_running = 0;
	    var_dashing = 0;
		var_rolling = 0;
	    var_shooting = 0;
	    var_chem_blast = 0;
	    var_wallgrab = 0;
	    var_wallslide = 0;
	    var_aiming = 0;
	    var_parry = 0;
	

		var_mash_count++;
	
		//Mash to break free
		if mash_inp
		{
			var_mash_count *= 1.1;	
		}
	
		//Break free
		if var_mash_count >= var_mash_shock_max
		{
			plyr_state = playerState.enable;
			var_i_frame_count = 60;
			var_mash_count = 0;
		}
		break;
	
	
		case playerState.statusDead:
		var_crouching = 0;
	    var_jumping = 0;
	    var_running = 0;
	    var_dashing = 0;
		var_rolling = 0;
	    var_shooting = 0;
	    var_chem_blast = 0;
	    var_wallgrab = 0;
	    var_wallslide = 0;
	    var_aiming = 0;
	    var_chemball_creating = 0;
	    var_chemball_hold = 0;
	    var_chemball_throw = 0;
	    var_parry = 0;
		break;
	#endregion
	
	#region //Disabled states
		case playerState.disable:
		case playerState.animIntro:
	
		vx = 0;
	
		var_crouching = 0;
	    var_dashing = 0;
	    var_shooting = 0;
	    var_chem_blast = 0;
	    var_wallgrab = 0;
	    var_wallslide = 0;
	    var_aiming = 0;
	    var_chemball_creating = 0;
	    var_chemball_hold = 0;
	    var_chemball_throw = 0;
	    var_parry = 0;
		break;
	#endregion
	
	#region //Auto Run for Clearing Levels
		case playerState.autoRun:
	
		if var_clearrun >= 1
	    {
	        right_inp = 1
	        left_inp = 0
	        facing = 1;
	        // Apply acceleration right
	        if (vx < 0)
	            vx = Approach(vx, 0, tempFric);
             
	        vx = Approach(vx, vxMax, tempAccel);
	    }
    
	    if var_clearrun <= -1
	    {
	        right_inp = 0
	        left_inp = 1;
	        facing = -1;
	        // Apply acceleration left
	        if (vx > 0)
	            vx = Approach(vx, 0, tempFric);   
            
	        vx = Approach(vx, -vxMax, tempAccel);
	    }
	
		break;
	#endregion
	
	}









}
