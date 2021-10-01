//draw_self();
event_inherited()

//draw_sprite(spr_UI_menu_background,0,x,y,);

draw_text_shadow_ext(x,y-64,scr_get_string(9),c_white,c_black,90,3,1);

var highlight;

var end_of_menu = array_length(menu)

for(var i = 0; i < end_of_menu; i++)
{
	if i = menu_pos
		highlight = c_yellow;
	else
		highlight = c_white;
	
	//draw_sprite_ext(spr_UI_menu_button,0,x,y + (menu_spacing * i),1,0.5,0,highlight,1);
    //draw_text_shadow_ext(x,y + (menu_spacing * i),string(menu[i]),c_white,c_black,315,3,1);
}



