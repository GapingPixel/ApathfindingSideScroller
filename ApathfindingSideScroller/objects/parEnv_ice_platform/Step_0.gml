image_xscale = abs(env_heat_value);

if env_dur < 0 || env_heat_value > -0.25
{
part_particles_create(global.parsys,x,y-(sprite_height/2),part_var_env_ice_smokepoof,round(20*image_yscale));

part_particles_create(global.parsys,x,y-(sprite_height/2),part_var_env_ice_bits,round(40*image_yscale));


part_particles_create(global.parsys,x,y-(sprite_height/2),part_var_env_ice_bang,round(30*image_yscale));

part_particles_create(global.parsys,x,y-(sprite_height/2),part_var_env_ice_burst,5);

uc_shake(10);
//part_particles_create(parsys,x,y,smokepoof,30);
instance_destroy(); 
}

