/// @description Script that manages color of heat radiation
function scr_env_material_drawRadiate() {
	//Hot
	if alarm_get(0) < 0 and object_state != objectState.electrified
	{
	if env_heat_value > 1 && env_heat_value < 5
	{
	image_blend = make_colour_rgb(255
	    ,255- 128*(env_heat_value/9)
	    ,255 - 255*(env_heat_value/9));
	}
	else if env_heat_value >= 5
	    image_blend = c_orange;

	//Cold
	if env_heat_value < -1 && env_heat_value > -5
	{
	image_blend = make_colour_rgb(255 - 255*(env_heat_value/9)
	    ,255- 128*(env_heat_value/9)
	    ,255);
	}
	else if env_heat_value <= -5
	    image_blend = c_aqua;
	}



}
