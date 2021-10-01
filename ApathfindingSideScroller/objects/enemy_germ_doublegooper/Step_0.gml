/// @description Insert description here

var plyr = instance_nearest(x,y,parPlyr)
var aim_box = collision_rectangle(x-enemy_var_target_range,
y-enemy_var_target_range/4,
x+enemy_var_target_range,
y+enemy_var_target_range/4,
plyr,false,true)

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	Gravity();
	
		switch(enemy_behavior)
		{
			case enemy_WAIT:
				if aim_box
					enemy_behavior = enemy_PURSUE;
			break;
			
			case enemy_PURSUE:
				vx = vxMax * dir;
			break;
		}
	
	var skin = skeleton_skin_get();
	if !onGround
	{
		if skin = "ground"
		{
			skeleton_skin_set("fall");
			scr_play_sound(snd_common_cartoony_fall,20,0.5,0.6);
		}
	}
	else
	{
		if skin = "fall"
		{
			skeleton_skin_set("ground");
			scr_play_sound(snd_common_liquid_splat_heavy,20,0.5,0.75);
		}
	}
	break;
	
	case enemyState.HITSTUN:
	vx = 0
	vy = 0;
	break;
	
	case enemyState.FROZEN:
	
	break;
	
	
	case enemyState.SHOCKED:
	
	break;
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

switch(anim)
{
	default:
	
	break;
	
}

}
#endregion