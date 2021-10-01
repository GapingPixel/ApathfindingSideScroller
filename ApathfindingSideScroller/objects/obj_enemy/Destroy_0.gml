/// @description For wave spawning enemies and dropping goods
if instance_exists(obj_wave_spawner)
{
	with(obj_wave_spawner)
	{
		if (waveSpawn_trigger)
		{
			remaining[waveSpawn_curr_wave] --;
		}
	}
}

scr_enemy_drop_goods(enemy_goodies_quantity);