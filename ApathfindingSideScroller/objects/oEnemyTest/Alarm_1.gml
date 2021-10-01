/// @description Kill Effect

	particle_scr_eff_boom(random_range(1.25,1.5));
    //audio_sound_pitch(snd_env_explosion_quick_2,random_range(0.9,1.1));
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    scr_play_sound(snd_enemy_robot_kill_1,0,0.8,1);
    //audio_play_sound(snd_enemy_robot_minion_kill,0,0);
    var inst = instance_create_depth(x,y-25,depth-4,obj_effect_enemy_robot_head)
    inst.image_xscale = image_xscale;
    instance_destroy();