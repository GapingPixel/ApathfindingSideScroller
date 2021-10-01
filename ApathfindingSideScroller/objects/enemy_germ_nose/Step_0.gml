/// @description Movement
var anim = skeleton_animation_get();
var plyr = parPlyr;

#region AI
image_xscale = facing;
switch(enemy_state)
{
	case enemyState.NORMAL:
	Gravity();
	if !onGround
	{
		image_speed = 0.75;
		if anim != "2_fall"
		{
       scr_skeleton_animation_setAnim("2_fall");
		}
	}
	else
	{
		if anim = "2_fall" and anim != "2_land"
		{
        scr_play_sound(snd_common_liquid_splat_2,0,0.8,1.2);
		skeleton_animation_set("2_land");
		}
	}

	switch(enemy_behavior)
	{
		case enemy_IDLE:
		vx = 0
		//Turning
		var plyr_insight = collision_rectangle(x-400,y-100,x+400,y+100,plyr,false,true);
		if instance_exists(plyr) and onGround and plyr_insight
			{
				if x >= plyr.x && image_xscale = 1
				{
				    if anim != "1_turn"
				    {
				       scr_skeleton_animation_setAnim("1_turn");
						facing *= -1;
				    }
				}
				if x <= plyr.x && image_xscale = -1
				{
				    if anim != "1_turn"
				    {
				       scr_skeleton_animation_setAnim("1_turn");
						facing *= -1;
				    }
				}
			}
			
		//Fire Range
		var shot_range = 400;
		//Horizontal Shotrange
		if collision_rectangle(x,y-100,x+shot_range*facing,y+100,plyr,false,true)
		{
			if alarm_get(2) < 0 and anim != "3_shoot"
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
			var detect_edge = (!position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+8, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+4, parJumpThru))
				
			 if detect_edge || (place_meeting(x+facing,y,solid_block))
		        {
				  facing *= -1;
				  if anim != "1_turn"
					skeleton_animation_set("1_turn")
		        }
		}
		
		//Fire Range
		var shot_range = 200;
		var plyr_insight = collision_rectangle(x-400,y-100,x+400,y+100,plyr,false,true);
		//Horizontal Shotrange
		if plyr_insight and collision_rectangle(x,y-100,x+shot_range*facing,y+100,plyr,false,true)
		{
			if alarm_get(2) < 0 and anim != "3_shoot"
				alarm[2] = choose(10,20);
		}
		break;
		
		case enemy_ATTACK_1:
		vx = 0;
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
	particle_scr_enemy_statusCreate_shock_bang(1);
	if anim != "98_stun"
	scr_skeleton_animation_setAnim("98_stun");
	break;
	
	case enemyState.HITSTUN:
	image_speed = 0;
	vx = 0;
	vy = 0;
	break;
	
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{

switch(anim)
{

case "3_shoot":
   scr_skeleton_animation_setAnim("0_idle");
	enemy_behavior = enemy_IDLE;
    alarm[1] = 40;
break;

case "2_land":
   scr_skeleton_animation_setAnim("0_idle");
    alarm[1] = 30;
break;

case "1_turn":
   scr_skeleton_animation_setAnim("1_walk");
break;

}

}
#endregion

#region Death
if enemy_hp < 0
{
	//audio_sound_pitch(snd_boom,random_range(1.5,2));
    //audio_play_sound(snd_boom,0,0);
	particle_scr_eff_boom(0.5);
    //part_particles_create(global.parsys,x,y,part_var_enemy_slime_boom,30);
	instance_destroy();
}
#endregion