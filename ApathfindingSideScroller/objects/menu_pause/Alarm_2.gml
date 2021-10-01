/// @description Selection switch case
var room_state = global.game_room_state

if room_state != roomState.Map
{
	#region//In Game
	switch(menu_pos)
	{
	case 0://Unpause
	    with(obj_game_state_controller)
			scr_pause();
	break;

	case 1://Restart
		alarm[1] = 15
	break;


	case 2://Options
	    instance_create_layer(x,y,"Menu",menu_options);
	    instance_destroy();
	break;

	case 3://Return to Map
	    instance_create_layer(x,y,"Menu",menu_pause_return_to_map);
	    instance_destroy();
	break;
	}
	#endregion
}
else
{
	#region//In Overworld
	switch(menu_pos)
	{
	case 0://Unpause
	    with(obj_game_state_controller)
			scr_pause();
	break;

	case 1://Options
		instance_create_layer(x,y,"Menu",menu_options);
	    instance_destroy();
	break;


	case 2://Return to Title
	    alarm[1] = 15;
	break;

	case 3://Quit Game
	    instance_create_layer(x,y,"Menu",menu_pause_confirm_quit);
	    instance_destroy();
	break;
	}
	#endregion
	
	
}


