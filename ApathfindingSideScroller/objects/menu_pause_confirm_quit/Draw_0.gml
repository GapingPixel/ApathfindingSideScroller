//draw_self();
event_inherited();
draw_sprite(spr_UI_menu_background,0,x,y,);
var quit_string = scr_get_string(9);
draw_text_shadow_ext(x,y-64,quit_string,c_white,c_black,90,3,1);

var highlight;
var end_of_array = array_length(menu)
for(var i = 0; i < end_of_array; i++)
{
    if i = menu_pos
		highlight = c_yellow;
	else
		highlight = c_white;
		
	draw_text_shadow_ext(x,y + (menu_spacing * i),string(menu[i]),highlight,c_black,315,3,1);
}



