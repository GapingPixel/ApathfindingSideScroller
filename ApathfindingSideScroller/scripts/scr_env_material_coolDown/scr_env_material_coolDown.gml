// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_env_material_coolDown(hit, dmg){
	
			//Script that manages cooling metal
			
			if hit.env_heat_value > 0
			{hit.env_heat_value = 0} 
		
			hit.env_heat_value -= 1//Lower Heat
			
			if hit.env_heat_value <= 0 && hit.env_heat_value > -10//Radiate Sound
		    {
				if !audio_is_playing(snd_common_ice_freeze)
				scr_play_sound(snd_common_ice_freeze,0,abs(hit.env_heat_value/2),abs(hit.env_heat_value/2));
				
				particle_scr_eff_burst(hit,2);
		    }
			

}