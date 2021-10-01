// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_set_horde_ini(enemy,spawnType,initialSpawnOffset,spawnOffsetSeed,frequency){
//Initializes values

edge_spawn_enemy_object = enemy;

edge_spawn_offset = initialSpawnOffset;

//Set Spawn Style
switch(spawnType)
{
	//Basic Horizontal Horde
	default:
	edge_spawn_type = enemyEdgeSpawner_horizontal;
	edge_spawn_y_randomizer = spawnOffsetSeed;
	edge_spawn_vertical_trigger = false;
	break;
	
	//Vertical Horde, enemies spawn from ceiling
	case 1:
	edge_spawn_type = enemyEdgeSpawner_vertical;
	edge_spawn_x_randomizer = spawnOffsetSeed;
	edge_spawn_vertical_trigger = true;
	break;
	
	//Horizontal Horde, enemies spawn from ceiling
	case 4:
	edge_spawn_type = enemyEdgeSpawner_vertical;
	edge_spawn_x_randomizer = spawnOffsetSeed;
	edge_spawn_vertical_trigger = false;
	break;
}


edge_spawn_frequency = frequency;

}