/// @description Salt kills grenade
var slime_boom = part_type_create();
part_type_sprite(slime_boom,spr_effect_liq_splatter_vert,0,0,0);
part_type_scale(slime_boom,0.10,0.10);
part_type_alpha2(slime_boom,1,0);
part_type_color3(slime_boom,65408,65535,65280);
part_type_direction(slime_boom,0,359,0,0);
part_type_gravity(slime_boom,0.25,270);
part_type_orientation(slime_boom,0,0,0,0,1);
part_type_blend(slime_boom,0);
part_type_speed(slime_boom,6,12,0,0);
part_type_size(slime_boom,0.70,1.25,0.01,1);
part_type_life(slime_boom,30,40);

part_particles_create(global.parsys,x,y,slime_boom,30);

instance_destroy();