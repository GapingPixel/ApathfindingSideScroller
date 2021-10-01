// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_skeleton_animation_setAnim(animation_string){

//Substitute for skeleton_animation_set, set animation while setting dt to zero to go back to original frame under delta time
	
skeleton_animation_set(animation_string);
dt = 0;

}