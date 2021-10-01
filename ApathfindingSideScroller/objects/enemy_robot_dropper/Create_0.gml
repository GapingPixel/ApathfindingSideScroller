/// @description Set Variables
event_inherited();
scr_set_enemy_vars(1,1,5,1,0.5,5,true,false,true);
enemy_temp_hot = 1;
enemy_temp_cold = -1;
//Movement const and alarm
vxMax = 4;
vyMax = 10;
alarm[1] = 40; //Elevation upon creation
alarm[2] = 5;//Copter spin sfx

atom = 0;


enemy_behavior = enemy_FLY;

image_speed = 0.5;


