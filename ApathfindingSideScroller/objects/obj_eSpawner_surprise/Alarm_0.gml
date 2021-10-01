/// @description Insert description here
// You can write your code in this editor

var image_offset_x, image_offset_y;

if eSpawn_oneOff_vertical == false
{
image_offset_x = (sprite_get_width(sprite_index)*image_xscale)
image_offset_y = 0
}
else
{
image_offset_x = 0
image_offset_y = (sprite_get_height(sprite_index))
}

if eSpawn_child != 0
{
var inst = instance_create_layer(x-image_offset_x,y-image_offset_y,"Enemy",eSpawn_child);
inst.image_xscale = image_xscale;
inst.facing = image_xscale;
}

instance_destroy();