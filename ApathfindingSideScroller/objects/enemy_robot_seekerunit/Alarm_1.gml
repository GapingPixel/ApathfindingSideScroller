/// @description Pursuit and Stop Alarm
switch(enemy_behavior)
{
	case enemy_IDLE:
		enemy_behavior = enemy_PURSUE;
		enemy_var_count--
		if enemy_var_count > 0
			alarm[1] = 30;
	break;
	
	case enemy_PURSUE:
		enemy_behavior = enemy_IDLE;
		motion_set(image_angle,0)
		alarm[1] = 60;
	break;
}

