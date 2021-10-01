/// @description Homing step for bullets
/// @param magnetic_boolean
function scr_bullet_home_step(magnetic) {
	
	var enemy = instance_exists(obj_enemy)
	var metal = instance_exists(parEnv_metal);
	var metal_platform = instance_exists(parEnv_metal_platform);

	//Homing initiated
	if bullet_data[2] = 1
	{
		motion_set(image_angle,bullet_data[0]);
	
		if !magnetic
		{
			if instance_exists(obj_enemy)
			{
				bullet_data[1] = point_direction(x, y, obj_enemy.x, obj_enemy.y);
		        image_angle = angle_approach(image_angle,bullet_data[1],bullet_data[0]/2);
		        x = homing_approach(x,obj_enemy.x,0.5);
		        y = homing_approach(y,obj_enemy.y,0.5);
			}
		
		}
		else
		{
			//Check for enemies and Metal
			switch(1)
			{
				case enemy:
					bullet_data[1] = point_direction(x, y, obj_enemy.x, obj_enemy.y);
			        image_angle = angle_approach(image_angle,bullet_data[1],bullet_data[0]/2);
			        x = homing_approach(x,obj_enemy.x,0.5);
			        y = homing_approach(y,obj_enemy.y,0.5);
				break;
		
				case metal:
					bullet_data[1] = point_direction(x, y, parEnv_metal.x, parEnv_metal.y);
			        image_angle = angle_approach(image_angle,bullet_data[1],bullet_data[0]/2);
			        x = homing_approach(x,parEnv_metal.x,0.5);
			        y = homing_approach(y,parEnv_metal.y,0.5);
				break;
		
				case metal_platform:
					bullet_data[1] = point_direction(x, y, parEnv_metal_platform.x, parEnv_metal_platform.y);
			        image_angle = angle_approach(image_angle,bullet_data[1],bullet_data[0]/2);
			        x = homing_approach(x,parEnv_metal_platform.x,0.5);
			        y = homing_approach(y,parEnv_metal_platform.y,0.5);
				break;
			}
	
		}
	}
	else
	motion_set(image_angle,bullet_data[0]*image_xscale);//Setting Motion



}
