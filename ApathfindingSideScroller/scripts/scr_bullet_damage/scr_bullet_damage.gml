/// @description Script determines bullet damage on contact
function scr_bullet_damage(baseDamage, damageType, destroyOnHit) {
	/*
	arg0 = base damage (real/double)
	arg1 = damage type (integer)
	        0 = Explosion Damage
	        1 = Fire
	        2 = Ice
	        3 = Salt
	        4 = Corrosive
	        5 = Extractor
	        6 = Regular
	        7 = Metals
			8 = Electric
			9 = Water
	arg2 = boolean to determine bullet is destroyed upon contact
	        true = destroy
	        false = not destroy
	*/

	var hit = instance_place(x,y,obj_enemy);//obj_enemy is parent for enemies

	//////////////////////////////////////////////////Enemy
	if (hit != noone)
	{

	var damage = baseDamage * hit.enemy_def_mult;

	///Damage Bonus dependent on bullet type
	if hit.enemy_def_mult > 0
	{
		if damage > 0 && hit.enemy_hp > 0//perform damage and particles when enemy is alive
		    switch(damageType)
		    {
		    case 1://Fire Damage
		#region
		    damage *= hit.enemy_def_flam;
    
		    if damage > 0
		    part_particles_create(global.parsys, 
		    hit.x + random_range(-50,50), 
		    hit.y + random_range(-50,50), 
		    hit.part_var_enemy_hit_fire,25);
    
		    global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
    
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
				scr_play_sound(snd_common_ice_break,0,1,1.1);
		    }
			
			particle_scr_eff_enemy_weaknessHit(hit,hit.enemy_def_flam);
		#endregion
		    break;
    
		    case 2://Ice Damage
		#region
		    damage *= hit.enemy_def_cyro;
    
		    if hit.enemy_state = enemyState.NORMAL
		    {
			    if damage > 0
			    part_particles_create(global.parsys, 
			    hit.x + random_range(-50,50), 
			    hit.y + random_range(-50,50),
			    hit.part_var_enemy_hit_ice,15);
		    }
    
		    if hit.enemy_freezable//Freeze enemy if freezable
		    {
		        if hit.enemy_state = enemyState.NORMAL
		        {
					with(hit)
					{
						particle_scr_enemy_statusCreate_freeze_bang();
						enemy_current_image_speed = image_speed;
						if timeline_index != -1
							timeline_running = false;
						enemy_state = enemyState.FROZEN;
					}
				
		            scr_play_sound(snd_common_ice_freeze,0,0.8,1.2)
		        }
		    }
        
			particle_scr_eff_enemy_weaknessHit(hit,hit.enemy_def_cyro);
        
		    global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
		#endregion
		    break;
    
		    case 3://Salt Damage
		#region
		    damage *= hit.enemy_def_salt;
    
		    if damage > 0
		    part_particles_create(global.parsys, 
		    hit.x + random_range(-50,50), 
		    hit.y + random_range(-50,50),
		    hit.part_var_enemy_hit_salt,20);
    
		    global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
			
			
			//Apply shock when in water
			if object_state = objectState.wet
			{
				if hit.enemy_shockable && hit.enemy_state = enemyState.NORMAL
				{
					with(hit)
					{
						part_particles_create(global.parsys,x,y,part_var_enemy_shock_bang,100);
						enemy_current_image_speed = image_speed;
				
						if enemy_current_animation != ""
							enemy_current_animation = skeleton_animation_get()
					
						if timeline_index != -1
							timeline_running = false;
			
						enemy_state = enemyState.SHOCKED;
					}
				}
				
			}
			
			particle_scr_eff_enemy_weaknessHit(hit,hit.enemy_def_salt);
		#endregion
		    break;
    
		    case 4://Corrosive Damage
		#region
		    damage *= hit.enemy_def_corr;
    
		    if damage > 0
		    part_particles_create(global.parsys, 
		    hit.x + random_range(-50,50), 
		    hit.y + random_range(-50,50),
		    hit.part_var_enemy_hit_corr,40);
    
		    global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
			
			particle_scr_eff_enemy_weaknessHit(hit,hit.enemy_def_corr);
		#endregion
		    break;
    
		    case 5://Extrator Damage
		    damage *= hit.enemy_def_elem;
		    break;
    
		    case 6: //Normal Damage
		#region
		    damage *= hit.enemy_def_reg;
		#endregion
		    break;
    
		    case 7: //Metal Damage
		#region
		
		    if object_state != objectState.electrified
			damage *= hit.enemy_def_reg;
			else
			{
			damage *= ((hit.enemy_def_salt + hit.enemy_def_flam + hit.enemy_def_corr)/3);
		
			if hit.enemy_shockable && hit.enemy_state = enemyState.NORMAL
			{
				with(hit)
				{
					enemy_current_image_speed = image_speed;
					if timeline_index != -1
						timeline_running = false;
					enemy_state = enemyState.SHOCKED;
				}
			}
		
			}
		
			if hit.enemy_state = enemyState.FROZEN //more damage when frozen
		    {
		        damage *= 3;
				uc_shake(10);
				with(hit)
				{
					image_speed = enemy_current_image_speed;
					image_blend = c_white;
					if timeline_index != -1
					{
						if timeline_running == false
						timeline_running = true;
					}
					enemy_state = enemyState.NORMAL;
				}
				scr_play_sound(snd_common_ice_break,0,0.9,1.1);
		    }
		
				global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
		#endregion
		    break;
		
			case 8: //Electric Damage; average b/w fire, salt, corr defenses
		#region
		    damage *= ((hit.enemy_def_salt + hit.enemy_def_flam + hit.enemy_def_corr)/3);
			global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
		
			if hit.enemy_shockable && hit.enemy_state = enemyState.NORMAL
			{
				with(hit)
				{
					part_particles_create(global.parsys,x,y,part_var_enemy_shock_bang,100);
				
					enemy_current_image_speed = image_speed;
				
					if enemy_current_animation != ""
						enemy_current_animation = skeleton_animation_get()	
			
					if timeline_index != -1
						timeline_running = false;
			
					enemy_state = enemyState.SHOCKED;
				}
				
				scr_play_sound(snd_common_electric_explosion_2,0,0.8,1.2)
			}
		#endregion
		    break;
		
			case 9: //Water Damage; reference ice defense
		#region
		    damage *= hit.enemy_def_cyro;
			global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
		#endregion
		    break;
    
		    case 0://Explosive Damage
		#region
		    damage *= 1;
		    global.scoring_c_blasts += damage * 1.05; //add point for special chemical blasts
		#endregion
		    break;
		    }


		hit.enemy_hp -= damage; //damage
		
		//Add points to meter based off of damage
		if bullet_Super == false
		{
			if variable_instance_exists(id,"bullet_id")
			{
				global.player_chem_blast[bullet_id][2] += damage;
			}
		}
		
		var b_destroy = destroyOnHit; //destroy bullet upon collision
		var b_hitstun = bullet_Super; //Super Shots can commit hitstun
		
		if damage > 0 && hit.enemy_hp > 0//Hit feedback
		{
		   
		    
			with(hit)
		    {
				if alarm_get(0) < 0
				{
					enemy_hit_flash = true;
					
					//scr_play_sound(snd_common_bullet_hit,100,0.8,1.2);
				
					//Commit hitstun if bullet is able to perform hitstun or enemy has no poise
					if (b_hitstun == true) || enemy_poise = 0
					{
						if b_hitstun == true//special effect for super bullets
						{
							scr_play_sound(snd_common_bullet_hit_critical,100,0.8,1.2);
							var burstX = lengthdir_x(point_distance(other.x,other.y,x,y),point_direction(x,y,other.x,other.y))
							var burstY = lengthdir_y(point_distance(other.x,other.y,x,y),point_direction(x,y,other.x,other.y))
							part_particles_create(global.parsys,x + burstX,y + burstY,part_var_bigBoom_burst,3);
						}
						
						enemy_current_image_speed = image_speed;
						
						enemy_current_vx = vx;
						enemy_current_vy = vy;
					
						if enemy_state = enemyState.NORMAL
							enemy_state = enemyState.HITSTUN;
					
						if timeline_index != -1
							timeline_running = false;
						
					}
					
					alarm[0] = 5;
				}
		    }
		}
	
		if b_destroy = true
		    instance_destroy();//Destroy the bullet
	}

	}




}
