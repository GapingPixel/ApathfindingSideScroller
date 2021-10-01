/// @description Set variables
event_inherited();

scr_set_enemy_vars(3,0.5,1.2,1,1.5,0.5,true,true,true);

///Movement Variables and Alarm

vxMax = 1.75;
vyMax = 15;
gravNorm    = 1;



enemy_behavior= enemy_IDLE;
facing = image_xscale;
enemy_var_patrol = true;//Boolean to check if SlimeNose can patrol or not
//Shooting alarm
alarm[1] = 30
//Slime
alarm[3] = 5;


//Animation mixing
image_speed = 0.75;

skeleton_skin_set("type_1")

skeleton_animation_mix("1_walk", "0_idle",0.25);
skeleton_animation_mix("0_idle","1_walk",0.25);

skeleton_animation_mix("1_turn", "0_idle",0.25);
skeleton_animation_mix("0_idle","1_turn",0.25);