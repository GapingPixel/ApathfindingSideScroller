/// @description Insert description here
// You can write your code in this editor

unit_state = UNIT_STATE.MOVE;

alarm[3] = -1;	
alarm[4] = -1;	

p = path_closest_free_cell(x, y,target_x,target_y);
if(path_exists(p)) {
	path_set_closed(p, 0);
	path_start(p,3,path_action_stop, 1);
}