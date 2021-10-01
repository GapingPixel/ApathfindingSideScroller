///@description Shoot out an atom
if pipe_atom != 0
&& !instance_place(x,y,pipe_atom)
&& env_heat_value > -5
{
var inst = instance_create_depth(x,y,depth-1,pipe_atom);
inst.direction = image_angle + 90
inst.image_xscale = 0;
inst.image_yscale = 0;
if env_heat_value < 5
    with(inst)
        motion_set(direction,irandom_range(1,2));
else
    with(inst)
        motion_set(direction+(random_range(-20,20)),irandom_range(6,8));
}
   

alarm[1] = irandom_range(180,240);


