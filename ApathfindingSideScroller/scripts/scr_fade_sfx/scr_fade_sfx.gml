/// @description Script to fade all SFX group's gain
function scr_fade_sfx() {
	audio_group_set_gain(audiogroup_sfx_player,0,800);//Player

	audio_group_set_gain(audiogroup_sfx_enemy,0,800);//Enemies

	audio_group_set_gain(audiogroup_sfx_bullets,0,800);//Bullets

	//audio_group_set_gain(audiogroup_sfx_UI,0,800);//UI, ignore

	audio_group_set_gain(audiogroup_sfx_common,0,800);//Environment


	audio_group_set_gain(audiogroup_default,0,800);//Default / Music



}
