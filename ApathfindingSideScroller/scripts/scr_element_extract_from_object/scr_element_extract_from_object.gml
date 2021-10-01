/// @description Alters bullet into element when hit with extractor shot
function scr_element_extract_from_object(argument0, argument1) {
	/*
	arg0 = atom_x
	arg1 = active variable, 1 for p1 2 for p2
	*/
	var inst;
	instance_destroy(other);

	inst = instance_create_depth(x+random_range(-(sprite_width/4),(sprite_width/4)),
	y+random_range(-sprite_height/4,sprite_height/4),-1,argument0);
	inst.active = argument1;
	inst.image_angle = 0;
	if argument1 = 1//go to p1
	inst.image_blend = make_color_rgb(200,200,255);
	if argument1 = 2//go to p2
	inst.image_blend = make_color_rgb(255,200,200);
	inst.gravity = 0;
	inst.hspeed = 0;
	inst.vspeed = 0;
	inst.image_xscale = 1;
	inst.image_yscale = 1;
    




}
