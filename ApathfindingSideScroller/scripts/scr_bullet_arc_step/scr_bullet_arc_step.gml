// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bullet_arc_step(){


if bullet_data[3] = 0
{
	
	//Alter angle a bit if firing forward
	var extra_ang;
	if image_angle = 0
	extra_ang = 10 * image_xscale;
	else
	extra_ang = 0;

	motion_set(image_angle + extra_ang,bullet_data[0] * image_xscale);
}
else
{
	gravity = bullet_data[3]
	
	if place_meeting(x,y, parSolid)
	        instance_destroy();
}



}