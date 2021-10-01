/// @description  entityStep();
function EntityEndStep() {


	jumped = false;
	landed = false;

	if (vy < 1 && vy > -1)
	    PlatformCheck();
	else
	    repeat(abs(vy)) {
	        if (!PlatformCheck())
	            y += sign(vy);
	        else
	            break;
	    }

	if (platformTarget) {
	    if (!onGround)
	        landed = true;
    
	    if (landed)
	        with (platformTarget) other.vy = 0;
	    else
	        with (platformTarget) other.vy = 0;
	}


	/*var CheckSlopeUp = (place_meeting(x + sign(vx), y, parSolid) && !place_meeting(x + sign(vx), y - 1, parSolid));
	var CheckSlopeDown = (place_meeting(x + sign(vx), y + 2, parSolid) && !place_meeting(x + sign(vx), y + 1, parSolid));
	var CheckWall = (!place_meeting(x + sign(vx), y, parSolid))*/

	//Checking for Slope Collision
	repeat(abs(vx)) {
	
		var CheckSlopeUp = (place_meeting(x + sign(vx), y, parSolid) && !place_meeting(x + sign(vx), y - 1, parSolid));
		var CheckSlopeDown = (place_meeting(x + sign(vx), y + 2, parSolid) && !place_meeting(x + sign(vx), y + 1, parSolid));
		var CheckLedUp = (place_meeting(x + sign(vx), y, parJumpThru) && !place_meeting(x + sign(vx), y - 1, parJumpThru));
		var CheckLedDown = (place_meeting(x + sign(vx), y + 2, parJumpThru) && !place_meeting(x + sign(vx), y + 1, parJumpThru));
		var CheckWall = x + sign(vx)

		 if CheckLedUp //(place_meeting(x + sign(vx), y, parSolid) && !place_meeting(x + sign(vx), y - 1, parSolid))
	        y -= 1;
         
	    if CheckLedDown//(place_meeting(x + sign(vx), y + 2, parSolid) && !place_meeting(x + sign(vx), y + 1, parSolid))
	        y += 1;

	    if CheckSlopeUp //(place_meeting(x + sign(vx), y, parSolid) && !place_meeting(x + sign(vx), y - 1, parSolid))
	        y -= 1;
         
	    if CheckSlopeDown//(place_meeting(x + sign(vx), y + 2, parSolid) && !place_meeting(x + sign(vx), y + 1, parSolid))
	        y += 1;
       
		var newX = sign(vx)
	    if !place_meeting(CheckWall, y, parSolid)
	        x += newX
	    else
	        vx = 0;
		
	}



}
