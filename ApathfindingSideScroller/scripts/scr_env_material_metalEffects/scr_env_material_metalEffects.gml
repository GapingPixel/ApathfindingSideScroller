// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_env_material_metalEffects(partDrawVar){

/*
partDrawVar
value to determine how we draw particles

*/
var xOff, yOff;
var sW = sprite_get_width(sprite_width);
var sH = sprite_get_height(sprite_height);

switch(partDrawVar)
{
	default://None
	xOff = random_range(-sW/2,sW/2);
	yOff = random_range(-sH/2,sH/2);
	break
	
	case 1://Platforms
	xOff = random_range(-sW/3,sW/3);
	yOff = random_range(-sH/3,sH/3);
	break;
	
	case 2://Blocks
	xOff = random_range(-sW/4,sW/4);
	yOff = random_range(-sH/4,sH/4);
	break;
	
}


#region Conduction

//Hot
if env_heat_value >= 3
{
part_particles_create(global.parsys_below,x+xOff,y+yOff,part_var_env_metal_radiate_hot,15);

/*if partDrawVar = 2//For blocks and solids
{
part_particles_create(global.parsys,x+sW/4,y+random_range(-sH/4,sH/4),part_var_env_metal_radiate_hot,5);
part_particles_create(global.parsys,x-sW/4,y+random_range(-sH/4,sH/4),part_var_env_metal_radiate_hot,5);
}*/

//Fire Damage
scr_env_damage(0.05,1,false);
scr_bullet_dmg_env(0.005,1,false);
scr_bullet_dmg_env_solids(0,1,false);
scr_bullet_dmg_env_platforms(0,1,false);
}

//Cold
if env_heat_value <= -3
{
part_particles_create(global.parsys_below,x+xOff,y+yOff,part_var_env_metal_radiate_cold,15);

/*if partDrawVar = 2//For blocks and solids
{
part_particles_create(global.parsys,x+sW/4,y+random_range(-sH/4,sH/4),part_var_env_metal_radiate_cold,5);
part_particles_create(global.parsys,x-sW/4,y+random_range(-sH/4,sH/4),part_var_env_metal_radiate_cold,5);
}*/

//Ice Damage
scr_env_damage(0.05,2,false);
scr_bullet_dmg_env(0.5,2,false);
scr_bullet_dmg_env_solids(0.5,2,false);
scr_bullet_dmg_env_platforms(0.5,2,false);
}

//Shocked
if object_state = objectState.electrified
{
	part_particles_create(global.parsys_below,
	x+random_range(-sW/3,sW/3),
	y+random_range(-sH/3,sH/3),
	part_var_env_metal_electric_shock,15);
	
	//Electric Damage
	scr_env_damage(0.1,8,false);
	scr_bullet_dmg_env(0.05,8,false);
	scr_bullet_dmg_env_solids(0.05,8,false);
	scr_bullet_dmg_env_platforms(0.05,8,false);
}

#endregion

#region Destruction particles and sound
var col;//Color of metal
if env_heat_value < -5
		col = c_aqua;
else if env_heat_value > 5
		col = c_orange;
else
		col = c_white;

part_type_color1(part_var_env_metal_bits,col);//Color of metal

if env_dur <= 0
{
part_particles_create(global.parsys,x,y,part_var_env_metal_bits,round(abs(30*image_yscale)));
part_particles_create(global.parsys,x,y,part_var_env_metal_smoke,round(abs(15*image_yscale)));
part_particles_create(global.parsys,x,y,part_var_env_metal_burst,1);

scr_play_sound(snd_common_metal_break,30,0.9,1.1);
uc_bounce(10);
instance_destroy();
}
#endregion

}