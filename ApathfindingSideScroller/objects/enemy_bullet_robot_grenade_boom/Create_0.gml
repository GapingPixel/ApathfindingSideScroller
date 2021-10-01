/// @description Call paritcles and junk
event_inherited();
particle_scr_big_booms();
part_type_alpha1(part_var_bigBoom_smoke,0.25);
scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
particle_scr_eff_boom(1);
alarm[0] = 20;
image_xscale = 2
image_yscale = 2
image_alpha = 0;