///Initialize Music Player Values
function scr_music_player_init() {

	bgm = 0;//Audio_play_sound for step event
	/*
	var music_pos = audio_sound_get_track_position(bgm);
	*/
	bgm_set_loop = false;//Bool to determine if we have a track that doesn't need to loop at a certain point
	bgm_intro_length = 0;//Measures end of intro and start of loop
	bgm_loop_length = 0;//Measures end of loop
	bgm_total_length = bgm_intro_length + bgm_loop_length;

	msc_value = 0;//value to be called in music player script to obtain music id


}
