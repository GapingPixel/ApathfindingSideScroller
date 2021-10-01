event_inherited();

scr_set_enemy_vars(3,0.5,1.2,1,2,0.25,true,false,true);

enemy_poise = 1;
enemy_def_mult = 0.001;
image_speed = 0;
//Movement Variables
vyMax = 10
gravNorm = 1.25;

//Behavior

enemy_behavior = enemy_WAIT;

//slime droopage
alarm[3] = 5;


//Animation Mix
skeleton_animation_set("1_spawn");
/*skeleton_animation_mix("1_spawn","2_idle",0.05);
skeleton_animation_mix("2_idle","3_turn",0.05);
skeleton_animation_mix("3_turn","2_idle",0.05);
skeleton_animation_mix("2_idle","4_shoot",0.05);
skeleton_animation_mix("4_shoot","2_idle",0.05);
skeleton_animation_mix("2_idle","5_shoot_down",0.05);
skeleton_animation_mix("5_shoot_down","2_idle",0.05);*/

