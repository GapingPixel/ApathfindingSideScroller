if in_view()
{
if object_state = objectState.onFire
{
part_particles_create(global.parsys,x,y-(sprite_height/2),part_var_env_combust_smoke,round(5*image_yscale));
part_particles_create(global.parsys,x,y-(sprite_height/2),part_var_env_combust_embers,round(15*image_yscale));

scr_play_sound(snd_common_fire_sizzle,0,0.9,1.1);
}
else
{
	part_type_size(part_var_env_combust_spark_ignite,0.15*image_xscale,0.15*image_yscale,0,0);
	part_type_color3(part_var_env_combust_spark_ignite,c_white,c_gray,c_white);
	part_particles_create(global.parsys,x,y-(sprite_height/2),part_var_env_combust_spark_ignite,1);
}
part_particles_create(global.parsys,x,y-(sprite_height/2),part_var_env_combust_grass_bits,round(10*image_yscale));
scr_play_sound(snd_common_grass_cut,0,0.95,1.05);
}
scr_env_drop_goods();

