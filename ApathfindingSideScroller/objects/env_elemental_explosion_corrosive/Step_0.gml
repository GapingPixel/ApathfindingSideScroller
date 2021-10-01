/// @description Particles and Damage
part_particles_create(global.parsys,
x+random_range(-sprite_width/4,sprite_width/4),
y+random_range(-sprite_height/4,sprite_height/4),
part_var_elemExplosion_corr,
5);

if image_xscale < 5
	image_xscale += 0.1;


if image_yscale < 5
	image_yscale += 0.1;
	
image_alpha -= 0.05;


