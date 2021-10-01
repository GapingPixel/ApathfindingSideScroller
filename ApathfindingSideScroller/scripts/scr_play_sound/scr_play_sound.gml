// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Function plays a sound once while altering pitch based on following values
function scr_play_sound(audio,priority,lowest_pitch,highest_pitch){

	var soundToPlay = audio;
	audio_sound_pitch(soundToPlay,random_range(lowest_pitch,highest_pitch));
	
	audio_play_sound(soundToPlay,priority,false);

}