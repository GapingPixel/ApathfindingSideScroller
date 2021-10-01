/// @description Particles and Damage

part_particles_create(global.parsys_below,x,y,part_var_elemExplosion_elec_core,1);
part_particles_create(global.parsys,
x+random_range(-sprite_width/4,sprite_width/4),
y+random_range(-sprite_height/4,sprite_height/4),
part_var_elemExplosion_elec_outter,20);


image_blend = choose(c_lime,c_aqua,c_yellow);

if image_xscale < 3
image_xscale += 0.25;


if image_yscale < 3
image_yscale += 0.25;


switch(object_state)
{
	case objectState.normal:
		image_alpha -= 0.01;
		if image_alpha <= 0
			instance_destroy();
	break;
	
	case objectState.electrified:
		if image_alpha < 0.25
			image_alpha += 0.05;
	break;
}

