/// @description Damage script from environment objects onto enemies
function scr_env_damage(argument0, argument1, argument2) {
	/*
	arg0 = base damage (real/double)
	arg1 = chemical type (integer)
	        1 = Fire
	        2 = Ice
	        3 = Salt
	        4 = Corrosive
			6 = Misc
			7 = Metal
			8 = Electric
		
	arg2 = boolean to determine bullet is destroyed upon contact
	        true = destroy
	        false = not destroy
	*/

	var hit = collision_rectangle(bbox_left - 8,bbox_top - 8,bbox_right + 8,bbox_bottom + 8,obj_enemy,false,true);//obj_enemy is parent for enemies

	//////////////////////////////////////////////////Enemy
	if (hit != noone)
	{

	var damage = argument0 * hit.enemy_def_mult;

	///Damage Bonus dependent on bullet type
	if damage > 0 && hit.enemy_hp > 0
	    switch(argument1)
	    {
	    case 1://Fire Damage
		#region
	    if hit.enemy_combustable == true
		{
		
			if hit.enemy_temp >= hit.enemy_temp_hot
			{
				damage *= hit.enemy_def_flam;
    
			    if damage > 0
			    part_particles_create(global.parsys, 
			    hit.x + random_range(-50,50), 
			    hit.y + random_range(-50,50), 
			    hit.part_var_enemy_hit_fire,25);
    
    
			    if hit.enemy_state = enemyState.FROZEN //more damage when frozen
			    {
			        damage *= 3;
					uc_shake(10);
					with(hit)
					{
						image_blend = c_white;
						image_speed = enemy_current_image_speed;
						particle_scr_enemy_statusCreate_freeze_break();
						if timeline_index != 0
						{
							if timeline_running == false
							timeline_running = true;
						}
						enemy_state = enemyState.NORMAL;
					}
					//audio_sound_pitch(snd_env_ice_break,choose(0.9,1,1.1));
					//audio_play_sound(snd_env_ice_break,false,false);
			    }
			}
			else
			{
				hit.enemy_temp += 1;
			}
		}
		else
		{
			damage *= 0;	
		}
	#endregion
	    break;
    
	    case 2://Ice Damage
		#region
	    if hit.enemy_freezable
		{
			if hit.enemy_temp <= hit.enemy_temp_cold
			{
				damage *= hit.enemy_def_cyro;
    
			    if hit.enemy_state = enemyState.NORMAL
			    {
			    if damage > 0
			    part_particles_create(global.parsys, 
			    hit.x + random_range(-50,50), 
			    hit.y + random_range(-50,50),
			    hit.part_var_enemy_hit_ice,15);
			
				with(hit)
					{
						particle_scr_enemy_statusCreate_freeze_bang();
						enemy_current_image_speed = image_speed;
						if timeline_index != -1
							timeline_running = false;
						enemy_state = enemyState.FROZEN;
					}
				
				scr_play_sound(snd_common_ice_cloud,0,0.7,0.8);
				scr_play_sound(snd_common_ice_freeze,0,0.9,1.1);
			    }
    
			    if hit.enemy_state = enemyState.FROZEN
			    {
			        damage *= 0;
			    }

			}
			else
			{
				hit.enemy_temp -= 1;
			}
		}
		else
		{
			damage *= 0;
		}
	#endregion
	    break;
    
	    case 3://Salt Chem bonus
		#region
	    damage *= hit.enemy_def_salt;
    
	    if damage > 0
	    part_particles_create(global.parsys, 
	    hit.x + random_range(-50,50), 
	    hit.y + random_range(-50,50),
	    hit.part_var_enemy_hit_salt,20);
		#endregion
	    break;
    
	    case 4://Corrosive Chem bonus
		#region
	    damage *= hit.enemy_def_corr;
    
	    if damage > 0
	    part_particles_create(global.parsys, 
	    hit.x + random_range(-50,50), 
	    hit.y + random_range(-50,50),
	    hit.part_var_enemy_hit_corr,40);
		#endregion
	    break;
		
		case 7:
		
		break;
		
		case 8: //Electric; average b/w fire, salt, corr defenses
		#region
			if hit.enemy_shockable && hit.enemy_state = enemyState.NORMAL
			{
				damage *= ((hit.enemy_def_salt + hit.enemy_def_flam + hit.enemy_def_corr)/3);
				global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
				with(hit)
				{
					part_particles_create(global.parsys,x,y,part_var_enemy_shock_bang,100);
					enemy_current_image_speed = image_speed;
				
					if enemy_current_animation != ""
						enemy_current_animation = skeleton_animation_get();
						
					enemy_current_vx = vx;
					enemy_current_vy = vy;
					
					if timeline_index != -1
						timeline_running = false;
			
					enemy_state = enemyState.SHOCKED;
				}
			}
	#endregion
		break;
	
	    }


	hit.enemy_hp -= damage //damage

	var b_destroy = argument2 //destroy bullet upon collision
	if b_destroy = true && hit.enemy_def_mult > 0
	    instance_destroy();

	if damage > 0 && hit.enemy_hp > 0//if statement for proper hit feedback
	{
   
	    
	    with(hit)//to prevent ear rape
	    {
			enemy_hit_flash = true;
			
			if alarm_get(0) < 1
				scr_play_sound(snd_common_bullet_hit,100,0.8,1.2);
			
			alarm[0] = 5;
	    }
	}
	else
	{
	    //Nothing
	}


	}




}
