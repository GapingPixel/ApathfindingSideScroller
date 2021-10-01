/// @description Electric Ball
event_inherited();
ini = false;
//audio_play_sound(snd_plyr_chemball_explode_salt,0,0);
image_xscale = 0.5;
image_yscale = 0.5;
image_alpha = 0;

bullet_dmg = 0.1;
object_state = objectState.electrified;
//Destroy
alarm[0] = 60;

scr_play_sound(snd_common_electric_explosion_1,0,0.9,1.1)

part_var_elemExplosion_elec_core = part_type_create();
part_type_sprite(part_var_elemExplosion_elec_core,spr_effect_elec_lightning,1,0,1);
part_type_size(part_var_elemExplosion_elec_core,1,1.5,0,0.3);
part_type_scale(part_var_elemExplosion_elec_core,1,1);
part_type_color3(part_var_elemExplosion_elec_core,8454143,8454016,8454143);
part_type_orientation(part_var_elemExplosion_elec_core,0,359,0,0,1);
part_type_blend(part_var_elemExplosion_elec_core,1);
part_type_life(part_var_elemExplosion_elec_core,5,15);
//2

part_var_elemExplosion_elec_outter = part_type_create();
part_type_sprite(part_var_elemExplosion_elec_outter,spr_effect_elec_shock,1,0,1);
part_type_size(part_var_elemExplosion_elec_outter,0.10,1.50,0,0);
part_type_color3(part_var_elemExplosion_elec_outter,8454143,8454016,8454143);
part_type_speed(part_var_elemExplosion_elec_outter,8,15,0,0);
part_type_direction(part_var_elemExplosion_elec_outter,0,359,0,0);
part_type_orientation(part_var_elemExplosion_elec_outter,0,359,0,0,1);
part_type_blend(part_var_elemExplosion_elec_outter,0);
part_type_life(part_var_elemExplosion_elec_outter,5,15);
//5