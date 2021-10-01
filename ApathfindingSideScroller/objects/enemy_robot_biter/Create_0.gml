/// @description Set variables
event_inherited();
scr_set_enemy_vars(1,1,2,1,0.25,2,true,true,true);

//Movement  variables
facing = image_xscale;
vxMax       = 8;
vyMax       = 30;
groundAccel = 1.00;
groundFric  = 12;
airAccel    = 0.75;
airFric     = 0.5;
jumpHeight  = 20.00;
gravNorm    = 1.2;



enemy_behavior = enemy_RUN;



skeleton_animation_set("1_run");
skeleton_animation_mix("1_run", "3_fall", 0.03);
skeleton_animation_mix("3_fall", "1_run", 0.03);
skeleton_animation_mix("1_run", "6_taunt1", 0.03);
skeleton_animation_mix("1_run", "6_taunt2", 0.03);
skeleton_animation_mix("1_run", "6_taunt3", 0.03);

