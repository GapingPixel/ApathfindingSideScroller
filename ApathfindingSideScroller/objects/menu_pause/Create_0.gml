//Our menu options
event_inherited();

var room_state = global.game_room_state
switch(room_state)
{
default://In Game Pause Menu
menu[0] = scr_get_string(22);//Resume
menu[1] = scr_get_string(24);//Retry
menu[2] = scr_get_string(16);//Options
menu[3] = scr_get_string(23);//Return to Map
break;

case roomState.Map://In Map Menu
menu[0] = scr_get_string(22);//Resume
menu[1] = scr_get_string(16);//Options
menu[2] = scr_get_string(60);//Return to Title
menu[3] = scr_get_string(61);//Quit Desktop
break;
}
//arrayLength = array_length_1d(menu);
menu_spacing = 64;
menu_offset = -64




