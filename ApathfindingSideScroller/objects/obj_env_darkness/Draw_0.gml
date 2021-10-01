/// @description draw the darkness
if surface_exists(darkness_surface)
{
	var _cam_x = global.cam_x - 128;
	var _cam_y = global.cam_y - 128;
	var _cam_w = global.cam_width + 128;
	var _cam_h = global.cam_height + 128;
	
	surface_set_target(darkness_surface);
	//draw darkness
	draw_set_alpha(darkness_alpha);
	draw_set_color(darkness_color);
	draw_rectangle(0,0, _cam_w,_cam_h,false);
	//draw_rectangle(_cam_w,_cam_h,_cam_w+64,_cam_h+64,false);
	//draw_sprite_stretched_ext(spr_trans_black,0,0,0,_cam_w,_cam_h,)

	gpu_set_blendmode(bm_subtract);
	///Objects that subtract darkness here
	#region Player Objects
	with(parPlyr)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1.8*random_range(1.01,1.05),1.8*random_range(1.01,1.05),0,c_white,1);
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1.9*random_range(1.01,1.05),1.9*random_range(1.01,1.05),0,c_white,1)	
	}
	
	with(parDeadPlayerHeads)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1.7*random_range(1.01,1.05),1.7*random_range(1.01,1.05),0,c_white,1);
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1.8*random_range(1.01,1.05),1.8*random_range(1.01,1.05),0,c_white,1)	
	}
	
	with(parPlayerAngel)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1.7*random_range(1.01,1.05),1.7*random_range(1.01,1.05),0,c_white,1);
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1.8*random_range(1.01,1.05),1.8*random_range(1.01,1.05),0,c_white,1)	
	}
	#endregion
	
	
	
	#region objectS
	with(shoot_source_par)
	{
		draw_sprite_ext(spr_light_emission_1,0,
		x + lengthdir_x(60*image_xscale,image_angle) - _cam_x,
		y + lengthdir_y(60*image_xscale,image_angle) - _cam_y,
		1.2*random_range(1.01,1.05),
		1.2*random_range(1.01,1.05),
		0,c_white,1-(image_index/8));
		
	}
	
	with(parPlyrBullet)
	{
		if object_state = objectState.electrified || object_state = objectState.onFire
		{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,image_xscale*1.1*random_range(1.01,1.05),image_yscale*1.1*random_range(1.01,1.05),image_angle,c_white,image_alpha)	
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,image_xscale*1.1*random_range(1.01,1.10),image_yscale*1.1*random_range(1.01,1.10),image_angle,c_white,image_alpha)
		}
	}
	
	with(parExtractorBullet)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,0.5*random_range(1.01,1.05),0.5*random_range(1.01,1.05),image_angle,c_white,image_alpha)	
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,0.5*random_range(1.01,1.10),0.5*random_range(1.01,1.10),image_angle,c_white,image_alpha)	
	}
	
	with(parChemball)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1.5*random_range(1.01,1.05),image_yscale*1.5*random_range(1.01,1.05),image_angle,c_white,image_alpha)	
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1.6*random_range(1.01,1.10),image_yscale*1.6*random_range(1.01,1.10),image_angle,c_white,image_alpha)	
	}
	#endregion
	
	#region Enviornmental Objects
	with(parEnv_fire)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,image_xscale*random_range(1.01,1.05),image_yscale*random_range(1.01,1.05),image_angle,c_orange,1)	
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,image_xscale*random_range(1.01,1.02),image_yscale*random_range(1.01,1.02),image_angle,c_yellow,1)	
	}
	
	
	with(parEnv_combust)
	{
		if object_state = objectState.onFire
		{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,image_xscale*2*random_range(1.01,1.05),image_yscale*2*random_range(1.01,1.05),image_angle,c_orange,image_alpha)	
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,image_xscale*2*random_range(1.01,1.02),image_yscale*2*random_range(1.01,1.02),image_angle,c_yellow,1)	
		}
	}
	
	with(parEnv_combust_platform)
	{
		if object_state = objectState.onFire
		{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,image_xscale*2*random_range(1.01,1.05),image_yscale*2*random_range(1.01,1.05),image_angle,c_orange,image_alpha)	
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,image_xscale*2*random_range(1.01,1.02),image_yscale*2*random_range(1.01,1.02),image_angle,c_yellow,1)	
		}
	}
	
	with(parEnv_metal)
	{
		if env_heat_value > 5 || object_state = objectState.electrified
		{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,image_xscale*2*random_range(1.01,1.05),image_yscale*2*random_range(1.01,1.05),image_angle,c_orange,image_alpha)	
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,image_xscale*2*random_range(1.01,1.02),image_yscale*2*random_range(1.01,1.02),image_angle,c_yellow,1)		
		}
	}
	
	with(parEnv_metal_platform)
	{
		if env_heat_value > 5 || object_state = objectState.electrified
		{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,image_xscale*2*random_range(1.01,1.05),image_yscale*2*random_range(1.01,1.05),image_angle,c_orange,image_alpha)	
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,image_xscale*2*random_range(1.01,1.02),image_yscale*2*random_range(1.01,1.02),image_angle,c_yellow,1)		
		}
	}
	#endregion
	
	#region Collectables
	with(atom_parent)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1);
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1)	
	}
	
	with(parHealth)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1);
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1)	
	}
	
	with(parNanoModule)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1);
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1)	
	}
	#endregion
	
	#region Enemies
	with(obj_enemy_major_Element)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1);
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1)	
	}
	
	with(obj_enemy_minor_Element)
	{
		draw_sprite_ext(spr_light_emission_1,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1);
		draw_sprite_ext(spr_light_emission_2,0,x - _cam_x,y - _cam_y,1*random_range(1.01,1.05),1*random_range(1.01,1.05),0,c_white,1)	
	}
	#endregion
	
	gpu_set_blendmode(bm_normal);
	
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(darkness_surface,_cam_x,_cam_y)
	draw_surface(darkness_surface,_cam_x+_cam_w,_cam_y)
	draw_surface(darkness_surface,_cam_x,_cam_y+_cam_h)
	
}
if !surface_exists(darkness_surface)//Inititae Darkness
{
	var _cam_x = global.cam_x - 128;
	var _cam_y = global.cam_y - 128;
	var _cam_w = global.cam_width + 128;
	var _cam_h = global.cam_height + 128;
	
	darkness_surface = surface_create(_cam_w,_cam_h);
	
	surface_set_target(darkness_surface);
	draw_set_color(darkness_color);
	draw_set_alpha(darkness_alpha);
	draw_rectangle(0,0, _cam_w,_cam_h,false);
	surface_reset_target();
}
