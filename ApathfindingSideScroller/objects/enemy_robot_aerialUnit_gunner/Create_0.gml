/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_set_enemy_vars(2,0.75,2,0.5,0.5,2,true,true,true);
enemy_poise = 1
///Movement variables
vxMax = 2;
vyMax = 2;


facing = image_xscale ;



enemy_behavior = enemy_FLY;
enemy_var_aim_angle = 0;
enemy_var_shots = 3;
//aerialUnit_mobile = false;//Boolean to set aerial Unit to constantly fly around or not

//Gun point
enemy_var_gun_x = 0;
enemy_var_gun_y = 0;

//Jet Exhaust
enemy_var_jet_exhaust_L[0] = 0;
enemy_var_jet_exhaust_R[0] = 0;
enemy_var_jet_exhaust_L[1] = 0;
enemy_var_jet_exhaust_R[1] = 0;

image_speed = 1;

alarm[1] = 45;//Alarm to switch b/w flying and idle
alarm[2] = 15;
skeleton_skin_set("type_uzi");
skeleton_animation_set("0_idle");
/*skeleton_animation_mix("0_idle","2_aim_fwrd",0.25);
skeleton_animation_mix("0_idle","2_aim_diagdown",0.25);
skeleton_animation_mix("0_idle","2_aim_down",0.25);
skeleton_animation_mix("2_aim_diagdown","2_aim_fwrd",0.05);
skeleton_animation_mix("2_aim_diagdown","2_aim_down",0.05);
skeleton_animation_mix("2_aim_fwrd","2_aim_diagdown",0.05);
skeleton_animation_mix("2_aim_fwrd","2_aim_down",0.05);
skeleton_animation_mix("2_aim_down","2_aim_diagdown",0.05);
skeleton_animation_mix("2_aim_down","2_aim_fwrd",0.05);*/


particle_scr_enemy_robot_jetPack()