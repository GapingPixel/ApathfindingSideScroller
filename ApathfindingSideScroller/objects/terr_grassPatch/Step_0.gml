/// @description After initializing, create grass
if !ini
{
for(var i = -env_var_grassPatch_span; i <= env_var_grassPatch_span; i++)
{
    //High Depth
	var inst = instance_create_depth(x + i*env_var_grassPatch_width_seed*(30+random_range(0,2)) + random_range(-4,0),y,-10,terr_grass)
	inst.image_yscale *= image_yscale * random_range(0.5,1) * env_var_grassPatch_height_seed;
    inst.image_xscale *=  choose(-1,1)
	inst.image_index = irandom_range(0,2);
	
	//Low Depth
    var inst2 = instance_create_depth(x + i*env_var_grassPatch_width_seed*(30+random_range(2,6)) + random_range(-4,0),y,10,terr_grass)
	inst2.image_yscale *= image_yscale * random_range(0.5,1) * env_var_grassPatch_height_seed;
    inst2.image_xscale *= choose(-1,1)
	inst2.image_index = irandom_range(0,2);
	inst2.image_blend = c_dkgray;
}

ini = true;
}
else//Kill object when patch is created
{
instance_destroy();
}

