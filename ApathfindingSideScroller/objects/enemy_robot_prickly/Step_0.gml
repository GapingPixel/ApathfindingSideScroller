/// @description Freeze Check and Shadow
CastShadow();
var anim = skeleton_animation_get();
var plyr = parPlyr;


#region AI
if image_angle <= 0 && image_yscale = 1
	Gravity();
else
{
	if !place_meeting(x,y,parSolid) || !place_meeting(x,y,parJumpThru)
	{
		image_angle = 0;
		image_yscale = 1;
	}
}
	
	
switch(enemy_state)
{
	case enemyState.NORMAL:
	switch(enemy_behavior)
	{
		case enemy_IDLE:
			if distance_to_object(plyr) < enemy_var_target_range
			{
				if alarm_get(1) < 0
				{
					alarm[1] = 20;
				}
			}
		break;
	}
	break;
	
	case enemyState.FROZEN:
	scr_enemy_freeze_check();
	break;
	
	case enemyState.SHOCKED:
	if anim != "98_stun"
		scr_skeleton_animation_setAnim("98_stun");
	particle_scr_enemy_statusCreate_shock_bang(1);
	break;
}
#endregion


#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

switch(anim)
{
	case "1_attack":
    scr_skeleton_animation_setAnim("0_idle");
	enemy_behavior = enemy_IDLE;
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
		enemy_behavior = enemy_KO;
        scr_skeleton_animation_setAnim("98_stun");
        scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    }
}
#endregion

