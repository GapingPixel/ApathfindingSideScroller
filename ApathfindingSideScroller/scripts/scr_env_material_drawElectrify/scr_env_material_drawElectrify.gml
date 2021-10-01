// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_env_material_drawElectrify(){
	
	//Draw Shadowing when material is electrified
	if object_state = objectState.electrified
	{
		draw_sprite_shadow(0,0,1.01,choose(c_lime,c_yellow),random_range(0.25,0.5))
	}
	else
	{
		if alarm_get(0) < 0 
		{
			if env_heat_value > 0
			{
			draw_sprite_shadow(0,0,random_range(1.01,1.03),image_blend,random_range(0.1,0.15))
			draw_sprite_shadow(0,0,random_range(1.00,1.02),image_blend,random_range(0.15,0.2))	
			draw_sprite_shadow(0,0,random_range(0.99,1.01),image_blend,random_range(0.2,0.25))
			}
		}
		
	}
	
	//Draw Glitter
	
}