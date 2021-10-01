/// @description Frost Alarm
var spw = sprite_width;
var sph = sprite_height;

part_particles_create(global.parsys,x+(random_range(-spw/4,spw/4) * image_xscale),y-sph/2 + random_range(-sph/4,sph/4),part_var_env_ice_frost_flake,20);
part_particles_create(global.parsys,x+(random_range(-spw/4,spw/4) * image_xscale),y-sph/2 + random_range(-sph/4,sph/4),part_var_env_ice_frost_mist,20);
part_particles_create(global.parsys,x+(random_range(-spw/4,spw/4) * image_xscale),y-sph/2 + random_range(-sph/4,sph/4),part_var_env_ice_frost_bits,20);

alarm[1] = irandom_range(30,50);


