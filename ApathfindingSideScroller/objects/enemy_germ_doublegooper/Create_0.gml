/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_set_enemy_vars(15,0.5,1.25,1.25,3,0.5,true,true,true)

vxMax = 0.5;
dir = 1
vyMax = 15;
gravNorm    = 1;

enemy_behavior = enemy_WAIT;
enemy_poise = 0;
enemy_var_target_range = 300;

skeleton_skin_set("ground");

skeleton_animation_mix("0_idle","1_attack",0.2);
skeleton_animation_mix("1_attack","0_idle",0.2);

enemy_var_mouth_L[0] = 0;
enemy_var_mouth_L[1] = 0;
enemy_var_mouth_R[0] = 0;
enemy_var_mouth_R[1] = 0;