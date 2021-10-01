event_inherited();
var end_of_menu = array_length(menu) - 1
if menu_enable
{
menu_move = 0;
//Moving Cursor Up or Down

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

//Alter Display when option is selected
//Push Left or Right
if menu_pos < end_of_menu
{
slide = 0
slide -= menu_input_LEFT
slide += menu_input_RIGHT


    if slide != 0 || menu_push = 1
    {
        switch(menu_pos)
        {
        case 0:
		#region//Fullscreen Mode
            audio_play_sound(snd_UI_menu_cursor_move,0,false);
            if slide != 0 || menu_push = 1
            {
                if !global.settings_fullscreen
                {
                    window_set_fullscreen(true)
					menu[1] = scr_get_string(67);//Change Text
                    global.settings_fullscreen = true;
                }
                else
                {
                    window_set_fullscreen(false)
					menu[1] = scr_get_string(65);//Change Text
                    global.settings_fullscreen = false;
                }
            }
			
			//Effects
			if slide = 1
			menu_effect_right_arrow_pulse_frame[0] = 1;
			else if slide = -1
			menu_effect_left_arrow_pulse_frame[0] = 1;
		#endregion
        break;
        
        case 1: 
		#region//Resolution
            audio_play_sound(snd_UI_menu_cursor_move,0,false);
            global.settings_res_main += slide;
            if global.settings_res_main <= -2//control
                global.settings_res_main = -2
            if global.settings_res_main >= 4
                global.settings_res_main = 4
			
			#region//Resolution Change
            switch(global.settings_res_main)
            {
            case -2:
                global.settings_res_W = 800;
                global.settings_res_H = 480;
            break;
            
            case -1:
                global.settings_res_W = 1024;
                global.settings_res_H = 768;
            break;
            
            case 0://base
                global.settings_res_W = 1280;
                global.settings_res_H = 720;
            break;
            
            case 1:
                global.settings_res_W = 1366;
                global.settings_res_H = 768;
            break;
            
            case 2:
                global.settings_res_W = 1440;
                global.settings_res_H = 1050;
            break;
            
            case 3:
                global.settings_res_W = 1600;
                global.settings_res_H = 900;
            break;
            
            case 4:
                global.settings_res_W = 1920;
                global.settings_res_H = 1080;
            break;
            }
			#endregion
			
			//Effects
			if slide = 1
			menu_effect_right_arrow_pulse_frame[1] = 1;
			else if slide = -1
			menu_effect_left_arrow_pulse_frame[1] = 1;
            
            scr_game_set_resolution();
		#endregion
        break;
        
        case 2: 
		#region//AntiAliasing
            audio_play_sound(snd_UI_menu_cursor_move,0,false);
            if (slide == -1 && global.settings_aa != 0) && (slide == 1 && global.settings_aa != 8)
			{
				if (global.settings_aa <= 8 && global.settings_aa >= 0)
	            {
	                global.settings_aa += 2 * slide;
	            }
	            if (global.settings_aa < 0) //control
	                global.settings_aa = 0;
	            if (global.settings_aa > 8) //control
	                global.settings_aa = 8;
			}
            display_reset(global.settings_aa,global.settings_vsync);
			
			//Effects
			if slide = 1
			menu_effect_right_arrow_pulse_frame[2] = 1;
			else if slide = -1
			menu_effect_left_arrow_pulse_frame[2] = 1;
            scr_game_set_resolution();
			#endregion
        break;
        
        case 3:
		#region//Vsync
            audio_play_sound(snd_UI_menu_cursor_move,0,false);
            if slide != 0
            {
                if !global.settings_vsync
                {
                    global.settings_vsync = true;
                    display_reset(global.settings_aa,global.settings_vsync);
                }
                else
                {
                    global.settings_vsync = false;
                    display_reset(global.settings_aa,global.settings_vsync);
                }
            }
            scr_game_set_resolution();
			
			//Effects
			if slide = 1
			menu_effect_right_arrow_pulse_frame[3] = 1;
			else if slide = -1
			menu_effect_left_arrow_pulse_frame[3] = 1;
		#endregion
        break;
        
        case 4:
		#region//Screen Shake
            audio_play_sound(snd_UI_menu_cursor_move,0,false);
            global.settings_screen_shake += (slide * 0.25);
			if global.settings_screen_shake < 0
				global.settings_screen_shake = 0
			if global.settings_screen_shake > 1
				global.settings_screen_shake = 1
            
			//Effects
			if slide = 1
			menu_effect_right_arrow_pulse_frame[4] = 1;
			else if slide = -1
			menu_effect_left_arrow_pulse_frame[4] = 1;
		#endregion
        break;
        }
        scr_game_save_settings();
    }
	else//Reset Effects of Arrows
	{
		for(var a = 0; a <= 4; a++)
		{
			menu_effect_left_arrow_pulse_frame[a] = 0;
			menu_effect_right_arrow_pulse_frame[a] = 0;
		}
	}
}

	if (menu_push == 1 && menu_pos == end_of_menu)//Begin transition when option is selected
	{
	    audio_play_sound(snd_UI_menu_cursor_select,0,false);
	    alarm[2] = 5;
	}


    //Immediate Quit
    if menu_backout == 1
    {
        audio_play_sound(snd_UI_menu_cursor_cancel,0,false);
		menu_pos = 5;
        alarm[2] = 1;
        scr_game_save_settings();
    }

}

//Text for bools
var on_string = scr_get_string(5);
var off_string = scr_get_string(6);

if global.settings_fullscreen
    dis_fs = on_string;
else
    dis_fs = off_string;

if global.settings_vsync
    dis_vsync = on_string;
else
    dis_vsync = off_string;



