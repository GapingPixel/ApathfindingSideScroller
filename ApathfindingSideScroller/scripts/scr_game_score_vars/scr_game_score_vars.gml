/// @description Initializes variables for game play record keeping; are always reset to zero
function scr_game_score_vars() {
	
	//For tracking Nano Coins collected in levels
	for(var a = 0; a <= 2; a++)
		global.temp_nanoMod_get[a] = false;
	
	//Values for scoring points
	global.scoring_time = 0;
	global.scoring_e_extracts = 0;
	global.scoring_c_blasts = 0;
	global.scoring_hits = 0;


	#region Special variables
	//Bool for pacifist runs
	//globalvar no_kill;
	global.scoring_no_kill = true;

	//Bool for extractor shot only runs
	//globalvar extract_only;
	global.scoring_extract_only = true;
	#endregion


}
