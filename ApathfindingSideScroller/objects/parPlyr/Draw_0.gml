var flight = global.game_room_state

if flight != roomState.Flight
DrawShadow(0,0,1,1);

#region Outlines
if var_parry = 1//Border for parry
{
draw_sprite_shadow_ext(90,0,0,0.9*stretch_x,0.9*stretch_y,c_white,0.75);
}

//Outline showing temperature
if var_temp >= 0//Hot
{
	draw_sprite_shadow_ext(90,0,0,
	0.8*stretch_x,
	0.8*stretch_y, 
	make_color_rgb(round(var_temp),round(var_temp/2),0),
	image_alpha);
}
else//Cold
{
	draw_sprite_shadow_ext(90,0,0,
	0.8*stretch_x+random_range(0.01,0.01+(0.08*abs(var_temp/255))),
	0.8*stretch_y+random_range(0.01,0.01+(0.08*abs(var_temp/255))), 
	make_color_rgb(0,round(abs(var_temp)/2),round(abs(var_temp))),
	image_alpha);
}
#endregion


#region Temperature Changing image blend (for when character gets hot)
if var_temp > 0
{
	image_blend = make_color_rgb(255,255 - round(var_temp),255 - round(var_temp));
}
else
image_blend = c_white;
#endregion


//Super Attack Trail
if var_super = 1
{
	scr_image_trail(4,5,0.004,c_blue,false,0.78)	
}




#region Drawing Character

draw_self();

#endregion