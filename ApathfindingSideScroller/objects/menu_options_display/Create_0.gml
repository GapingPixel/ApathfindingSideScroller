//Our menu options
event_inherited();

menu[0] = scr_get_string(64);//Fullscreen

if !global.settings_fullscreen//String for Resolution or Window Size based on if fullscreen is active
menu[1] = scr_get_string(65);//Window Size
else
menu[1] = scr_get_string(67);//Resolution

menu[2] = scr_get_string(66);//AA
menu[3] = scr_get_string(68);//Vsync
menu[4] = scr_get_string(69);//Screen Shake
menu[5] = scr_get_string(21);//Back
//arrayLength = array_length_1d(menu);
//set for switch case for bools
dis_fs = "";
dis_vsync = "";

slide = 0;

menu_spacing = 64;
menu_offset = -128;


//effects for sliders
for (var a = 0; a <= 4; a++)
{
menu_effect_left_arrow_pulse_frame[a] = 0;
menu_effect_right_arrow_pulse_frame[a] = 0;
}


