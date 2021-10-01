/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
env_dur = 12;
env_material_brittle = false; //Not brittle
skeleton_animation_set("0_normal");

//Extra Paritcles
part_var_terrain_dandelions = part_type_create();
part_type_sprite(part_var_terrain_dandelions,spr_effect_dandelion_seed,0,0,0);
part_type_alpha3(part_var_terrain_dandelions,1,1,0);
part_type_speed(part_var_terrain_dandelions,6,10,0,0);
part_type_direction(part_var_terrain_dandelions,0,359,0,0);
part_type_gravity(part_var_terrain_dandelions,0.10,270);
part_type_orientation(part_var_terrain_dandelions,0,359,1,0,0);
part_type_blend(part_var_terrain_dandelions,0);
part_type_life(part_var_terrain_dandelions,240,0);
//50

dand_pos_x = 0;
dand_pos_y = 0;
