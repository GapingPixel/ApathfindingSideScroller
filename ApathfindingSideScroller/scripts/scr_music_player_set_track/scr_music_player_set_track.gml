/// @description Starts music dependent on msc value
function scr_music_player_set_track(argument0) {
	/*
	arg0 - number in track
	*/


	/*Id Reference
	0 - Nothing
	1 - Menus and Test Themes
	100 - Cutscene and Misc
	200 - Map Themes
	300 - Stage Themes
	400 - Boss Themes
	*/

	var priority = 10;

	switch(argument0)
	{
	default:
	//Nothing, 0
	break;

	case 1://Test
	bgm = audio_play_sound(msc_test,priority,true);
	bgm_set_loop = true;
	break;

#region//Map Themes, 200
	case 201://Map 1
	bgm = audio_play_sound(msc_overworld_1,priority,false);
	bgm_set_loop = false;
	bgm_intro_length = 0;
	bgm_loop_length = 135.534;
	break;

	case 202://Map 2
	bgm = audio_play_sound(msc_overworld_1,priority,false);
	bgm_set_loop = false;
	bgm_intro_length = 0;
	bgm_loop_length = 135.534;
	break;

	case 203://Map 1
	bgm = audio_play_sound(msc_overworld_1,priority,false);
	bgm_set_loop = false;
	bgm_intro_length = 0;
	bgm_loop_length = 135.534;
	break;
#endregion

#region//Stage Themes, 300
	case 300:
	bgm = audio_play_sound(msc_stage_tutorial,priority,true);
	bgm_set_loop = true;
	break;
#endregion

#region//Boss Themes, 400
	case 401://Ferrous Force, Phase 1
	bgm = audio_play_sound(msc_boss_force_1,priority,false);
	bgm_set_loop = false;
	bgm_intro_length = 15.007;
	bgm_loop_length = 67.504;
	break;

	case 402://Ferrous Force, Phase 2
	bgm = audio_play_sound(msc_boss_force_final_phase,priority,false);
	audio_sound_set_track_position(bgm,0)
	bgm_set_loop = false;
	bgm_intro_length = 3.720;
	bgm_loop_length = 37.478;
	break;

#endregion

	}

	bgm_total_length = bgm_intro_length + bgm_loop_length;


}
