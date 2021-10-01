//draw_self();
event_inherited();

draw_sprite(spr_UI_menu_background,0,x,y,);

var display_str = scr_get_string(18)
draw_text_transformed_color(x+2+random_range(-0.5,0.5),y-190+random_range(-0.5,0.5),display_str,1.5,2,0,c_black,c_black,c_black,c_black,1);
draw_text_transformed_color(x,y-192,display_str,1.5,2,0,c_white,c_white,c_white,c_white,1);

var highlight;
var men;
var end_of_menu = array_length(menu);
var arrow_offset;

for (var i = 0; i < end_of_menu; i++)
{
	if i = menu_pos
		highlight = c_yellow;
	else
		highlight = c_white;
	
	switch(i)
	{
		case 0: men = dis_fs; arrow_offset = 55; break;
		case 1: men = string(global.settings_res_W) + " x " + string(global.settings_res_H); arrow_offset = 80; break;
		case 2: men = string(global.settings_aa); arrow_offset = 35; break;
		case 3: men = dis_vsync; arrow_offset = 55;break;
		case 4: men = string(global.settings_screen_shake); arrow_offset = 35; break;
		case 5: men = ""; arrow_offset = 0; break;
	}
	
	if i < 5
	{
	
	
	#region Mouse Detection
	if point_in_rectangle(mouse_x,mouse_y,x-arrow_offset-32,(y-118)-16+menu_spacing*i,x-arrow_offset+32,y+menu_spacing*i)
	{
		slide -= 1;
		
		draw_sprite_ext(spr_UI_menu_arrow,menu_effect_left_arrow_pulse_frame[i],x-arrow_offset,(y-118)+(menu_spacing * i),-0.55,0.30,0,c_yellow,1)
		//menu_pos = i;
	}
	
	if point_in_rectangle(mouse_x,mouse_y,x+arrow_offset-32,(y-118)-16+menu_spacing*i,x+arrow_offset+32,y+16+menu_spacing*i)
	{
		slide += 1;
		
		draw_sprite_ext(spr_UI_menu_arrow,menu_effect_right_arrow_pulse_frame[i],x+arrow_offset,(y-118)+(menu_spacing * i),0.55,0.30,0,c_white,1)
		//menu_pos = i;
	}
	#endregion
	
	draw_sprite_ext(spr_UI_menu_arrow,menu_effect_left_arrow_pulse_frame[i],x-arrow_offset,(y-118)+(menu_spacing * i),-0.5,0.25,0,c_white,1)
	draw_sprite_ext(spr_UI_menu_arrow,menu_effect_right_arrow_pulse_frame[i],x+arrow_offset,(y-118)+(menu_spacing * i),0.5,0.25,0,c_white,1)
	}
	
	if i = 5
	{
	draw_sprite_ext(spr_UI_menu_button,0,x,(y+menu_offset) + (menu_spacing*i),2,0.5,0,highlight,1);
	draw_text_shadow(x,(y + menu_offset) + (menu_spacing * i),string(menu[i]) + men, c_white, c_black, 1);//Draw Text
	}
	else
	{
	//draw_sprite_ext(spr_UI_menu_button,0,x,(y+menu_offset) + (menu_spacing*i),1,0.4,0,highlight,1);
	draw_text_shadow(x,(y + menu_offset) + (menu_spacing * i),string(menu[i]) + men, highlight, c_black, 1);//Draw Text
	}
	
	
}


