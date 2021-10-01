function plyr_shoot_source_originator(origin) {

	
	var scl;
	var room_state = global.game_room_state;

	//scale down based on room state
	if room_state = roomState.Flight
	scl = 0.75;
	else
	scl = 1;

	if origin = 0 //player 1
	{
	image_xscale = shoot_source_p1.image_xscale * scl;
	image_yscale = shoot_source_p1.image_yscale * scl;
	image_angle = shoot_source_p1.image_angle;
	bullet_id = 0;
	}
	if origin = 1 //player 2
	{
	image_xscale = shoot_source_p2.image_xscale * scl;
	image_yscale = shoot_source_p2.image_yscale * scl;
	image_angle = shoot_source_p2.image_angle;
	bullet_id = 1;
	}


}
