/// @description Set variables
event_inherited();
scr_set_enemy_vars(2,1,2,1,0.25,2,true,true,true);
enemy_poise = 1
//Movement  variables
facing = image_xscale;
vxMax       = 4;
vyMax       = 20;
groundAccel = 1.00;
groundFric  = 12;
airAccel    = 0.75;
airFric     = 0.5;
jumpHeight  = 15.00;
gravNorm    = 1.2;


image_speed = 0.5;
enemy_behavior = enemy_IDLE;
enemy_var_target_range = 500;
enemy_var_aim_angle = 0;

enemy_var_gun_point_x = 0;
enemy_var_gun_point_y = 0;
skeleton_animation_set("0_idle");

skeleton_animation_mix("1_run","0_idle_aim_fwrd",0.25);
skeleton_animation_mix("2_turn","0_idle_aim_fwrd",0.25);
skeleton_animation_mix("0_idle","0_idle_aim_fwrd",0.25);


//Check Angle
alarm[2] = 10;

//Particles





