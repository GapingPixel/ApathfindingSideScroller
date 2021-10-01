if !ini
{
motion_set(image_angle, 8*image_xscale);
alarm[0] = 65;//destroy alarm
ini = true;
}


var bullet_trail = part_type_create();
part_type_sprite(bullet_trail,spr_effect_shape_disk,0,0,0);
part_type_size(bullet_trail,0.20,0.40,0,0);
part_type_scale(bullet_trail,1,1);
part_type_color3(bullet_trail,65408,8454016,65408);
part_type_alpha2(bullet_trail,0.50,0);
part_type_speed(bullet_trail,0,0,0,0);
part_type_direction(bullet_trail,0,359,0,0);
part_type_gravity(bullet_trail,0.01,270);
part_type_orientation(bullet_trail,0,0,0,0,0);
part_type_blend(bullet_trail,1);
part_type_life(bullet_trail,120,120);

part_particles_create(global.parsys_below,x,y,bullet_trail,1);

