/// @description Set variables
event_inherited();
scr_set_enemy_vars(4,1,1.5,0.5,0.75,1.5,true,true,true);

vxMax = 2;
vyMax = 15;
gravNorm    = 1;



enemy_behavior= enemy_IDLE;
enemy_var_fire_rate = 10;
enemy_var_fire_cooldown = 0;
enemy_var_aim_angle = 0;
enemy_var_gun_point_x = 0;
enemy_var_gun_point_y = 0;
facing = image_xscale;
enemy_var_patrol = false;//Boolean to check if K can patrol or not
//Shooting alarm
alarm[1] = 30
//alarm[2] = 50;//alarm for firing when player is near enemy sight


//Animation mixing
image_speed = 0.5;
skeleton_animation_set("0_idle");

skeleton_animation_mix("1_move","5_shoot_startup",0.03);
skeleton_animation_mix("5_shoot_startup","6_shoot_firing",0.03);
skeleton_animation_mix("5_shoot_startup_diagdown","6_shoot_firing_diagdown",0.03);
skeleton_animation_mix("6_shoot_firing","0_idle",0.1);
skeleton_animation_mix("0_idle","1_move",0.25);
skeleton_animation_mix("1_move","0_idle",0.25);



