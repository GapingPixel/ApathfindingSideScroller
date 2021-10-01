var bullet_impact = part_type_create();
part_type_sprite(bullet_impact,spr_effect_shape_disk,0,0,0);
part_type_size(bullet_impact,0.10,0.10,0,0.10);
part_type_scale(bullet_impact,1,1);
part_type_color3(bullet_impact,65280,8454016,32768);
part_type_alpha2(bullet_impact,1,0);
part_type_speed(bullet_impact,4,6,0,0);
part_type_direction(bullet_impact,0,359,0,0);
part_type_gravity(bullet_impact,0,270);
part_type_orientation(bullet_impact,0,0,0,0,1);
part_type_blend(bullet_impact,1);
part_type_life(bullet_impact,30,0);

part_particles_create(global.parsys,x,y,bullet_impact,50);

