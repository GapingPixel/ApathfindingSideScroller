/// @description Revive After Effect
if playerAngel_var_revive
	for(var i = 0; i < 24; i++)//Halo Pieces
	{
	part_type_direction(part_var_playerAngel_smoke_poof,i*15,0,0,0)
	part_particles_create(global.parsys,x,y,part_var_playerAngel_smoke_poof,1);
	}