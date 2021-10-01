x = global.cam_x + (global.cam_width/2);
y = global.cam_y + (global.cam_height/4);
image_yscale = 0;

alarm[0] = 180;//Go prompt
alarm[1] = 90;//Shrink

//Effect
var rand = irandom(2)
image_alpha = 0;

switch(rand)
{
case 0: image_yscale = 2; image_xscale = 2; break;
case 1: image_yscale = 2; image_xscale = 1; break;
case 2: image_yscale = 1; image_xscale = 2; break;
}

