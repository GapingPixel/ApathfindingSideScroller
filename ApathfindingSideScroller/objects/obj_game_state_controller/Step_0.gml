///@description Manage objects in room
scr_object_activation();
var pause_call = gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(1,gp_start) || keyboard_check_pressed(vk_escape)
///Pause Call through pressing start and autoupdate audio gain
if pause_call = true && game_state_controller_pause_activated == true
{
    //alarm[0] = 1;
}