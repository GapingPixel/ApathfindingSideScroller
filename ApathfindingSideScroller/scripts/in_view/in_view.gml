function in_view() {
	//Checks for object in camera view
	return (x >= global.cam_x && x <= global.cam_x + global.cam_width)
	&& (y >= global.cam_y && y <= global.cam_y + global.cam_height)



}
