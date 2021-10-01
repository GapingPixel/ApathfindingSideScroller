/// @description Insert description here
// You can write your code in this editor
var fireD, fireD2;

if env_var_fire_spread_count = 0
{
	fireD = instance_create_depth(x,y,depth,terr_fireDebris_minor);	
}
else
{
	fireD = instance_create_depth(x + (env_var_fire_spread_count*64),y,depth,terr_fireDebris_minor);	
	fireD2 = instance_create_depth(x - (env_var_fire_spread_count*64),y,depth,terr_fireDebris_minor);	
}

env_var_fire_spread_count++;


if env_var_fire_spread_count >= env_var_fire_spreadMax
{
	instance_destroy();		
}

alarm[0] = 10;