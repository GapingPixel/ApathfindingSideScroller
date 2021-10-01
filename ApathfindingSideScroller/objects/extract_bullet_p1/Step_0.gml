
motion_set(image_angle,bullet_data[0]*image_xscale);

//scr_bullet_damage(0.5,8,true);//OP Version
scr_bullet_damage(0.5,5,true);

if place_meeting(x,y,parSolid)
	instance_destroy();
	
scr_bullet_destroy();