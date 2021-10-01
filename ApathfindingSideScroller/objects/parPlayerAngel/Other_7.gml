/// @description Insert description here
// You can write your code in this editor
var room_state = global.game_room_state;//Check room state

if sprite_index = p1_angel_thankyou || sprite_index = p2_angel_thankyou
{
	var inst;
	switch(global.character[playerAngel_var_plyr_id])
	{
		case 0: //Revive P1
		global.hp[0] = 1;
		
		if room_state != roomState.Flight
		{
		inst = instance_create_layer(x,y,"player1",obj_plyr1);
		inst.vy -= 5;
		with(Camera)
			uc_add_instance_following_list(inst);
		}
		else
		inst = instance_create_layer(x,y,"player1",obj_plyr1_flight);
		
		
		break;
		
		case 1: //Revive P2
		global.hp[1] = 1;
		
		if room_state != roomState.Flight
		{
		inst = instance_create_layer(x,y,"player2",obj_plyr2);
		inst.vy -= 5;
		with(Camera)
			uc_add_instance_following_list(inst);
		}
		else
		inst = instance_create_layer(x,y,"player2",obj_plyr2_flight);

		break;
	}
	
	with(inst)
		{
			var_inv = 1;
			alarm[1] = 1;
			alarm[2] = room_speed*2;
		}
	
	
	instance_destroy();
}