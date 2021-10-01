/// @description Metal Interaction

switch(bullet_type)
{

default:
	//Empty
break;

case 7: //Metal Material
	if other.object_state = objectState.electrified
	{
		if object_state != objectState.electrified
		{
		scr_play_sound(snd_common_electric_spark_1,0,0.8,1.2);
		image_blend = make_color_hsv(48,255,255)
		object_state = objectState.electrified;
		}
	}
break;

}