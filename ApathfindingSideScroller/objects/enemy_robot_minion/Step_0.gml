/// @description Movement
var anim = skeleton_animation_get();



//AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	
	Gravity();
	
	switch(enemy_behavior)
	{
		case enemy_RUN:
		#region AI
		image_xscale = facing;
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
			 if !position_meeting(x+(abs(sprite_width)/4)*1, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(abs(sprite_width)/4)*-1, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+4, parJumpThru)
		        {
				   vy -= jumpHeight;
				   scr_play_sound(snd_common_cartoony_boingy_jump,0,1.2,1.3);
		        }
		}
		#endregion
		
		#region//Animation
		if !onGround
		{
		    if anim != "3_fall"
		        scr_skeleton_animation_setAnim("3_fall");
		    image_speed = 0.5;
		}
		else
		{
				if anim ="3_fall"//Landing particles
				{
					particle_scr_eff_land_smoke(1);
					scr_play_sound(snd_enemy_robot_footstep_1,0,1,1.01);
				}
				
		        if anim != "1_run" && anim != "2_turn"
		            scr_skeleton_animation_setAnim("1_run");
        
		        image_speed = 0.5;
        
		        //Foot Steps
		        /*if anim = "1_run"
		        {
		        if ((image_index < 3 && image_index > 2))//first foot
		            {
		            scr_play_sound(snd_enemy_robot_footstep_1,0,1,1.01);}
		        if ((image_index < 15 && image_index > 14))//second foot
		            {
		            scr_play_sound(snd_enemy_robot_footstep_1,0,1.09,1.1);}
		        }*/
		}
		#endregion

		break;
		
		//Disable Gravity
		default:
			vx = 0;
			vy = 0;
		break;
		
		case enemy_KO:
		if alarm_get(1) < 0
		{
			vy -= vyMax * random_range(0.9,1.1);
			vx = vxMax * facing * -1;
			if anim != "6_whacked" && anim != "6_whacked2"
			{
				scr_skeleton_animation_setAnim(choose("6_whacked","6_whacked2"));
			}
			alarm[1] = choose(10,20,30);
		}
		break;
		
		case enemy_SPAWN:
		 image_speed = 0.5;
		 gravNorm = 0;
		 enemy_def_mult = 0;
		break;
	}
	
	break;
	
	case enemyState.FROZEN:
		image_speed = 0
		vx = 0
		vy = 0;
	break;
	
	case enemyState.SHOCKED:
		particle_scr_enemy_statusCreate_shock_bang(1);
		vx = 0;
		if anim != "6_whacked" && anim != "6_whacked2"
			{
				scr_skeleton_animation_setAnim(choose("6_whacked","6_whacked2"));
				image_speed = 1;
			}
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


	switch(anim)
	{
		case "2_turn":
			 scr_skeleton_animation_setAnim("1_run");
		break;
	
		case "0_spawn_runout":
			enemy_behavior = enemy_RUN;
			enemy_def_mult = 1;
			gravNorm = 1.2;
			scr_skeleton_animation_setAnim("1_run");
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