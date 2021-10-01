/// @description Insert description here
// You can write your code in this editor
// Handle sub-pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

if out_of_view(64)
{
	instance_destroy();	
}