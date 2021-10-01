/// @description Destroy when outside of view
event_inherited();

if out_of_view(256)
{
	instance_destroy();
}