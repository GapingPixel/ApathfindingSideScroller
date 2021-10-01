/// @description Movement
var anim = skeleton_animation_get();
var plyr = parPlyr;
var aim_box = collision_rectangle(x,
y-enemy_var_target_range,
x+enemy_var_target_range*facing,
y+enemy_var_target_range,
plyr,false,true)

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	image_xscale = facing;
	Gravity();
	
	#region//Animation & Particles
	if enemy_behavior != enemy_KO
		if !onGround
		{
		    if anim != "3_fall"
		        scr_skeleton_animation_setAnim("3_fall");
		    image_speed = 0.5;
		}
		else
		{

		        if anim = "3_fall"
				{
		            
					scr_skeleton_animation_setAnim("4_land");
				}
        
		        image_speed = 0.6;
        
		        //Foot Steps
		        if anim = "1_run"
		        {
		        if ((image_index < 3 && image_index > 2))//first foot
		            {
		            scr_play_sound(snd_enemy_robot_footstep_1,0,1,1.01);}
		        if ((image_index < 15 && image_index > 14))//second foot
		            {
		            scr_play_sound(snd_enemy_robot_footstep_1,0,1.09,1.1);}
		        }
		}
		#endregion
	
	#region//AI
	switch(enemy_behavior)
	{
		case enemy_RUN:
		//Movement
		if anim != "2_turn" and anim != "4_land"
		vx = vxMax*facing;
		else
		vx = 0
		
		//Turning
		var detect_edge = !position_meeting(x+(sprite_get_width(sprite_index)/2)*1, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*-1, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/3)+8, parJumpThru)
		
		if (place_meeting(x+facing,y,solid_block))
		{
		       if onGround
		        {
		            if anim != "2_turn"
					{
		                scr_skeleton_animation_setAnim("2_turn")
					}
		        }
				facing *= -1;
		}
			
		
		#region//Turn on edge or go to Aim mode
		if instance_exists(plyr)
		{
			if detect_edge and onGround
			{
				if aim_box//Switch to Aim Mode at edge of platform
				{
						if anim != "2_turn"
						{
				           scr_skeleton_animation_setAnim("2_turn")
						   facing *= -1;
						}
				}
			}
			else
			{
				if aim_box//Aim Mode
				{
					if alarm_get(3) < 0
						alarm[3] = 1;
				}	
			}
		}
		else//No player found
		{

				 if anim != "0_idle"
					{
			           scr_skeleton_animation_setAnim("0_idle")
					}
				enemy_behavior = enemy_IDLE;
		}
		#endregion	
		break;
		
		
		case enemy_IDLE:		
			vx = 0;

			//Switch to Aim Mode at edge of platform
			if instance_exists(plyr)
			{
				//Switch to Aim Mode at edge of platform
				if aim_box
				{
					if alarm_get(3) < 0
						alarm[3] = 1;
				}
			
			
				//Turn on position
				if distance_to_object(plyr) < (enemy_var_target_range) and onGround
				{
				
					if (plyr.x < x and facing = 1) || (plyr.x > x  and facing = -1)
					{
						if anim != "2_turn"
						{
				           scr_skeleton_animation_setAnim("2_turn")
						}
						facing *= -1	
					}
					
				}
			
			}
		break;
		
		///Aim and Fire
		case enemy_AIM:
			vx = 0;
			
			//Turn on position
				if distance_to_object(plyr) < (enemy_var_target_range) and onGround
				{
					if (plyr.x < x and facing = 1) || (plyr.x > x  and facing = -1)
					{
						facing *=-1	
					}
				}
			
			if !onGround
				enemy_behavior = enemy_IDLE;
		break;
		
		case enemy_KO:
		if alarm_get(1) < 0
		{
			vy -= vyMax * random_range(0.9,1.1);
			vx = vxMax * facing * -1;
			if anim != "98_stun"
			{
				scr_skeleton_animation_setAnim("98_stun");
			}
			alarm[1] = choose(10,20,30);
		}
		break;
	}
	#endregion
	break;
	
	case enemyState.FROZEN:
		scr_enemy_freeze_check();
		vx = 0;
		vy = 0;
	break;
	
	case enemyState.SHOCKED:
		particle_scr_enemy_statusCreate_shock_bang(1);
		if anim != "98_stun"
		{
			image_speed = 1.5;
			scr_skeleton_animation_setAnim("98_stun");
		}
		vx = 0;
	break;
	
	case enemyState.HITSTUN:
		vx = 0
		vy = 0;
		image_speed = 0;
	break;
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{

switch(anim)
{
	case "4_land":
	case "2_turn":
    switch(enemy_behavior)
	{
	case enemy_RUN:
	scr_skeleton_animation_setAnim("1_run");
	break;
	case enemy_IDLE:
	case enemy_AIM:
	scr_skeleton_animation_setAnim("0_idle");
	break;
	}
	break;
	
	case "0_idle_aim_fwrd_fire":
		scr_skeleton_animation_setAnim("0_idle_aim_fwrd");
	break;
	
	case "0_idle_aim_diagup_fire":
		scr_skeleton_animation_setAnim("0_idle_aim_diagup");
	break;
	
	case "0_idle_aim_diagdown_fire":
		scr_skeleton_animation_setAnim("0_idle_aim_diagdown");
	break;
	
	case "0_idle_aim_down_fire":
		scr_skeleton_animation_setAnim("0_idle_aim_down");
	break;
	
	case "0_idle_aim_up_fire":
		scr_skeleton_animation_setAnim("0_idle_aim_up");
	break;
	
	
}

}
#endregion


//Death
if enemy_hp <= 0
{
	enemy_state = enemyState.NORMAL;
	enemy_behavior = enemy_KO;
}