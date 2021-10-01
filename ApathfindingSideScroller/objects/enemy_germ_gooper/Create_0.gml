/// @description Set Enemy vars and Animations
event_inherited();
scr_set_enemy_vars(0.75,0.75,1.1,.9,2,0.1,true,false,true);



atom = choose(0,0,0,atom_cl,atom_br);


//animation
image_speed = 0.75;

//Gravity
vyMax = 15;
vxMax = 8;
gravNorm = 1.25;



enemy_behavior = enemy_RUN;
facing = image_xscale;



//Bite alarm
alarm[3] = 5;//Slime



skeleton_animation_mix("0_spawn","1_run",0.3);

