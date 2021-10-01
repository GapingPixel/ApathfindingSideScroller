/// @description Movement

part_type_direction(part_var_enemy_robot_volley_trail,direction,0,0,0);

part_particles_create(global.parsys,x,y,part_var_enemy_robot_volley_trail,1);

var plyr = instance_nearest(x,y,parPlyr);

if instance_exists(plyr)//Increase gravity when closer to players
{
	if distance_to_object(plyr) < 175
	{
		gravity = 1;
	}
}

if place_meeting(x,y,parSolid)
    instance_destroy();
