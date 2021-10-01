/// @description Damaging when hot
if env_heat_value >= 1
{
scr_env_damage(0.05,1,false);
scr_bullet_dmg_env(0.001,1,false);
scr_bullet_dmg_env_solids(0.001,1,false);
scr_bullet_dmg_env_platforms(0.001,1,false);
part_particles_create(global.parsys, 
x + random_range(-50,50), 
y + random_range(-50*image_yscale,0), 
part_var_env_combust_flame,5);
    if object_state = objectState.normal //Flame Lit
    {
        object_state = objectState.onFire;
		part_particles_create(global.parsys,x,y-sprite_height/2,part_var_env_combust_spark_point,20);
		part_particles_create(global.parsys,x,y-sprite_height/2,part_var_env_combust_spark_ignite,5);
        
        scr_play_sound(snd_common_fire_ignite_1,0,0.9,1.1);
        alarm[1] = 10;
		alarm[2] = 90;//Begin burning away
    }
}

