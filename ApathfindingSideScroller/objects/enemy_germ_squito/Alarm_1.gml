/// @description Insert description here
// You can write your code in this editor
switch(enemy_behavior)
{
	case enemy_IDLE:
		enemy_behavior = enemy_FLY;	
	break;
	
	case enemy_FLY:
		enemy_behavior = enemy_IDLE;	
	break;
}
alarm[1] = 120;