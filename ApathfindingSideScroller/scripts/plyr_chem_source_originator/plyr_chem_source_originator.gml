function plyr_chem_source_originator(argument0) {

	var origin = argument0;
	var scl;
	var room_state = global.game_room_state;
	var mixture = global.player_active_mixture[origin];
	var typing = global.player_weapon_slot[origin][mixture][3]
	//scale down based on level base
	if room_state = roomState.Flight
	scl = 0.75;
	else
	scl = 1;

	if origin = 0 //player 1
	{
	image_xscale = chem_source_p1.image_xscale * scl;
	image_yscale = chem_source_p1.image_yscale * scl;
	image_angle = chem_source_p1.image_angle;
	bullet_id = 0;
	bullet_type = typing;
	}
	
	if origin = 1 //player 2
	{
	image_xscale = chem_source_p2.image_xscale * scl;
	image_yscale = chem_source_p2.image_yscale * scl;
	image_angle = chem_source_p2.image_angle;
	bullet_id = 1
	bullet_type = typing;
	}


}
