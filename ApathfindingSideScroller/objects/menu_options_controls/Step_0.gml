event_inherited();
var end_of_menu_row = array_length(menu) - 1;
var end_of_menu_col = array_length(menu[0]);
if menu_enable
{

//Moving Cursor Up or Down
menu_move[0] = 0;
menu_move[0] -= menu_input_UP;
menu_move[0] += menu_input_DOWN;

//Moving Cursor Left or Right
menu_move[1] = 0;
menu_move[1] -= menu_input_LEFT;
menu_move[1] += menu_input_RIGHT;

if menu_move[0] != 0
{
    menu_pos[0] += menu_move[0];//Update cursor position to moving value
    audio_play_sound(snd_UI_menu_cursor_move,0,false);
    if (menu_pos[0] < 0)//If statement to prevent oob error for array length (below 0)
        menu_pos[0] = end_of_menu_row;
        
    if (menu_pos[0] > end_of_menu_row)//If statement to prevent oob error for array length (above menu array)
    {   
		menu_pos[0] = 0;
		
		if menu_pos[1] > 0
			menu_pos[1] = 0
	}
	
	//Shift Column away from empty arrays
	if menu_pos[0] > 1 and menu_pos[1] = 0
	{
		menu_pos[1] = 1	
	}
	
	//Shift Column away from empty arrays
	if menu_pos[0] < 2 and menu_pos[1] > 0
	{
		menu_pos[0] = 0
	}
	
	if menu_pos[0] = 0 and menu_pos[1] > 0
	{
		menu_pos[1] = 0
	}
}

if menu_move[1] != 0
{
    menu_pos[1] += menu_move[1];//Update cursor position to moving value
    audio_play_sound(snd_UI_menu_cursor_move,0,false);
    if (menu_pos[1] < 0)//If statement to prevent oob error for array length (below 0)
        menu_pos[1] = end_of_menu_col;
        
    if (menu_pos[1] > end_of_menu_col)//If statement to prevent oob error for array length (above menu array)
        menu_pos[1] = 0;
	
	//Shift Row away from empty arrays
	if menu_pos[1] = 0 and menu_pos[0] > 1
		menu_pos[0] = 1
	
	if menu_pos[0] = 0
		menu_pos[0] = 1
}

if (menu_push == 1)//Begin transition when option is selected
{
    audio_play_sound(snd_UI_menu_cursor_select,0,false);
	
	//Create Rebind prompt
	if menu_pos[1] > 0 and menu_pos[0] > 2
	{
	var rb = instance_create_layer(x,y,"Menu",menu_options_rebind_controls)
	rb.rebind_type = menu_pos[1]
	rb.rebind_action = menu_pos[0];
	rb.rebind_playerID = player_id;
	menu_enable = false;//Disable Menu
	}
	else//Other Toggles
    alarm[2] = 1;
}


//Immediate Back Out
if menu_backout = 1
    {
        audio_play_sound(snd_UI_menu_cursor_cancel,0,false);
		menu_pos[0] = 0;
		menu_pos[1] = 0;
        alarm[2] = 1
    }
}

