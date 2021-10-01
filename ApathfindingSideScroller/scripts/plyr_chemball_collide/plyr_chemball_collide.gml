function plyr_chemball_collide(argument0, argument1) {
	//Combine Chemical Ball with element to make chemical
	/*
	arg0 = atom_x
	arg1 = active
	*/
	var atom = argument0;
	var act = argument1;
	var ball;//variable to consider which player ball hit the target
	var inst;//instance of atom


	if act = 1
	ball = chemball_p1;
	else
	ball = chemball_p2;

	if (atom != 0 && ball.chemball_single_hold != 0 && ball.cb_state = ballState.THROW)
	{
	scr_game_parry_hitstun();
	if act = 1//go to p1
	image_blend = make_color_rgb(200,200,255);
	if act = 2
	image_blend = make_color_rgb(255,200,200);
	//audio_sound_pitch(snd_plyr_extraction,1.4);
	//audio_play_sound(snd_plyr_extraction,0,0);
	inst = instance_change(atom,true);
	/*inst.active = act;
	inst.image_angle = 0;
	inst.image_blend = image_blend;
	inst.gravity = 0;
	inst.hspeed = 0;
	inst.vspeed = 0;
	inst.image_xscale = 1;
	inst.image_yscale = 1;*/

	global.counter_extractions += 1;
	with(ball)
	{
	if ball = chemball_p1
	image_blend = make_color_rgb(200,200,255);
	else
	image_blend = make_color_rgb(255,200,200);
	inst = instance_change(chemball_single_hold,true);
	/*inst.active = 1;
	inst.image_angle = 0;
	inst.image_alpha = 1;
	inst.image_blend = image_blend;
	inst.gravity = 0;
	inst.hspeed = 0;
	inst.vspeed = 0;
	inst.image_xscale = 1;
	inst.image_yscale = 1;
	inst.depth = -4;*///make it slower
	}

	}




}
