function scr_pause() {
	//Handles Pausing
	{
	    switch(global.game_state)
	    {
	    case GameState.play:
	#region//Pause Game
	    global.game_state = GameState.paused;
	    audio_pause_all();
	
		#region Pausing sequences
		if layer_exists("Seq")
		{
			var seq = layer_get_all_elements("Seq")
			for (var i = 0; i < array_length(seq); i++;)
			{
				if layer_get_element_type(seq[i]) == layerelementtype_sequence
				{
					layer_sequence_pause(seq[i])
				}
			}
		}
		#endregion
	
		#region Particles
	    part_system_automatic_update(global.parsys,false);
		part_system_automatic_update(global.parsys_high,false);
	    part_system_automatic_update(global.parsys_below,false);
		part_system_automatic_update(global.parsys_deep,false);
		#endregion
		
		
	    if(!sprite_exists(global.screenshot)) && global.settings_res_main >= 0
	    {
		
			global.screenshot = sprite_create_from_surface(application_surface,
			0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,0,0,0);
	    }
        
    
	    instance_deactivate_all(true);
	    audio_play_sound(snd_UI_menu_pause,0,false);
		instance_create_layer(global.cam_x + global.cam_width/2, global.cam_y + global.cam_height/2,"Menu",menu_pause);
	#endregion
	    break;
    
	    case GameState.paused:
	#region//Unpause Game
	    global.game_state = GameState.play;
		audio_resume_all();
	
		#region Resume sequences
		if layer_exists("Seq")
		{
			var seq = layer_get_all_elements("Seq")
			for (var i = 0; i < array_length(seq); i++;)
			{
				if layer_get_element_type(seq[i]) == layerelementtype_sequence
				{
					layer_sequence_play(seq[i])
				}
			}
		}
		#endregion
	
	
	    part_system_automatic_update(global.parsys,true);
	    part_system_automatic_update(global.parsys_below,true);
		part_system_automatic_update(global.parsys_deep,true);
		part_system_automatic_update(global.parsys_high,true);
	    if (sprite_exists(global.screenshot))
	        sprite_delete(global.screenshot);
    
	    //Activate instances
	    instance_activate_all();
	    instance_activate_region(global.cam_x - (global.cam_width/2), global.cam_y - (global.cam_height/2), global.cam_x + global.cam_width + (global.cam_width/2), global.cam_y + global.cam_height + (global.cam_height/2),true);
	    var room_state = global.game_room_state
		if room_state != roomState.Map
		{
		instance_activate_object(parHUD);
	    instance_activate_object(obj_game_state_controller);
	    instance_activate_object(evflag_parent);
	    instance_activate_object(obj_frameskipx);
	    instance_activate_object(obj_menu_parent);
	    instance_activate_object(parPlyr);
	    instance_activate_object(debugger_main_controller);
		}
    
    
	    with(obj_menu_parent)
	        instance_destroy();
	    //audio_play_sound(snd_pause,100,false);
    #endregion
	    break;
	
		/*default:
	#region//Pause for other reasons
		part_system_automatic_update(global.parsys,false);
		part_system_automatic_update(global.parsys_high,false);
	    part_system_automatic_update(global.parsys_below,false);
		part_system_automatic_update(global.parsys_deep,false);
	    if(!sprite_exists(global.screenshot)) && global.settings_res_main >= 0
	    {
		
			global.screenshot = sprite_create_from_surface(application_surface,
			0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,0,0,0);
	    }
        
	    instance_deactivate_all(true);
	#endregion
		break;*/
	    }
	}



}
