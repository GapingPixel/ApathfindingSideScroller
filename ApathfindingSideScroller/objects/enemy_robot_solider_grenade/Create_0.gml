/// @description Set variables
event_inherited();
scr_set_enemy_vars(2,1,2,1,0.25,2,true,true,true);

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
//enemy_var_soldier_grenade_shots = 3;
enemy_var_soldier_grenade_cooldown = 0;
enemy_var_soldier_grenade_target_range = 600;



skeleton_animation_set("0_idle");


//alarm[2] = 60;





