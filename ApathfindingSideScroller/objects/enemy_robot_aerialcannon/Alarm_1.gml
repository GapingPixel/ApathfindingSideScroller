/// @description Halt Alarm
switch(enemy_behavior)
{
	case enemy_FLY:
		enemy_behavior = enemy_AIM;
		skeleton_animation_set("0_halt");
		alarm[2] = 90;//Time to shoot
	break;
	
	default:
		enemy_behavior = enemy_LEAVE;
		skeleton_animation_set("0_fly");
	break;
	
}