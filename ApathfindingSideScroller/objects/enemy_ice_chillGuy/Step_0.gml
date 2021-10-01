/// @description Movement
var anim = skeleton_animation_get();
var plyr = instance_nearest(x,y,parPlyr);
image_xscale = facing;
switch(enemy_state)
{
	case enemyState.NORMAL:
	Gravity();
	if !onGround
	{
		if anim != "3_fall"
		{
        skeleton_animation_set("3_fall");
		}
	}
	else
	{
		if anim = "3_fall" and anim != "4_land"
		{
        skeleton_animation_set("4_land");
		}
	}

	switch(enemy_behavior)
	{
		case enemy_IDLE:
		vx = 0
		//Turning
		var plyr_insight = collision_rectangle(x-400,y-50,x+400,y+50,plyr,false,true);
		if instance_exists(plyr) and onGround and plyr_insight
			{
				if x >= plyr.x && image_xscale = 1
				{
				    if anim != "2_turn"
				    {
				        skeleton_animation_set("2_turn");
						facing *= -1;
				    }
				}
				if x <= plyr.x && image_xscale = -1
				{
				    if anim != "2_turn"
				    {
				        skeleton_animation_set("2_turn");
						facing *= -1;
				    }
				}
			}
		
		if enemy_var_attack_cooldown > 0
			enemy_var_attack_cooldown--;
		
		//Fire Range
		var shot_range = 400;
		//Horizontal Shotrange
		if collision_rectangle(x,y-100,x+shot_range*facing,y+100,plyr,false,true)
		{
			if alarm_get(2) < 0 and enemy_var_attack_cooldown <= 0
				alarm[2] = choose(10,20,30);
			
		}
		
		if enemy_var_skate//Auto switch to patrol if we are skating
			enemy_behavior = enemy_PATROL;
		
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
			var detect_edge = (!position_meeting(x+(sprite_get_width(sprite_index)/2)*1, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*-1, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/3)+8, parJumpThru))
				
			 if detect_edge || (place_meeting(x+facing,y,solid_block))
		        {

				  if anim != "2_turn"
				  {
					facing *= -1;
					skeleton_animation_set("2_turn")
				  }
		        }
		}
		
		if enemy_var_attack_cooldown > 0
			enemy_var_attack_cooldown--;
		
		//Fire Range
		var shot_range = 400;
		var plyr_insight = collision_rectangle(x,y-100,x+shot_range*facing,y+100,plyr,false,true);
		//Horizontal Shotrange
		if plyr_insight// and collision_rectangle(x,y-100,x+shot_range*facing,y+100,plyr,false,true)
		{
			if alarm_get(2) < 0 and enemy_var_attack_cooldown <= 0
				alarm[2] = choose(10,20,30);
		}
		break;
		
		case enemy_ATTACK_1:
		vx = 0;
		//Ice Breath
		if anim = "5_shoot"
		{
			if image_index >= 30 && image_index <= 50
			{
				var breath = instance_create_depth(enemy_var_mouth_x,enemy_var_mouth_y,depth,enemy_bullet_ice_breath);
				var dir = facing;
				with(breath)
				{
					motion_set(0,10*dir);
				}
			}
		}
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
	skeleton_animation_set("98_stun");
	break;
	
}

///Death
if enemy_hp < 0
{
    vx = 0
	vy = 0
	if alarm_get(11) < 0
    {
        alarm[11] = 15;
        skeleton_animation_set("98_stun");
        scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    }

}
