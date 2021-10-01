/// @description Spawn Slime Mold enemy

if enemy_hp > 0
{
	particle_scr_eff_enemy_germ_boom(10,1);
	
	if enemy_child != 0
	{
	var inst = instance_create_depth(x,y-80,depth-1,enemy_child);
	inst.image_xscale = image_xscale;
	}
}
else
{
	particle_scr_eff_enemy_germ_boom(5,1);
}



