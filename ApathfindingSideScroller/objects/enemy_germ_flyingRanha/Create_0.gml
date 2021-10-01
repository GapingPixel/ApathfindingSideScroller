/// @description Set variables
event_inherited();

scr_set_enemy_vars(2.5,0,1.5,1,0.25,1,true,true,true);

///Movement variables
vxMax = 3;
vyMax = .001;

facing = image_xscale;



enemy_behavior = enemy_FLY;
enemy_var_fire_cooldown = 0;
enemy_var_fire_cooldown_max = 200;//How much time there is b/w shots
//Movement Alarm
//alarm[1] = 50;
//alarm[2] = 30;


///Animation mixing and booleans
image_speed = 0.5;
skeleton_animation_set("0_move");
/*skeleton_animation_mix("0_move","1_turn",0.5);
skeleton_animation_mix("1_turn","0_move",0.5);
skeleton_animation_mix("0_move","2_shoot",0.01);
skeleton_animation_mix("2_shoot","0_move",0.01);*/



