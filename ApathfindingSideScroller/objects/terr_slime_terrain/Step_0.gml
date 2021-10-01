/// @description Update Slime

//Set to destroy state
if (env_dur < 0)
{
	part_particles_create(global.parsys_high,x,y + random_range(-100,100),part_var_env_slime_messy_splatter,30);
	for(var s = 0; s <= 50; s++)
	{
		part_particles_create(global.parsys,x + random_range(-5,5),y + random_range(-10,10),part_var_env_slime_globs,1);
	}
	instance_destroy();
}

if image_blend != c_white
{
part_particles_create(global.parsys_high,
x+random_range(-25,25)
,y+random_range(-sprite_height/2,sprite_height/2),
part_var_env_slime_globs,3);
}

