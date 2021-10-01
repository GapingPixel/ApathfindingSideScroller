/// @description Set variables
event_inherited();
//atom = atom_o;
//dmg = 2;

scr_set_enemy_vars(15,1,1,1,1,1,true,true,true);

//Tier
switch(image_blend)
{
	case c_red://Fire Type
	enemy_def_cyro = 1.5;
	enemy_def_flam = 0.5;
	enemy_def_salt = 1.25;
	enemy_def_corr = 1.25;
	enemy_combustable = false;
	break;
	
	case c_yellow://Electric Type
	enemy_def_cyro = 1.5;
	enemy_def_flam = 0.75;
	enemy_def_salt = 0.25;
	enemy_def_corr = 0.25;
	enemy_shockable = false;
	break;
	
	default://Ice Type
	enemy_def_cyro = 0.5;
	enemy_def_flam = 1.5;
	enemy_def_salt = 1.25;
	enemy_def_corr = 1.25;
	enemy_freezable = false;
	break;
}

image_blend = c_white;

//scr_set_enemy_vars(5,0,1.25,0.5,1,1,false,false,true);
//particle_scr_collect_atoms(c_white);
//particle_scr_element_enemy_oxygen();

//Alarm
//alarm[1] = 60;
vxMax = 2;

enemy_var_target_range = 400;


facing = image_xscale;
enemy_behavior = enemy_PATROL;

//Animation mixing
image_speed = 0.75;



