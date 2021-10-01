// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bullet_charge_step(distance){

//Script manages bullets to stay with and track parent

if bullet_controller != 0
{
	
	///bullet_controller set in plyr_chemical_blast
	if instance_exists(bullet_controller)
	{
	var room_state = global.game_room_state;
	var plyr = bullet_controller;
	
	plyr.cool_down_shoot = 2;
	plyr.var_shooting = 1;
	
	
	x = plyr.x + lengthdir_x(distance*image_xscale,image_angle)

	switch(room_state)
	{
	
		default:///On Ground
		y = plyr.y + lengthdir_y(distance*image_xscale,image_angle) + (plyr.var_crouching * 30)
		switch(plyr.var_wallslide)
		{
			case 0:
			
			image_xscale = plyr.image_xscale;
			
			if (plyr.left_inp || plyr.right_inp) 
			|| (plyr.upRelease_inp || plyr.downRelease_inp) 
			|| (plyr.var_crouching = 1 and (plyr.leftRelease_inp || plyr.rightRelease_inp))
			|| (plyr.var_crouching = 1 and (plyr.down_inp))
				image_angle = 0
			
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
			if (plyr.up_inp)
			{
				image_angle = 90;
				//image_yscale = 1;
			}

			
			if (plyr.down_inp)
			{
				image_angle = 270;
				//image_yscale = 1
			}
			
			if (plyr.left_inp)
			{
				image_angle = 180;
				//image_yscale = 1;
			}
		
			if (plyr.up_inp && plyr.left_inp)
			{
				image_angle = 155;
				//image_yscale = -1;
			}

		
			if (plyr.up_inp && plyr.right_inp)
			{
				image_angle = 25;
				//image_yscale = 1;
			}
			
			if (plyr.down_inp && plyr.left_inp)
			{
				image_angle = 210;
				//image_yscale = 1;
			}
		
			if (plyr.down_inp && plyr.right_inp)
			{
				image_angle = 330;
				//image_yscale = 1;
			}
				
			if (plyr.rightRelease_inp) ||
			(plyr.upRelease_inp) ||
			(plyr.downRelease_inp) ||
			(plyr.leftRelease_inp)
			//(plyr.upRelease_inp && plyr.rightRelease_inp) ||
			//(plyr.upRelease_inp && plyr.leftRelease_inp) ||
			//(plyr.downRelease_inp && plyr.leftRelease_inp) ||
			//(plyr.downRelease_inp && plyr.rightRelease_inp)
			{
				image_angle = 0;
				//image_yscale = 1;
			}
		}
		else
		{
			image_angle = 0;
			//image_yscale = 0;
		}
			
		x = bullet_controller.x + lengthdir_x(distance,image_angle)
		y = bullet_controller.y + lengthdir_y(distance,image_angle)
		break;

	}
		
	
	if plyr.switch_element_inp ||
	plyr.switch_mixture_inp ||
	plyr.var_hit = 1 ||
	plyr.var_dashing = 1 ||
	plyr.var_rolling = 1 ||
	plyr.plyr_state != playerState.enable
		instance_destroy();
	}
	else//Kill off if player dies
		instance_destroy();
}

}