/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var lightningBolt = part_type_create();
part_type_sprite(lightningBolt,spr_effect_elec_lightning,1,0,1);
part_type_size(lightningBolt,1,1,0.01,0.20);
part_type_scale(lightningBolt,2.5,2);
part_type_color3(lightningBolt,c_lime,c_yellow,16777088);
part_type_orientation(lightningBolt,270,0,0,0,1);
part_type_blend(lightningBolt,1);
part_type_life(lightningBolt,1,3);

part_particles_create(global.parsys,x+random_range(-1,1),y,lightningBolt,3);