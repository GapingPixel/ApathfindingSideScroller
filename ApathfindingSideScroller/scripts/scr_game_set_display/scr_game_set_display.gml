/// @description Script to get new display
function scr_game_set_display() {
	window_set_fullscreen(global.settings_fullscreen);
	display_reset(global.settings_aa,global.settings_vsync)
	//display_set_windows_vertex_buffer_method(vertex);



}
