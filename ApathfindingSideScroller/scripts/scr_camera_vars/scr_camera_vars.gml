////Script for setting Global camera variables
function scr_camera_vars() {
	/*
	We will always be using the default camera which is 0 in GMS

	*/

	//globalvar cam, cam_x, cam_y, cam_width, cam_height;

	//Getting camera view
	global.cam = view_get_camera(0);

	//x and y
	global.cam_x = camera_get_view_x(global.cam);
	global.cam_y = camera_get_view_y(global.cam);

	//Camera width and height
	global.cam_width = camera_get_view_width(global.cam);
	global.cam_height = camera_get_view_height(global.cam);


}
