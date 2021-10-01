/// @description Movement

image_angle = direction

if image_yscale < 1
    image_yscale += 0.1;
    
if place_meeting(x,y,parSolid)
    instance_destroy();
