/// @description - - DRAW THE DEBUG IN ROOM

// Draw the debug over all things
depth = -9999;

// ==============================================================
// ------------------------	DRAW THE DEBUG INSIDE THE ROOM	-------------------------------
// ==============================================================
#region Draw all the debug elements that are inside the room

// Basic drawing settings
draw_set_font(fnt_debug);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

if (camera_debug_mode) {
	
	// Draw the target
	var t_size = 6;
	
	draw_set_color(c_white);
	draw_set_alpha(.5);
	
	if (uc_get_mode()!=CMODE.MOUSE_BORDERS) {
		var tx = uc_get_target_x();
		var ty = uc_get_target_y();
	}
	
	for ( var i=0; i<5 ; i++ ) { // This for is made for drawing with size
		draw_circle(tx, ty, t_size-0.2*i, true);	
	}
	draw_line_width(tx-t_size+1, ty, tx+t_size-1, ty, 1);
	draw_line_width(tx, ty-t_size+1, tx, ty+t_size-1, 1);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	// Draw the position of the camera
	var c_size = 3;
	var c_color = c_white;
	draw_circle_color( x, y, c_size, c_color, c_color, false);
	
	
	if (uc_get_mode() = CMODE.OBJECT_FOLLOWING_V)
	{
		if cam_box_id != 0
		{
		draw_rectangle(global.cam_x,
		cam_box_id.y,
		global.cam_x + global.cam_width, 
		global.cam_y + (global.cam_height/4),true);
		
		draw_rectangle(global.cam_x,
		global.cam_y + (global.cam_height) - (global.cam_height/3),
		global.cam_x + global.cam_width,
		global.cam_y + room_height,true);
		}
		
	}

}

#endregion