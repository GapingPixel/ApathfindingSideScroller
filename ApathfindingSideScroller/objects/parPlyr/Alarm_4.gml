/// @description Alarm for Thumbstick

if lsStickDirection[1] > 0 and lsStickDirection[0] = 0
{
	if upRelease_inp
	upRelease_inp = false;

	if downRelease_inp
	downRelease_inp = false;
	
	lsStickDirection[1] = 0
}

if lsStickDirection[0] > 0 and lsStickDirection[1] = 0
{
	if leftRelease_inp
	leftRelease_inp = false;

	if rightRelease_inp
	rightRelease_inp = false;

	lsStickDirection[0] = 0;
}
