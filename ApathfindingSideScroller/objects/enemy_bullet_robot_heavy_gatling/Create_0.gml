event_inherited();
atom = atom_k
ini = false;
dmg = 2;


var bang = part_type_create();
part_type_sprite(bang,spr_effect_shape_oval,0,0,0);
part_type_size(bang,0.10,0.10,0,0);
part_type_scale(bang,1,1.50);
part_type_color3(bang,65535,8454143,65535);
part_type_alpha2(bang,1,0);
part_type_speed(bang,2,5,0,0);
part_type_direction(bang,0,359,0,0);
part_type_orientation(bang,0,0,0,0,1);
part_type_blend(bang,1);
part_type_life(bang,10,15);
part_particles_create(global.parsys,x,y,bang,50);

scr_play_sound(snd_common_element_shoot_k,10,0.5,0.6)

