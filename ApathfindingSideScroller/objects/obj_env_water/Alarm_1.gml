/// @description Particles

//if in_view()
{
	if env_ph_value > -5
	part_particles_create(global.parsys,x+random_range(0,sprite_width),y,part_var_env_water_clean_twinkle,1);
	else
	part_particles_create(global.parsys,x+random_range(0,sprite_width),y,part_var_env_water_acid_aroma,1);
	
}
alarm[1] = choose(10,20,30,40,50,60);