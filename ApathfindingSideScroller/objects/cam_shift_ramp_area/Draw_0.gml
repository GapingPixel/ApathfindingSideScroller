/// @description Debug Draw

if uc_get_debug_mode()
{

	
	/*draw_rectangle(global.cam_x,global.cam_y,
	global.cam_x + global.cam_width, global.cam_y + (global.cam_height/4),true);*/
if cam_shift_activated = false
draw_set_color(c_lime);
else
draw_set_color(c_red);

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true)


}