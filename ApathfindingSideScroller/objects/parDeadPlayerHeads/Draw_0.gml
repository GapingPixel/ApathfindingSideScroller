/// @description Draw Head and Pallete
var char = global.character[DeadPlayerHeads_var_plyr_id];
var char_alt = global.character_alt[DeadPlayerHeads_var_plyr_id]
var pal_spr;

//Get pallete sprite
switch(char)
{
	case 0:
	pal_spr = spr_plyr_pal_a;
	break;
	
	case 1:
	pal_spr = spr_plyr_pal_m;
	break;
}



pal_swap_set(pal_spr, char_alt, false);
draw_sprite_ext(sprite_index,image_index,x,y,
image_xscale,image_yscale,
image_angle,image_blend,image_alpha);
pal_swap_reset();
