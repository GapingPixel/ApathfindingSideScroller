/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_set_enemy_vars(2,0.5,2,2,0.5,2,true,false,true);
enemy_poise = 1;
///Movement variables
vxMax = 2;
vyMax = random_range(1,2);


facing = image_xscale;



enemy_behavior = enemy_FLY;

image_speed = 1;

alarm[1] = 120;//Alarm to switch b/w flying and idle

skeleton_animation_set("0_idle");