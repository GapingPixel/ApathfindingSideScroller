//draw_self();
event_inherited();

draw_sprite(spr_UI_menu_background,0,x,y)


var options_str = scr_get_string(16)
draw_text_transformed_color(x+2+random_range(-0.5,0.5),y-190+random_range(-0.5,0.5),options_str,1.5,2,0,c_black,c_black,c_black,c_black,1);
draw_text_transformed_color(x,y-192,options_str,1.5,2,0,c_white,c_white,c_white,c_white,1);


//draw_sprite_ext(sprite_index,image_index,x,y + space * menu_pos,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
var highlight;
for(var i = 0; i < array_length(menu); i++)
{
    if i = menu_pos
		highlight = c_yellow;
	else
		highlight = c_white;
	
	draw_sprite_ext(spr_UI_menu_button,0,x,(y+menu_offset) + (menu_spacing*i),2,0.5,0,highlight,1);
	draw_text_shadow_ext(x,(y+menu_offset) + menu_spacing * i,string(menu[i]),c_white,c_black,315,3,1);
}




