/// @description Script determines bullet reaction to environment objects
function scr_bullet_dmg_env_platforms(totalDamage, damageType, destroyOnHit) {
	/*
	arg0 = base damage (real/double)
	arg1 = chemical type (integer)
	        0 = Explosives
	        1 = Flame
	        2 = Cyrogenic
	        3 = Salt
	        4 = Corrosive
	arg2 = boolean to determine bullet is destroyed upon contact
	        true = destroy
	        false = not destroy
	*/
	var hit_p = collision_rectangle(bbox_left - 4,
	bbox_top - 4,
	bbox_right + 4,
	bbox_bottom + 4,
	obj_env_platforms,false,true);

	//var hit_p = instance_place(x,y-1,obj_env_platforms);

	//////////////////////////////////////////////////Environment
	if (hit_p != noone)
	{
	var damage = totalDamage;

	    ///Environment Type Dependence follow by Bullet Type Dependence
	    switch(hit_p.env_type)
	    {
	    case 0://Combustable
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100 break;//Explosive
			
	        case 1: 
			if object_state != objectState.wet
			{
			if !hit_p.object_state != objectState.onFire {particle_scr_eff_burst(hit_p,1);} damage *= .5; 
			}
			
			if damage > 0.1//Prevent audio from Enviromental objects
			scr_bullet_env_hit(hit_p);
			
			hit_p.env_heat_value += 1 ;
			break;//Flame
			
	        case 3: damage *= 3 break;
	        case 4: damage *= 100  particle_scr_eff_burst(hit_p,4); break;//Corrosive

	        case 7: 
			damage *= 2;
			if damage > 0.1//Prevent audio from Enviromental objects
				scr_bullet_env_hit(hit_p); 
			break; 
	    }
	#endregion
	    break;
    
	    case 1://Metal
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100;  break;//Explosive
	        
			case 1: //Fire Reaction
			scr_env_material_heatUp(hit_p,damage)
			damage *= 0.1;
	        break;
	        
			case 2://Ice Reaction
			scr_env_material_coolDown(hit_p,damage)
			damage *= 0;
			break;
	        
			case 3: //Salt Reaction
			damage *= 0.15;
			if object_state != objectState.wet
				particle_scr_eff_burst(hit_p,3);
			else
				scr_env_material_electrify(hit_p);
			break;
		
	        case 4: //Corrosive
			damage *= 10;
			particle_scr_eff_burst(hit_p,4); 
			scr_bullet_env_hit(hit_p); 
			break;

	        case 7: 
			damage *= 1;
			
			if object_state = objectState.electrified
				scr_env_material_electrify(hit_p);
				
			scr_bullet_env_hit(hit_p); 
			break;
			case 8: damage *= 0; scr_env_material_electrify(hit_p); break;
	    }
	#endregion
	    break;
    
	    case 2://Ice
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100  scr_bullet_env_hit(hit_p); break;//Explosive
	        case 1: 
			if object_state != objectState.wet
			{
			 hit_p.env_heat_value += 0.01 * damage; 
			 damage *= .05;
			 particle_scr_eff_burst(hit_p,1);
			 particle_scr_eff_burst(hit_p,6);
			}
			break;
	        case 3: damage *= .5  particle_scr_eff_burst(hit_p,3); scr_bullet_env_hit(hit_p);break;//Salt
	        case 4: damage *= 100  particle_scr_eff_burst(hit_p,4); scr_bullet_env_hit(hit_p);break;//Corr
	        case 7: damage *= 0.25 scr_bullet_env_hit(hit_p); break; 
			case 8: damage *= 0.5; particle_scr_eff_burst(hit_p,4); break;
	    }
	#endregion
	    break;
    
	    case 3://Water
	#region
	    switch(damageType)
	    {
			case 3: hit_p.env_ph_value += 1;  particle_scr_eff_burst(hit_p,3); break;//Salt
	        case 4: hit_p.env_ph_value -= 1;  particle_scr_eff_burst(hit_p,4); break;//Corr
	    }
	#endregion
	    break;
    
	    case 4://Fire
	#region
	    switch(damageType)
	    {
	        default: damage *= 0 break;
	        case 2: damage *= 100  particle_scr_eff_burst(hit_p,2); break;//Ice
	        case 3: damage *= .1  particle_scr_eff_burst(hit_p,3); break;//Salt
			case 9: damage *= 100; break;
	    }
	#endregion
	    break;
    
	    case 5://Ore/Stone
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100 scr_bullet_env_hit(hit_p); break;//Explosive
	        case 7: damage *= 1; scr_bullet_env_hit(hit_p); break;//Metal
			case 3: damage *= 0.5;  particle_scr_eff_burst(hit_p,3); break;//Salt
	    }
	#endregion
	    break;
	
		case 6://Slime
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100 scr_bullet_env_hit(hit_p); break;//Explosive
	        case 1: damage *= 0.5; scr_bullet_env_hit(hit_p); break;
	        case 3: damage *= 1.5; scr_bullet_env_hit(hit_p); break;
	        case 7: damage *= 0.05; scr_bullet_env_hit(hit_p); break;
	    }
	#endregion
	    break;
	
		case 9://Special
		#region
	    switch(damageType)
	    {
	        default: damage *= 1; scr_bullet_env_hit(hit_p); break;
			case 0: damage *= 100; scr_bullet_env_hit(hit_p); break;//Explosive
	        case 1: damage *= 1; scr_bullet_env_hit(hit_p); particle_scr_eff_burst(hit_p,1); break;
	        case 2: damage *= 1; scr_bullet_env_hit(hit_p); particle_scr_eff_burst(hit_p,2); break;
	        case 3: damage *= 1; scr_bullet_env_hit(hit_p); particle_scr_eff_burst(hit_p,3); break;
	        case 4: damage *= 1; scr_bullet_env_hit(hit_p); particle_scr_eff_burst(hit_p,4); break;
			case 8: damage *= 1; scr_bullet_env_hit(hit_p); particle_scr_eff_burst(hit_p,5); break;
	    }
		#endregion
		break;
	    }


	hit_p.env_dur -= damage; //damage

	//Cue flash tick
	with(hit_p)
	{
		if env_dur < (env_dur_MAX/4) && env_dur_low == false
			alarm[11] = 1;
	}

	var b_destroy = destroyOnHit; //destroy bullet upon collision
	if b_destroy = true
	    instance_destroy();
    
	}
	//////////////////////////////////////////////////End of Environment




}
