/// @description Manage Tutorial Text and Invincibility

var left, top, right, bottom;

left = global.cam_x - (global.cam_width);//Left of view
top = global.cam_y;//Top of view
right = global.cam_width + (global.cam_width*2);//Right of view
bottom = global.cam_height;//Bottom of view


//instance_deactivate_object(obj_enemy);
instance_deactivate_object(bgt_tutorial_parent);
instance_activate_region(left,top,right,bottom,true);

//Invincibility
for(var h = 0; h<=1;h++)
{
	
if global.hp[h] < global.hp_max[h]
	global.hp[h] = global.hp_max[h]

}