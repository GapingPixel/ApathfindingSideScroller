/// @description Frost Alarm
var spw = random_range(-sprite_width,sprite_width);
var sph = random_range(-sprite_height,sprite_height);

part_particles_create(global.parsys,x +spw/7,y+sph/7,part_var_env_ice_frost_bits,20);
part_particles_create(global.parsys,x+spw/2,y+sph/2,part_var_env_ice_frost_mist,20);
part_particles_create(global.parsys,x+spw/5,y+sph/5,part_var_env_ice_frost_bits,20);

alarm[1] = irandom_range(30,60);

