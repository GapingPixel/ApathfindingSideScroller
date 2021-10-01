with (menu_options_controls) {
///Specific Toggles

if menu_pos[0] = 0 and menu_pos[1] = 0//Return to Options Menu
{
	instance_create_layer(x,y,"Menu",menu_options)
	instance_destroy();
}

if menu_pos[0] = 1 and menu_pos[1] = 0//Change which Player Controls to bind and change string
{
	if player_id == 0
	{player_id = 1; menu[1,0] = scr_get_string(76)}
	else
	{player_id = 0; menu[1,0] = scr_get_string(75)}
}

if menu_pos[0] = 1 and menu_pos[1] = 1//Change Vibration
{
	if global.config_vibration[player_id] = true//Turn Off
		global.config_vibration[player_id] = false
	else//Turn On
	{
		global.config_vibration[player_id] = true
	
		
			gamepad_set_vibration(player_id,0.1,0.1);
	
	}
	scr_game_save_controls();
}

if menu_pos[0] = 1 and menu_pos[1] = 2//Reset Controls
{
	scr_control_reset(player_id);
	scr_game_save_controls();
}


}
