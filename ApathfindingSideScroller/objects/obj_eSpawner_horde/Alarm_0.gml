/// @description Create enemy object to spawn
var left_side = global.cam_x - edge_spawn_offset;
var right_side = global.cam_x + global.cam_width + edge_spawn_offset;
var top_side = global.cam_y - edge_spawn_offset
var bottom_side = global.cam_y + global.cam_height + edge_spawn_offset;

var offset_x = edge_spawn_x_randomizer
var offset_y = edge_spawn_y_randomizer
var eSpawn;

if edge_spawn_active
{
	switch(edge_spawn_type)
	{
		case enemyEdgeSpawner_horizontal:
			if scr_enemy_weightted_spawner_chance() == 0//Spawn from the left
			{
				
				eSpawn = instance_create_layer(left_side,y+offset_y,"Enemy",edge_spawn_enemy_object);
			}
			else//Spawn from the right
			{
				eSpawn = instance_create_layer(right_side,y+offset_y,"Enemy",edge_spawn_enemy_object);
				with(eSpawn)
				{
					facing = -1;
					image_xscale = facing;
				}
			}
		break;
		
		
		case enemyEdgeSpawner_vertical:
		if scr_enemy_weightted_spawner_chance() == 0//Spawn from the Top
		{
			eSpawn = instance_create_layer(x+offset_x,top_side-edge_spawn_offset,"Enemy",edge_spawn_enemy_object);
		}
		else //Spawn from the Bottom
		{
			eSpawn = instance_create_layer(x+offset_x,bottom_side+edge_spawn_offset,"Enemy",edge_spawn_enemy_object);
		}
		break;
	}
}

alarm[0] = edge_spawn_frequency

///Need to Inherit/Override to change the objects stuff upon creation