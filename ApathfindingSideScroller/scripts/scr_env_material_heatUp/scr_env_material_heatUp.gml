// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_env_material_heatUp(hit,dmg){

//Script that manages heating metal

if object_state != objectState.wet
{
	if hit.env_heat_value < 0 
	{hit.env_heat_value = 0} 
			
	hit.env_heat_value += 1//Add Heat
	
	if hit.env_heat_value >= 1 && hit.env_heat_value < 10//Radiate Sound
	{
		scr_play_sound(snd_common_energy_radiate,0,hit.env_heat_value/2,hit.env_heat_value/2);
		particle_scr_eff_burst(hit,1);
	}
	else if hit.env_heat_value >= 5//Damage when Hot
	{
		if dmg > 0.01//Prevent audio from Enviromental objects
		scr_bullet_env_hit(hit);
		//dmg *= 0.2;//take more dmg when hot
	}
	else if hit.env_heat_value <= -5//Damage when cold
	{
		if dmg > 0.01//Prevent audio from Enviromental objects
		scr_bullet_env_hit(hit);
		//dmg *= 1.5;//take more damage when cold
	}
}

}