/// @description Revive
if !playerAngel_var_revive && playerAngel_var_hold_delay < 5 && !place_meeting(x,y,parSolid)
{
part_particles_clear(part_var_playerAngel_sparkles)
playerAngel_var_revive = true;


if global.player_count < 2
	global.player_count++

image_index = 0;
switch(global.character[playerAngel_var_plyr_id])
{
	
	case 0: sprite_index = p1_angel_thankyou; break;
	case 1: sprite_index = p2_angel_thankyou; break;
}
image_speed = 0.25;

for(var i = 0; i < 25; i++)//Bing
{
part_type_direction(part_var_playerAngel_bing,i*15,0,0,0)
part_particles_create(global.parsys_below,x,y,part_var_playerAngel_bing,1)
}


part_particles_create(global.parsys,x,y,part_var_playerAngel_burst,1)

for(var i = 1; i < 8; i++)//Halo Pieces
{
part_type_direction(part_var_playerAngel_halo,0,180,0,0)
part_particles_create(global.parsys,x,y-45,part_var_playerAngel_halo,2);
}

part_particles_create(global.parsys,x,y,part_var_playerAngel_halo_orb,1);

}