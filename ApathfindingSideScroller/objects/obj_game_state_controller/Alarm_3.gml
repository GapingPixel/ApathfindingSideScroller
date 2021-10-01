/// @description Generate Results Page

#region//Pause and get screen shot
/*audio_group_set_gain(audiogroup_sfx_UI,master_vol_sfx,1);
	
part_system_automatic_update(parsys,false);
part_system_automatic_update(parsys_below,false);
part_system_automatic_update(parsys_high,false);
part_system_automatic_update(parsys_deep,false);
if(!sprite_exists(screenshot))
   {
        screenshot = sprite_create_from_surface(application_surface,
		0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,0,0,0);
   }*/

#endregion
//create the results object
game_state_controller_var_show_results = true;

with(parPlyr)
	plyr_state = playerState.disable;
	
instance_create_layer(global.cam_x,global.cam_y,"Menu",obj_UI_results);