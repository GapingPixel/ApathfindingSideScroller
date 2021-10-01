/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

robotTower_platform = instance_create_depth(x,y+36,depth,solid_ledge)
with(robotTower_platform)
{
	image_xscale *= 3;
}

robotTower_spawner = instance_create_depth(x,y-60,depth,obj_eSpawner_outOfHole)
