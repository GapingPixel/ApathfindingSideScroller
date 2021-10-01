///Changes enemy bullet color in accordance to its 'atom' storage value
function scr_enemy_projectile_change_color() {


	switch(atom)
	{
		case atom_k://Potassium
			image_blend = c_yellow;
		break;
				
		case atom_cl://Chlorine
			image_blend = c_lime;
		break;
				
		case atom_h://Hydrogen
			image_blend = c_orange;
		break;
				
		case atom_f://Fluorine
			image_blend = c_red;
		break;
	
		case atom_i://Iodine
			image_blend = c_purple;
		break;
	
		case atom_br://Bromine
			image_blend = c_fuchsia;
		break;
	
		case atom_na://Sodium
			image_blend = c_white;
		break;
	
		case atom_n://Nitrogen
			image_blend = make_color_rgb(0,100,255);
		break;
	
		case atom_o://Oxygen
			image_blend = c_aqua;
		break;
	
		case atom_c://Carbon
			image_blend = make_color_rgb(255,255,127);
		break;
	
		case atom_ho://Holmium
			image_blend = c_green;
		break;
	
		case atom_ba://Barium
			image_blend = c_olive;
		break;
	}


}
