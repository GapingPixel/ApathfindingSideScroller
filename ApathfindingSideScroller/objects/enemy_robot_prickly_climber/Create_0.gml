/// @description Set variables
event_inherited();
atom = atom_na;
dmg = 2;
scr_set_enemy_vars(1,1,1,0.5,1,3,true,true,false);

enemy_goodies = atom_na;

dir = 1;
vyMax = 15;
vxMax = vyMax;
gravNorm = 1.3;


enemy_behavior = enemy_ATTACK_3;



//Animation mixing
image_speed = 0.75;
skeleton_animation_set("0_idle");
//skeleton_animation_mix("2_attack","0_idle", 0.001);


