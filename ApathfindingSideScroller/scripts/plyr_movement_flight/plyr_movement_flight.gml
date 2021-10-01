/// @description //////////Movement
function plyr_movement_flight() {
	//var control = argument0;//based on player; 0 for p1, 1 for p2


#region///Cooldown Variables
	var_inv_cooldown -= 1;

	if var_inv_cooldown < 0
	    var_inv_cooldown = 0;
    
	cool_down_shoot -= 1;

	if cool_down_shoot < 0
	    cool_down_shoot = 0;

	cool_down_switch -= 1;

	if cool_down_switch < 0
	    cool_down_switch = 0;
    
	cool_down_chem_blast -= 1;

	if cool_down_chem_blast < 0
	    cool_down_chem_blast = 0;
#endregion




	switch(plyr_state)
	{
	
	#region//Enabled; input available
		case playerState.enable:
		//Movement
	
	#region///No Flight Zone
		var left_bound = global.cam_x + 16;
		var right_bound = global.cam_x + global.cam_width - 64;
		var top_bound = global.cam_y + 128;
		var bottom_bound = global.cam_y + global.cam_height - 64;
	
		if x < left_bound//Left
			x = left_bound;
		if x > right_bound//Right
			x = right_bound;
	
		if y < top_bound//Top
			y = top_bound;
		if y > bottom_bound//Bottom
			y = bottom_bound;
	#endregion
	
	#region///Damage on collision
			if place_meeting(x,y,parSolid)
			{
				plyr_damage(char_id,2)
			}
	#endregion
	
		// Left 
		if (left_inp && !right_inp) {
		    // Apply acceleration left
			if (vx > 0)
		        vx = Approach(vx, 0, airFric); 
			vx = Approach(vx, -vxMax, airAccel);
			//x -= vxMax
		// Right
		} 
		if (right_inp && !left_inp) {
		    // Apply acceleration right
			if (vx < 0)
		        vx = Approach(vx, 0, airFric);
			vx = Approach(vx, vxMax, airAccel);
			//x += vxMax
		}

		// Up
		if (up_inp && !down_inp) {
		    // Apply acceleration left

		    if (vy > 0)
		        vy = Approach(vy, 0, airFric); 
			vy = Approach(vy, -vyMax, airAccel);
			//y -= vyMax;
		// Down
		}
		if (down_inp && !up_inp) {
		    // Apply acceleration right
			if (vy < 0)
		        vy = Approach(vy, 0, airFric);
			vy = Approach(vy, vyMax, airAccel);
			//y += vyMax
		}
	
	
		//Lock in Place and disable aiming
		if var_chemball_creating = 1 
		|| var_chemball_throw = 1 
		|| var_hit = 1 
		|| (var_aiming = 1 && var_dashing = 0)//aiming but no boost input
		|| var_super = 1
		{
		    vx = 0;
		    vy = 0;
		}


		//Amplify Max velocity values depending on actions
		if (var_dashing = 1)//Boosting, reduce dash_speed constant for better control
		{
			vxMax = (dash_speed * 15);
			vyMax = (dash_speed * 15);
		}
		else if var_chem_blast = 1//Chemical Blasting
		{
			vxMax = 4.5;
			vyMax = 4.5;
		}
		else//Default
		{
			vxMax = 10;
			vyMax = 10;
		}

		// Friction
		if (!right_inp && !left_inp) {
		    vx = Approach(vx, 0, airFric);
		} 
		if (!up_inp && !down_inp) {
		    vy = Approach(vy, 0, airFric);
		} 
	
		break;
	#endregion
	
	#region//Status
		case playerState.statusFrozen:
			vx = 0;
			vy = 0;
		
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
			vy = 0;
		
			var_crouching = 0;
		    var_jumping = 0;
		    var_running = 0;
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
				var_mash_count = 0;
				var_i_frame_count = 60;
			}
		break;
	
		case playerState.statusDead:
			var_crouching = 0;
		    var_jumping = 0;
		    var_running = 0;
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
	
	#region//Disabled states
		case playerState.disable:
		case playerState.animIntro:
			vx = 0;
			vy = 0;
		
			//sets variables to zero when damaged
		    right_inp = 0
		    rightPress_inp = 0
		    rightRelease_inp = 0
		    left_inp = 0
		    leftPress_inp = 0
		    leftRelease_inp = 0
		    up_inp = 0
		    upPress_inp = 0
		    upRelease_inp = 0
		    down_inp = 0
		    downPress_inp = 0
		    downRelease_inp = 0
		    jump_inp = 0
		    jumpHeld_inp = 0
		    shoot_inp = 0
		    shootHeld_inp = 0
		    shootRelease_inp = 0
		    aim_inp = 0
		    chemblast_inp = 0
		    chemblastHeld_inp = 0
		    chemblastRelease_inp = 0
		    switch_element_inp = 0
		    chemball_inp = 0
		    chemballReturn_inp = 0
			mash_inp = 0
		break;
	#endregion
		
	#region//Auto Run for Clearing Levels
		case playerState.autoRun:
			x += (vxMax/2);
		break;
	#endregion
	
	}


}
