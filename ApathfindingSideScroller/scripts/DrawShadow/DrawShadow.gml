/// @description DrawShadow(x offset, y offset, shadow width,shadow height; Also need shadow_y value)
/// @param x_offset
/// @param y_offset
/// @param  shadow_width
/// @param shadow_height; Also need shadow_y value
function DrawShadow(argument0, argument1, argument2, argument3) {
	var ss = power(0.9, (shadow_y - y) / 50);
	draw_sprite_ext(spr_shadow, 0, x + argument0, shadow_y + argument1, ss*argument2, ss*argument3, 0, c_white, 1.0)




}
