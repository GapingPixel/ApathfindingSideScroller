/// @description Call paritcles and junk
event_inherited();
image_speed = 0.5;

var room_state = global.game_room_state
if room_state = roomState.Flight
	{
		image_xscale *= 0.75;	
		image_yscale *= 1;
	}
else
	{
		image_xscale *= 1;
		image_yscale *= 2;
	}

//particle_scr_enemy_robot_bullet();