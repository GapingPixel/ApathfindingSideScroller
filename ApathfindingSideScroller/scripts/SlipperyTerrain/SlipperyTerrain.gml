/// @description Alter friction when on icy terrain
function SlipperyTerrain() {

	//Ice
	if (onGround && (place_meeting(x,y+1,parEnv_ice) || place_meeting(x,y+1,parEnv_ice_platform)))
	{
	    groundFric  *= 0.5;
	}
	else
	    groundFric  = 12;
    






}
