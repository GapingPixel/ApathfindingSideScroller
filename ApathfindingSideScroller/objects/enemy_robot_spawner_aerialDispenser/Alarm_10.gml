/// @description Kill off
repeat(15)
{
	particle_scr_eff_boom_offeset(1,random_range(-200,200),random_range(-150,0));
}

for(var b = 0; b <= 360; b += 30)
{
var d = instance_create_depth(x,y,depth-1,obj_effect_explosion_debris)
with(d)
{
	motion_set(b,random_range(10,15));
	effect_var_explosion_debris_size = random_range(0.5,1);
	effect_var_explosion_debris_life_span = 2000;
	alarm[0] = effect_var_explosion_debris_life_span;
}
}

uc_flash();
//audio_play_sound(snd_env_explosion_long_2,0,0);
//audio_play_sound(snd_env_explosion_long_1,0,0);
instance_destroy();