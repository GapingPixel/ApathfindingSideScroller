/// @description Set variables
event_inherited();
scr_set_enemy_vars(1,0.5,2,1,0.25,2,true,true,true);

//Movement  variables
facing = -1;
dmg = 2;//damage on the player
vxMax       = 5;
vyMax       = 20;
groundAccel = 1.00;
groundFric  = 12;
airAccel    = 0.75;
airFric     = 0.5;
jumpHeight  = 17.00;
gravNorm    = 1.2;

//Enemy Behavior States


enemy_behavior = enemy_RUN;

//enemy_var_minion_target_range = 400;


skeleton_animation_set("1_run");
//skeleton_animation_mix("1_run", "3_fall", 0.03);
//skeleton_animation_mix("3_fall", "1_run", 0.03);
skeleton_animation_mix("1_run", "6_taunt1", 0.03);
skeleton_animation_mix("1_run", "6_taunt2", 0.03);
skeleton_animation_mix("1_run", "6_taunt3", 0.03);


