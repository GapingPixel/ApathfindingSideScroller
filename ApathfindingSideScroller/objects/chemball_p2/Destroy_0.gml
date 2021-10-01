/// @description Develop explosion according to type
/*if instance_exists(obj_plyr2)
{
if cb_state = ballState.throw
{
audio_play_sound(snd_plyr_chemball_impact,0,0);
    switch(chemball_type)
    {
        case 0://Explosion
            instance_create_depth(x,y,0,chemball_explosion_explo);
        break;
        
        case 1://Flame
            if !bullet_wet
			instance_create_depth(x,y,0,chemball_explosion_flame);
			else
			part_particles_create(global.parsys,x,y,part_var_chemball_smoke,25);
        break;
        
        case 2://Cyro
            instance_create_depth(x,y,0,chemball_explosion_cryo);
        break;
    
        case 3://Salt
            instance_create_depth(x,y,0,chemball_explosion_salt);
        break;
        
        case 4://Corrosive
            instance_create_depth(x,y,0,chemball_explosion_corrosive);
        break;
		
		case 9://Water
            instance_create_depth(x,y,0,chemball_explosion_water);
        break;
    }
}

part_particles_create(global.parsys,x,y,part_var_chemball_impact_1,30);
part_particles_create(global.parsys,x,y,part_var_chemball_impact_2,30);

}*/
event_inherited();

/* */
/*  */
