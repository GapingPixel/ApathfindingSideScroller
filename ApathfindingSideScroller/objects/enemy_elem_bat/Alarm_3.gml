/// @description Pathfinding state update
// You can write your code in this editor
if(instance_exists(target) and instance_in_cell_range(x,y,target, 1)) {
	unit_state = UNIT_STATE.GATHER;
	show_debug_message("Gathering: "+ string(object_get_name(target.object_index)));
}