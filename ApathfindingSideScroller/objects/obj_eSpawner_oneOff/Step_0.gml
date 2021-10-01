/// @description Insert description here
// You can write your code in this editor
if eSpawn_child != 0
if !instance_exists(eSpawn_child)
{
	eSpawn_child = 0
}

//Flip
if instance_exists(Camera)
{
    if x <= Camera.x
        image_xscale = 1;
    else
        image_xscale = -1;
}