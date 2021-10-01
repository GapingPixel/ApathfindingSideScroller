/// @description Set Variables
event_inherited();
scr_set_enemy_vars(1,1,1.5,1,0.5,1.5,true,false,true);
enemy_temp_hot = 1;
enemy_temp_cold = -1;
//Movement const and alarm
vx = 4;
vy = 10;
alarm[1] = 30; //Elevation upon creation




enemy_behavior = enemy_PURSUE;
enemy_var_count = 3;

image_speed = 0.5;

var plyr = instance_nearest(x,y,parPlyr);
if instance_exists(plyr)
image_angle = point_direction(x,y,plyr.x,plyr.y)

skeleton_animation_mix("0_idle","0_pursuit",0.1)
skeleton_animation_mix("0_pursuit","0_idle",0.1)



/* */
/*  */
