/// @description Set variables
event_inherited();
enemy_goodies = atom_n
//dmg = 2;
scr_set_enemy_vars(2.5,1,3,0.05,1.5,1.5,false,true,true);

///Movement Variables and Alarm

vxMax = 5;
vyMax = 15;
gravNorm    = 1;

//Behavior


enemy_behavior= enemy_IDLE;
facing = image_xscale;
enemy_var_patrol = true;//Boolean to set enemy to patrol
enemy_var_attack_cooldown = 0;

//mouth point
enemy_var_mouth_x = 0;
enemy_var_mouth_y = 0;

enemy_var_skate = false;
//Shooting alarm
alarm[1] = 30
//alarm[2] = 50;//alarm for firing when player is near enemy sight


//Animation mixing
image_speed = 1;
skeleton_animation_set("0_idle");

/*skeleton_animation_mix("1_walk","5_shoot",0.25);
skeleton_animation_mix("0_idle","1_walk",0.5);
skeleton_animation_mix("1_walk","0_idle",0.5);





