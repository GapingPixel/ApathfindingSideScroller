/// @description Draw Text
event_inherited();
var ready_str = scr_get_string(419);

draw_text_ext_transformed_color(x-2,y-2,ready_str,32,16,4*image_xscale,8*image_yscale,0,c_black,c_black,c_black,c_black,1);
draw_text_ext_transformed_color(x+2,y+2,ready_str,32,16,4*image_xscale,8*image_yscale,0,c_black,c_black,c_black,c_black,1);
draw_text_ext_transformed(x,y,ready_str,32,16,4*image_xscale,8*image_yscale,0);
