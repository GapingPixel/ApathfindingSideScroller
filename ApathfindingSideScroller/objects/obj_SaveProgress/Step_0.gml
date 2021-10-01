/// @description Update Graphic Position
x = global.cam_x + 64
y = global.cam_y + global.cam_height - 64

if image_alpha <= 0
	instance_destroy()