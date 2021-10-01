/// @description Spawn Rate
if eSpawn_child = 0
{
    var inst = instance_create_layer(x,y,"Enemy",eSpawn_enemy);
    inst.image_xscale = image_xscale;
	eSpawn_child = inst;
    
}

alarm[0] = eSpawn_frequency;