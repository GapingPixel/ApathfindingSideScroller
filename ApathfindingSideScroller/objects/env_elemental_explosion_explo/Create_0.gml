/// @description Set up Vars and Scripts
event_inherited();
ini = false;
//audio_sound_pitch(snd_boom2,random_range(2,2.5));
//audio_play_sound(snd_boom2,0,0);
image_blend = c_red;
image_xscale = 0.5;
image_yscale = 0.5;
bullet_dmg = 0.5;

scr_play_sound(snd_common_explosion_long_2,0,0.9,1.1)

uc_shake(15);

particle_scr_big_booms();

part_type_color3(part_var_bigBoom_burst,c_red,c_white,c_red);
part_type_color1(part_var_bigBoom_sphere,c_red);
part_type_color1(part_var_bigBoom_smoke,c_dkgray);
part_type_alpha1(part_var_bigBoom_smoke,0.25);

particle_scr_eff_boom(1);

part_var_elemExplosion_explo = part_type_create();
part_type_sprite(part_var_elemExplosion_explo,spr_effect_cartoon_zigzag,0,0,1);
part_type_scale(part_var_elemExplosion_explo,0.5,0.25);
part_type_color3(part_var_elemExplosion_explo,255,8421631,255);
part_type_alpha2(part_var_elemExplosion_explo,1,0);
part_type_speed(part_var_elemExplosion_explo,6,12,0,1);
part_type_direction(part_var_elemExplosion_explo,0,359,0,0);
part_type_orientation(part_var_elemExplosion_explo,0,0,0,1,1);
part_type_blend(part_var_elemExplosion_explo,1);
part_type_life(part_var_elemExplosion_explo,40,60);

part_particles_create(global.parsys,x,y,part_var_elemExplosion_explo,40);

var inst;
//Create flame debris
for(var f = 45; f <= 335; f += 45)
{
inst = instance_create_depth(x,y,0,terr_fireDebris_minor)
inst.image_angle = f;
with(inst)
{
motion_set(image_angle,random_range(6,12));
}
}

