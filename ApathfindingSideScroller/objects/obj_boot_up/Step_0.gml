if gamepad_button_check_pressed(0,gp_start) or gamepad_button_check_pressed(1,gp_start)
{
event_perform(ev_keypress,vk_anykey);
}

