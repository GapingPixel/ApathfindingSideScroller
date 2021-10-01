/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
scr_set_enemy_vars(0.8,0.5,1.1,0.9,0.5,1.5,true,false,true);
vxMax = 3;
enemy_poise = 1

atom = 0;

enemy_var_robodiamond_wavemo_freq = 60;
enemy_var_robodiamond_wavemo_amp = 50;
enemy_var_robodiamond_wavemo_sY = y;

switch(image_blend)
{
	case c_red:
	enemy_var_robodiamond_wavemo_amp = 100;
	break;
	
	case c_blue:
	enemy_var_robodiamond_wavemo_amp = 25;
	break;
}
image_blend = c_white;



enemy_behavior = enemy_FLY;

image_speed = 0.5;

