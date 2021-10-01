/// @description Insert description here
// You can write your code in this editor
var cam_change_line;
var Cam_Target;

if cam_shift_activated == false
{
	Cam_Target = Camera;
	cam_change_line = collision_line(x+sprite_width/2,y,x+sprite_width/2,y+sprite_height,Cam_Target,false,true);
	
	if cam_change_line
	{
	uc_set_mode(CMODE.OBJECT_FOLLOWING_V);
	
	Camera.cam_box_id = id;
	with(Camera)
	target_x = cam_box_id.x + cam_box_id.sprite_width/2

	
	//Develop a pitfall below
	if cam_vert_pitfall_child = 0
	{
	cam_vert_pitfall_child = instance_create_depth(global.cam_x+global.cam_width/2,global.cam_y+global.cam_height+256,0,damage_pitfall_vertical);
		with (cam_vert_pitfall_child)
		{
			image_xscale *= 16;
		}
	}
	
	cam_shift_activated = true;
	}
}
else
{
	if instance_exists(parPlyr)
	{
		Cam_Target = instance_nearest(x,y,parPlyr)
		cam_change_line = collision_rectangle(
		bbox_left,
		bbox_top - 5000,
		bbox_right,
		bbox_bottom,
		Cam_Target,
		false,
		true);
		
		if !cam_change_line && uc_get_mode() == CMODE.OBJECT_FOLLOWING_V
		{
			uc_set_mode(CMODE.OBJECT_FOLLOWING_H);
			
			with(cam_vert_pitfall_child)
				instance_destroy()
			
			cam_vert_pitfall_child = 0;
			
			cam_shift_activated = false;
			
			Camera.cam_box_id = 0;
		}

	
	}
	

}