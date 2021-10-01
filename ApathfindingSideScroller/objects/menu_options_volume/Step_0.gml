event_inherited();
if menu_enable
{
menu_move = 0;
//Moving Cursor Up or Down
menu_move -= menu_input_UP;
menu_move += menu_input_DOWN;

//Play Test Music   
    if(menu_pos = 0)
    {
        if !audio_is_playing(msc_test)
            audio_play_sound(msc_test,0,true);
    }
    else
    {
        if audio_is_playing(msc_test)
            audio_stop_sound(msc_test);
    }

var arrayLength = array_length(menu) - 1;
if menu_move != 0
{
    menu_pos += menu_move;//Update cursor position to moving value
    audio_play_sound(snd_UI_menu_cursor_move,0,false);
    if (menu_pos < 0)//If statement to prevent oob error for array length (below 0)
        menu_pos = arrayLength;
        
    if (menu_pos > arrayLength)//If statement to prevent oob error for array length (above menu array)
        menu_pos = arrayLength;
}
//Slide Volume Options
//Push Left or Right
slide = 0
slide -= menu_input_LEFT;
slide += menu_input_RIGHT;

if menu_pos < 2
{
    if slide != 0
    {  
        switch(menu_pos)
        {
            case 0:
			#region//Music
            audio_play_sound(snd_UI_menu_cursor_move,0,false);
            if (global.settings_master_vol_music <= 1 && global.settings_master_vol_music >= 0)
                global.settings_master_vol_music += (0.1 * slide); 
            if global.settings_master_vol_music <= 0
                global.settings_master_vol_music = 0;
            if global.settings_master_vol_music >= 1
                global.settings_master_vol_music = 1;

            vol[0] = global.settings_master_vol_music;
            audio_group_set_gain(audiogroup_default,global.settings_master_vol_music,1);
			
			//Effects
			if slide = 1
			menu_effect_right_arrow_pulse_frame[0] = 1;
			else if slide = -1
			menu_effect_left_arrow_pulse_frame[0] = 1;
			#endregion
            break;
            
            case 1:
			#region//SFX
            audio_play_sound(snd_UI_menu_cursor_move,0,false);
            if (global.settings_master_vol_sfx <= 1 && global.settings_master_vol_sfx >= 0)
                global.settings_master_vol_sfx += (0.1 * slide); 
            if global.settings_master_vol_sfx <= 0
                global.settings_master_vol_sfx = 0;
            if global.settings_master_vol_sfx >= 1
                global.settings_master_vol_sfx = 1;
                
            vol[1] = global.settings_master_vol_sfx;
            scr_game_set_sfx_group_gain();
			
			//Effects
			if slide = 1
			menu_effect_right_arrow_pulse_frame[1] = 1;
			else if slide = -1
			menu_effect_left_arrow_pulse_frame[1] = 1;
			#endregion
            break;
        }  
        scr_game_save_settings();
    }
	else//Reset Effects of Arrows
	{
		for(var a = 0; a <= 1; a++)
		{
			menu_effect_left_arrow_pulse_frame[a] = 0;
			menu_effect_right_arrow_pulse_frame[a] = 0;
		}
	}
}

if (menu_push == 1 && menu_pos == 2)//Begin transition when option is selected
{
    audio_play_sound(snd_UI_menu_cursor_select,0,false);
    alarm[2] = 5;
}

    //Immediate Quit
    if menu_backout == 1
    {
        menu_pos = 2;
        alarm[2] = 1;
    }

}

