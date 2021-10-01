/// @description Kill Alarm
instance_create_depth(x,y,depth-1,atom);
audio_play_sound(snd_common_collectable_spawn,0,0);
instance_destroy();


