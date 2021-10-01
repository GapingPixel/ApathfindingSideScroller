///Unload boss audio groups out of memory
function scr_game_unload_boss_audio_groups() {

#region//Force Boss
	if audio_group_is_loaded(audiogroup_sfx_boss_force)
		audio_group_unload(audiogroup_sfx_boss_force);
#endregion
	
	
#region//Phlexer Boss
	if audio_group_is_loaded(audiogroup_sfx_boss_phlexer)
		audio_group_unload(audiogroup_sfx_boss_phlexer);

#endregion

#region//Silimicon Boss
	if audio_group_is_loaded(audiogroup_sfx_boss_silimicon)
		audio_group_unload(audiogroup_sfx_boss_silimicon);
#endregion


}
