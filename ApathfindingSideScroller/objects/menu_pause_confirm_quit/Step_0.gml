event_inherited();
if enable
{
menu_move = 0;
//Moving Cursor Left or right
menu_move -= menu_input_UP;
menu_move += menu_input_DOWN;


if menu_move != 0
{
    menu_pos += menu_move;//Update cursor position to moving value
    audio_play_sound(snd_UI_menu_cursor_move,0,false);

    if (menu_pos < 0)//If statement to prevent oob error for array length (below 0)
        menu_pos = 1;
        
    if (menu_pos > 1)//If statement to prevent oob error for array length (above menu array)
        menu_pos = 0;
}




if (menu_push == 1)//Begin transition when option is selected
{
    audio_play_sound(snd_UI_menu_cursor_select,0,false);
    if menu_pos = 0
    {
    menu_enable = false;
    alarm[2] = room_speed;
    }
    else
    alarm[2] = 1;

}
}

//Immediate Quit
if menu_backout
    {
        audio_play_sound(snd_UI_menu_cursor_cancel,0,false);
		menu_pos = 1;
        alarm[2] = 1
    }

