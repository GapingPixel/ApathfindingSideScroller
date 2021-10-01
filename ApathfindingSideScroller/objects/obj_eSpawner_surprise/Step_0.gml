/// @description Check for player to activate
#region Activation and Disabling
var objCam = instance_nearest(x,y,Camera);
var viewHeight = global.cam_height;
var viewWidth = global.cam_width;

if instance_exists(objCam)
{
	//Detection Line
	var detect_line;
	switch(eSpawn_oneOff_vertical)
	{
	case false://Spawns when meeting with the line horizontally
		detect_line = collision_rectangle(x+eSpawn_oneOff_spawning_offset,
		y-viewHeight*2,
		x+eSpawn_oneOff_spawning_offset+64,
		y+viewHeight*2,objCam,false,true);
	break;
	
	case true://Spawns when meeting with the line vertically
		detect_line = collision_line(x-viewWidth*2,
		y+eSpawn_oneOff_spawning_offset,x+viewWidth*2,
		y+eSpawn_oneOff_spawning_offset+64,objCam,false,true);
	break;
	}

	if detect_line && alarm_get(0) < 1
	{
		alarm[0] = 1
	}

}

#endregion