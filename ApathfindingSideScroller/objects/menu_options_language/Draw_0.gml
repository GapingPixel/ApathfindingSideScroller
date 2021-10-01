/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_sprite(spr_UI_menu_background,0,x,y,);

var lang_str = scr_get_string(19)
draw_text_transformed_color(x+2+random_range(-0.5,0.5),y-62+random_range(-0.5,0.5),lang_str,1.5,2,0,c_black,c_black,c_black,c_black,1);
draw_text_transformed_color(x,y-64,lang_str,1.5,2,0,c_white,c_white,c_white,c_white,1);

var highlight;
var end_of_array = array_length(menu)

for(var i = 0; i < end_of_array; i++)
{
	if i = menu_pos
		highlight = c_yellow;
	else
		highlight = c_white;
		
    if (i < 1)
    {
   
	#region Mouse Detection
	if point_in_rectangle(mouse_x,mouse_y,x-128-32,y-32+menu_spacing*i,x-96+32,y+32+menu_spacing*i)
	{
		if mouse_check_button_pressed(mb_left)
		{
		audio_play_sound(snd_UI_menu_cursor_move,0,false);
		slide -= 1;
		}
		draw_sprite_ext(spr_UI_menu_arrow,menu_effect_left_arrow_pulse_frame[i],x-128,y+(menu_spacing * i),-1.1,1.1,0,c_yellow,1)
		menu_pos = i;
	}
	
	if point_in_rectangle(mouse_x,mouse_y,x+128-32,y-32+menu_spacing*i,x+128+32,y+32+menu_spacing*i)
	{
		if mouse_check_button_pressed(mb_left)
		{
		audio_play_sound(snd_UI_menu_cursor_move,0,false);
		slide += 1;
		}
		draw_sprite_ext(spr_UI_menu_arrow,menu_effect_right_arrow_pulse_frame[i],x+128,y+(menu_spacing * i),1.1,1.1,0,c_yellow,1)
		menu_pos = i;
	}
	#endregion
	
	draw_sprite_ext(spr_UI_menu_arrow,menu_effect_left_arrow_pulse_frame[i],x-128,y+(menu_spacing * i),-1,1,0,c_white,1)
	draw_sprite_ext(spr_UI_menu_arrow,menu_effect_right_arrow_pulse_frame[i],x+128,y+(menu_spacing * i),1,1,0,c_white,1)
   
	draw_text_transformed_color(x+2,y + menu_spacing * i+2,string(menu[i]),1.25,1.25,0,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(x,y + menu_spacing * i,string(menu[i]),1.25,1.25,0,highlight,highlight,highlight,highlight,1);
	//Flag Sprite?
    }
    else
	{
	draw_sprite_ext(spr_UI_menu_button,0,x,y + (menu_spacing*i),2,0.5,0,highlight,1);
    draw_text_shadow_ext(x,y + menu_spacing * i,string(menu[i]),c_white,c_black,315,3,1);
	}
}