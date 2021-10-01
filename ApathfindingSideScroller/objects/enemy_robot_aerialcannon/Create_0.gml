/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
scr_set_enemy_vars(8,0.5,1.1,0.9,0.5,1.5,true,true,true);
vxMax = 5;

//aerialCannon values
enemy_var_aerialCannon_angle = 0;
enemy_var_aerialCannon_stretch = 1;
enemy_var_aerialCannon_shots = 4;




enemy_behavior = enemy_FLY;

alarm[1] = 60

skeleton_animation_set("0_fly")
skeleton_animation_mix("0_idle","0_fly",0.1);
