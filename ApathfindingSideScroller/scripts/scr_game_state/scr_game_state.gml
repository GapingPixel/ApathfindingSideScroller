/// @description Script initialize variables of in-game actions and scoring results
function scr_game_state() {

	//Initialize Audio to variables
	audio_group_set_gain(audiogroup_default,global.settings_master_vol_music,1)
	scr_game_set_sfx_group_gain();

	//Scoring variables
	scr_game_score_vars();

	///Game States
	//globalvar game_state, screenshot;
	global.screenshot = -1;//variable made to snapshot for pausing

	enum GameState
	{
		play,
		clear,
		dead,
		paused,
		transitioning,
		inSuper
	}
	global.game_state = GameState.play;


}
