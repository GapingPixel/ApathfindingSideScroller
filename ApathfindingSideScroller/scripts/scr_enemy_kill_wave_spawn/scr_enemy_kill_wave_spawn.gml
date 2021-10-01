////Set in Destroy event of objects / enemies
function scr_enemy_kill_wave_spawn() {

	/// @description For wave spawning enemies
	if instance_exists(obj_wave_spawner)
	{
		with(obj_wave_spawner)
		{
			if (waveSpawn_trigger)
			{
				remaining[waveSpawn_curr_wave] --;//reduce count in the current wave
			}
		}
	}


}
