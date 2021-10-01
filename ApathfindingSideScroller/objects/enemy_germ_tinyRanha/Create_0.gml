/// @description Set variables
event_inherited();
atom = atom_cl;
dmg = 0;
scr_set_enemy_vars(2,0,1.5,1,0.25,1,true,false,true);
//particle_scr_collect_atoms(c_lime);

///Movement variables
vxMax = 1;
vyMax = .1;

image_xscale *= 10
image_yscale *= 10
depth = -10;

facing = image_xscale;


enemy_behavior = enemy_SPAWN;





///Animation mixing and booleans
image_speed = 0.5;
skeleton_animation_set("0_move");
/*skeleton_animation_mix("0_move","1_turn",0.5);
skeleton_animation_mix("1_turn","0_move",0.5);*/




