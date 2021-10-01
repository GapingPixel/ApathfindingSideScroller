/// @description Consecutive Booms
var boom_x, boom_y;
boom_x = random_range(x-(sprite_width/3),x+(sprite_width/3))
boom_y = random_range(y-(sprite_height/3),y+(sprite_height/3))
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_smoke,30);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_sphere,1);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_stars,15);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_sparks,15);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_spikes,16);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_strips,8);
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_burst,3);
//audio_play_sound(snd_chem_blast,0,0);
if in_view()
alarm[9] = choose(10,15);

