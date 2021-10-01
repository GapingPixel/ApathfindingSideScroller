/// @description Set Variables
event_inherited();
scr_set_enemy_vars(3,1,2,2,2,2,true,true,true);
vxMax = 6;
vyMax = 15;
jumpHeight = 30;
gravNorm    = 1.25;

atom = choose(0,atom_cl,atom_cl);


//Animation
skeleton_animation_set("0_idle");
//skeleton_animation_mix("3_land","0_idle",0.01)

//Behavior


enemy_behavior = enemy_PURSUE;
facing = image_xscale;


//Jumping/Hopping
alarm[1] = 5;

