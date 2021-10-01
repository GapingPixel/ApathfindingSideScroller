/// @description Mouse Input
var arrayLength = array_length(menu);
if menu_enable == true
{
	for(var i = 0; i < arrayLength; i++)
	{
		if point_in_rectangle(mouse_x,mouse_y,x-menu_spacing,
		y+(menu_spacing*i) - 32 + menu_offset,
		x+menu_spacing,
		y+(menu_spacing*i) + 32 + menu_offset)
		{
			if menu_pos != i
			{
			audio_play_sound(snd_UI_menu_cursor_move,0,false);
			menu_pos = i;
			}
		}
	}
}