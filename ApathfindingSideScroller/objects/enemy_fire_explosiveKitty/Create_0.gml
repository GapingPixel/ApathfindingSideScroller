/// @description Set variables
event_inherited();
//atom = atom_f;
//dmg = 3;
scr_set_enemy_vars(12,0.5,0.25,1.5,1.25,0.25,true,true,false);
enemy_goodies = atom_f;
//particle_scr_collect_atoms(c_red);
//particle_scr_element_enemy_fluorine();

///Movement variables
vxMax = 8;
vyMax = 15;
jumpHeight = 25;
gravNorm    = 1.5;
facing = image_xscale



enemy_behavior = enemy_IDLE;

//Alarms
//alarm[1] = 25;//Hop Alarm
image_speed = 0.5;


///Animation mixing and booleans
skeleton_animation_set("0_idle");
/*skeleton_animation_mix("0_idle","1_jump",0.01);
skeleton_animation_mix("1_jump","2_fall",0.01);
skeleton_animation_mix("2_fall","3_land",0.01);
skeleton_animation_mix("3_land","0_idle",0.01);
skeleton_animation_mix("0_idle","4_turn",0.01);
skeleton_animation_mix("4_turn","0_idle",0.01);*/



