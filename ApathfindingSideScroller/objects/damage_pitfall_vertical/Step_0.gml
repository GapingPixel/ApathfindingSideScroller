/// @description Set Pit Fall below screen

var y_Offset = 128;//Set this to offset pitfall to prevent cheap hits/death
var cam_x = global.cam_x;
var cam_width = global.cam_width;
var cam_y = global.cam_y;
var cam_height = global.cam_height;

x = cam_x + cam_width/2
y = cam_y + cam_height + y_Offset;

