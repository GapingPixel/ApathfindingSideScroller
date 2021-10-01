/// @description Camera dependent hazard; drops down
scr_moving_platform_init();
hazard_triggered = false;

switch(image_blend)
{
	default:
		hazard_time = 30;
	break;
	
	case c_yellow:
		hazard_time = 60;
	break;
	
	case c_red:
		hazard_time = 180;
	break;
	
}

image_blend = c_white;

