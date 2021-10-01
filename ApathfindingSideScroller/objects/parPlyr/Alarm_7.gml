/// @description Win Animation Alarm
var gs = global.game_room_state;

switch(gs)
{
	default:
		plyr_anim_win(char_id)
	break;
	
	case roomState.Flight:
		plyr_anim_flight_win(char_id);
	break;
	
}
