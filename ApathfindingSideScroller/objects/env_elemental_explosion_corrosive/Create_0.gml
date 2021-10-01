/// @description Set up Vars and Scripts
event_inherited();
ini = false;
audio_play_sound(snd_common_corrosion_explode,0,0);
image_blend = c_yellow;
image_xscale = 1;
image_yscale = 1;
bullet_dmg = 0.5;
//Destroy
alarm[0] = 40;


//particle_scr_plyr_chemball_explosion();

part_var_elemExplosion_corr = part_type_create();
part_type_shape(part_var_elemExplosion_corr,pt_shape_pixel);
part_type_size(part_var_elemExplosion_corr,2,5,-0.01,0);
part_type_color3(part_var_elemExplosion_corr,c_yellow,8421504,4227200);
part_type_alpha2(part_var_elemExplosion_corr,0.75,0);
part_type_speed(part_var_elemExplosion_corr,1,8,0,0.10);
part_type_direction(part_var_elemExplosion_corr,0,359,0,0);
part_type_gravity(part_var_elemExplosion_corr,0.25,270);
part_type_orientation(part_var_elemExplosion_corr,0,0,0,0,1);
part_type_blend(part_var_elemExplosion_corr,1);
part_type_life(part_var_elemExplosion_corr,20,0);