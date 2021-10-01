
event_inherited();

var intheView =  (x >= global.cam_x - 100 && x <= global.cam_x + global.cam_width + 100)

if intheView
{
	switch(pipe_type)
	{
	default://Smoke Pipe
	if env_heat_value > -5
	part_particles_create(global.parsys_below,x,y,part_var_terrain_pipe_leak,irandom_range(1,5));
	break;
	
	case 1://Water Drip
	
	break;
	}
}



