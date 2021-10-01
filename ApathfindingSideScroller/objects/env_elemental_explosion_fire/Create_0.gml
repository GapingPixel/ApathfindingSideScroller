/// @description Set up Vars and Scripts
event_inherited();
ini = false;
audio_play_sound(snd_common_fire_explode,0,0);
image_xscale = 1;
image_yscale = 1;
image_blend = c_orange;
bullet_dmg = 0.2;
//Destroy
alarm[0] = 30;

//Particles
part_var_elemExplosion_fire = part_type_create();
part_type_sprite(part_var_elemExplosion_fire,spr_effect_fire_flame,1,1,1);
part_type_size(part_var_elemExplosion_fire,2,2,0,0);
part_type_scale(part_var_elemExplosion_fire,0.50,0.75);
part_type_color3(part_var_elemExplosion_fire,4227327,c_yellow,4227327);
part_type_alpha2(part_var_elemExplosion_fire,0.75,0);
part_type_speed(part_var_elemExplosion_fire,1,2,0,0);
part_type_direction(part_var_elemExplosion_fire,0,359,0,0);
part_type_gravity(part_var_elemExplosion_fire,1,90);
part_type_blend(part_var_elemExplosion_fire,1);
part_type_life(part_var_elemExplosion_fire,15,0);

//particle_scr_plyr_chemball_explosion();

