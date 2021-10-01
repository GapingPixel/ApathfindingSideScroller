/// @description Retry Menu
with(obj_game_state_controller)
{
//scr_pause();
instance_create_layer(global.cam_x + global.cam_width/2,global.cam_y + global.cam_height/2,"Menu",menu_retry);
}