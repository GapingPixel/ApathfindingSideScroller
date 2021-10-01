/// @description Player 2 Inputs only
// You can write your code in this editor
menu_input_SELECT = max(gamepad_button_check_pressed(1,gp_face1), keyboard_check_pressed(vk_enter),0);
menu_input_BACK = max(gamepad_button_check_pressed(1,gp_face2), keyboard_check_pressed(vk_shift),0);
menu_input_UP = max(gamepad_button_check_pressed(1,gp_padu), keyboard_check_pressed(vk_up),0);
menu_input_DOWN= max(gamepad_button_check_pressed(1,gp_padd), keyboard_check_pressed(vk_down),0);
menu_input_LEFT= max(gamepad_button_check_pressed(1,gp_padl), keyboard_check_pressed(vk_left),0);
menu_input_RIGHT = max(gamepad_button_check_pressed(1,gp_padr), keyboard_check_pressed(vk_down),0);

#region//Analog Stick menu_input

    var analog_thres = 0.9;//threshold
    var analog_dz = 0.10;//deadzone
    gamepad_set_axis_deadzone(0,analog_dz);
    
    //lsHor and lsVer Releas for thumbsticks
    var analog_lsHor = gamepad_axis_value(1,gp_axislh)
    var analog_lsVer = gamepad_axis_value(1,gp_axislv)
    
	// left pressed
    if (!menu_stick_left_held && analog_lsHor <= -analog_thres)
    {
        menu_stick_left_held = 1;
        menu_input_LEFT = 1;
    }

    // left release
    else if (menu_stick_left_held && analog_lsHor > -analog_thres)
    {
        menu_stick_left_held = 0;
        menu_input_LEFT = 0;
    }


    // right pressed
    if (!menu_stick_right_held && analog_lsHor >= analog_thres)
    {
        menu_stick_right_held = 1;
        menu_input_RIGHT = 1;
    }

    // right release
    else if (menu_stick_right_held && analog_lsHor < analog_thres)
    {
        menu_stick_right_held = 0;
        menu_input_RIGHT = 0;
    }

  
    // up pressed
    if (!menu_stick_up_held && analog_lsVer <= -analog_thres)
    {
        menu_stick_up_held = 1;
        menu_input_UP = 1;
    }

    // up release
    else if (menu_stick_up_held && analog_lsVer > -analog_thres)
    {
        menu_stick_up_held = 0;
        menu_input_UP = 0;
    }


    // down pressed
    if (!menu_stick_down_held && analog_lsVer >= analog_thres)
    {
        menu_stick_down_held = 1;
		menu_input_DOWN = 1;
    }

    // down release
    else if (menu_stick_down_held && analog_lsVer < analog_thres)
    {
        menu_stick_down_held = 0;
        menu_input_DOWN = 0;
    }

#endregion


if menu_enable
{
#region///Check for menu button pressing
menu_push = 0;

menu_push = menu_input_SELECT;

menu_backout = 0;

menu_backout = menu_input_BACK;
#endregion
//Moving Cursor is dependent on menu's options. inherit this
}