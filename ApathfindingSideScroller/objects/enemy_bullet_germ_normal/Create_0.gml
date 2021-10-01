/// @description Call paritcles and junk
event_inherited();
image_yscale = 0;


var slime_bullet = part_type_create();
part_type_sprite(slime_bullet,spr_effect_liq_splatter_vert,1,1,0);
part_type_size(slime_bullet,1,1,0,0);
part_type_scale(slime_bullet,1,1);
part_type_color3(slime_bullet,65280,8453888,8454143);
part_type_alpha1(slime_bullet,1);
part_type_speed(slime_bullet,1,5,0,0);
part_type_direction(slime_bullet,0,359,0,0);
part_type_orientation(slime_bullet,0,0,0,0,1);
part_type_blend(slime_bullet,0);
part_type_life(slime_bullet,15,0);


part_particles_create(global.parsys,x,y,slime_bullet,15);