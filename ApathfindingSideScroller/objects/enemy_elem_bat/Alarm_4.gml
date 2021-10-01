/// @description Pathfinding type
// You can write your code in this editor
arrived=false;
switch(target.instance_family) {
	case INSTANCE_FAMILY.BLOCK:
		unit_state = UNIT_STATE.IDLE;
	break;
	
	case INSTANCE_FAMILY.RESOURCE:
		alarm[3] = room_speed * 0.65;
	break;	
}
