event_inherited();
if debugger_on == true
{
debugger_o_spawn_x = mouse_x;
debugger_o_spawn_y = mouse_y;
draw_text(160,160,"- = Restart Room");
draw_text(0,0+160+96,"Object Spawner - Left Click on screen to spawn enemy at mouse point");

if debugger_object != 0
draw_text(0,0+160+112,"Object Spawn = " + object_get_name(debugger_object));
else
draw_text(0,0+160+112,"Object Spawn = N/A; Type key to set object to spawn");

draw_text(0,0+160+128,"BackSpace = Destroy all Objects");


		#region//Objects
		draw_text(320,0+160+176,"1 = Metal Block");
		draw_text(320,0+160+192,"2 = Metal Ledge");
		draw_text(320,0+160+208,"3 = Metal Pipe (Platform)");
		draw_text(320,0+160+224,"4 = Metal Pipe");
		draw_text(320,0+160+240,"5 = ");
		draw_text(320,0+160+256,"6 = ");
		draw_text(320,0+160+272,"7 = ");
		draw_text(320,0+160+288,"8 = ");
		draw_text(320,0+160+304,"9 = ");
		draw_text(320,0+160+320,"0 = ");
		draw_text(0,0+160+176,"Q = Leaf Platform");
		draw_text(0,0+160+192,"W = Dandelion");
		draw_text(0,0+160+208,"E = Grass Patch");
		draw_text(0,0+160+224,"R = ");
		draw_text(0,0+160+240,"T = ");
		draw_text(0,0+160+256,"Y = ");
		draw_text(0,0+160+272,"U = ");
		draw_text(0,0+160+288,"I = ");
		draw_text(0,0+160+304,"O = ");
		draw_text(0,0+160+320,"P = ");
		draw_text(0,0+160+336,"A = Ice Block");
		draw_text(0,0+160+358,"S = ");
		draw_text(160,0+160+176,"D = Slime Wall");
		draw_text(160,0+160+192,"F = Slime Floor");
		draw_text(160,0+160+208,"G = ");
		draw_text(160,0+160+224,"H = ");
		draw_text(160,0+160+240,"J = ");
		draw_text(160,0+160+256,"K = ");
		draw_text(160,0+160+272,"L = ");
		draw_text(160,0+160+288,"Z = Ore Block");
		draw_text(160,0+160+304,"X = Ore Ledge");
		draw_text(160,0+160+320,"C = Ore Deposit");
		draw_text(160,0+160+336,"V = ");
		draw_text(160,0+160+358,"B = ");
		draw_text(480,0+160+176,"N = ");
		draw_text(480,0+160+192,"M = Body of Water");
		
			switch(keyboard_key)
			{
				case ord("1"):
					debugger_object = terr_metal_block;
				break;
				case ord("2"):
					debugger_object = terr_metal_ledge;
				break;
				case ord("3"):
					debugger_object = terr_metal_pipe;
				break;
				case ord("4"):
				break;
				case ord("5"):
				break;
				case ord("6"):
				break;
				case ord("7"):
				break;
				case ord("8"):
				break;
				case ord("9"):
				break;
				case ord("0"):
				break;
				case ord("Z"):
					debugger_object = terrain_ore_block
				break;
				case ord("X"):
					debugger_object = terrain_ore_platform
				break;
				case ord("Q"):
					debugger_object = terr_leaf_platform
				break;
				case ord("W"):
					debugger_object = terr_grassPatch
				break;
				case ord("E"):
				break;
				case ord("R"):
				break;
				case ord("T"):
				break;
				case ord("Y"):
				break;
				case ord("U"):
				break;
				case ord("I"):
				break;
				case ord("O"):
				break;
				case ord("P"):
				break;
				case ord("A"):
					debugger_object = terr_ice_block;
				break;
				case ord("S"):
				break;
				case ord("D"):
					debugger_object = terr_slime_wall;
				break;
				case ord("F"):
					debugger_object = terr_slime_terrain;
				break;
				case ord("G"):
				break;
				case ord("H"):
				break;
				case ord("J"):
				break;
				case ord("K"):
				break;
				case ord("L"):
				break;
				case ord("C"):
					debugger_object = terrain_ore_deposit;
				break;
				case ord("V"):
				break;
				case ord("B"):
				break;
				case ord("N"):
				break;
				case ord("M"):
					debugger_object = terr_water_body;
				break;
			}
	#endregion
	
	if mouse_check_button_pressed(mb_left)
	{
		/// @description Spawn Object
		if debugger_object != 0
		{
		var t = instance_create_depth(debugger_o_spawn_x,debugger_o_spawn_y,0,debugger_object);
			if debugger_object = terr_water_body
			{
				
				with(t)
				{
					image_xscale *= 100
					image_yscale *= 25
					liquid_set_values(sprite_width,sprite_height,sprite_width/16,3,6,1,1,2,3,1);
				}
			}
		}
	}
	
	if keyboard_check_pressed(vk_backspace)
	{
		with(obj_env)
		{
			instance_destroy();	
		}
		
		with(obj_env_solids)
		{
			instance_destroy();	
		}
		
		with(obj_env_platforms)
		{
			instance_destroy();	
		}
	}
}