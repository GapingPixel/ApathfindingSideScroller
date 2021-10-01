/// @description Pause for Super
if game_state_controller_super_initiator != 0
{
	with(game_state_controller_super_initiator)
	{
		scr_super_pause(true);
		image_alpha = 1;
		var inst = instance_create_depth(x,y,depth-1,obj_effect_superEffect)
		with(inst)
		{
			effect_parent = id;
		}
	}
}

