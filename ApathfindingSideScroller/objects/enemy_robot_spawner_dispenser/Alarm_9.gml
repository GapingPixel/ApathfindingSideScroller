
/// @description Consecutive Booms
var boom_x, boom_y;
boom_x = random_range(x-(sprite_width/4),x+(sprite_width/4))
boom_y = random_range(y-(sprite_height/4),y+(sprite_height/4))
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_smoke,30);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_sphere,1);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_stars,15);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_sparks,15);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_spikes,16);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_strips,8);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_burst,3);
scr_play_sound(snd_common_explosion_popcorn_1,0,0.9,1.1);
if in_view()
alarm[9] = choose(10,15);