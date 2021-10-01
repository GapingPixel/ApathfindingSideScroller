event_inherited();
if debugger_on == true
{


draw_text(0,0+160+96,string_hash_to_newline("Player Data"));
//draw_text(0,0+160+128,string_hash_to_newline("Mouse Pos X = " + string(mouse_x)));
//draw_text(0,0+160+144,string_hash_to_newline("Mouse Pos Y = " + string(mouse_y)));

var plyr = obj_plyr1;

if instance_exists(plyr)
{
	draw_text(0,0+160+128,"Stretch X = " + string(plyr.stretch_x));
	draw_text(0,0+160+144,"Stretch Y = " + string(plyr.stretch_y));
	draw_text(0,0+160+160,"jumping = " + string(plyr.var_jumping));
	draw_text(0,0+160+176,"running = " + string(plyr.var_running));
	draw_text(0,0+160+192,"dashing = " + string(plyr.var_dashing));
	draw_text(0,0+160+208,"wallgrab = " + string(plyr.var_wallgrab));
	draw_text(0,0+160+224,"wallslide = " + string(plyr.var_wallslide));
	draw_text(0,0+160+240,"aim_buffer = " + string(plyr.var_aim_buffer));
	draw_text(0,0+160+256,"parry = " + string(plyr.var_parry));
	draw_text(0,0+160+272,"parry frames = " + string(plyr.var_parry_frame));
	draw_text(0,0+160+288,"rolling = " + string(plyr.var_rolling));
	draw_text(0,0+160+304,"coyote jump = " + string(plyr.var_coyote_jump_frame));
	draw_text(0,0+160+320,"i_frame count = " + string(plyr.var_i_frame_count));
	draw_text(0,0+160+336,"temperature = " + string(plyr.var_temp));
	draw_text(0,0+160+352,"shooting = " + string(plyr.var_shooting));
	draw_text(0,0+160+368,"crouching = " + string(plyr.var_crouching));
	draw_text(0,0+160+384,"left Stick Hori = " + string(plyr.lsHor));
	draw_text(0,0+160+400,"left Stick Vert = " + string(plyr.lsVer));
}


draw_text(120,0+160+128,string_hash_to_newline("S key, set room speed"));
draw_text(120,0+160+144,string_hash_to_newline("Q key, damage players"));
draw_text(120,0+160+160,string_hash_to_newline("H key, toggle HUD"));
draw_text(120,0+160+176,string_hash_to_newline("K key, kill P1"));
draw_text(120,0+160+192,string_hash_to_newline("L key, kill P2"));
draw_text(120,0+160+208,string_hash_to_newline("P key, Lot of HP"));
draw_text(120,0+160+224,string_hash_to_newline("I key, max Stats"));
draw_text(120,0+160+240,string_hash_to_newline("O key, Invicible"));
draw_text(120,0+160+256,string_hash_to_newline("W key, Shock players"));
draw_text(120,0+160+272,string_hash_to_newline("E key, Freeze players"));
draw_text(120,0+160+288,string_hash_to_newline("U key, Show Cam/Spawn detection"));
draw_text(120,0+160+304,string_hash_to_newline("Y key, set players invisible"));

draw_text(240,0+160+128,string_hash_to_newline("1, change player 1 character"));
draw_text(240,0+160+144,string_hash_to_newline("2, change player 2 character"));
draw_text(240,0+160+160,string_hash_to_newline("3, change player 1 alt"));
draw_text(240,0+160+176,string_hash_to_newline("4, change player 2 alt"));
draw_text(240,0+160+192,string_hash_to_newline("Change Player Count = ") + string(global.total_players));



		if keyboard_check_pressed(ord("1"))
		{
			
			global.character[0]++;
				
			if global.character[0] > 1
				global.character[0] = 0;
		}
		
		if keyboard_check_pressed(ord("2"))
		{
			global.character[1]++;
				
			if global.character[1] > 1
				global.character[1] = 0;
		}
		
		if keyboard_check_pressed(ord("3"))
		{
			
			global.character_alt[0]++;
				
			if global.character_alt[0] > 5
				global.character_alt[0] = 0;
			
		}
		
		if keyboard_check_pressed(ord("4"))
		{
			
			global.character_alt[1]++;
				
			if global.character_alt[1] > 5
				global.character_alt[1] = 0;
			
		}
		
		if keyboard_check_pressed(ord("5"))
		{
			
			if global.total_players = 2
				global.total_players = 1;
			else
				global.total_players = 2;
			
		}

}

