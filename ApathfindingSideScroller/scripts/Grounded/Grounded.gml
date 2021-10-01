/// @description  Return bool when we meet with Platforms
function Grounded() {

	return place_meeting(x, y + 1, parSolid) || (place_meeting(x, y + 1, parJumpThru ) && !place_meeting(x, y, parJumpThru));



}
