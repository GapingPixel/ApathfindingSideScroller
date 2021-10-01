//var farRight = x > ((global.cam_x + global.cam_width) + 64)
//var farLeft = x < (global.cam_x - 64)

//Spawn when off screen
//if eSpawn_offscreen == true
{
	if eSpawn_child = 0
	{
		
		

		var inst = instance_create_layer(x,y,"Enemy",eSpawn_enemy);

	    inst.facing = image_xscale;
		with(inst)
			image_xscale = facing;
		
		with(inst)
		{
			enemy_behavior = enemy_SPAWN;
			skeleton_animation_set("0_spawn_runout");
		}
	    eSpawn_child = inst;
	}
}


alarm[0] = eSpawn_frequency;