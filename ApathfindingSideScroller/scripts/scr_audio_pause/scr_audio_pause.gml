function scr_audio_pause() {
	//Script to Pause / Unpause Sounds

	switch(global.game_state)
	{
		case GameState.paused://Resume Sounds
		audio_sound_gain(audiogroup_default,global.settings_master_vol_music/5,10);
		audio_group_set_gain(audiogroup_sfx_player,0,1);
		audio_group_set_gain(audiogroup_sfx_enemy,0,1);
		audio_group_set_gain(audiogroup_sfx_common,0,1);
		audio_group_set_gain(audiogroup_sfx_bullets,0,1);
		break;
	
		default:
		audio_sound_gain(audiogroup_default,global.settings_master_vol_music,60);
		audio_group_set_gain(audiogroup_sfx_player,global.settings_master_vol_sfx,1);
		audio_group_set_gain(audiogroup_sfx_enemy,global.settings_master_vol_sfx,1);
		audio_group_set_gain(audiogroup_sfx_common,global.settings_master_vol_sfx,1);
		audio_group_set_gain(audiogroup_sfx_bullets,global.settings_master_vol_sfx,1);
		break;
	}


}
