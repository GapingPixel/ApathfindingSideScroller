/// @description Call paritcles and junk
event_inherited();
image_speed = 0.5;
scr_play_sound(snd_common_attack_bullet_1,0,1,1);
gravity = 0.4;
gravity_direction = 270;


particle_scr_big_booms();

part_var_enemy_robot_volley_trail = part_type_create();
part_type_sprite(part_var_enemy_robot_volley_trail,spr_effect_shape_donut,1,0,1);
part_type_size(part_var_enemy_robot_volley_trail,0.25,0.5,0,0.10);
part_type_scale(part_var_enemy_robot_volley_trail,1,1);
part_type_color3(part_var_enemy_robot_volley_trail,16777088,65408,8421631);
part_type_alpha2(part_var_enemy_robot_volley_trail,1,0);
part_type_speed(part_var_enemy_robot_volley_trail,0.00,0,0,0);
part_type_direction(part_var_enemy_robot_volley_trail,0,0,0,0);
part_type_orientation(part_var_enemy_robot_volley_trail,0,0,0,0,1);
part_type_blend(part_var_enemy_robot_volley_trail,0);
part_type_life(part_var_enemy_robot_volley_trail,30,0);
//emitter1 = part_emitter_create(Sname);
