/// @description /Handles animation scripts and inputs/bullets for players
function plyr_button_commands(argument0) {
	/*
	arg0 = commander value to run through script
	*/
	var command = argument0;
	var mix_id = global.player_active_mixture[command];
	var activeShot = global.player_active_weapon_slot[command];
	
	switch(plyr_state)
	{
		case playerState.enable :
		//Actions here are only performed when we are not blasting chemicals, creating chemicals, or throwing chemicals
	    if var_chem_blast = 0 && var_chemball_creating = 0 && var_chemball_throw = 0
	    {
	   
		#region//Single Shoot
		    if shoot_inp and (var_wallgrab = 0 and var_dashing = 0 and var_rolling = 0)
		    {
		        switch(var_chemball_hold)
		        {
		            case 0://Normal Shooting
						//Other Shots
		                if cool_down_shoot = 0
		                {
		                    plyr_anim_shoot(command);
		                    cool_down_shoot = 0;
		                }
                
						//Extract Shots
		                if global.player_weapon_slot[command][mix_id][activeShot] = "null" and extract_shot > 0
		                {
		                    plyr_anim_shoot(command);
		                    cool_down_shoot = 0;
		                    extract_shot -= 1;
		                }
                
		            break;
        
		            case 1://Chem Ball Throw
		                if var_chemball_creating = 0
		                {
		                    plyr_anim_shoot(command);
		                }
		            break;
		        }
		    }
		#endregion
    
	    if var_chemball_hold = 0//Prevent use of dash, fire, parry, and aiming when holding Chemical Ball
	    {
		
		#region Shoot Action
				if shootHeld_inp
		        and (var_wallgrab = 0 and var_dashing = 0 and var_chemball_throw = 0 and var_rolling = 0)
		        {
		            if cool_down_shoot = 0
		            {
		                plyr_anim_shoot(command);
						//Create Bullet Source
						if command = 0
				           plyr_shoot_bullet_source(shoot_source_p1);
						else
							plyr_shoot_bullet_source(shoot_source_p2);
		            }
		        }

		#endregion
    
        #region//Dash and Roll
			//if global.stat_dash[command] > 0
		        if dash_inp and cool_down_air_move = 0 && (var_wallslide = 0 && var_wallgrab = 0 && var_dashing = 0)
		        {
					//Dash
					if var_crouching = 0
						plyr_anim_dash(command);
					else
					//Roll
					{
						//if global.stat_dash[command] > 1
						plyr_anim_roll(command);
						//else
						//plyr_anim_dash(command);
					}
		            
					alarm[0] = 15;//Dash/Roll Alarm Cancel
		            
					if !onGround
		                cool_down_air_move = 1;
		        }
			
			
		#endregion
        
        #region//Parry
	        if jump_inp && !onGround && alarm_get(10) < 0
	        {
	            var_parry = 1;
	            alarm[10] = 15;
	        }
		#endregion
        
        #region//Aiming
	        if aimHeld_inp and (onGround) and !switch_elementHeld_inp
	        {
	            var_aiming = 1;
	            var_running = 0;
	            var_crouching = 0;
	        }
        
	        if var_aiming = 1 and aimRelease_inp
	        {
	            var_aiming = 0;
	            plyr_anim_halt(command);
	        }
		#endregion
	    }
    
	    #region//switch element shots
			var switch_singletap = (cool_down_switch <= 10)//Threshold for switching mixtures via switching Mixture
		    if switch_element_inp && switch_singletap and (var_chemball_throw = 0 && var_chemball_creating = 0 && var_chemball_hold = 0)
		    {
		        audio_play_sound(snd_UI_HUD_switch_shot,0,0);
					
		        switch(global.player_active_weapon_slot[command])
		        {
		        case 0://Elem Slot 1 to Elem Slot 2
		            //global.elem_switch[command] = 1
		            //global.active_elem_slot[command] = global.elem_slot[global.active_mixture[command],1+(command*2)];
					global.player_active_weapon_slot[command] = 1;
		        break;
            
		        case 1://Elem Slot 2 to Elem Slot 1 OR Compound Slot if we got a Compound Formed
		            //global.elem_switch[command] = 0
		            //global.active_elem_slot[command] = global.elem_slot[global.active_mixture[command],0+(command*2)];
					
					var comp = global.player_weapon_slot[command][global.player_active_mixture[command]][2]
					if comp = "null"
					global.player_active_weapon_slot[command] = 0;//Go to Elem Slot 1
					else
					global.player_active_weapon_slot[command] = 2;//Go to Compound Slot
		        break;
				
				case 2://Compound Slot
		            //global.elem_switch[command] = 0
		            //global.active_elem_slot[command] = global.elem_slot[global.active_mixture[command],0+(command*2)];
					global.player_active_weapon_slot[command] = 0;
		        break;
		        }
				cool_down_shoot = 0;
				
				
		        cool_down_switch = 50;

				
				/*if ShotStyle = 0
					cool_down_switch = 1;
				else
					cool_down_switch = 50;*/
					
				//Draw element and mixture above head
		        shot_alpha = 1;
		        shot_pulse_elem = 3;
		        shot_pulse_mix = 2;
		    }
		#endregion
		
	    #region//switch mixtures
			var switch_doubletap = (cool_down_switch < 40 && cool_down_switch > 20)//Threshold for switching mixtures via switching Mixture
		    if switch_mixture_inp && cool_down_switch = 0 && (var_chemball_hold = 0 && var_chemball_hold = 0 && var_chemball_creating = 0) || (switch_element_inp && switch_doubletap)
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
					
				//Draw element and mixture above head
		        shot_alpha = 1;
		        shot_pulse_elem = 2;
		        shot_pulse_mix = 3;
				}
		    }
		#endregion
    
	    }//End of Actions
    

	
    #region//Chemical Blast Action
	    if global.player_chem_blast[command][2] >= 25 && var_chemball_hold = 0 //Restrict use when no comp or holding Chem Ball
	    {
	        if chemblast_inp and (var_wallgrab = 0 and var_dashing = 0) and var_chem_blast = 0
	        {
	            if cool_down_chem_blast = 0 && var_wallslide = 0 && cool_down_air_move = 0
	            {
					if global.player_chem_blast[command][2] < 100
					{
						//Super Shot
						plyr_anim_chemblast(command);
					}
					else
					{
						//Fire Normal Super
						if global.player_chem_blast[command][1] = 0
							plyr_anim_chemblast(command);
						else//Special
						{
							plyr_anim_chemical_super(command);
						}
						
					}
	            }
            
	            if !(onGround)
	                cool_down_air_move = 1;//Set cool_down penalty to prevent double shooting when airborne
	        }
	    }//end of ChemBlast if
	#endregion
    
    #region//Chemball Creation
	var haveElements = global.player_weapon_slot[command][global.player_active_mixture[command]][0] != "null" 
	|| global.player_weapon_slot[command][global.player_active_mixture[command]][1] != "null"
	
	    if chemball_inp and var_chemball_creating = 0  and !shoot_inp
	    and (var_wallgrab = 0 and var_rolling = 0 and var_dashing = 0 and var_chem_blast = 0 and var_aiming = 0) 
		and haveElements
	    //and (global.elem_slot[global.active_mixture[command],0+(command*2)] != "null" || global.elem_slot[global.active_mixture[command],1+(command*2)] != "null")
	    {
	        if command = 0//Player 1
			{
				if !instance_exists(chemball_p1)
				{
				plyr_anim_chemball(command);
		        	alarm[5] = 20;
				}
			}
			else//Player 2
			{
				if !instance_exists(chemball_p2)
				{
				plyr_anim_chemball(command);
		        	alarm[5] = 20;
				}
			}
	    }
	#endregion
    
    
    #region//Chemball Return
	    if !shoot_inp and
	    (var_chemball_creating = 0 and var_wallgrab = 0 
	    and var_dashing = 0 and var_chem_blast = 0 and var_aiming = 0)
	    {
	        if command = 0//Player 1
			{
				if instance_exists(chemball_p1)
					if (chemball_p1.cb_state = ballState.HELD and chemballReturn_inp)
					{
					plyr_anim_chemball_return(command)
					chemball_p1.alarm[1] = 1;//Return State
					}
			}
		else//Player 2
			{
				if instance_exists(chemball_p2)
					if (chemball_p2.cb_state = ballState.HELD and chemballReturn_inp)
					{
					plyr_anim_chemball_return(command)
					chemball_p2.alarm[1] = 1;//Return State
					}
			}
	    }
	#endregion
	
		break;
	}
	////////////////////////////////////////////////////////End of Script




}
