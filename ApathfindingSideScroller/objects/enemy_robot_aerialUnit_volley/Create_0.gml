/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_set_enemy_vars(2,0.75,2,0.5,0.5,2,true,true,true);
///Movement variables
vxMax = 2;
//vyMax = random_range(1,2);


facing = image_xscale;

//Behavior


enemy_behavior = enemy_FLY;
enemy_var_shots = 2;
//aerialUnit_mobile = false;//Boolean to set aerial Unit to constantly fly around or not

//Gun point
enemy_var_volley_x[0] = 0;
enemy_var_volley_y[0] = 0;
enemy_var_volley_x[1] = 0;
enemy_var_volley_y[1] = 0;

//Jet Exhaust
enemy_var_jet_exhaust_L[0] = 0;
enemy_var_jet_exhaust_R[0] = 0;
enemy_var_jet_exhaust_L[1] = 0;
enemy_var_jet_exhaust_R[1] = 0;

image_speed = 1;

alarm[1] = 45;//Alarm to switch b/w flying and idle
alarm[2] = 15;
skeleton_skin_set("type_volley");
skeleton_animation_set("0_idle");
/*skeleton_animation_mix("2_shoot_volley_single","0_idle",0.25);
skeleton_animation_mix("2_shoot_volley_double","0_idle",0.25);*/




particle_scr_enemy_robot_jetPack();