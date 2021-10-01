/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_basic_subtext);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_ext(sprite_index,image_index,x,y,0.5,0.5,0,c_white,image_alpha);

//Saving Text
draw_text_shadow(x + 128, y, scr_get_string(7),c_white,c_black,1);