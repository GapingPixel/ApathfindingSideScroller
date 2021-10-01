/// @desc --- CONTROL CHECK & PLAYER POSITIONS

#region Check following list

// Here we will check if all the instances inside the cam_following_list are still
// existing. Other way our game would crash.

// Iterate for all elements in list
var a_len = ds_list_size(cam_following_list);
var i = 0;

repeat (a_len) {
	// If the element does not exist just delete it from the list.
	if (!instance_exists(cam_following_list[|i])) {
		ds_list_delete(cam_following_list, i);
	} else {
		// Since we are deleting an entire element from the list,
		// all the indexes get modified, so we will increment the index
		// when we are not deleting any elemnt.
		i++;	
	}
}

#endregion

#region Handle camaera wall-ins and manage player positioning


var left_side = global.cam_x
var right_side = global.cam_x + global.cam_width
var middle_y = global.cam_y + global.cam_height/2;
var top = global.cam_y;

if cam_mode != CMODE.OBJECT_FOLLOWING_V
{
	if instance_exists(cam_walling_L)
	with(cam_walling_L)
	{
		x = left_side;
		y = middle_y;
	}
	
	if instance_exists(cam_walling_R)
	with(cam_walling_R)
	{
		x = right_side;
		y = middle_y;
	}
}
else
{
	if instance_exists(cam_walling_L)
	with(cam_walling_L)
	{
		x = 0;
		y = 0;
	}
	
	if instance_exists(cam_walling_R)
	with(cam_walling_R)
	{
		x = 0;
		y = 0;
	}
	
	if instance_exists(parPlyr)
	{
		with(parPlyr)
		{
			if x < left_side - 128
				vx = 0;
				
			if x > right_side + 128
				vx = 0;
		}
	}
}

if instance_exists(parPlyr)
{
	with(parPlyr)
	{
		if y < top - 128
			vy = 0;
	}
}



#endregion
