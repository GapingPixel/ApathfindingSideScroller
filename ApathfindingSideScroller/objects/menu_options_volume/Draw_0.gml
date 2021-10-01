//draw_self();
event_inherited()

draw_sprite(spr_UI_menu_background,0,x,y,);

var audio_str = scr_get_string(17)
draw_text_transformed_color(x+2+random_range(-0.5,0.5),y-78+random_range(-0.5,0.5),audio_str,1.5,2.5,0,c_black,c_black,c_black,c_black,1);
draw_text_transformed_color(x,y-80,audio_str,1.5,2.5,0,c_white,c_white,c_white,c_white,1);


var highlight;
var end_of_array = array_length(menu)

for(var i = 0; i < end_of_array; i++)
{
	if i = menu_pos
		highlight = c_yellow;
	else
		highlight = c_white;
		
    if (i < 2)
    {
	draw_set_halign(fa_left);
	
	#region Mouse Detection
	if point_in_rectangle(mouse_x,mouse_y,x-20-24,y-20+menu_spacing*i,x-20+24,y+20+menu_spacing*i)
	{
		if mouse_check_button_pressed(mb_left)
		{
		audio_play_sound(snd_UI_menu_cursor_move,0,false);
		slide -= 1;
		
		}
		draw_sprite_ext(spr_UI_menu_arrow,menu_effect_left_arrow_pulse_frame[i],x-20,y+(menu_spacing * i),-0.6,1.1,0,c_yellow,1)
		menu_pos = i;
	}
	
	if point_in_rectangle(mouse_x,mouse_y,x+200-24,y-20+menu_spacing*i,x+200+24,y+20+menu_spacing*i)
	{
		if mouse_check_button_pressed(mb_left)
		{
		audio_play_sound(snd_UI_menu_cursor_move,0,false);
		slide += 1;
		}
		draw_sprite_ext(spr_UI_menu_arrow,menu_effect_right_arrow_pulse_frame[i],x+200,y+(menu_spacing * i),0.6,1.1,0,c_yellow,1)
		menu_pos = i;
	}
	#endregion
	
	draw_sprite_ext(spr_UI_menu_arrow,menu_effect_left_arrow_pulse_frame[i],x-20,y+(menu_spacing * i),-0.5,1,0,c_white,1)
	draw_sprite_ext(spr_UI_menu_arrow,menu_effect_right_arrow_pulse_frame[i],x+200,y+(menu_spacing * i),0.5,1,0,c_white,1)
	
	draw_text_shadow_ext(x-210,y + menu_spacing * i,string(menu[i]),highlight,c_black,315,3,1);
    draw_healthbar(x,y+(menu_spacing*i)-15,x+180,y+(menu_spacing*i) + 15,((vol[i]/1)*100),c_black,highlight,highlight,0,1,1);
    }
    else
	{
	draw_set_halign(fa_center);//Back Prompt
	
	draw_sprite_ext(spr_UI_menu_button,0,x,y + (menu_spacing*i),2,0.5,0,highlight,1);
    draw_text_shadow_ext(x,y + menu_spacing * i,string(menu[i]),c_white,c_black,315,3,1);
	}
}



