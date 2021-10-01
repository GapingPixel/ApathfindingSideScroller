/// @description draw_sprite_shake(shake_intensity)
/// @param shake_intensity
function draw_sprite_shake(argument0) {
	//Shaky shake the sprite

	draw_sprite_ext(sprite_index,image_index,
	x + random_range(-argument0,argument0),
	y + random_range(-argument0,argument0),
	image_xscale,image_yscale,image_angle,image_blend,image_alpha)



}
