/// @description Set up Vars and Scripts
event_inherited();
ini = false;
audio_play_sound(snd_common_ice_explode,0,0);
image_xscale = 1;
image_yscale = 1;
image_blend = c_aqua;
bullet_dmg = 0.2;
//Destroy
alarm[0] = 30;


part_var_elemExplosion_ice_clouds = part_type_create();
part_type_sprite(part_var_elemExplosion_ice_clouds,spr_effect_smoke_big,0,0,1);
part_type_size(part_var_elemExplosion_ice_clouds,0.10,1,0,0.10);
part_type_scale(part_var_elemExplosion_ice_clouds,1,0.50);
part_type_color3(part_var_elemExplosion_ice_clouds,16777088,16776960,16777215);
part_type_alpha2(part_var_elemExplosion_ice_clouds,0.25,0);
part_type_speed(part_var_elemExplosion_ice_clouds,2,6,0,0);
part_type_direction(part_var_elemExplosion_ice_clouds,0,359,0,0);
part_type_blend(part_var_elemExplosion_ice_clouds,1);
part_type_life(part_var_elemExplosion_ice_clouds,80,0);
//5



part_var_elemExplosion_ice = part_type_create();
part_type_sprite(part_var_elemExplosion_ice,spr_effect_ice_flake,0,0,1);
part_type_size(part_var_elemExplosion_ice,1,1,-0.01,0.10);
part_type_scale(part_var_elemExplosion_ice,0.25,0.25);
part_type_color2(part_var_elemExplosion_ice,16777215,c_aqua);
part_type_alpha2(part_var_elemExplosion_ice,1,0);
part_type_speed(part_var_elemExplosion_ice,3,6,0,0);
part_type_direction(part_var_elemExplosion_ice,0,359,0,0);
//part_type_orientation(part_var_elemExplosion_ice,0,0,15,0,1);
part_type_blend(part_var_elemExplosion_ice,1);
part_type_life(part_var_elemExplosion_ice,20,0);

//particle_scr_plyr_chemball_explosion();

