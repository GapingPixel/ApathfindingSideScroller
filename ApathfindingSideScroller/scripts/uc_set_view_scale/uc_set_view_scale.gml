/// @desc uc_set_view_scale
/// @param scale
/// @param (optional)view_scale_acceleration
function uc_set_view_scale() {

	var scale = argument[0];
	if (argument_count==2) var acc = argument[1];

	/*
		Setter of the view_scale_target variable. It will make view_scale approach at scale_acceleration.
		The view_scale will multiply the current width and height of the view.
		Also the given scale value can not be above the max limit neither under the min limit.
	
		Arguments:
			- scale (real): Value scale we want to multiply the size of the width for.
			(Optional)
			- acceleration (real): Value between 0 and 1 that sets the how fast the camera reaches the target size.
	
		Returns:
			- This script returns no value.
	*/


	// Check if the Camera instance exists. If not, give a message error and exit the script.
	if (!instance_exists(Camera)) {
		uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
		exit;
	}

	// Check if the given scale is in between the boundaries. If not, it clamps the value.
	if (scale>Camera.view_scale_max_limit || scale<Camera.view_scale_min_limit) {
		uc_error_message("CODE 02 - The given parameter (scale) is outside the boundaries. Value got clamped.");
		scale = clamp(scale, Camera.view_scale_min_limit, Camera.view_scale_max_limit);
	}

	// Check if we have a valid cam view_scale_acceleration.
	if (argument_count==2) {
		if (acc>1 || acc<0) {
			uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
			acc = clamp(acc, 0, 1);
		}
	}

	// Sets the view_scale and view_scale_acceleration values.
	Camera.view_scale_target = scale;
	if (argument_count==2) Camera.view_scale_acceleration = acc;


}
