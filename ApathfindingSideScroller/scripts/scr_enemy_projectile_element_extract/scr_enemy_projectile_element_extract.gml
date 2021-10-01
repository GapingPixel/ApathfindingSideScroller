/// @description Alters bullet into element when hit with extractor shot
function scr_enemy_projectile_element_extract(argument0, argument1) {
	/*
	arg0 = atom_x
	arg1 = active variable, 1 for p1 2 for p2
	*/
	var inst;
	var atom = argument0;
	var act = argument1;

	if atom != 0
	{
	instance_destroy(other);
	scr_game_parry_hitstun();
	if act = 1//go to p1
	image_blend = make_color_rgb(200,200,255);
	if act = 2
	image_blend = make_color_rgb(255,200,200);
	//audio_sound_pitch(snd_plyr_extraction,random_range(1.1,1.15));
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
    
	}



}
