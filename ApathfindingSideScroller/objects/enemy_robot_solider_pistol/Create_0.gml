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

enemy_behavior = enemy_RUN;
enemy_var_soldier_shots = 3;
enemy_var_soldier_shot_cooldown = 0;
enemy_var_soldier_target_range = 200;



skeleton_animation_set("0_idle");

skeleton_animation_mix("5_shoot_fire","0_idle",0.25);
skeleton_animation_mix("4_land","1_run",0.25);
skeleton_animation_mix("0_idle","1_run",0.25);

//alarm[2] = 60;

//Particles



