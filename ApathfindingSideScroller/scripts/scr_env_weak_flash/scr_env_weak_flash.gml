///Script that flashes object indicating it is at low durability
function scr_env_weak_flash() {
	env_dur_low = true;

	switch(image_blend)
	{
		default:
			image_blend = c_red;
		break;
	
		case c_red:
			image_blend = c_white;
		break;
	}

	if env_dur > 0
		alarm[11] = 10;


}
