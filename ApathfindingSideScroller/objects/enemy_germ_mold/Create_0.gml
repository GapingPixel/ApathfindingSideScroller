/// @description Set Enemy vars and Animations
event_inherited();
scr_set_enemy_vars(3,0.75,1.1,.9,2,0.1,true,true,true);


//audio
//audio_sound_pitch(snd_enemy_slime_slimeglob_spawn,random_range(0.9,1.1));
//audio_play_sound(snd_enemy_slime_slimeglob_spawn,0,0)

//animation
image_speed = 0.75;

//Gravity
vyMax       = 15;
vxMax = 5;
gravNorm = 1.5;

//Behavior


enemy_behavior = enemy_SPAWN


skeleton_animation_set("0_spawn")
/*skeleton_animation_mix("0_spawn","1_idle",0.03);
skeleton_animation_mix("1_idle","3_turn",0.06);
skeleton_animation_mix("3_turn","1_idle",0.06);
skeleton_animation_mix("1_idle","2_bite",0.03);
skeleton_animation_mix("2_bite","1_idle",0.03);*/

//Bite alarm
alarm[1] = choose(80,100,120);

