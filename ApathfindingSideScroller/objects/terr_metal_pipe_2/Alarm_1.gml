if !instance_place(x,y,env_var_metalPipe_atom)
{
var inst = instance_create_depth(x,y,depth-1,env_var_metalPipe_atom);
inst.direction = image_angle
inst.image_xscale = 0;
inst.image_yscale = 0;
    with(inst)
        motion_set(direction,irandom_range(1,2));

}
   

alarm[1] = choose(90,180);


