/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
scr_env_set_vars(10*image_yscale,6);

skeleton_animation_set("0_norm");
skeleton_animation_mix("0_norm","1_destroyed",0.01)

//Destroyed
env_var_slimeWall_destroyed = false;