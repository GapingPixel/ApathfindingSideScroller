/// @description Script to get new resolution settings from options
function scr_game_set_resolution() {

	// Set the size of GUI
	display_set_gui_size(global.settings_res_W, global.settings_res_H);

	// Set the size of the game window
	window_set_size(global.settings_res_W, global.settings_res_H);

	// Determine the aspect ratio
	var aspect = global.settings_base_display_W/global.settings_base_display_H;

	// Work out the adjusted height and width
	if (global.settings_base_display_W >= global.settings_base_display_H)
	{
	    var height = min(global.settings_base_display_H, global.settings_res_H);
	    var width = height * aspect;
	}

	// Resize the application surface to our adjusted values
	surface_resize(application_surface, width, height);



}
