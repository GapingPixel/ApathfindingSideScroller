/// @description Checks if mouse is detected
function mouse_on_screen() {
	return (mouse_x >=  global.cam_x && mouse_x <= global.cam_x + global.cam_width)
	&& (mouse_y >= global.cam_y && mouse_y <= global.cam_y + global.cam_height)



}
