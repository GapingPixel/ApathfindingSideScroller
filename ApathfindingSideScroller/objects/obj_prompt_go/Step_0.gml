//image_speed = 0.5

//Center prompt on screen
x = global.cam_x + (global.cam_width/2);
y = global.cam_y + (global.cam_height/2);


if prompt_var_go_grow
{
image_xscale += 0.25;
image_yscale += 0.25;

image_alpha -= .05;
}

if image_alpha <= 0
    instance_destroy();

