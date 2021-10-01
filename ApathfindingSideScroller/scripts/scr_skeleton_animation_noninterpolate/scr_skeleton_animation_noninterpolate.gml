// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_skeleton_animation_noninterpolate(){

/*
Script manages skeleton animations to calculate frames to integers
to make json animations look more choppy and not smooth
*/
if variable_instance_exists(id,"dt") && skeleton_animation_get() != ""
{
	dt += (delta_time / 1000000) * image_speed;
	var anim = skeleton_animation_get();
	var duration = skeleton_animation_get_duration(anim);
	var frame = floor((image_number * (dt / duration)) + 0.5) % image_number;

	image_index = frame;
}

}