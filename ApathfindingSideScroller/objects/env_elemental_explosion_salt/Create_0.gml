/// @description Set up Vars and Scripts
event_inherited();
ini = false;
audio_play_sound(snd_common_salt_explode,0,0);
image_xscale = 1;
image_yscale = 1;
image_blend = c_lime;
bullet_dmg = 0.5;
//Destroy
alarm[0] = 40;


//particle_scr_plyr_chemball_explosion();

part_var_elemExplosion_salt = part_type_create();
part_type_shape(part_var_elemExplosion_salt,pt_shape_square);
part_type_size(part_var_elemExplosion_salt,0.05,0.4,-0.01,0.10);
part_type_color3(part_var_elemExplosion_salt,c_lime,65280,65408);
part_type_alpha1(part_var_elemExplosion_salt,0.50);
part_type_speed(part_var_elemExplosion_salt,2,4,0,1);
part_type_direction(part_var_elemExplosion_salt,0,359,15,0);
part_type_blend(part_var_elemExplosion_salt,1);
part_type_life(part_var_elemExplosion_salt,30,0);

part_var_elemExplosion_elec = part_type_create();
part_type_sprite(part_var_elemExplosion_elec,spr_effect_elec_lightning,1,0,1);
part_type_size(part_var_elemExplosion_elec,0.05,0.1,0,0.50);
part_type_color3(part_var_elemExplosion_elec,16744576,8454143,8454016);
part_type_alpha1(part_var_elemExplosion_elec,1);
part_type_speed(part_var_elemExplosion_elec,5,10,0,0);
part_type_direction(part_var_elemExplosion_elec,0,359,0,0);
part_type_orientation(part_var_elemExplosion_elec,0,0,0,0,1);
part_type_blend(part_var_elemExplosion_elec,1);
part_type_life(part_var_elemExplosion_elec,15,0);