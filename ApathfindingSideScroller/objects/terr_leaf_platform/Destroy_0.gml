/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if in_view()
{
repeat(100)
part_particles_create(global.parsys,x+random_range(-sprite_width/2,sprite_width/2),y,part_var_env_combust_grass_bits,1);


scr_play_sound(snd_common_grass_cut,0,0.5,0.7);
}