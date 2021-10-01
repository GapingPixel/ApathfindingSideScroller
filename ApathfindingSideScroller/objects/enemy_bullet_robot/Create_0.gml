/// @description Call paritcles and junk
event_inherited();
image_speed = 0.5;

var room_state = global.game_room_state
if room_state = roomState.Flight
	{
		image_xscale *= 0.5;	
		image_yscale *= 0.5;
	}

//particle_scr_enemy_robot_bullet();

var bullet_burst_inner = part_type_create();
	part_type_sprite(bullet_burst_inner,spr_effect_shape_octagon,0,0,0);
	part_type_size(bullet_burst_inner,0.50,0.50,0.01,0);
	part_type_color3(bullet_burst_inner,8454143,16777088,16777215);
	part_type_blend(bullet_burst_inner,1);
	part_type_life(bullet_burst_inner,5,0);


var	bullet_burst_outer = part_type_create();
	part_type_sprite(bullet_burst_outer,spr_effect_elec_shock,1,0,0);
	part_type_size(bullet_burst_outer,0.50,0.50,0,0);
	part_type_speed(bullet_burst_outer,20,0,0,0);
	part_type_color2(bullet_burst_outer,c_aqua,c_white);
	part_type_direction(bullet_burst_outer,0,359,0,0);
	part_type_orientation(bullet_burst_outer,0,0,0,0,1);
	part_type_blend(bullet_burst_outer,1);
	part_type_life(bullet_burst_outer,5,0);

for(var i = 0; i < 8; i++)
{
	part_type_direction(bullet_burst_outer,i*45,0,0,0);
	part_particles_create(global.parsys,
	x,
	y,
	bullet_burst_outer,1);
}
	
	part_particles_create(global.parsys,
	x,
	y,
	bullet_burst_inner,5);