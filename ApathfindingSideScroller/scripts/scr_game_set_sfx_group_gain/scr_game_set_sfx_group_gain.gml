/// @description Script to call all SFX group's gain
function scr_game_set_sfx_group_gain() {
	audio_group_set_gain(audiogroup_sfx_player,global.settings_master_vol_sfx,1);//Player

	audio_group_set_gain(audiogroup_sfx_enemy,global.settings_master_vol_sfx,1);//Enemies

	//audio_group_set_gain(audiogroup_sfx_boss,master_vol_sfx,1);//Bosses

	audio_group_set_gain(audiogroup_sfx_bullets,global.settings_master_vol_sfx,1);//Bullets

	audio_group_set_gain(audiogroup_sfx_UI,global.settings_master_vol_sfx,1);//UI

	audio_group_set_gain(audiogroup_sfx_common,global.settings_master_vol_sfx,1);//Environment


	audio_group_set_gain(audiogroup_default,global.settings_master_vol_sfx,1);//Default / Music



}
