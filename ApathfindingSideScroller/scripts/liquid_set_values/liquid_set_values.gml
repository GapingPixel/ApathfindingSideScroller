/// @description liquid_set_values(w, h, nodes, spring, friction, factor, wave, waveamount, wavespeed, sides)
function liquid_set_values(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	/// @param  w
	/// @param  h
	/// @param  nodes
	/// @param  spring
	/// @param  friction
	/// @param  factor
	/// @param  wave
	/// @param  waveamount
	/// @param  wavespeed
	/// @param  sides


	///Set Liquid Values

	waveamount = 0.5;
	move       = false;
	moveSpd    = 0;

	liq_width = argument0 //sprite_width;
	liq_height = argument1 //sprite_height;
	image_xscale = liq_width/sprite_get_width(sprite_index);
	image_yscale = liq_height/sprite_get_height(sprite_index);
	liq_nodes = max(2,floor(argument2));
	liq_nodeWidth = liq_width/liq_nodes-1;
	liq_spring = argument3; //
	liq_friction = argument4; //
	liq_factor = argument5 * 60; //
	liq_wave = argument6; //
	liq_waveAmount = argument7; //
	liq_waveSpd = clamp(argument8, 1, 180);
	liq_waveAngle = 0; //
	liq_sides = argument9; //


	//build nodes
	liquid_build_nodes();


}
