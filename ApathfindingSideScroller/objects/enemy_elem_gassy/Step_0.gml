/// @description Freeze Check and Shadow
CastShadow();
var anim = skeleton_animation_get();
var plyr = instance_nearest(x,y,parPlyr);


#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	switch(enemy_behavior)
	{
		case enemy_PATROL:
		
		vx = vxMax * facing;
		
		if place_meeting(x+16*facing,y,solid_block)
		{
			facing *= -1;
		}
		
			if distance_to_object(plyr) < enemy_var_target_range
			{
				if alarm_get(1) < 0
				{
					alarm[1] = 20;
				}
			}
		break;
		
		case enemy_ATTACK_1:
			vx = 0;
		break;
		
		case enemy_KO:
			Gravity();
			image_angle += 0.5;
		break;
	}
	break;
	
	case enemyState.FROZEN:
	scr_enemy_freeze_check();
	break;
	
	case enemyState.SHOCKED:
	if anim != "98_stun"
		skeleton_animation_set("98_stun")
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

#region Death
if enemy_hp <= 0
{
    if alarm_get(11) < 0
    {
        alarm[11] = 10;
        skeleton_animation_set("98_stun");
		enemy_behavior = enemy_KO;
        scr_play_sound(snd_common_explosion_popcorn_1,0,1.1,1.2);
    }
}
#endregion

