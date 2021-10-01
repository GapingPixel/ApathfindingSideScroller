/// @description Particles
var bullet_impact = part_type_create();
	part_type_sprite(bullet_impact,spr_effect_elec_shock,1,0,1);
	part_type_size(bullet_impact,1,1,-0.10,0);
	part_type_color3(bullet_impact,16777088,11192063,16777088);
	part_type_alpha1(bullet_impact,1);
	part_type_speed(bullet_impact,5,10,0,0);
	part_type_orientation(bullet_impact,0,0,0,0,1);
	part_type_blend(bullet_impact,1);
	part_type_life(bullet_impact,10,0);

for(var i = 0; i <= 12;i++)
{
	part_type_direction(bullet_impact,i*30,0,0,0);
	part_particles_create(global.parsys,x,y,bullet_impact,1);
}

