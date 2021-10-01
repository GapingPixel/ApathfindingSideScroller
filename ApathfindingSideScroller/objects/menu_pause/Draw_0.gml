//draw_self();
event_inherited();

//draw_sprite(spr_UI_menu_background,0,x,y,);

var highlight;

var pause_str = scr_get_string(11)
draw_text_transformed_color(x+2+random_range(-0.5,0.5),y-126+random_range(-0.5,0.5),pause_str,1.5,4,0,c_black,c_black,c_black,c_black,1);
draw_text_transformed_color(x,y-128,pause_str,1.5,4,0,c_white,c_white,c_white,c_white,1);

//draw_sprite_ext(spr_UI_menu_button,0,x,y + menu_spacing * menu_pos + menu_mouse_detection_offset,2,1,0,c_yellow,0);
var arrayLength = array_length(menu);
for(var i = 0; i < arrayLength; i++)
{
    if i = menu_pos
		highlight = c_yellow;
	else
		highlight = c_white;
		
	//draw_sprite_ext(spr_UI_menu_button,0,x,y + (menu_spacing*i) + menu_offset,2,0.5,0,highlight,1);
	draw_text_shadow_ext(x,y + (menu_spacing * i) + menu_offset,string(menu[i]),c_white,c_black,315,3,1);
}



