/// @description scr_env_set_vars(durability points, 0 = Wood/Oil/Combustable 1 = Metal 2 = Ice 3 = Water 4 = Fire 5 = Ore/Stone)
/// @param durability points
/// @param  Environemnt_Type;0=Combustable_1=Metal_2=Ice_3=Water_4=Fire_5=Ore_6=Slime
///Set Values for interactable objects
function scr_env_set_vars(durability, envType) {
	
	env_dur = durability;//Durability points for destrucatble objects
	env_dur_MAX = env_dur;//Value to take and determine current durability over time
	env_dur_low = false;//Flag to indicate durability is low
	env_type = envType;//Value to determine environment type
	env_heat_value = 0;//Value to determine temperature of metals
	env_ph_value = 0;//Value to determine pH balance of water
	env_goodies = 0;//Value for objects having goodies like atoms or health
	
	//env_material_onFire = false;//Bool for material being on fire (mainly for Wood / Grass)
	//env_material_electrified = false;//Bool for material being electrified (mainly for Metal)
	
	env_material_brittle = false;//Boolean to check if a material is brittle enough to be destroyed by weak projectiles
	
	//Boolean to run drawing shadows in drawing scripts
	env_draw_shadow = false;
	shadow_y = 10000;
	
	//bullet booleans for when the object becomes an active hitbox to run damage script
	
	/*
	0 = Wood/Oil/Combustable
	1 = Metal
	2 = Ice 
	3 = Water
	4 = Fire
	5 = Ore/Stone
	6 = Slime/Germs
	7 = Pure Electric
	9 = Special / Misc
	*/
	
	//Set Object State
	switch(env_type)
	{
		default: object_state = objectState.normal; break;
		case 2: object_state = objectState.frozen; break;
		case 3: object_state = objectState.wet; break;
		case 4: object_state = objectState.onFire; break;
		case 7: object_state = objectState.electrified; break;
	}

	//Particles (The same as enemies)
	particle_scr_enemy_damage_flame();
	particle_scr_enemy_damage_ice();
	particle_scr_enemy_damage_salt();
	particle_scr_enemy_damage_corrosive();
	particle_scr_enemy_damage_electric();


}
