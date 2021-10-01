/// @description Insert description here
// You can write your code in this editor

image_xscale += 0.25;
image_yscale += 0.25;


var part_var_icebreath = part_type_create();
part_type_sprite(part_var_icebreath,spr_effect_smoke_small,1,0,1);
part_type_size(part_var_icebreath,0.10,0.50,0,0);
part_type_scale(part_var_icebreath,1,1);
part_type_color3(part_var_icebreath,16777088,16744448,16711680);
part_type_alpha1(part_var_icebreath,1);
part_type_speed(part_var_icebreath,5,0,0,0);
part_type_direction(part_var_icebreath,0,359,20,0);
part_type_gravity(part_var_icebreath,0,270);
part_type_orientation(part_var_icebreath,0,0,0,0,1);
part_type_blend(part_var_icebreath,1);
part_type_life(part_var_icebreath,10,15);
part_particles_create(global.parsys,
x+random_range(-sprite_width/2,sprite_width/2),
y+random_range(-sprite_width/2,sprite_width/2),part_var_icebreath,3)
