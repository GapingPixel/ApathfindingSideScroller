/// @description Halt Alarm
// You can write your code in this editor
switch(enemy_behavior)
{
	case enemy_IDLE:
		enemy_behavior = enemy_FLY;	
		
		if x < parPlyr.x {
			angle = 315;
			flee_away_direction = 1;
		} else {
			angle = 225;
			flee_away_direction = -1;
		}
	break;
	
	case enemy_FLY:
		enemy_behavior = enemy_IDLE;	
	break;
}
alarm[1] = 30;