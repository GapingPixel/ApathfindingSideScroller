/////Fixate player bullet source
///@param obj_plyr
function plyr_shoot_source_fixation(argument0) {
	var room_state = global.game_room_state;
	var plyr = argument0;

	x = plyr.x;

	switch(room_state)
	{
	
		default:///On Ground
		y = plyr.y;
		/*if plyr.var_crouching = 1
		{
		    y = plyr.y + 30;
		}
		else
		{
			y = plyr.y;
		}*/
		switch(plyr.var_wallslide)
		{
			case 0:
			image_xscale = plyr.image_xscale
			if plyr.up_inp and !(plyr.left_inp && plyr.right_inp) || plyr.var_aim_buffer = 2
			    image_angle = 90 * image_xscale;
    
			if plyr.up_inp and (plyr.left_inp || plyr.right_inp) || plyr.var_aim_buffer = 4
			    image_angle = 45 * image_xscale;

			if plyr.down_inp and !(plyr.left_inp && plyr.right_inp) and plyr.var_crouching = 0 || plyr.var_aim_buffer = 3
			    image_angle = -90 * image_xscale;
    
			if plyr.down_inp and (plyr.left_inp || plyr.right_inp) and plyr.var_crouching = 0 || plyr.var_aim_buffer = 5
			    image_angle = -40 * image_xscale;
			break;

			default:
				image_xscale = plyr.image_xscale * -1;
			break;
		}
		break;
	
		case roomState.Flight:///Flight Segments
		if plyr.var_aiming = 1
		{
			if (plyr.up_inp) || plyr.var_aim_buffer = 3
			{
				image_angle = 90;
				image_yscale = -1;
			}
			
			if (plyr.down_inp) || plyr.var_aim_buffer = 7
				image_angle = 270;
			
			if (plyr.left_inp) || plyr.var_aim_buffer = 5
			{
				image_angle = 180;
				image_yscale = -1;
			}
		
			if (plyr.right_inp) || plyr.var_aim_buffer = 1
				image_angle = 0;
		
			if (plyr.up_inp && plyr.left_inp) || plyr.var_aim_buffer = 4
			{
				image_angle = 155;
				image_yscale = -1;
			}
		
			if (plyr.up_inp && plyr.right_inp) || plyr.var_aim_buffer = 2
				image_angle = 25;
			
			if (plyr.down_inp && plyr.left_inp) || plyr.var_aim_buffer = 6
				image_angle = 210;
		
			if (plyr.down_inp && plyr.right_inp) || plyr.var_aim_buffer = 8
				image_angle = 330;
		}
	
		break;

	}



}
