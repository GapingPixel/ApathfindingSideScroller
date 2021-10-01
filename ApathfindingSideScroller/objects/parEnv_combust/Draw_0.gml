/// @description Burn Black
//image_blend = make_color_rgb(255 - (env_heat_value*20),255 - (env_heat_value*20),255 - (env_heat_value*20))
    
if object_state = objectState.onFire
image_blend = make_color_rgb(255 - (env_heat_value*20),255 - (env_heat_value*20),255 - (env_heat_value*20))
	
draw_self();

