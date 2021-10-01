/// @description Water Ball
event_inherited();
ini = false;
scr_play_sound(snd_common_liquid_splash,0,0.9,1.1);
image_xscale = 0.5;
image_yscale = 0.5;
image_alpha = 0;
image_blend = c_blue;
bullet_dmg = 0.5;



part_var_elemExplosion_inner = part_type_create();
part_type_sprite(part_var_elemExplosion_inner,spr_effect_liq_boil,1,1,0);
part_type_size(part_var_elemExplosion_inner,1,1.5,0,0);
part_type_scale(part_var_elemExplosion_inner,1,0.75);
part_type_color3(part_var_elemExplosion_inner,16776960,16777088,16744448);
part_type_alpha1(part_var_elemExplosion_inner,1);
part_type_speed(part_var_elemExplosion_inner,1,1,0,0);
part_type_direction(part_var_elemExplosion_inner,0,359,0,0);
part_type_orientation(part_var_elemExplosion_inner,0,0,0,0,1);
part_type_blend(part_var_elemExplosion_inner,1);
part_type_life(part_var_elemExplosion_inner,15,30);
//30

part_var_elemExplosion_outter = part_type_create();
part_type_sprite(part_var_elemExplosion_outter,spr_effect_liq_splatter_vert,1,1,0);
part_type_size(part_var_elemExplosion_outter,0.50,1,0,0);
part_type_scale(part_var_elemExplosion_outter,1,1);
part_type_color3(part_var_elemExplosion_outter,16776960,16777088,16744448);
part_type_alpha1(part_var_elemExplosion_outter,1);
part_type_speed(part_var_elemExplosion_outter,5,10,0,0);
part_type_direction(part_var_elemExplosion_outter,0,359,0,0);
part_type_gravity(part_var_elemExplosion_outter,0.10,270);
part_type_orientation(part_var_elemExplosion_outter,0,0,0,0,1);
part_type_blend(part_var_elemExplosion_outter,1);
part_type_life(part_var_elemExplosion_outter,20,40);

part_var_bigBoom_burst = part_type_create();
part_type_sprite(part_var_bigBoom_burst,spr_effect_explosion_spark,0,0,0);
part_type_size(part_var_bigBoom_burst,0.50,1,0,0.10);
part_type_color3(part_var_bigBoom_burst,c_white,c_blue,c_aqua);
part_type_blend(part_var_bigBoom_burst,1);
part_type_life(part_var_bigBoom_burst,5,10);


part_particles_create(global.parsys,x,y,part_var_elemExplosion_outter,60)
part_particles_create(global.parsys,x,y,part_var_elemExplosion_inner,30)
part_particles_create(global.parsys,x,y,part_var_bigBoom_burst,5)