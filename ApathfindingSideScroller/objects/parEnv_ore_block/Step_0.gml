/// @description Check desctruction of Ore
if env_dur <= 0
{
repeat(30)
part_particles_create(global.parsys,
x+random_range(-sprite_width/2,sprite_width/2),
y+random_range(-sprite_height/2,sprite_height/2),part_var_env_ore_smoke,1);

part_particles_create(global.parsys,x,y,part_var_env_ore_bits,round(abs(image_xscale)*20));
part_particles_create(global.parsys,x,y,part_var_env_ore_burst,3);

scr_play_sound(snd_common_ore_explosion,0,0.9,1.1);
uc_shake(10);
instance_destroy();
}