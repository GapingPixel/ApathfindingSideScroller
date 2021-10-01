/// @description Handle aerial Unit to stop
switch(enemy_behavior)
{
	default:
		enemy_behavior = enemy_FLY;
		alarm[1] = 180;
	break;
	
	case enemy_FLY:
		enemy_behavior = enemy_IDLE;
		alarm[3] = 90;
	break;
}