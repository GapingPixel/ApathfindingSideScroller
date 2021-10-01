//draw_self();
event_inherited()

//draw_sprite_ext(sprite_index,image_index,1280/2,(720/2) + space * menu_pos,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
var highlight;
var end_of_menu = array_length(menu)
for(var i = 0; i < end_of_menu; i++)
{
    if i = menu_pos
		highlight = c_yellow;
	else
		highlight = c_white;
		
	draw_text_shadow_ext(x,y + menu_spacing * i,string(menu[i]),highlight,c_black,315,3,1);
}



