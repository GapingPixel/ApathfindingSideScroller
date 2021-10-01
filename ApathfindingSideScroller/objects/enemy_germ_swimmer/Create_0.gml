/// @description Set Enemy vars and Animations
event_inherited();
scr_set_enemy_vars(5,0.75,1.1,.9,2,0.1,true,true,true);


//animation
image_speed = 0.75;

//Gravity
vyMax = 15;
jumpHeight = 30;
vxMax = 5;
gravNorm = 1.25;


enemy_behavior = enemy_PATROL
facing = image_xscale;


