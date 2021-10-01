/// @description Script determines bullet reaction to environment objects
function scr_bullet_dmg_env(totalDamage, damageType, destroyOnHit) {
	/*
	arg0 = base damage (real/double)
	arg1 = chemical type (integer)
	        0 = Explosives
	        1 = Flame
	        2 = Cyrogenic
	        3 = Salt
	        4 = Corrosive
	        5 = Extract
	        6 = Normal
	        7 = Metals
			8 = Electric
	arg2 = boolean to determine bullet is destroyed upon contact
	        true = destroy
	        false = not destroy
	*/

	var hit = collision_rectangle(bbox_left - 8,
	bbox_top - 8,
	bbox_right + 8,
	bbox_bottom + 8,
	obj_env,
	false,1);
	//////////////////////////////////////////////////Environment
	if (hit != noone)
	{
	
	var damage = totalDamage;
	var b_destroy = destroyOnHit; //destroy bullet upon collision

	    ///Environment Type Dependence follow by Bullet Type Dependence to calculate Damage on durability
	    switch(hit.env_type)
	    {
			
		default:
		//Nothing
		break;
			
	    case 0://Combustable
    #region
		switch(damageType)
	    {
	        default: damage *= 0; break;
			
			case 0: damage *= 100; break;//Explosive
		
	        case 1: 
			if (object_state != objectState.wet)
			{
			particle_scr_eff_burst(hit,1);
			damage *= 0.5; 
			hit.env_heat_value += 1;  
			}
			break;//Flame
		
	        case 2: 
			if hit.env_material_brittle = false
			damage *= 1;
			else
			damage *= 0;
			break;
		
	        case 3: 
			damage *= 1;
			particle_scr_eff_burst(hit,3); 
			break;
		
	        case 4: 
			damage *= 100;
			particle_scr_eff_burst(hit,4); 
			break;//Corrosive
		
	        case 7: 
			damage *= 3;
			break; 
		
		
	    }
	#endregion
	    break;
    
	    case 1://Metal
    #region
		switch(damageType)
	    {
	        
			default: damage *= 0; break;
			
			case 0: damage *= 100 break;//Explosive
	        
			case 1: 
			scr_env_material_heatUp(hit,damage)
			damage *= 0.1;
			break;//Flame
	        
			case 2: 
			scr_env_material_coolDown(hit,damage)
			damage *= 0;
			break;//Cyro
	        
			case 3: 
			damage *= 0.15;
			
			if object_state = objectState.wet
				scr_env_material_electrify(hit);
			else
				particle_scr_eff_burst(hit,3)
			break;
			
	        case 4: 
			damage *= 100; 
			particle_scr_eff_burst(hit,4); 
			break;//Corr
			
			case 5:
				if hit.env_material_brittle == true
					damage *= 1;
			break;
			
	        case 7: 
			damage *= 1; 
			
			if object_state = objectState.electrified
				scr_env_material_electrify(hit);
			break;
	    }
	#endregion
	    break;
    
	    case 2://Ice
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100 break;//Explosive
	        case 1: 
			if (object_state != objectState.wet)
			{
			hit.env_heat_value += 0.01 * damage; 
			damage *= .15;
			particle_scr_eff_burst(hit,1);
			}
			break;//Fire
	        case 3: damage *= .2  particle_scr_eff_burst(hit,3);break;//Salt
	        case 4: damage *= 100  particle_scr_eff_burst(hit,4);break;//Corr
	        case 7: damage *= 0.1; break;
			case 8: damage *= 0.5; break;
			case 9: damage *= -1.5; break;
	    }
	#endregion
	    break;
    
    
	    case 4://Fire
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
	        case 2: damage *= 100  particle_scr_eff_burst(hit,2); break;//Cyro
	        case 3: damage *= .1  particle_scr_eff_burst(hit,3); break;//Salt
			case 9: damage *= 100; break;
	    }
	#endregion
	    break;
    
	    case 5://Ore/Stone
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100 instance_destroy(); break;//Explosive
	        case 3: damage *= 0.5; break; 
			case 7: damage *= 1; break; 
	    }
	#endregion
	    break;
	
		case 6://Slime
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100; break;//Explosive
	        case 1: damage *= 0.5; break;
	        case 3: damage *= 1.5; break;
	        case 7: damage *= 0.15; break;
	    }
	#endregion
	    break;
	
		case 9://Special
	#region
	    switch(damageType)
	    {
	        default: damage *= 1; break;
			case 0: damage *= 100; break;//Explosive
	        case 1: damage *= 1; particle_scr_eff_burst(hit,1); break;
	        case 2: damage *= 1; particle_scr_eff_burst(hit,2); break;
	        case 3: damage *= 1; particle_scr_eff_burst(hit,3); break;
	        case 4: damage *= 1; particle_scr_eff_burst(hit,4); break;
			case 8: damage *= 1; particle_scr_eff_burst(hit,6); break;
	    }
	#endregion
		break;
	    }


	if damage > 0 && hit.env_material_brittle = false
		{scr_bullet_env_hit(hit);}
	
	hit.env_dur -= damage; //Damage
	
	//Cue low durability flash tick
	with(hit)
	{
		if env_dur < (env_dur_MAX/4) && env_dur_low == false
			alarm[11] = 1;
	}

	if b_destroy = true
	    instance_destroy();
	}
	//////////////////////////////////////////////////End of Environment




}
