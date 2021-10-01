/// @description Insert description here
// You can write your code in this editor
if env_heat_value >= 1 and env_dur > 0 and in_view()
{
scr_env_damage(0.05,1,false);
scr_bullet_dmg_env(0.001,1,false);
scr_bullet_dmg_env_solids(0.001,1,false);
scr_bullet_dmg_env_platforms(0.001,1,false);
part_particles_create(global.parsys, 
dand_pos_x + random_range(-75,75), 
dand_pos_y + random_range(-75,75), 
part_var_env_combust_flame,5);
    if object_state = objectState.normal
    {
        object_state = objectState.onFire
		part_particles_create(global.parsys,dand_pos_x,dand_pos_y,part_var_env_combust_spark_point,20);
		part_particles_create(global.parsys,dand_pos_x,dand_pos_y,part_var_env_combust_spark_ignite,5);
        
        scr_play_sound(snd_common_fire_ignite_2,0,0.9,1.1);
        alarm[1] = 10;
		alarm[2] = 90;//Begin burning away
    }
}
