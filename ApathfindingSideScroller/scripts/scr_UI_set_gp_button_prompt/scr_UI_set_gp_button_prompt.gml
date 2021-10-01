///@description scr_UI_set_gp_button_prompt(global_input_variable)
///@param config_action[x]
function scr_UI_set_gp_button_prompt(argument0) {

	//Script to call image index based on spr_UI_gamepad_controller

	var input = argument0;
	var button = 0; //value of the image index to be returned
	switch(input)
	{
		case gp_face1: //A or Cross
			button = 0;
		break;
	
		case gp_face2: //B or Circle
			button = 1;
		break;
	
		case gp_face3: //X or Square
			button = 2;
		break;
	
		case gp_face4: //Y or Triangle
			button = 3;
		break;
	
		case gp_shoulderl: //LB or L1
			button = 4;
		break;
	
		case gp_shoulderr: //RB or R1
			button = 5;
		break;
	
		case gp_shoulderlb: //LT or L2
			button = 6;
		break;
	
		case gp_shoulderrb: //RT or R2
			button = 7;
		break;
	
		case gp_stickl: //Left Stick or L3
			button = 8;
		break;
	
		case gp_stickr: //Right Stick or R3
			button = 9;
		break
	
		case gp_padu: //Dpad Up
			button = 10;
		break;
	
		case gp_padd: //Dpad Down
			button = 11;
		break;
	
		case gp_padl: //Dpad Left
			button = 12;
		break;
	
		case gp_padr: //Dpad Right
			button = 13;
		break;
	
		default: //Nothing
			button = 14;
		break;
	}


	return button;





}
