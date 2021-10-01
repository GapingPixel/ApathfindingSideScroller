event_inherited();

scr_set_enemy_vars(1.5,0,0.25,2,0.25,1,true,true,false);

//Action Variables
enemy_var_flaming = 1;//Fly faster when flaming
facing = image_xscale;
vxMax       = 4;

//Behavior


enemy_behavior = enemy_FLY;

//Animations
image_speed = 0.75;
skeleton_animation_set("0_flying");

/*skeleton_animation_mix("0_flying","1_bounce",0.01);
skeleton_animation_mix("1_bounce","0_flying",0.01);
skeleton_animation_mix("0_flying","2_openmouth",0.03);
skeleton_animation_mix("2_openmouth","3_flying_mouthopen",0.03);
skeleton_animation_mix("2_openmouth","0_flying",0.03);
skeleton_animation_mix("3_flying_mouthopen","4_bounce_mouthopen",0.03);
skeleton_animation_mix("4_bounce_mouthopen","3_flying_mouthopen",0.03);*/


