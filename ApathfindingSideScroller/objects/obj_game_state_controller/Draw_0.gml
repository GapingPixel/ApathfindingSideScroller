//Alpha Build, Game Paused
/*with(obj_enemy)
{
	draw_self();	
}*/
//display_set_gui_size(1280,720);
if global.game_state = GameState.paused 
|| game_state_controller_var_show_results == true 
|| global.game_state = GameState.inSuper
{

if sprite_exists(global.screenshot)
draw_sprite_ext(global.screenshot,0,global.cam_x,global.cam_y,0.75,0.75,0,c_white,1);

draw_sprite_stretched_ext(spr_trans_black,0,global.cam_x,global.cam_y,960,540,c_black,0.5);


if global.game_state = GameState.paused
{
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(fnt_BIG);
draw_text_ext(global.cam_x + global.cam_width/2, global.cam_y + 64,scr_get_string(11), 5, 100);
}


}