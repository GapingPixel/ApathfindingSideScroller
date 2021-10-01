/// @description Damage object indication
function scr_bullet_env_hit(hit) {
	audio_sound_pitch(snd_common_bullet_hit,random_range(0.8,1.2));
	    with(hit)//to prevent continuous sound play
	    {
			if alarm_get(0) < 0 && env_dur > 0
				{
					audio_play_sound(snd_common_bullet_hit,100,false);
					alarm[0] = 10;
					image_blend = c_yellow;
				}
	    }



}
