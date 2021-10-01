///Track position of the music playing and loop
function scr_music_player_step() {

	if msc_value != 0 && !bgm_set_loop
	{
		var music_pos = audio_sound_get_track_position(bgm);

		if music_pos > bgm_total_length
		{
			audio_sound_set_track_position(bgm,music_pos - bgm_loop_length);
		}
	}


}
