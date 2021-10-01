/// @description Handle aerial Unit to stop
switch(enemy_behavior)
{
	default:
		enemy_behavior = enemy_FLY;
	break;
	
	case enemy_FLY:
		enemy_behavior = enemy_AIM;
		alarm[3] = 60;
	break;
}