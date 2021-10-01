if !ini
{
var bullet_sway = random_range(-2,2)
motion_set(image_angle+bullet_sway,10*image_xscale);
ini = true;
}


var trail = part_type_create();
	part_type_shape(trail,pt_shape_line);
	part_type_size(trail,0.01,0.50,0.01,1);
	part_type_scale(trail,0.5,0.1);
	part_type_color3(trail,65535,4227327,65535);
	part_type_alpha3(trail,0.50,1,0);
	part_type_blend(trail,1);
	part_type_life(trail,10,0);
	
part_particles_create(global.parsys,x,y,trail,2);

if place_meeting(x,y,parSolid)
    instance_destroy();

scr_bullet_destroy();
