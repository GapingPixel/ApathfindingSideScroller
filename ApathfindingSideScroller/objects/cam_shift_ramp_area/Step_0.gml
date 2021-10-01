/// @description Insert description here
// You can write your code in this editor
var cam_change_line;
var Cam_Target;

if cam_shift_activated == false
{
	Cam_Target = Camera;
	cam_change_line = collision_line(x,y,x,y+sprite_height,Cam_Target,false,true) 
	|| collision_line(x+sprite_width,y,x+sprite_width,y+sprite_height,Cam_Target,false,true);
	
	if cam_change_line
	{
	uc_set_mode(CMODE.OBJECT_FOLLOWING_BOX);
	
	Camera.cam_box_id = id;
	
	cam_shift_activated = true;
	}
}
else
{
	if instance_exists(Camera)
	{
		Cam_Target = Camera;
		cam_change_line = collision_rectangle(
		bbox_left,
		bbox_top - 5000,
		bbox_right,
		bbox_bottom + 5000,
		Cam_Target,
		false,
		true);
		
		
		if !cam_change_line && uc_get_mode() == CMODE.OBJECT_FOLLOWING_BOX
		{
			uc_set_mode(CMODE.OBJECT_FOLLOWING_H);
			
			
			cam_shift_activated = false;
			
			Camera.cam_box_id = 0;
		}

	
	}
	

}