/// @description Glob shoot direction, and Death

#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

	switch(anim)
	{
		case "2_shoot":
	    scr_skeleton_animation_setAnim("0_idle");
	    if spawn_count < spawn_limit
	    alarm[1] = 50;
    
	    image_speed = 0.25;
		break;

	}
}
#endregion

#region AI
switch(enemy_state)
{
		case enemyState.NORMAL:
			if image_angle = 0
					Gravity();
		break;
		
		case enemyState.FROZEN:
			scr_enemy_freeze_check();
		break;
}


if instance_exists(Camera) && !dir_lock
{
    if x <= Camera.x
        dir = -1;
    else
        dir = 1;
}

if enemy_hp <= 0
{
image_yscale -= 0.1;
image_xscale -= 0.05;
enemy_state = enemyState.NORMAL;
image_speed = 1.5;
image_blend = c_white;
scr_play_sound(snd_enemy_slime_cry_4,10,0.5,0.55)
}

if image_yscale <= 0
{
    instance_destroy();
}
#endregion


