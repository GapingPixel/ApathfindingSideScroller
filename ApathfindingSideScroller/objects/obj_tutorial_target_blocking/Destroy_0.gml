/// @description Kill off

repeat(5)
{
var boom_x, boom_y;
boom_x = random_range(x-(sprite_width/4),x+(sprite_width/4))
boom_y = random_range(y-(sprite_height/4),y+(sprite_height/4))
part_particles_create(global.parsys,boom_x,boom_y,part_var_bigBoom_smoke,30);
}
particle_scr_eff_boom(3);
uc_shake(5);

scr_play_sound(snd_common_ore_explosion,0,1,1)
scr_play_sound(snd_common_explosion_popcorn_2,0,0.5,0.7);

with(tutorial_wall)
{
	instance_destroy();	
}