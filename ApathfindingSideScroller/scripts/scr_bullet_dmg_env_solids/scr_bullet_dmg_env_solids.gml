/// @description Script determines bullet reaction to environment objects
function scr_bullet_dmg_env_solids(totalDamage, damageType, destoryOnHit) {
	/*
	arg0 = base damage (real/double)
	arg1 = chemical type (integer)
	        0 = Explosives
	        1 = Flame
	        2 = Cyrogenic
	        3 = Salt
	        4 = Corrosive
			5 = Extractor
			6 = Normal
			7 = Metal
			8 = Electric
	arg2 = boolean to determine bullet is destroyed upon contact
	        true = destroy
	        false = not destroy
	*/

	var hit_s = collision_ellipse(bbox_left-8,bbox_top-8,bbox_right+8,bbox_bottom+8,obj_env_solids,false,true);
	//instance_place(x,y-1,obj_env_solids);


	//////////////////////////////////////////////////Environment
	if (hit_s != noone)
	{
	var damage = totalDamage

	    ///Environment Type Dependence follow by Bullet Type Dependence
	    switch(hit_s.env_type)
	    {
	    case 0://Combustable
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100  break;//Explosive
			
	        case 1: 
			if object_state != objectState.wet
			{
			particle_scr_eff_burst(hit_s,1); 
			damage *= 0.25; 
			hit_s.env_heat_value += 1;
			}
			break;//Flame
			
	        case 3: damage *= 3 break;
	        case 4: damage *= 100 particle_scr_eff_burst(hit_s,4); break;//Corrosive
	        case 7: damage *= 3 break; 

	    }
	#endregion
	    break;
    
	    case 1://Metal
	#region
	    switch(damageType)
	    {
	        default: 

			if hit_s.env_material_brittle == false
			damage *= 0; 
			else//For Breakable crates
			{
				damage *= 1; 
				scr_bullet_env_hit(hit_s);
			}
			
			break;
			
			case 0: 
			damage *= 100;
			scr_bullet_env_hit(hit_s); 
			break;//Explosive
	        
			case 1://Fire
			scr_env_material_heatUp(hit_s,damage);
			damage *= 0.1;
			break;
	

			case 2://Ice
			scr_env_material_coolDown(hit_s,damage)
			damage *= 0;
			break;
        
			case 3: //Salt
			damage *= 0.15;
			scr_bullet_env_hit(hit_s); 
		
			if object_state = objectState.wet
			scr_env_material_electrify(hit_s)
			else
			particle_scr_eff_burst(hit_s,3)
		
			break;
		
	        case 4: //Corrosive
	        damage *= 3;   
			particle_scr_eff_burst(hit_s,4);
	        scr_bullet_env_hit(hit_s);
	        break;
			
	        case 7: 
			damage *= 1;
				
			switch(object_state)
			{
				case objectState.electrified:
				scr_env_material_electrify(hit_s);
				break;
				
				case objectState.onFire:
				scr_env_material_heatUp(hit_s,damage);
				break;
				
				case objectState.frozen:
				scr_env_material_coolDown(hit_s,damage);
				break;
			}
			
			scr_bullet_env_hit(hit_s); 
			break;
			
			case 8: 
			damage *= 0; 
			scr_env_material_electrify(hit_s);
			break;
	    }
	#endregion
	    break;
    
	    case 2://Ice
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100; break;//Explosive
	        case 1: 
			hit_s.env_heat_value += 1;
			damage *= .01;
			particle_scr_eff_burst(hit_s,6);
			particle_scr_eff_burst(hit_s,1);
			break;//Flame
	        case 3: damage *= .25;  particle_scr_eff_burst(hit_s,3); scr_bullet_env_hit(hit_s);  break;//Salt
	        case 4: damage *= 5;   particle_scr_eff_burst(hit_s,4); scr_bullet_env_hit(hit_s); break;//Corr
	        case 7: damage *= 1 scr_bullet_env_hit(hit_s); break; 
			case 8: damage *= 0.5; particle_scr_eff_burst(hit_s,5); break;
			case 9: damage *= -1; break;
	    }
	#endregion
	    break;
    
	    case 3://Water
	#region
	    switch(damageType)
	    {
	        case 3: hit_s.env_ph_value += 1; particle_scr_eff_burst(hit_s,3); break;//Salt
	        case 4: hit_s.env_ph_value -= 1; particle_scr_eff_burst(hit_s,4); break;//Corr
	    }
	#endregion
	    break;
    
	    case 4://Fire
	#region
	    switch(damageType)
	    {
	        default: damage *= 0 break;
	        case 2: damage *= 100; particle_scr_eff_burst(hit_s,2); break;//Cyro
	        case 3: damage *= 1; particle_scr_eff_burst(hit_s,3); break;//Salt
			case 9: damage *= 100; break;
	    }
	#endregion
	    break;
    
	    case 5://Ore/Stone
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100 scr_bullet_env_hit(hit_s);break;//Explosive
	        case 3: damage *= 0.5; scr_bullet_env_hit(hit_s); break;
	        case 7: damage *= 1; scr_bullet_env_hit(hit_s); break;
	    }
	#endregion
		break;
	
		case 6://Slime
	#region
	    switch(damageType)
	    {
	        default: damage *= 0; break;
			case 0: damage *= 100   scr_bullet_env_hit(hit_s); break;//Explosive
	        case 1: damage *= 0.5;   scr_bullet_env_hit(hit_s); break;
	        case 3: damage *= 2; scr_bullet_env_hit(hit_s); break;
	        case 7: damage *= 0.15; scr_bullet_env_hit(hit_s); break;
	    }
	#endregion
	    break;
	
		case 9://Special
	#region
	    switch(damageType)
	    {
	        default: damage *= 1; scr_bullet_env_hit(hit_s); break;
			case 0: damage *= 100;   scr_bullet_env_hit(hit_s); break;//Explosive
	        case 1: damage *= 1;   scr_bullet_env_hit(hit_s); particle_scr_eff_burst(hit_s,1);break;
	        case 2: damage *= 1; scr_bullet_env_hit(hit_s); particle_scr_eff_burst(hit_s,2); break;
	        case 3: damage *= 1;   scr_bullet_env_hit(hit_s); particle_scr_eff_burst(hit_s,3); break;
	        case 4: damage *= 1; scr_bullet_env_hit(hit_s); particle_scr_eff_burst(hit_s,4); break;
			case 8: damage *= 1; scr_bullet_env_hit(hit_s); particle_scr_eff_burst(hit_s,5) break;
	    }
	#endregion
	    break;
	    }


	hit_s.env_dur -= damage //damage

	//Cue flash tick
	with(hit_s)
	{
		if env_dur < (env_dur_MAX/4) && env_dur_low == false
			alarm[11] = 1;
	}

	var b_destroy = destoryOnHit //destroy bullet upon collision
	if b_destroy = true
	    instance_destroy();
    

	}
	//////////////////////////////////////////////////End of Environment




}
