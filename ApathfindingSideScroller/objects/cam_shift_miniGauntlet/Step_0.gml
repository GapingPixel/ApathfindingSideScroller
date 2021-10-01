/// @description Insert description here
// You can write your code in this editor
var cam_trigger;
var Cam_Target;

if cam_shift_activated == false
{
	Cam_Target = Camera;
	cam_trigger = collision_line(x+(sprite_width/2),global.cam_y,x+(sprite_width/2),global.cam_y + global.cam_height,Cam_Target,false,true) 
	
	if cam_trigger
	{
	uc_set_mode(CMODE.STATIC);
	
	cam_shift_activated = true;
	}
}
else
{
	
	

}