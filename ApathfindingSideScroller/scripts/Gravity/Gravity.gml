/// @description Entity Gravity
function Gravity() {

	onGround = Grounded();//Check on Ground

	// Apply the correct form of acceleration and friction
	if (onGround) {  
	    tempAccel = groundAccel;
	    tempFric  = groundFric;
	} else {
	    tempAccel = airAccel;
	    tempFric  = airFric;
	}

	if (!onGround) {
	    vy = Approach(vy, vyMax, gravNorm);
	}




}
