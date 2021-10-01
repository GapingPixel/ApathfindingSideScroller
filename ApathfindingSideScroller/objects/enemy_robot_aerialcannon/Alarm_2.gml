/// @description Shoot Cannon
enemy_var_aerialCannon_shots--
enemy_var_aerialCannon_stretch = 2
var ang = enemy_var_aerialCannon_angle;
var bullet = instance_create_depth(x-15+lengthdir_x(30,ang),y+lengthdir_y(10,ang),depth-1,enemy_bullet_robot_heavy);

with(bullet)
{
	motion_set(ang,7);
	image_angle = ang;	
}

if enemy_var_aerialCannon_shots > 1
alarm[2] = 180;
else
alarm[1] = 120;//Leave alarm
