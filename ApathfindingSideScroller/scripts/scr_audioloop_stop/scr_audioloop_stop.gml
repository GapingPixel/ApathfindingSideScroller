// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_audioloop_stop(){

	if variable_instance_exists(id,"al")
	{
		audio_stop_sound(al)
	}
}