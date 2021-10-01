/// @description - - CAMERA SIZE AND MOVEMENT

// Calculate the time factor
time_factor = delta_time * BASE_FPS / 1000000;

// ==============================================================
// -------------------------------------------	CAMERA TARGET	-----------------------------------------
// ==============================================================
#region Calculate the movement of the camera

// Here we will be calculating the point target the camera will follow
// the target of the camera will change depenging of the camera mode.
switch (cam_mode) {
	
	#region Static
	// Static mode will make the camera stay still.
	case CMODE.STATIC:
		// Once the target has been calculate approach the camera X and Y coordinates up to the desired point.
		target_x = global.cam_x + global.cam_width/2;
		target_y = global.cam_y + global.cam_height/2;
		x = uc_fixed_lerp(x, target_x, cam_static_acceleration);
		y = uc_fixed_lerp(y, target_y, cam_static_acceleration);
		
	break; 
	#endregion

	#region Object Following Horizontally
	// Object Following mode will make the camera focus the average
	// position of all the instances within the cam_following list.
	case CMODE.OBJECT_FOLLOWING_H:
	
		if (ds_list_size(cam_following_list)) {	
			// Firstly we reset the center point and the average distance to the center.
			target_x = 0;
			target_y = 0;
			avg_dis_to_center = 0;
		
			// Next we iterate through all the instances on the list checking if it exits
			// then we add it position to the target and we increment the divisor.
			var f_size = ds_list_size(cam_following_list);
			var divisor = 0;
		
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					target_x += cam_following_list[|i].x;	
					target_y += cam_following_list[|i].y;
					divisor++;
				}
			}
		
			// Once we added all the coordinates of the instances in the list we
			// divide it by the number of valid instances on the list.
			if divisor {
				target_x /= divisor;
				target_y /= divisor;
			}
		
			// Now we calculate the average distance from each instance to the middle point.
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					avg_dis_to_center += point_distance(target_x, target_y, cam_following_list[|i].x, cam_following_list[|i].y)*(1/divisor);
				}
			}
		}
		
		// Once the target has been calculate approach the camera X and Y coordinates up to the desired point.
		if target_x > view_width/2 && target_x < room_width - view_width/2
		x = uc_fixed_lerp(x, target_x, cam_object_following_acceleration);
		else if target_x < view_width/2
		x = uc_fixed_lerp(x, view_width/2, cam_object_following_acceleration);
		else if target_x > room_width - view_width/2
		x = uc_fixed_lerp(x, room_width - view_width/2, cam_object_following_acceleration);
		
		break; 
	#endregion
	
	#region Object Following Veritcally
	// Object Following mode will make the camera focus the average
	// position of all the instances within the cam_following list.
	case CMODE.OBJECT_FOLLOWING_V:
	
		if (ds_list_size(cam_following_list)) {	
			// Firstly we reset the center point and the average distance to the center.
			target_x = 0;
			target_y = 0;
			avg_dis_to_center = 0;
		
			// Next we iterate through all the instances on the list checking if it exits
			// then we add it position to the target and we increment the divisor.
			var f_size = ds_list_size(cam_following_list);
			var divisor = 0;
		
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					target_x += cam_following_list[|i].x;	
					target_y += cam_following_list[|i].y;
					divisor++;
				}
			}
		
			// Once we added all the coordinates of the instances in the list we
			// divide it by the number of valid instances on the list.
			if divisor {
				target_x /= divisor;
				target_y /= divisor;
			}
		
			// Now we calculate the average distance from each instance to the middle point.
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					avg_dis_to_center += point_distance(target_x, target_y, cam_following_list[|i].x, cam_following_list[|i].y)*(1/divisor);
				}
			}
		}
		
		target_x = cam_box_id.x + cam_box_id.sprite_width/2
		x = uc_fixed_lerp(x, target_x, cam_object_following_acceleration);
		
		//Vertical scrolling depending on rectangle collision with player object
		var plyr = parPlyr
		
		if cam_box_id != 0
		{
			var box_x = cam_box_id.x;
			var box_y = cam_box_id.y;
			var box_y_end = cam_box_id.sprite_height
			
			
			//Lerp x value to center of box
			var box_middle = cam_box_id.x + cam_box_id.sprite_width/2
			x = uc_fixed_lerp(x, box_middle, cam_object_following_acceleration);
			
			//Check when we are halfway to the top of a room to set camera's y coordinate to 0
			var check_player_above_end = collision_rectangle(box_x,
			box_y
			,box_x + global.cam_width, 
			box_y + global.cam_height - (global.cam_height/4),
			plyr,
			false,true);
			
			var check_player_above = collision_rectangle(box_x,
			box_y - global.cam_height,
			box_x + global.cam_width, 
			global.cam_y + (global.cam_height/4),plyr,
			false,true);
		
			var check_player_below = collision_rectangle(global.cam_x,
			global.cam_y + (global.cam_height) - (global.cam_height/3),
			global.cam_x + global.cam_width,
			global.cam_y + room_height,
			plyr,
			false,true);
			
			var check_player_below_end = collision_rectangle(box_x,
			box_y + box_y_end,
			box_x + global.cam_width,
			box_y + box_y_end - (global.cam_height/4),
			plyr,
			false,true);
		
			//Check when we are halfway to the bottom of a room to set camera's y coordinate to room's room_height - cam_height/2
			/*var check_player_below_end = collision_rectangle(global.cam_x,
			global.cam_y - global.cam_height,
			global.cam_x + global.cam_width, 
			global.cam_y + (global.cam_height/2),
			plyr,false,true);*/
		
			//Reduce cam shift speed a bit for vertical camera
			var accel_manipulation = 1.75;
		
			if instance_exists(plyr)
			{
					if (check_player_above || check_player_below) && !check_player_above_end && !check_player_below_end
					{
						if target_y > view_height/2 && target_y < room_height - view_height/2
						y = uc_fixed_lerp(y, target_y, cam_object_following_acceleration/accel_manipulation);
						if target_y < box_y + view_height
						y = uc_fixed_lerp(y, box_y + view_height, cam_object_following_acceleration/accel_manipulation);
						else if target_y > room_height - view_height/2
						y = uc_fixed_lerp(y, room_height- view_height/2, cam_object_following_acceleration/accel_manipulation);
					}
					
					if check_player_above_end
					{
						var top_end_of_box = cam_box_id.y + global.cam_height/2;
						y = uc_fixed_lerp(y, top_end_of_box, cam_object_following_acceleration);
					}
				
					
					if check_player_below_end
					{
						var bottom_end_of_box = cam_box_id.y + cam_box_id.sprite_height - global.cam_height/2;
						y = uc_fixed_lerp(y, bottom_end_of_box, cam_object_following_acceleration);
					}
					
					/*if check_player_above_halfway && target_y < box_y + view_height
							y = uc_fixed_lerp(y, box_y + view_height/2, cam_object_following_acceleration/2);
			
					if check_player_below_halfway && target_y > (room_height) - view_height/2
							y = uc_fixed_lerp(y, room_height - view_height/2, cam_object_following_acceleration/2);*/
					
			}
	
		}
		break; 
		
		#endregion
	
	#region Object Following within a Boxed area
	// Object Following mode will make the camera focus the average
	// position of all the instances within the cam_following list.
	case CMODE.OBJECT_FOLLOWING_BOX:
	
		if (ds_list_size(cam_following_list)) {	
			// Firstly we reset the center point and the average distance to the center.
			
			target_x = 0;
			target_y = 0;
			avg_dis_to_center = 0;
		
			// Next we iterate through all the instances on the list checking if it exits
			// then we add it position to the target and we increment the divisor.
			var f_size = ds_list_size(cam_following_list);
			var divisor = 0;
		
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					target_x += cam_following_list[|i].x;	
					target_y += cam_following_list[|i].y;
					divisor++;
				}
			}
		
			// Once we added all the coordinates of the instances in the list we
			// divide it by the number of valid instances on the list.
			if divisor {
				target_x /= divisor;
				target_y /= divisor;
			}
		
			// Now we calculate the average distance from each instance to the middle point.
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					avg_dis_to_center += point_distance(target_x, target_y, cam_following_list[|i].x, cam_following_list[|i].y)*(1/divisor);
				}
			}
		}
		
		var plyr = parPlyr;
		if cam_box_id != 0
		{
			var box_x = cam_box_id.x;
			var box_y = cam_box_id.y;
			var box_y_end = cam_box_id.sprite_height;
			var box_x_end = cam_box_id.sprite_width;
			
		// Once the target has been calculate approach the camera X and Y coordinates up to the desired point.
		if target_x > (view_width/2) && target_x < room_width - view_width/2
		x = uc_fixed_lerp(x, target_x, cam_object_following_acceleration);
		else if target_x < view_width/2
		x = uc_fixed_lerp(x, view_width/2, cam_object_following_acceleration);
		else if target_x > room_width - view_width/2
		x = uc_fixed_lerp(x, room_width - view_width/2, cam_object_following_acceleration);
		
		
		
		
		//Reduce cam shift speed a bit for vertical camera
		var accel_manipulation = 1.75;
		
		//Detection when we are meeting to the very top
		var check_player_at_top = collision_rectangle(box_x,
		box_y
		,box_x + box_x_end, 
		box_y + view_height/2,
		plyr,
		false,true)
		||
		collision_rectangle(box_x,
		box_y
		,box_x + view_width/2, 
		box_y + view_height,
		plyr,
		false,true) ||
		collision_rectangle(box_x + box_x_end - view_width/2,
		box_y
		,box_x + box_x_end, 
		box_y + view_height,
		plyr,
		false,true);
		
		//Detection when we are meeting to the very bottom
		var check_player_at_bottom = collision_rectangle(box_x,
		box_y + box_y_end - view_height/2,
		box_x + box_x_end,
		box_y + box_y_end,
		plyr,
		false,true) ||
		collision_rectangle(box_x,
		box_y + box_y_end - view_height,
		box_x + view_width/2,
		box_y + box_y_end,
		plyr,
		false,true) ||
		collision_rectangle(box_x + box_x_end - view_width/2,
		box_y + box_y_end - view_height,
		box_x + box_x_end,
		box_y + box_y_end,
		plyr,
		false,true);
		
		if !check_player_at_top && !check_player_at_bottom
		{
		if target_y > box_y + view_height/2 && target_y < box_y_end - view_height/2
		y = uc_fixed_lerp(y, target_y, cam_object_following_acceleration/accel_manipulation);
		if target_y < box_y + view_height/2
		y = uc_fixed_lerp(y, box_y + view_height/2, cam_object_following_acceleration/accel_manipulation);
		else if target_y > box_y_end - view_height/2
		y = uc_fixed_lerp(y, box_y_end - view_height/2, cam_object_following_acceleration/accel_manipulation);
		}
		
		
		if check_player_at_top
		{
			var top_end_of_box = cam_box_id.y + view_height/2;
			y = uc_fixed_lerp(y, top_end_of_box, cam_object_following_acceleration);
		}
				
					
		if check_player_at_bottom
		{
			var bottom_end_of_box = (cam_box_id.y + cam_box_id.sprite_height) - view_height/2;
			y = uc_fixed_lerp(y, bottom_end_of_box, cam_object_following_acceleration);
		}

		
		}
	break; 
	#endregion
	
	#region Object Following (For Maps)
	// Object Following mode will make the camera focus the average
	// position of all the instances within the cam_following list.
	case CMODE.OBJECT_FOLLOWING:
	
		if (ds_list_size(cam_following_list)) {	
			// Firstly we reset the center point and the average distance to the center.
			
			target_x = 0;
			target_y = 0;
			avg_dis_to_center = 0;
		
			// Next we iterate through all the instances on the list checking if it exits
			// then we add it position to the target and we increment the divisor.
			var f_size = ds_list_size(cam_following_list);
			var divisor = 0;
		
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					target_x += cam_following_list[|i].x;	
					target_y += cam_following_list[|i].y;
					divisor++;
				}
			}
		
			// Once we added all the coordinates of the instances in the list we
			// divide it by the number of valid instances on the list.
			if divisor {
				target_x /= divisor;
				target_y /= divisor;
			}
		
			// Now we calculate the average distance from each instance to the middle point.
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					avg_dis_to_center += point_distance(target_x, target_y, cam_following_list[|i].x, cam_following_list[|i].y)*(1/divisor);
				}
			}
		}
		
		
		
		// Once the target has been calculate approach the camera X and Y coordinates up to the desired point.
		if target_x > view_width/2 && target_x < room_width - view_width/2
		x = uc_fixed_lerp(x, target_x, cam_object_following_acceleration);
		else if target_x < view_width/2
		x = uc_fixed_lerp(x, view_width/2, cam_object_following_acceleration);
		else if target_x > room_width - view_width/2
		x = uc_fixed_lerp(x, room_width - view_width/2, cam_object_following_acceleration);
		
		
		if target_y > view_height/2 && target_y < room_height - view_height/2
		y = uc_fixed_lerp(y, target_y, cam_object_following_acceleration);
		if target_y < view_height/2
		y = uc_fixed_lerp(y, view_height/2, cam_object_following_acceleration);
		else if target_y > room_height - view_height/2
		y = uc_fixed_lerp(y, room_height- view_height/2, cam_object_following_acceleration);
		
		// Once the target has been calculate approach the camera X and Y coordinates up to the desired point.
		x = uc_fixed_lerp(x, target_x, cam_object_following_acceleration);
		y = uc_fixed_lerp(y, target_y, cam_object_following_acceleration);
		
		break; #endregion
	
}

#endregion

// ==============================================================
// -------------------------------------------	CAMERA EFFECTS	-----------------------------------------
// ==============================================================
#region Calculate all the camera effects

// ------------------------------ View Scale and Auto-Scale -------------------------------

// Approach the camera to the target scale.
view_scale = uc_fixed_lerp(view_scale, view_scale_target, view_scale_acceleration);

// Calculate the auto scaling.
var target_auto_view_scale = view_auto_scale_enabled?clamp((1 + avg_dis_to_center*view_auto_scale_factor),view_scale_min_limit, view_scale_max_limit):1;
view_auto_scale = uc_fixed_lerp(view_auto_scale, target_auto_view_scale, view_scale_acceleration);

// Get the total multiplier
view_total_scale = view_scale*view_auto_scale

// ------------------------------------- Camera Rotation -------------------------------------
view_inclination += uc_fixed_lerp(0, angle_difference(view_inclination_target, view_inclination), view_inclination_acceleration);
view_inclination = view_inclination%360;
view_inclination_target = view_inclination_target%360;


// -------------------------------------------- Shake ---------------------------------------------

// Calculate the shaking.
if shake_enable {
	shake_enable = false;
	shake_current = shake_intensity;
}

if bounce_enable {
	bounce_enable = false;
	bounce_current = bounce_intensity;
}

if wiggle_enable {
	wiggle_enable = false;
	wiggle_current = wiggle_intensity;
}

var shake_dir = random(365);
var shake_x = lengthdir_x(shake_current*view_total_scale, shake_dir);
var wiggle = lengthdir_x(wiggle_current*view_total_scale, shake_dir);
var shake_y = lengthdir_y(shake_current*view_total_scale, shake_dir);
var bounce = lengthdir_y(bounce_current*view_total_scale, shake_dir);
shake_current = uc_fixed_lerp(shake_current, 0, shake_acceleration);
bounce_current = uc_fixed_lerp(bounce_current, 0, shake_acceleration);
wiggle_current = uc_fixed_lerp(wiggle_current, 0, shake_acceleration);

// -------------------------------------------- Hit --------------------------------------------------
hit_length = max(0,hit_length+hit_intensity*time_factor);
if (abs(hit_length)>hit_recovery) {
	hit_intensity = hit_intensity-hit_recovery*time_factor;
} else {
	hit_intensity = 0;	
	hit_length = 0;
}

var hit_x = lengthdir_x(hit_length*view_total_scale, hit_direction);
var hit_y = lengthdir_y(hit_length*view_total_scale, hit_direction);

// --------------------- Apply all the effect to the current view ------------------------

// Now join all the different effects to calculate the view position and size
// relative to the camera position
view = view_camera[0];
primitive_view_x = x-view_width*view_total_scale/2+shake_x+hit_x+wiggle;
primitive_view_y = y-view_height*view_total_scale/2+shake_y+hit_y+bounce;

camera_set_view_pos(view, primitive_view_x, primitive_view_y);
camera_set_view_size(view, view_width*view_total_scale, view_height*view_total_scale);
camera_set_view_angle(view, view_inclination);

view_x = x-((x-primitive_view_x)*dcos(-view_inclination) - (y-primitive_view_y)*dsin(view_inclination));
view_y = y-((x-primitive_view_x)*dsin(-view_inclination) - (y-primitive_view_y)*dcos(view_inclination));

#endregion

// ==============================================================
// -----------------------------------------------	DEBUG MODE	-----------------------------------------
// ==============================================================
#region Manage the debug mode

// Enabel and unable the debug mode
if keyboard_check_pressed(vk_f1) && global.debugger_enabled == true {
	uc_set_debug_mode(!uc_get_debug_mode());
}

#endregion