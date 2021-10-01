///@description scr_basic_flight_collision(detect_collision)
function scr_basic_flight_collision(argument0) {
	//Script for basic flight enemies / bullets; vx and vy required for non objEntity children
	//@param detect_collision
	var detect_collision = argument0


	switch(detect_collision)
	{
		case true:
		//Horizontal
		if place_meeting(x + vx, y, parSolid)
		{
			while (!place_meeting(x+sign(vx),y,parSolid))
			{
				x += sign(vx);	
			}
			vx = 0;
		}

		x += vx;
	
	
		//Vertical
		if place_meeting(x, y+vy, parSolid)
		{
			while (!place_meeting(x,y+sign(vy),parSolid))
			{
				y += sign(vy);	
			}
			vy = 0;
		}

		y += vy;
	
		break;

		case false:
		x += vx;
		y += vy;
		break;
	}


}
