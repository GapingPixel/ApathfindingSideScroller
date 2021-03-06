/// @description  draw_sprite_skew(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, image_xskew, image_yskew);
/// @param sprite_index
/// @param  image_index
/// @param  x
/// @param  y
/// @param  image_xscale
/// @param  image_yscale
/// @param  image_angle
/// @param  image_blend
/// @param  image_alpha
/// @param  image_xskew
/// @param  image_yskew
function draw_sprite_skew(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
	//Skewing effect for wavy sprites

	var sprite   = argument0; 
	var index    = argument1;
	var xx       = argument2;
	var yy       = argument3; 
	var xscale   = argument4; 
	var yscale   = argument5;
	var cosAngle = cos(degtorad(argument6)); 
	var sinAngle = sin(degtorad(argument6)); 
	var tint     = argument7;
	var alpha    = argument8;
	var hskew    = argument9;
	var vskew    = argument10;

	// Calculate common operations
	var sprTex    = sprite_get_texture(sprite, index); 
	var sprWidth  = sprite_get_width(sprite); 
	var sprHeight = sprite_get_height(sprite); 
	var sprXOrig  = sprite_get_xoffset(sprite); 
	var sprYOrig  = sprite_get_yoffset(sprite);

	var tempX, tempY;//, tempDir, tempDist;

	// Begin drawing primitive
	draw_primitive_begin_texture(pr_trianglestrip, sprTex);

	// Top-left corner
	tempX = (-sprXOrig + (sprYOrig / sprHeight) * hskew) * xscale;
	tempY = (-sprYOrig + (sprXOrig / sprWidth) * -vskew) * yscale;
	draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 0, 0, tint, alpha);

	// Top-right corner
	tempX = (sprWidth + (sprYOrig / sprHeight) * hskew - sprXOrig) * xscale;
	tempY = (-sprYOrig + (1 - sprXOrig / sprWidth) * vskew) * yscale;
	draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 1, 0, tint, alpha);

	// Bottom-left corner
	tempX = (-sprXOrig + (1 - sprYOrig / sprHeight) * -hskew) * xscale;
	tempY = (sprHeight - sprYOrig + (sprXOrig / sprWidth) * -vskew) * yscale;
	draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 0, 1, tint, alpha);

	// Bottom-right corner
	tempX = (sprWidth - sprXOrig + (1 - sprYOrig / sprHeight) * -hskew) * xscale;
	tempY = (sprHeight - sprYOrig + (1 - sprXOrig / sprWidth) * vskew) * yscale;
	draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 1, 1, tint, alpha);

	// Finish drawing primitive
	draw_primitive_end();




}
