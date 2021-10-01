/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

with(robotTower_platform)
	instance_destroy();
	
with(robotTower_spawner)
	instance_destroy();