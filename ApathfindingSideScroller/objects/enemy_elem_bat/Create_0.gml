/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_set_enemy_vars(1.5,0.5,1,1,1,1,true,false,true);

///Movement variables
vxMax = 4;
vyMax = 1

//angle = 225;
angle = 315;

//clamp(angle,315,359);

facing = image_xscale;


if x < parPlyr.x {
	angle = 315;
	flee_away_direction = 1;
} else {
	angle = 225;
	flee_away_direction = -1;
}

enemy_behavior = enemy_IDLE;

image_speed = 0.75;

//alarm[1] = 180;//Alarm to switch b/w flying and idle



//Wave movement
zigzag = 20;


//Pathfinding Stuff

move_snap(16,16);
p=path_add();
target=noone;
arrived = false;
unit_state = UNIT_STATE.IDLE;
target_x = -1;
target_y = -1;


function start_path() {
	var plyr = parPlyr;
	target_x = get_snapped(plyr.x, CELL_SIZE) + CELL_SIZE / 2;
	target_y = get_snapped(plyr.y, CELL_SIZE) + CELL_SIZE / 2;
	target = instance_position(target_x, target_y, CLICKABLE_CELL);
	event_user(0); 
}