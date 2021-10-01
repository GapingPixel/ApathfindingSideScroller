/// @description Movement
var anim = skeleton_animation_get();
var plyr = instance_nearest(x,y,parPlyr);
image_xscale = facing;

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	Gravity();
	if !onGround
	{
		image_speed = 0.75;
		if anim != "3_fall"
		{
        scr_skeleton_animation_setAnim("3_fall");
		}
	}
	else
	{
		if anim = "3_fall" and anim != "4_land"
		{
        scr_skeleton_animation_setAnim("4_land");
		}
	}

	switch(enemy_behavior)
	{
		case enemy_IDLE:
		vx = 0
		//Turning
		var plyr_insight = collision_rectangle(x-100,y-100,x+200*facing,y+100,plyr,false,true);
		if instance_exists(plyr) and onGround and plyr_insight
			{
				if x >= plyr.x && image_xscale = 1
				{
				    if anim != "2_turn"
				    {
				        scr_skeleton_animation_setAnim("2_turn");
						facing *= -1;
				    }
				}
				if x <= plyr.x && image_xscale = -1
				{
				    if anim != "2_turn"
				    {
				        scr_skeleton_animation_setAnim("2_turn");
						facing *= -1;
				    }
				}
			}
			
		//Fire Range
		var shot_range = 400;
		//Horizontal Shotrange
		if collision_rectangle(x,y-100,x+shot_range*facing,y+100,plyr,false,true)
		{
			if alarm_get(2) < 0 and anim != "5_shoot_startup"
				alarm[2] = choose(10,20,30);
			
		}
		break;
		
		case enemy_PATROL:
		
		//Motion
		if anim != "2_turn"
		vx = vxMax * facing;
		else
		vx = 0;
		
		///Turning
		if onGround
		{
			var detect_edge = (!position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+4, parJumpThru))
				
			 if detect_edge || (place_meeting(x+facing,y,solid_block))
		        {
				  facing *= -1;
				  if anim != "2_turn"
					scr_skeleton_animation_setAnim("2_turn")
		        }
		}
		
		//Fire Range
		var shot_range = 400;
		var plyr_insight = collision_rectangle(x,y-60,x+shot_range*2*facing,y+100,plyr,false,true);
		//var plyr_insight_below = collision_rectangle(x-100,y-60,x+shot_range*2*facing,y+400,plyr,false,true);
		
		#region Horizontal Shotrange
		if plyr_insight
		{
			if alarm_get(2) < 0 and anim != "5_shoot_startup"
			{
				alarm[2] = choose(10,20,30);
				scr_skeleton_animation_setAnim("5_shoot_startup");
			}
		}
		#endregion
		break;
		
		case enemy_ATTACK_1:
		vx = 0
		//Shooting Logic
		if enemy_var_fire_cooldown > 0//Manage Cooldown
		    enemy_var_fire_cooldown -= 1;
			
		if enemy_var_fire_cooldown = 0//Fire Bullet
		{
		var inst = instance_create_depth(enemy_var_gun_point_x,enemy_var_gun_point_y,depth+1,enemy_bullet_robot_heavy_gatling)
		inst.image_xscale *= image_xscale;
		enemy_var_fire_cooldown = enemy_var_fire_rate;
		}
		break;
		
		case enemy_KO:
		if anim != "98_stun"
		scr_skeleton_animation_setAnim("98_stun");
		break;
	}
	break;

	case enemyState.FROZEN:
	scr_enemy_freeze_check();
	vx = 0
	vy = 0
	break;
	
	
	case enemyState.SHOCKED:
	Gravity();
	vx = 0;
	if anim != "98_stun"
	scr_skeleton_animation_setAnim("98_stun");
	break;
	
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{
	switch(anim)
	{

	case "5_shoot_startup":
	    scr_skeleton_animation_setAnim("6_shoot_firing");
		enemy_behavior = enemy_ATTACK_1;
	    alarm[3] = 40;
	break;

	case "4_land":
	    scr_skeleton_animation_setAnim("0_idle");
	    alarm[1] = 90;
	break;

	case "2_turn":
	    scr_skeleton_animation_setAnim("0_idle");
		enemy_behavior = enemy_IDLE;
		alarm[1] = 5;
	break;

	}
}
#endregion

#region Death
if enemy_hp < 0
{
    if alarm_get(11) < 0
    {
        alarm[11] = 15;
		enemy_behavior = enemy_KO;
		vy -= 15;
        //audio_play_sound(snd_env_explosion_quick_2,0,0);
    }

}
#endregion
