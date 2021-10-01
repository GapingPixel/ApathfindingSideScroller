//Our menu options
event_inherited();
menu[0] = scr_get_string(17);//Audio
menu[1] = scr_get_string(18);//Visual
menu[2] = scr_get_string(19);//Language
menu[3] = scr_get_string(20);//Control Setup
menu[4] = scr_get_string(21)//Back

menu_spacing = 64;
menu_offset = -128;

menu_enable = false; //enable after time passes
alarm[0] = 5;


for (var a = 0; a <= 3; a++)
{
menu_effect_left_arrow_pulse_frame[a] = 0;
menu_effect_right_arrow_pulse_frame[a] = 0;
}
