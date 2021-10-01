/// @description shader_scr_element_glow(image_blend,intensity)
function scr_element_glow(size) {
	//Glow script for elements

	var color;
	
	if variable_instance_exists(id,"atom")
	{
		switch(atom)
		{
		default://To prevent crashes
			color = c_white;
		break;
		
		//Metals
		case atom_na:
		case atom_k:
		case atom_ba:
		case atom_ho:
			color = make_color_rgb(180,180,255);
		break;
		
		//NonMetals
		case atom_c:
		case atom_h:
		case atom_n:
		case atom_o:
			color = make_color_rgb(255,255,180);
		break;
		
		//Halogens
		case atom_f:
		case atom_cl:
		case atom_br:
		case atom_i:
			color = make_color_rgb(180,255,180);
		break;
	
		}
	
	if atom != 0//Draw Glow if we yield an element
	{
	draw_sprite_shadow(0,0,1.55*random_range(0.9,1)*size,color,0.30);
	draw_sprite_shadow(0,0,1.45*random_range(0.9,1)*size,color,0.50);
	draw_sprite_shadow(0,0,1.35*random_range(0.9,1)*size,color,0.40);
	draw_sprite_shadow(0,0,1.25*random_range(0.9,1)*size,color,0.60);
	draw_sprite_shadow(0,0,1.15*random_range(0.9,1)*size,color,0.70);
	}
	
	}



}
