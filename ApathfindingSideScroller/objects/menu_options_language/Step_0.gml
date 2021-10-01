/// @description Insert description here
// You can write your code in this editor
event_inherited();
var end_of_menu = array_length(menu) - 1;
if menu_enable
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
        menu_pos = end_of_menu;
        
    if (menu_pos > end_of_menu)//If statement to prevent oob error for array length (above menu array)
        menu_pos = 0;
}

slide = 0
slide -= menu_input_LEFT;
slide += menu_input_RIGHT;

if menu_pos < 1
{
    if slide != 0
    {  
        switch(menu_pos)
        {
            case 0:
			#region//Toggle Language
            audio_play_sound(snd_UI_menu_cursor_move,0,false);
			global.settings_language += slide;
			
            if global.settings_language < 0 
                global.settings_language = 4;
			 if global.settings_language > 5
                global.settings_language = 0;
			
			menu[0] = scr_get_string(70);
			
			//Effects
			if slide = 1
			menu_effect_right_arrow_pulse_frame[0] = 1;
			else if slide = -1
			menu_effect_left_arrow_pulse_frame[0] = 1;
			#endregion
            break;
        }  
        scr_game_save_settings();
    }
	else//Reset Effects of Arrows
	{
		menu_effect_left_arrow_pulse_frame[0] = 0;
		menu_effect_right_arrow_pulse_frame[0] = 0;
	}
}

if (menu_push == 1 && menu_pos == 1)//Begin transition when option is selected
{
    
    audio_play_sound(snd_UI_menu_cursor_select,0,false);
    menu_enable = false;
    alarm[2] = 1;
}


//Immediate Quit
if (menu_backout == 1)
    {
        audio_play_sound(snd_UI_menu_cursor_cancel,0,false);
		menu_pos = 1;
        alarm[2] = 1;
    }
}