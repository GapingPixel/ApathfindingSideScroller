/// @description Movement
var plyr = parPlyr;

if instance_exists(plyr)//Increase gravity when closer to players
{
	if distance_to_object(plyr) < 175
	{
		gravity = 1;
	}
}

if place_meeting(x,y,parSolid)
    instance_destroy();
