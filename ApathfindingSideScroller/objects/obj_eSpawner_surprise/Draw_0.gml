/// @description Insert description here
// You can write your code in this editor
if global.debugger_enable_detect_show == true
{
	
var viewHeight = global.cam_height;
var viewWidth = global.cam_width;
switch(eSpawn_oneOff_vertical)
	{
	case false:
		draw_rectangle(x+eSpawn_oneOff_spawning_offset,
		y-viewHeight*2,
		x+eSpawn_oneOff_spawning_offset+64,
		y+viewHeight*2,true);
	break;
	
	case true:
		draw_rectangle(x-viewWidth*2,
		y+eSpawn_oneOff_spawning_offset,x+viewWidth*2,
		y+eSpawn_oneOff_spawning_offset+64,true);
	break;
	}

if eSpawn_child !=0
draw_text(x,y,object_get_name(eSpawn_child));
}