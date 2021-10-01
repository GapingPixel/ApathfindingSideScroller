// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_skeleton_animation_end_template(){

/*
For copying and pasting, put in Step event for objects using json animations 
for noninterpolation script in substitute for Animation End event
*/

#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

switch(anim)
{
	default:
	
	break;
	
}

}
#endregion

}