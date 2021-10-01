/// @description Save Game Settings
function scr_game_save_settings() {
	ini_open("game_settings.ini")
	ini_write_real("display", "res_setting", global.settings_res_main);
	ini_write_real("display", "fullscreen", global.settings_fullscreen);
	ini_write_real("display", "vsync", global.settings_vsync);
	ini_write_real("display", "aa", global.settings_aa);
	ini_write_real("display", "screenshake", global.settings_screen_shake);
	ini_write_real("volume", "vol_music", global.settings_master_vol_music);
	ini_write_real("volume", "vol_sfx", global.settings_master_vol_sfx);
	ini_write_real("language", "lang", global.settings_language);
	ini_close();



}
