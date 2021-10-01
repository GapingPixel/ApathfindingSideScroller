/// @description Movement
var anim = skeleton_animation_get();



//AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	
	image_xscale = facing;
	Gravity();
	
	switch(enemy_behavior)
	{
		case enemy_RUN:
		#region AI
		//Movement
		if anim != "2_turn"
		vx = Approach(vx,vxMax*facing,tempAccel);
		
		//Turning
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
		
		
		//Jump
	    if onGround
		{
			 if !position_meeting(x+(sprite_get_width(sprite_index)/4)*1, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/4)*-1, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+4, parJumpThru)
		        {
				   vy -= jumpHeight;
				   
				   scr_play_sound(snd_enemy_robot_bark,0,0.95,1.05)
		        }
		}
		#endregion
		
		#region//Animation & Particles
		if !onGround
		{
		    if anim != "1_fall"
		        scr_skeleton_animation_setAnim("1_fall");
		    image_speed = 0.5;
		}
		else
		{
				if anim ="1_fall"//Landing particles
				{

					scr_play_sound(snd_enemy_robot_footstep_1,0,1.09,1.1);
				}
				
		        if anim != "0_run" && anim != "2_turn"
		            scr_skeleton_animation_setAnim("0_run");
        
		        image_speed = 0.6;
        
		        //Foot Steps
		        /*if anim = "0_run"
		        {
		        if ((image_index < 3 && image_index > 2))//first foot
		            {
		            scr_play_sound(snd_enemy_robot_footstep_1,0,1.2,1.21);}
		        if ((image_index < 15 && image_index > 14))//second foot
		            {
		            scr_play_sound(snd_enemy_robot_footstep_1,0,1.09,1.1);}
		        }*/
		}
		#endregion

		break;
		
		
		case enemy_KO:
		if alarm_get(1) < 0
		{
			if anim != "98_stun"
			{
				scr_skeleton_animation_setAnim("98_stun");
				vy = 0
			}
			vyMax = 15
			vy -= vyMax * random_range(0.9,1.1);
			vx = vxMax * facing * -1;
			alarm[1] = choose(20,30);
		}
		break;
	}
	
	break;
	
	case enemyState.FROZEN:
		image_speed = 0
		vx = 0
		vy = 0;
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

if anim = "2_turn"
{
    scr_skeleton_animation_setAnim("0_run");
}
	
}
#endregion 

//Death
if enemy_hp <= 0
{
	enemy_state = enemyState.NORMAL;
	enemy_behavior = enemy_KO;
}