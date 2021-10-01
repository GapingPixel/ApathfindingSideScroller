/// @description Script for parrying bullets
///@param Atom
///@param ActiveBeh
///@param PlayerVal,p1=0,p2=1
///@param Damage
function plyr_parry(argument0, argument1, argument2, argument3) {
	/*
	arg0 = atom
	arg1 = active
	arg2 = plyr
	arg3 = damage
	*/
	var inst;
	var atom = argument0;
	var act = argument1;
	var plyr = argument2;
	var damage = argument3;
	var room_state = global.game_room_state
	with(other)
	{
	//start parry frame
	if var_inv = 0
		var_parry_frame++;
	
	if atom = 0//If the bullet is not assigned and Element
		var_parry_frame = var_parry_frame_max;
	}

		if other.var_parry = 1 && atom != 0//Successful parry and/or the bullet is assigned an element
		{
			global.scoring_e_extracts += 1; 
			
		    with(other)
		    {
				if room_state != roomState.Flight//only perform hop when in nonflight segments
				{
					if var_parry = 1
					vy -= 50;
					image_index = 0;
					stretch_y = 2;
				}
				var_parry_buffer = 1;
				var_parry = 0;
				var_parry_frame = 0;
			
				//Build up super meter
				global.player_chem_blast[plyr][2] += 10;
			
				for(var p = 0; p <= 36; p++)
				{
				part_type_direction(part_var_plyr_parry_flair,p*10,0,0,0);
				part_particles_create(global.parsys_high,x,y,part_var_plyr_parry_flair,1);	
				}
				part_particles_create(global.parsys_high,x,y,part_var_plyr_parry_burst,1);	
		    }

			scr_game_parry_hitstun();
		
		    if act = 1//go to p1
		    image_blend = make_color_rgb(200,200,255);
		    if act = 2
		    image_blend = make_color_rgb(255,200,200);
		    //audio_sound_pitch(snd_plyr_extraction,1.2);
		    //audio_play_sound(snd_plyr_extraction,0,0);
		    inst = instance_change(atom,true);
		    //inst.active = argument1;
		}
		else//Failure, damage
		{
		    if dmg > 0 and other.var_parry_frame >= other.var_parry_frame_max
		    {
	        
				with(other)
				{
		            plyr_damage(plyr, damage);
					var_parry_frame = 0;
				}
            
		        if destroyFlag//Destroy on contact
		        {
		            instance_destroy();
		        }
		    }
		}




}
