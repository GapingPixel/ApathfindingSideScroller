/// @description Damaging when hot
if env_heat_value >= 1
{
scr_env_damage(0.6 * (env_heat_value/10),1,false);
part_particles_create(global.parsys, 
x + random_range(-50,50), 
y + random_range(-50,50), 
part_var_env_combust_flame,2);
    if object_state = objectState.normal
    {
        object_state = objectState.onFire;
        scr_play_sound(snd_common_fire_ignite_1,0,0.9,1.1)
		part_particles_create(global.parsys,x,y,part_var_env_combust_spark_point,20);
		part_particles_create(global.parsys,x,y,part_var_env_combust_spark_ignite,5);
		alarm[1] = 10;//Begin burning away
        alarm[2] = 90;//Begin burning away
    }
}

