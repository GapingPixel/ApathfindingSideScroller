/// @description Movement
var anim = skeleton_animation_get();
var plyr = parPlyr;
//Eye Sight to turn
var eye_sight = collision_line(x-enemy_var_soldier_grenade_target_range,
y,
x+enemy_var_soldier_grenade_target_range,
y,
plyr,false,true);

//AI
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
	
	switch(enemy_behavior)
	{
		case enemy_RUN:
		//Movement
		if anim != "2_turn" and anim != "4_land"
		vx = vxMax*facing;
		else
		vx = 0
		
		//Turning
		var detect_edge = !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+8, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+6, parJumpThru)
		
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
		
		//Handle shot cool down
		if enemy_var_soldier_grenade_cooldown > 0
			enemy_var_soldier_grenade_cooldown--
			
		if detect_edge
		{
			if alarm_get(3) < 0
			alarm[3] = 1
		}
		
		if !instance_exists(plyr)
		{
			if anim != "0_idle"
					{
			           scr_skeleton_animation_setAnim("0_idle")
					}
				enemy_behavior = enemy_IDLE;
		}
	
		break;
		
		case enemy_IDLE:		
			vx = 0;
			
			//Throw Grenade
			if alarm_get(2) < 0 and distance_to_object(plyr) < enemy_var_soldier_grenade_target_range
				alarm[2] = choose(90,120);
			
			//Turning and Throwing Grenades
			if instance_exists(plyr)
			{
				//Turn on position
				if eye_sight and onGround
				{
					if plyr.x < x and facing = 1
					{
						if anim != "2_turn"
						{
				           scr_skeleton_animation_setAnim("2_turn")
						}
						facing *= -1	
					}
					if plyr.x > x  and facing = -1
					{
						if anim != "2_turn"
						{
				           scr_skeleton_animation_setAnim("2_turn")
						}
						facing *=-1	
					}
				}
			}		
		break;
		
		case enemy_ATTACK_1:
		vx = 0;
		
		
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
			image_speed = 1.5
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



#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

switch(anim)
{
	case "4_land":
	case "5_halt":
	case "2_turn":
    switch(enemy_behavior)
	{
	case enemy_RUN:
	scr_skeleton_animation_setAnim("1_run");
	break;
	case enemy_IDLE:
	scr_skeleton_animation_setAnim("0_idle");
	break;
	}
	break;
	
	case "6_throw":
	scr_skeleton_animation_setAnim("0_idle");
	enemy_behavior = enemy_IDLE;
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