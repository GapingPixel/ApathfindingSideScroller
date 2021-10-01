/// @description Movement
   
var bullet_trail = part_type_create();
	part_type_sprite(bullet_trail,spr_effect_shape_octagon,0,0,0);
	part_type_size(bullet_trail,0.3,0.3,-0.05,0);
	part_type_color3(bullet_trail,16777170,13557503,16777183);
	part_type_alpha1(bullet_trail,1);
	part_type_blend(bullet_trail,0);
	part_type_life(bullet_trail,10,0);  
  
part_particles_create(global.parsys_below,x,y,bullet_trail,1);

if place_meeting(x,y,parSolid)
    instance_destroy();
