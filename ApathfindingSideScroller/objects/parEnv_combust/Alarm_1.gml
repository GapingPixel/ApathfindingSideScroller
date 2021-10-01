/// @description Fire Crackle
if object_state = objectState.onFire
&& in_view()
{
//audio_sound_pitch(snd_env_fire_loop,random_range(0.8,1.2))
//audio_play_sound(snd_env_fire_loop,1000,0);
}
alarm[1] = 10;

