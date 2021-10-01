/// @description Insert description here
// You can write your code in this editor
var char = global.character[playerAngel_var_plyr_id];
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

//Glow
draw_sprite_shadow(90,0,1.025,c_white,0.5*playerAngel_var_glow_alpha)
draw_sprite_shadow(90,0,1.0125,c_aqua,0.15*playerAngel_var_glow_alpha)
draw_sprite_shadow(90,0,1.00625,c_white,0.25*playerAngel_var_glow_alpha)


if playerAngel_var_hold_delay < 5
{
pal_swap_set(pal_spr, 6, false);
draw_sprite_ext(sprite_index,image_index,x,y,
(image_xscale)*.9,(image_yscale)*.9,
image_angle,image_blend,image_alpha*0.75);
pal_swap_reset();


if !playerAngel_var_revive
draw_sprite_ext(spr_player_angel_halos,playerAngel_var_halo_frame,x+20*image_xscale,y-45,0.5,0.6,0,c_white,1*0.8);
}