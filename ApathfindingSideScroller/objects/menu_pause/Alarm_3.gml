/// @description Retry Alarm or Go To Title
var room_state = global.game_room_state

if room_state != roomState.Map
room_restart();
//else
//room_goto(room_title_screen);
