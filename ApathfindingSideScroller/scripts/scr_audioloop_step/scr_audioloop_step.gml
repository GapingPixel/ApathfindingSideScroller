// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_audioloop_step(){
	
	if variable_instance_exists(id,"al")
	{
	var al_pos = audio_sound_get_track_position(al);

		if al_pos > al_tot_length
		{
			audio_sound_set_track_position(al,al_pos - al_loop_length);
		}
	}
}