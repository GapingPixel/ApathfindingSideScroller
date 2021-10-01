/// @description PH values
if env_ph_value > 10
    env_ph_value = 10
if env_ph_value < -10
    env_ph_value = -10
	
image_blend = make_color_rgb(env_ph_value*5,env_ph_value*50,255 - (env_ph_value*30));
part_type_color1(part_var_env_water_splash,image_blend);
part_type_color3(part_var_env_water_splash_blobs,16776960,image_blend,16777088);