///Check Controllers
function scr_check_controllers() {
	var type = async_load[? "event_type"];
	var gp_index = async_load[? "pad_index"];

	if type = "gamepad_discovered"
	{
		show_debug_message("Controller Connected: " + string(gp_index));
	}
	if type = "gamepad lost"
	{
		show_debug_message("Controller Disconnected: " + string(gp_index));
		//Pause the Game when we lose a controller
		with(obj_game_state_controller)
		{
			alarm[0] = 1;	
		}
	}


}
