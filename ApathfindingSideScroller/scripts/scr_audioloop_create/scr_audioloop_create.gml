// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_audioloop_create(snd,intro,length){

	al = audio_play_sound(snd,0,false);
	al_intro_length = intro;
	al_loop_length = length;
	al_tot_length = al_intro_length + al_loop_length;

}