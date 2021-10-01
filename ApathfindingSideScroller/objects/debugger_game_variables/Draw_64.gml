if debugger_on == true
{
draw_set_alpha(0.5);
draw_rectangle_colour(0, 0+160,0+320, 0+540,
c_black,c_black,c_black,c_black,0);


draw_set_font(fnt_debug);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);

draw_text(0,0+160,string_hash_to_newline("Game Debugger Menu"));
draw_text(160,160,"- = Restart Room");
draw_text(0,0+160+16,string_hash_to_newline("1 - Game Variables"));
draw_text(0,0+160+32,string_hash_to_newline("2 - Player Values Data"));
draw_text(0,0+160+48,string_hash_to_newline("3 - Player Input Data"));
draw_text(0,0+160+64,string_hash_to_newline("4 - Element Spawner"));
draw_text(0,0+160+80,string_hash_to_newline("5 - Frame Skip Data"));

draw_text(0,0+160+96,string_hash_to_newline("Game Variables"));
draw_text(0,0+160+112,string_hash_to_newline("FPS (realtime) = " + string(fps_real)));
draw_text(0,0+160+128,string_hash_to_newline("FPS (ingame) = " + string(fps)));
draw_text(0,0+160+144,string_hash_to_newline("Particle Count (above) = " + string(part_particles_count(global.parsys))));
draw_text(0,0+160+160,string_hash_to_newline("Particle Count (below) = " + string(part_particles_count(global.parsys_below))));
draw_text(0,0+160+176,string_hash_to_newline("Instance Count = " + string(instance_count)));
draw_text(0,0+160+192,string_hash_to_newline("Music Vol = " + string(global.settings_master_vol_music)));
draw_text(0,0+160+208,string_hash_to_newline("Sound Vol = " + string(global.settings_master_vol_sfx)));
draw_text(0,0+160+224,string_hash_to_newline("Current Room = " + string(room_get_name(room))));
draw_text(0,160+240,string_hash_to_newline("Map Posistion = " + string(global.game_map_playerPos_x) + ", " + string(global.game_map_playerPos_y)));
draw_text(0,160+256,string_hash_to_newline("Map = " + string(room_get_name(global.game_map_room))));
draw_text(0,160+272,string_hash_to_newline("Room State = " + string(global.game_room_state)));
draw_text(0,160+288,"World " + string(global.curr_world) + " - Level  " + string(global.curr_level));
draw_text(0,160+304,"Coin 1 Get " + string(global.stage_nanoMod_collected[global.curr_world][global.curr_level][0]));
draw_text(0,160+320,"Coin 2 Get " + string(global.stage_nanoMod_collected[global.curr_world][global.curr_level][1]));
draw_text(0,160+336,"Coin 3 Get " + string(global.stage_nanoMod_collected[global.curr_world][global.curr_level][2]));
}


