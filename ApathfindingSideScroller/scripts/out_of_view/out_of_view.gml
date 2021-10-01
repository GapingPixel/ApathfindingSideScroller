function out_of_view(argument0) {
	/*
	@param pixel offset

	*/
	var offset = argument0;
	var left = global.cam_x;
	var right = global.cam_x + global.cam_width;
	var top = global.cam_y;
	var down = global.cam_y + global.cam_height;

	return (x < (left - offset)) ||
		(x > (right + offset)) ||
		(y < (top - offset)) ||
		(y > (down + offset));


}
