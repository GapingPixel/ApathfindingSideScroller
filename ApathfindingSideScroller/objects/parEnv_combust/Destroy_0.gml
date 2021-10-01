//Big Smoke Poof and embers
if object_state = objectState.onFire
{

scr_play_sound(snd_common_fire_sizzle,0,0.9,1.1);
part_particles_create(global.parsys,x,y,part_var_env_combust_embers,15);
part_particles_create(global.parsys,x,y,part_var_env_combust_smoke,5);
}
else
{
	part_type_color1(part_var_env_combust_spark_ignite,c_white);
	part_type_size(part_var_env_combust_spark_ignite,0.5*image_xscale,0.5*image_yscale,0,0);
	part_particles_create(global.parsys,x,y,part_var_env_combust_spark_ignite,1);
}
scr_env_drop_goods();


