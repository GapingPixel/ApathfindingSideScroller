/// @description script handles activation/deactivation of enemy/object intstances when in view
function scr_object_activation() {

	var left, top, right, bottom;

	left = global.cam_x - (128);//Left of view
	top = global.cam_y - (192);//Top of view
	right = global.cam_width + (128);//Right of view
	bottom = global.cam_height + (192);//Bottom of view


	//Seperate activation for hazzards and environment platforms
	var left_2, top_2, right_2, bottom_2;

	left_2 = global.cam_x - (global.cam_width*2);//Left of view
	top_2 = global.cam_y - (global.cam_height*2);//Top of view
	right_2 = global.cam_width + (global.cam_width*2);//Right of view
	bottom_2 = global.cam_height + (global.cam_height*2);//Bottom of view
	
	if global.game_state != GameState.paused && global.game_state != GameState.inSuper
	{
	        instance_deactivate_object(parSolidMoving);
			instance_deactivate_object(parJumpThruMoving);
			instance_deactivate_object(obj_env_platforms);
			instance_deactivate_object(obj_env_solids_wj);
	        instance_deactivate_object(obj_env_solids);
			instance_deactivate_object(obj_env);
			instance_deactivate_object(obj_eSpawner_oneOff);
	        instance_activate_region(left_2,top_2,right_2,bottom_2,true);
	
	
	
	        //instance_deactivate_object(obj_spawn_parent);
			instance_deactivate_object(obj_enemy_major);
			instance_deactivate_object(obj_enemy_major_Element);
			//instance_deactivate_object(parNanoModule);
	        instance_activate_region(left,top,right,bottom,true);
	}



}
