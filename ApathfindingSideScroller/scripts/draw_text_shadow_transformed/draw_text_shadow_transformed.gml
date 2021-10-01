/// @description Draw text with shadows and transformed

function draw_text_shadow_transformed(xPos, yPos, str, xScale, yScale, angle, str_color, shadow_color, shadow_dir, shadow_len, shadow_alpha) {



	//Draw text shadow
	draw_set_colour(shadow_color);
	draw_set_alpha(shadow_alpha);
	var shadow_x = xPos+lengthdir_x(shadow_len, shadow_dir);
	var shadow_y = yPos+lengthdir_y(shadow_len, shadow_dir);
	draw_text_transformed(shadow_x, shadow_y, string_hash_to_newline(str),xScale,yScale,angle);

	//Draw text
	draw_set_colour(str_color);
	draw_set_alpha(1);
	draw_text_transformed(xPos, yPos, string_hash_to_newline(str),xScale,yScale,angle);
	draw_set_colour(c_white);



}
