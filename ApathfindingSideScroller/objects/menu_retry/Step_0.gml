event_inherited();
if menu_enable
{
menu_move = 0;
//Moving Cursor Left or right
menu_move -= menu_input_UP;
menu_move += menu_input_DOWN;

var end_of_array = array_length(menu)
if menu_move != 0
{
    menu_pos += menu_move;//Update cursor position to moving value
    audio_play_sound(snd_UI_menu_cursor_move,0,false);
    if (menu_pos < 0)//If statement to prevent oob error for array length (below 0)
        menu_pos = end_of_array - 1;
        
    if (menu_pos > end_of_array - 1)//If statement to prevent oob error for array length (above menu array)
        menu_pos = 0;
}

if (menu_push == 1)//Begin transition when option is selected
{
    /*switch(menu_pos)
    {
    case 0:
        selection = "retry";
    break;
    
    case 1:
        selection = "quit";
    break;
    }*/
    audio_play_sound(snd_UI_menu_cursor_select,0,false);
    menu_enable = false;
    alarm[1] = room_speed/2;
	alarm[2] = 180;
}

}

/* */
/*  */
