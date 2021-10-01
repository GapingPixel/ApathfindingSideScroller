// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_env_material_electrify(hit)
{
			//Produce electric field
			if hit.object_state != objectState.electrified && hit.env_heat_value > -5
			{
				particle_scr_eff_burst(hit,5);
				with(hit)
				{
				object_state = objectState.electrified;
				scr_play_sound(snd_common_electric_explosion_1,0,1,1.1)
				alarm[2] = 180;	
				}
			}
}