/// @description Water Interaction

if object_state != objectState.wet
{
	switch(bullet_type)
	{
	
	default:
		//Empty / No Interaction
	break;

	case 1: //Fire Bullet Interaction
		bullet_dmg /= 2;
		image_blend = c_black;
	break;

	case 3: //Salt Bullet Interaction
		bullet_dmg *= 1.3;
	break;

	}

object_state = objectState.wet;
}