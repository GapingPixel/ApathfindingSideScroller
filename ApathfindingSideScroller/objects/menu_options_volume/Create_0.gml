//Our menu options
event_inherited();
menu[0] = scr_get_string(62);//Music
menu[1] = scr_get_string(63);//Sound
menu[2] = scr_get_string(21);//Back

vol[0] = (global.settings_master_vol_music); 
vol[1] = (global.settings_master_vol_sfx);


menu_spacing = 64;

slide = 0; //variable for sliding volume

//effects for sliders
for (var a = 0; a <= 1; a++)
{
menu_effect_left_arrow_pulse_frame[a] = 0;
menu_effect_right_arrow_pulse_frame[a] = 0;
}



