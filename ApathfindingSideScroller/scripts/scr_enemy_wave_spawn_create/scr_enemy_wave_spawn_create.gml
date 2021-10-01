function scr_enemy_wave_spawn_create() {
	//initiate wave spawn system

	//ds_list_add(waveSpawn_list,[WAVE,ENEMY,POS,SCALE_X,SCALE_Y,DELAY,DROP]);

	waveSpawn_list = ds_list_create();

	//Spawn Points
	/*
	waveSpawn_spawnPos[WAVE,0] = waveSpawnerZ.x;
	waveSpawn_spawnPos[WAVE,1] = waveSpawnerZ.y;
	*/

	if instance_exists(waveSpawnerPos1)//1
	{
	waveSpawn_spawnPos[0,0] = waveSpawnerPos1.x;
	waveSpawn_spawnPos[0,1] = waveSpawnerPos1.y;
	}
	else//just in case we're dumb and forget to add waveSpawnerPos1
	{
	waveSpawn_spawnPos[0,0] = x;
	waveSpawn_spawnPos[0,1] = y;
	}

	if instance_exists(waveSpawnerPos2)//2
	{
	waveSpawn_spawnPos[1,0] = waveSpawnerPos2.x;
	waveSpawn_spawnPos[1,1] = waveSpawnerPos2.y;
	}


	if instance_exists(waveSpawnerPos3)//3
	{
	waveSpawn_spawnPos[2,0] = waveSpawnerPos3.x;
	waveSpawn_spawnPos[2,1] = waveSpawnerPos3.y;
	}

	if instance_exists(waveSpawnerPos4)//4
	{
	waveSpawn_spawnPos[3,0] = waveSpawnerPos4.x;
	waveSpawn_spawnPos[3,1] = waveSpawnerPos4.y;
	}

	if instance_exists(waveSpawnerPos5)//5
	{
	waveSpawn_spawnPos[4,0] = waveSpawnerPos5.x;
	waveSpawn_spawnPos[4,1] = waveSpawnerPos5.y;
	}

	if instance_exists(waveSpawnerPos6)//6
	{
	waveSpawn_spawnPos[5,0] = waveSpawnerPos6.x;
	waveSpawn_spawnPos[5,1] = waveSpawnerPos6.y;
	}

	if instance_exists(waveSpawnerPos7)//7
	{
	waveSpawn_spawnPos[6,0] = waveSpawnerPos7.x;
	waveSpawn_spawnPos[6,1] = waveSpawnerPos7.y;
	}

	if instance_exists(waveSpawnerPos8)//8
	{
	waveSpawn_spawnPos[7,0] = waveSpawnerPos8.x;
	waveSpawn_spawnPos[7,1] = waveSpawnerPos8.y;
	}

	if instance_exists(waveSpawnerPos9)//9
	{
	waveSpawn_spawnPos[8,0] = waveSpawnerPos9.x;
	waveSpawn_spawnPos[8,1] = waveSpawnerPos9.y;
	}

	if instance_exists(waveSpawnerPos10)//10
	{
	waveSpawn_spawnPos[9,0] = waveSpawnerPos10.x;
	waveSpawn_spawnPos[9,1] = waveSpawnerPos10.y;
	}

	if instance_exists(waveSpawnerPos11)//11
	{
	waveSpawn_spawnPos[10,0] = waveSpawnerPos10.x;
	waveSpawn_spawnPos[10,1] = waveSpawnerPos10.y;
	}


	if instance_exists(waveSpawnerPos12)//12
	{
	waveSpawn_spawnPos[11,0] = waveSpawnerPos12.x;
	waveSpawn_spawnPos[11,1] = waveSpawnerPos12.y;
	}

	if instance_exists(waveSpawnerPos13)//13
	{
	waveSpawn_spawnPos[12,0] = waveSpawnerPos13.x;
	waveSpawn_spawnPos[12,1] = waveSpawnerPos13.y;
	}

	if instance_exists(waveSpawnerPos14)//14
	{
	waveSpawn_spawnPos[13,0] = waveSpawnerPos14.x;
	waveSpawn_spawnPos[13,1] = waveSpawnerPos14.y;
	}

	if instance_exists(waveSpawnerPos15)//15
	{
	waveSpawn_spawnPos[14,0] = waveSpawnerPos15.x;
	waveSpawn_spawnPos[14,1] = waveSpawnerPos15.y;
	}

	if instance_exists(waveSpawnerPos16)//16
	{
	waveSpawn_spawnPos[15,0] = waveSpawnerPos16.x;
	waveSpawn_spawnPos[15,1] = waveSpawnerPos16.y;
	}

	if instance_exists(waveSpawnerPos17)//17
	{
	waveSpawn_spawnPos[16,0] = waveSpawnerPos17.x;
	waveSpawn_spawnPos[16,1] = waveSpawnerPos17.y;
	}

	if instance_exists(waveSpawnerPos18)//18
	{
	waveSpawn_spawnPos[17,0] = waveSpawnerPos18.x;
	waveSpawn_spawnPos[17,1] = waveSpawnerPos18.y;
	}

	if instance_exists(waveSpawnerPos19)//19
	{
	waveSpawn_spawnPos[18,0] = waveSpawnerPos19.x;
	waveSpawn_spawnPos[18,1] = waveSpawnerPos19.y;
	}

	if instance_exists(waveSpawnerPos20)//20
	{
	waveSpawn_spawnPos[19,0] = waveSpawnerPos20.x;
	waveSpawn_spawnPos[19,1] = waveSpawnerPos20.y;
	}



	//Reference for adding elements to waves
	//ds_list_add(waves,[WAVE,ENEMY,POS,SCALE_X,SCALE_Y,DELAY,DROP])


}
