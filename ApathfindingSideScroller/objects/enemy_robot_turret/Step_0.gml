/// @description Defense Multiplier and Death

var plyr = instance_nearest(x,y,parPlyr);

switch(enemy_state)
{
    
	case enemyState.NORMAL:
	
	if instance_exists(plyr)
	{
		var aimDir = point_direction(x,y,plyr.x,plyr.y)
		
		enemy_var_aerialCannon_angle = aimDir;
	}
	
	if (image_angle = 0)
		Gravity();
	else
	{
		if !(place_meeting(x,y,parSolid) || place_meeting(x,y,parJumpThru))
			image_angle = 0
	}
	break;
	
	case enemyState.FROZEN:
	{
		scr_enemy_freeze_check();
	}
	
	
	break;
}

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

//Death
if enemy_hp <= 0
{
    particle_scr_eff_boom(0.7);

    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    instance_destroy();
}

