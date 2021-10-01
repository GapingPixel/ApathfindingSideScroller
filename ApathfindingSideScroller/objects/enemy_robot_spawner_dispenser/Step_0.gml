/// @description Handle Death


#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

switch(anim)
{
	case "1_shoot":
		skeleton_animation_set("0_idle")
		alarm[1] = choose(120,180);
	break;
	
	case "99_KO":
		repeat(15)
		{
			particle_scr_eff_boom_offeset(1,random_range(-200,200),random_range(-150,0));
		}
		uc_flash()
		repeat(5)
		{
			var d = instance_create_depth(x,y-120,depth-1,obj_effect_explosion_debris)
			with(d)
			{
				motion_set(random_range(45,135),random_range(15,20));
				effect_var_explosion_debris_life_span = 2000;
				alarm[0] = effect_var_explosion_debris_life_span
			}
		}
		//audio_play_sound(snd_env_explosion_long_2,0,0);
		//audio_play_sound(snd_env_explosion_long_1,0,0);
		instance_destroy();
	break;	
}
}
#endregion

//Destroy invisible wall upon death
if enemy_hp <= 0 && skeleton_animation_get() != "99_KO"
{
	skeleton_animation_set("99_KO");
	alarm[9] = 5
	image_speed = 0.55;
	
	enemy_behavior = enemy_KO;
}