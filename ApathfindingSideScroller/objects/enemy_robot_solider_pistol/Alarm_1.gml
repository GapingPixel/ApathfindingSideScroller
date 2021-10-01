///@description Kill Effect

	particle_scr_eff_boom(random_range(1.25,1.5));
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    var inst = instance_create_depth(x,y-25,depth-4,obj_effect_enemy_robot_head)
	inst.image_index = 1;
    inst.image_xscale = image_xscale;
    instance_destroy();