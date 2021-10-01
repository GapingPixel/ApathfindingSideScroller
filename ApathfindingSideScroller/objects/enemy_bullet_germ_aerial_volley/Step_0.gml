/// @description Movement
var plyr = instance_nearest(x,y,parPlyr);

if instance_exists(plyr)//Increase gravity when closer to players
{
	if distance_to_object(plyr) < 175
	{
		gravity = 0.5;
	}
}

if place_meeting(x,y,parSolid)
    instance_destroy();
