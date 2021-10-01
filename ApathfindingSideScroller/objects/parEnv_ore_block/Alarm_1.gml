/// @description Twinkle Alarm

if env_goodies != 0
{
part_particles_create(global.parsys,
x+random_range(-sprite_width/2,sprite_width/2),
y+random_range(-sprite_height/2,sprite_height/2),
part_var_env_ore_twinkle,
1);
alarm[1] = choose(5,10,15);
}