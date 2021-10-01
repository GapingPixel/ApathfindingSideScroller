/// @description Insert description here
// You can write your code in this editor
event_inherited();
var col;

if y_speed = 0
col = 0;
else
col = 1;


pal_swap_set(spr_env_metal_platform_copter_pal, col, false);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,image_blend,1);
pal_swap_reset();