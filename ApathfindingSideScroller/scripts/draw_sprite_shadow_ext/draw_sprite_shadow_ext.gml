/// @description draw_sprite_shadow(direction, distance_X,distance_Y, scale_X, scale_Y, colour, alpha);
/// @param direction
/// @param  Xdistance
/// @param  Ydistance
/// @param  Xscale
/// @param  Yscale
/// @param  colour
/// @param  alpha
///Draws the shadow of a sprite
///Using the calling object's x, y, image_angle, sprite_index & image_index
function draw_sprite_shadow_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	/*
	 * Example use:
	 * draw_sprite_shadow(270, 4, 6, 1, 1.5, c_black, 0.5);
	 * draw_self();
	 */
	var dir = argument0;
	var len_X = argument1;
	var len_Y = argument2;
	var sca_X = argument3;
	var sca_Y = argument4;
	var col = argument5;
	var alp = argument6;
	var xx = x+lengthdir_x(len_X, dir);
	var yy = y+lengthdir_y(len_Y, dir);
	gpu_set_fog(true, col, 50, 1000);
	draw_sprite_ext(sprite_index, image_index, xx, yy, sca_X*image_xscale, sca_Y*image_yscale, image_angle, c_white, alp);
	gpu_set_fog(0, 0, 0, 0);




}
