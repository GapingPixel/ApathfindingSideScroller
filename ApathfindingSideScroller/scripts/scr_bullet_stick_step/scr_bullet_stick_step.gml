/// @description Script for bullet sticking onto terrain
function scr_bullet_stick_step() {
	/*
	MUST include variable "bullet_data[7]" and "contact" in create version of script
	*/

	//motion_set(image_angle,vel);

	var contact_e = instance_place(x,y,obj_enemy);

	var contact_env_solid = instance_place(x,y,obj_env_solids);

	var contact_env_platform = instance_place(x,y,obj_env_platforms);

	var contact_solid = instance_place(x,y,parSolid);
	
	var contact_m_solid = instance_place(x+lengthdir_x(16,image_angle),y+lengthdir_y(16,image_angle), parSolidMoving);

	var contact_platform = instance_place(x,y,parJumpThru) 
	
	var contact_m_platform = instance_place(x+lengthdir_x(16,image_angle),y+lengthdir_y(16,image_angle), parJumpThruMoving) 

	var contact_detected = contact_e != noone || contact_env_solid != noone || contact_env_platform != noone || 
							contact_solid != noone || contact_m_solid != noone || contact_platform != noone || contact_m_platform != noone;

	switch(bullet_data[7])
	{
		case 0 :
	
		if contact_detected
		{
		    motion_set(image_angle,0);

			bullet_data[7] = 1;
		
			if contact_env_solid != noone
			{
				if contact_env_solid.env_dur <= 0
					instance_destroy(); 
			}
		
			if contact_env_platform != noone
			{
				if contact_env_platform.env_dur <= 0
					instance_destroy(); 
			}
		}
		else
		{
			if gravity = 0
			motion_set(image_angle,bullet_data[0] * image_xscale);	
		}

		break;
	
		case 1 :
		if contact_e != noone
		{
	    
			x = contact_e.hurt_x;// + contact.sprite_width/2;
		    y = contact_e.hurt_y;// + contact.sprite_height/2;
    
		    if contact_e.enemy_hp <= 0
		        instance_destroy();
		}
	
		if contact_env_solid != noone
		{
    
			motion_set(0,0);
		
			x += contact_env_solid.x_speed_final;
		    y += contact_env_solid.y_speed_final;
    
		    if contact_env_solid.env_dur <= 0
		        instance_destroy(); 
		}
	
		if contact_env_platform != noone
		{
    
			motion_set(0,0);
		
			x += contact_env_platform.x_speed_final;
		    y += contact_env_platform.y_speed_final;
    
		    if contact_env_platform.env_dur <= 0
		        instance_destroy(); 
		}
	
		if contact_m_solid != noone
		{
			x += contact_m_solid.x_speed_final;
		    y += contact_m_solid.y_speed_final;
		}
	
		if contact_m_platform != noone
		{
			x += contact_m_platform.x_speed_final;
		    y += contact_m_platform.y_speed_final;
		}

		break;
		/*if contact_e != noone
		{
		    x = contact_e.hurt_x;// + contact.sprite_width/2;
		    y = contact_e.hurt_y;// + contact.sprite_height/2;
    
		    bullet_data[7] = 1;
    
		    if contact_e.enemy_hp <= 0
		        instance_destroy();
		}

		if contact_s != noone
		{
    
		    vel = 0;
			motion_set(image_angle,vel);
		
			x = contact_s.x// + contact.sprite_width/2;
		    y = contact_s.y// + contact.sprite_height/2;
    
		    bullet_data[7] = 1;
    
		    if contact_s.env_dur <= 0
		        instance_destroy(); 
		}
	
	
		if contact_m_p != noone
		{
    
			vel = 0;
			motion_set(image_angle,vel);
			x += contact_m_p.x_speed_final;
		    y += contact_m_p.y_speed_final;
		
			bullet_data[7] = 1;
		}
	
		if contact_p != noone
		{
    
		    vel = 0;
			motion_set(image_angle,vel);
			bullet_data[7] = 1;
		}*/
	
	}



}
