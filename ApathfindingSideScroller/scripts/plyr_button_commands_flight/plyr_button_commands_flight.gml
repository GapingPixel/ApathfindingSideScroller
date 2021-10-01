/// @description Handles animation scripts and inputs/bullets for flying players
function plyr_button_commands_flight(argument0) {
	/*
	arg0 = commander value to run through script
	*/
	var command = argument0;
	var mix_id = global.player_active_mixture[command];
	var activeShot = global.player_active_weapon_slot[command];
	//var ShotStyle = global.player_weapon_slot[command][mix_id][activeShot + 4];
	
	switch(plyr_state)
	{
		case playerState.enable :
		//Actions
		if var_chem_blast = 0 && var_chemball_creating = 0 && var_chemball_throw = 0
	    {
    #region//shoot
	    if shoot_inp and (var_dashing = 0 && var_parry = 0)
	    {
	        switch(var_chemball_hold)
	        {
	            case 0://Normal Shooting
	                if cool_down_shoot = 0
	                {
	                    cool_down_shoot = 0;
	                }
                
	                if global.player_weapon_slot[command][mix_id][activeShot]  = "null" and extract_shot > 0
	                {
	                    cool_down_shoot = 0;
	                    extract_shot -= 1;
	                }
                
	            break;
        
	            case 1://Chem Ball Throw
	                if var_chemball_creating = 0
	                {
	                    plyr_anim_flight_chemball_throw(command);
	                }
	            break;
	        }
	    }
	#endregion
	
		if var_chemball_hold = 0//Prevent use of dash and aiming when holding Chemical Ball
	    {
			
		#region//Shoot Action

			if shootHeld_inp 
	        and (var_dashing = 0 and var_chemball_throw = 0 and var_parry = 0)
	        {
	            if cool_down_shoot = 0
	            {
	                if command = 0
						plyr_shoot_bullet_source(shoot_source_p1);//Player 1
					else
						plyr_shoot_bullet_source(shoot_source_p2);//Player 2
	            }
	        }
		#endregion
    
	        /*//dash
	        if dash_inp and var_dashing = 0 and var_parry_buffer = 0
	        {
				plyr_anim_flight_boost(command);
	        }*/
        
        #region//parry
	        if jump_inp && alarm_get(10) < 0
	        {
				plyr_anim_flight_parry(command);
	        }
		#endregion
        
        #region//aiming
			if var_parry_buffer = 0 and var_hit = 0 and var_parry = 0
			{
		        if aimHeld_inp and !switch_elementHeld_inp
		        {
		            var_aiming = 1;
		        }
        
		        if aimRelease_inp
		        {
		            var_aiming = 0;
		        }
			}
		#endregion
		}
	
	#region//switch element shots
	    if switch_element_inp && cool_down_switch <= 10
	    {
	        audio_play_sound(snd_UI_HUD_switch_shot,0,0);
	        switch(global.player_active_weapon_slot[command])
		        {
		        case 0://Elem Slot 1 to Elem Slot 2
		            //global.elem_switch[command] = 1
		            //global.active_elem_slot[command] = global.elem_slot[global.active_mixture[command],1+(command*2)];
					global.player_active_weapon_slot[command] = 1;
		        break;
            
		        case 1://Elem Slot 2
		            //global.elem_switch[command] = 0
		            //global.active_elem_slot[command] = global.elem_slot[global.active_mixture[command],0+(command*2)];
					var comp = global.player_weapon_slot[command][global.player_active_mixture[command]][2]
					if comp = "null"
					global.player_active_weapon_slot[command] = 0;
					else
					global.player_active_weapon_slot[command] = 2;
		        
		        break;
				
				case 2://Compound Slot
		            //global.elem_switch[command] = 0
		            //global.active_elem_slot[command] = global.elem_slot[global.active_mixture[command],0+(command*2)];
					global.player_active_weapon_slot[command] = 0;
		            
		        break;
		        }
			cool_down_shoot = 0;
			

		    cool_down_switch = 50;
			
	        shot_alpha = 1;//Draw element and mixture above head
	        shot_pulse_elem = 3;
	        shot_pulse_mix = 2;
	    }
	#endregion
	
	
	#region//switch mixtures
		var switch_doubletap = (cool_down_switch < 40 && cool_down_switch > 20)//Threshold for switching mixtures via switching shot
	    if switch_mixture_inp && cool_down_switch = 0 && var_chemball_hold = 0 && var_chemball_creating = 0 || (switch_element_inp && switch_doubletap)
	    {
	        if global.stat_mix[command] > 0//Check to see if we have mixture count in the first place
			{
			audio_play_sound(snd_UI_HUD_switch_mix,0,0);
		    switch(global.player_active_mixture[command])
		    {
		    case 0: //Mixture 1
				global.player_active_mixture[command] = 1;
			break;
		
		    case 1: //Mixture 2
			if global.stat_mix[command] < 2//Go back to mix 1
				{global.player_active_mixture[command] = 0;}
			else
				{global.player_active_mixture[command] = 2;}
			break;
		
			case 2: //Mixture 3
			if global.stat_mix[command] < 3//Go back to mix 1
				{global.player_active_mixture[command] = 0;}
			else
				{global.player_active_mixture[command] = 3;}
			break;
		
			case 3: //Mixture 4
				global.player_active_mixture[command] = 0;
			break;
		    }
		    //global.elem_switch[command] = 0; 
			//global.active_elem_slot[command] = global.elem_slot[global.active_mixture[command],0+(command*2)];
			global.player_active_weapon_slot[command] = 0;
	        cool_down_switch = 10;
	        shot_alpha = 1;//Draw element and mixture above head
	        shot_pulse_elem = 2;
	        shot_pulse_mix = 3;
			}
	    }
	#endregion
	
		}
	
	
	#region//Chemical Blast
	    if global.player_chem_blast[command][2] >= 25 && var_chemball_hold = 0 && var_parry = 0//Restrict use when no comp or holding Chem Ball
	    {
	        if chemblast_inp and var_chem_blast = 0
	        {
	            {
	                if cool_down_chem_blast = 0
	                {
	                plyr_anim_flight_chemblast(command);
	                }
				}
			}
	    }//end of ChemBlast if
	#endregion
	
	#region//Chemball creation
	var haveElements = global.player_weapon_slot[command][global.player_active_mixture[command]][0] != "null" 
	|| global.player_weapon_slot[command][global.player_active_mixture[command]][1] != "null"
	
	    if chemball_inp and var_chemball_creating = 0  and !shoot_inp
	    and (var_dashing = 0 and var_chem_blast = 0 and var_parry = 0) 
		and haveElements
	    //and (global.elem_slot[global.active_mixture[command],0+(command*2)] != "null" || global.elem_slot[global.active_mixture[command],1+(command*2)] != "null")
	    {
	        if command = 0//Player 1
			{
			if !instance_exists(chemball_p1)
				{
				plyr_anim_flight_chemball(command);
				alarm[5] = 20;
				}
			}
			else//Player 2
			{
			if !instance_exists(chemball_p2)
				{
				plyr_anim_flight_chemball(command);
				alarm[5] = 20;
				}
			}
	    }
	#endregion
    
    
    #region//Chemball Return
	    if !shoot_inp and (var_chemball_creating = 0 and var_dashing = 0 
		and var_chem_blast = 0 and var_parry = 0 and var_aiming = 0)
	    {
	        if command = 0//Player 1
			{
				if instance_exists(chemball_p1)
					if (chemball_p1.cb_state = ballState.HELD and chemballReturn_inp)
					{
					plyr_anim_flight_chemball_return(command)
					chemball_p1.alarm[1] = 1;//Return State
					}
			}
			else//Player 2
			{
				if instance_exists(chemball_p2)
					if (chemball_p2.cb_state = ballState.HELD and chemballReturn_inp)
					{
					plyr_anim_flight_chemball_return(command)
					chemball_p2.alarm[1] = 1;//Return State
					}
			}
	    }
	#endregion
	
	break;

	}




}
