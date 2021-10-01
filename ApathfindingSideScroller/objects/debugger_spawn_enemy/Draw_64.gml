event_inherited();
if debugger_on == true
{
debugger_e_spawn_x = mouse_x;
debugger_e_spawn_y = mouse_y;
draw_text(160,160,"- = Restart Room");
draw_text(0,0+160+96,"Enemy Spawner - Left Click on screen to spawn enemy at mouse point");

draw_text(0,0+160+112,"Q key, toggle enemy selector Left; E key, toggle enemy selector Right")

if debugger_enemy != 0
draw_text(0,0+160+128,"Enemy Spawn = " + object_get_name(debugger_enemy));
else
draw_text(0,0+160+128,"Enemy Spawn = [EMPTY]");

draw_text(0,0+160+142,"BackSpace = Destroy all Enemies");

		#region//Enemies
			switch(debugger_enemy_cursor)
			{
				case 0:
					debugger_enemy = enemy_robot_minion;
				break;
				case 1:
					debugger_enemy = enemy_robot_solider_rifle;
				break;
				case 2:
					debugger_enemy = enemy_robot_bananaGunner;
				break;
				case 3:
					debugger_enemy = enemy_robot_biter;
				break;
				case 4:
					debugger_enemy = enemy_robot_aerialUnit_gunner
				break;
				case 5:
					debugger_enemy = enemy_robot_aerialUnit_volley
				break;
				case 6:
					debugger_enemy = enemy_robot_drone;
				break;
				case 7:
					debugger_enemy = enemy_robot_dropper;
				break;
				case 8:
					debugger_enemy = enemy_robot_minion;
				break;
				case 9:
					debugger_enemy = enemy_robot_prickly;
				break;
				case 10:
					debugger_enemy = enemy_robot_prickly_climber;
				break;
				case 11:
					debugger_enemy = enemy_robot_turret;
				break;
				case 12:
					debugger_enemy = enemy_germ_mold;
				break;
				case 13:
					debugger_enemy = enemy_germ_gooper;
				break;
				case 14:
					debugger_enemy = enemy_germ_gooberGunner;
				break;
				case 15:
					debugger_enemy = enemy_germ_nose;
				break;
				case 16:
					debugger_enemy = enemy_germ_doublegooper;
				break;
				case 17:
					debugger_enemy = enemy_germ_swimmer;
				break;
				case 18:
					debugger_enemy = enemy_germ_tube;
				break;
				case 19:
					debugger_enemy = enemy_elem_gassy;
				break;
				case 20:
					debugger_enemy = enemy_fire_explosiveKitty;
				break;
				case 21:
					debugger_enemy = enemy_fire_hotWings;
				break;
				case 22:
					debugger_enemy = enemy_fire_hotWings;
				break;
				case 23:
					debugger_enemy = enemy_ice_chillGuy;
				break;
				case 24:
					debugger_enemy = enemy_robot_diamond;
				break;
				case 25:
					debugger_enemy = enemy_robot_jet;
				break;
				case 26:
					debugger_enemy = enemy_robot_seekerunit;
				break;
				case 27:
					debugger_enemy = enemy_robot_solider_pistol;
				break;
				case 28:
					debugger_enemy = enemy_robot_solider_grenade;
				break;
				case 29:
					debugger_enemy = enemy_robot_aerialcannon;
				break;
				case 30:
					debugger_enemy = enemy_germ_flea;
				break;
				case 31:
					debugger_enemy = enemy_germ_flyingRanha;
				break;
				case 32:
					debugger_enemy = enemy_germ_tinyRanha;
				break;
				case 33:
					debugger_enemy = enemy_germ_squito;
				break;
				case 34:
					debugger_enemy = enemy_elem_bat;
				break;
				case 35:
					debugger_enemy = enemy_robot_minion;
				break;
				default:
					debugger_enemy = 0
				break;
				break;
			}

	#endregion
	
	if mouse_check_button_pressed(mb_left)
	{
		/// @description Spawn Enemy
		if debugger_enemy != 0
		{
		if layer_exists("Enemy")
			instance_create_layer(debugger_e_spawn_x,debugger_e_spawn_y,"Enemy",debugger_enemy);
		}
	}
	
	if keyboard_check_pressed(vk_backspace)
	{
		with(obj_enemy)
		{
			instance_destroy();	
		}
	}	
}