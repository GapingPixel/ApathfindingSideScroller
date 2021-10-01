

//leak
if (x >= global.cam_x - 100 && x <= global.cam_x + global.cam_width + 100)
part_particles_create(global.parsys_below,x,y,part_var_terrain_pipe_leak,irandom_range(1,5));

