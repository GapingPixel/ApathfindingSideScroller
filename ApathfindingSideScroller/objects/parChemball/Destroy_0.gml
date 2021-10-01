/// @description 
/// @description Develop explosion according to type
if instance_exists(chemball_player_parent)
{
if cb_state = ballState.THROW
{
audio_play_sound(snd_plyr_chemball_impact,0,0);

    switch(bullet_type)
    {
        case 0://Explosion
            instance_create_depth(x,y,0,env_elemental_explosion_explo);
        break;
        
        case 1://Flame
            if object_state = objectState.normal
			instance_create_depth(x,y,0,env_elemental_explosion_fire);
			//else
			//part_particles_create(global.parsys,x,y,part_var_chemball_smoke,25);
        break;
        
        case 2://Cyro
            instance_create_depth(x,y,0,env_elemental_explosion_ice);
        break;
    
        case 3://Salt
            instance_create_depth(x,y,0,env_elemental_explosion_salt);
        break;
        
        case 4://Corrosive
            instance_create_depth(x,y,0,env_elemental_explosion_corrosive);
        break;
		
		case 9://Water
            instance_create_depth(x,y,0,env_elemental_explosion_water);
        break;
    }
}

part_particles_create(global.parsys,x,y,part_var_chemball_impact_1,30);
part_particles_create(global.parsys,x,y,part_var_chemball_impact_2,30);

}
