function PlatformCheck() {
	var collision = instance_place(x, y + sign(vy), parSolid);

	if (collision) {
	    if (vy >= 0) {
	        platformTarget = collision;
	    } else {
	        // Platform above
	        vy = 0;
	    }
	    return true;
	}

	if (vy < 0) {
		platformTarget = 0;
	}
	//Check for platform obtained
	if (instance_exists(platformTarget)) {
		//var platformGet = (place_meeting(x, y + 1, platformTarget) && !place_meeting(x, y, platformTarget))
	    if (platformTarget) {
	        if (place_meeting(x, y + 1, platformTarget) && !place_meeting(x, y, platformTarget))
			{
	            //Platform below
	            vy = 0;
	            return true;
	        } else
	            platformTarget = 0;
	    }
	} else
	    platformTarget = 0;
    
	if (vy > 0) {
	    with (objEntity) {
	        {
				var getEntity = (place_meeting(x, y - 1, other) && !place_meeting(x, y, other))
	            if getEntity //(place_meeting(x, y - 1, other) && !place_meeting(x, y, other)) 
				{
	                vy = 0;
	            }
	        }
	    }
	
	    with (parJumpThru) {
			var getJumpThru = (place_meeting(x, y - 1, other) && !place_meeting(x, y, other))
	        if getJumpThru //(place_meeting(x, y - 1, other) && !place_meeting(x, y, other))
			{
	            // Land
	            other.vy = 0;
	            other.platformTarget = id;
	            return true;
	        }
	    }
	
	}

	platformTarget = 0;
	return false;



}
