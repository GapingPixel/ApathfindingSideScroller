// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gp_any_button(){
	
	//Take Input from any controller while ignoring pause and select buttons
	for (var i = 0; i < 15; i++;)
	{
		{
		if gamepad_button_check_pressed(i, gp_face1)		return 1;
		if gamepad_button_check_pressed(i, gp_face1)		return 1;
		if gamepad_button_check_pressed(i, gp_face3)		return 1;
		if gamepad_button_check_pressed(i, gp_face4)		return 1;
		if gamepad_button_check_pressed(i, gp_shoulderl)	return 1;
		if gamepad_button_check_pressed(i, gp_shoulderlb)	return 1;
		if gamepad_button_check_pressed(i, gp_shoulderr)	return 1;
		if gamepad_button_check_pressed(i, gp_shoulderrb)	return 1;
		if gamepad_button_check_pressed(i, gp_padu)			return 1;
		if gamepad_button_check_pressed(i, gp_padd)			return 1;
		if gamepad_button_check_pressed(i, gp_padl)			return 1;
		if gamepad_button_check_pressed(i, gp_padr)			return 1;
		if gamepad_button_check_pressed(i, gp_axislh)		return 1;
		if gamepad_button_check_pressed(i, gp_axislv)		return 1;
		if gamepad_button_check_pressed(i, gp_axisrh)		return 1;
		if gamepad_button_check_pressed(i, gp_axisrv)		return 1;		
		}
	}
	
}