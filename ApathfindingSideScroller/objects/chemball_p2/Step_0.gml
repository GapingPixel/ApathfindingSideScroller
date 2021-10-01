/// @description change the chemball_direction variable on inputs when held and player exists
/*if cb_state = ballState2.held && instance_exists(obj_plyr2)
{
    image_xscale = obj_plyr2.image_xscale;
	//image_yscale = obj_plyr2.image_yscale;
    
    if !in_flight//Omnichemball_directional disabled during flight levels
	{
	if !(obj_plyr2.up_inp || obj_plyr2.down_inp)
        chemball_dir = 0;
    if obj_plyr2.up_inp and !(obj_plyr2.left_inp && obj_plyr2.right_inp)
        chemball_dir = 90 * image_xscale;  
    if obj_plyr2.up_inp and (obj_plyr2.left_inp || obj_plyr2.right_inp)
        chemball_dir = 45 * image_xscale;
    if obj_plyr2.down_inp and !(obj_plyr2.left_inp && obj_plyr2.right_inp)
        chemball_dir = -90 * image_xscale;
    if obj_plyr2.down_inp and (obj_plyr2.left_inp || obj_plyr2.right_inp)
        chemball_dir = -45 * image_xscale;
	}
}*/
var room_state = global.game_room_state;

if !instance_exists(obj_plyr2)
{
    instance_destroy();
}

///State Case
switch(cb_state)
{
case ballState.HELD://Holding state
    if instance_exists(obj_plyr2)
    {
       image_xscale = obj_plyr2.image_xscale;
	   if image_yscale < obj_plyr2.image_yscale
	   image_yscale += 0.1;
	   
		if room_state != roomState.Flight
		{
			x = obj_plyr2.x;
	        if (obj_plyr2.var_running = 0 && obj_plyr2.var_jumping = 0)
	        y = obj_plyr2.y-50;
	        else
	        y = obj_plyr2.y-70;
			
			
			//Omnidirectional disabled during flight levels
			if !(obj_plyr2.up_inp || obj_plyr2.down_inp)
				chemball_dir = 0;
			if obj_plyr2.up_inp and !(obj_plyr2.left_inp && obj_plyr2.right_inp)
				chemball_dir = 90 * image_xscale;  
			if obj_plyr2.up_inp and (obj_plyr2.left_inp || obj_plyr2.right_inp)
				chemball_dir = 45 * image_xscale;
			if obj_plyr2.down_inp and !(obj_plyr2.left_inp && obj_plyr2.right_inp)
				chemball_dir = -90 * image_xscale;
			if obj_plyr2.down_inp and (obj_plyr2.left_inp || obj_plyr2.right_inp)
				chemball_dir = -45 * image_xscale;
		}
		else
		{
			x = obj_plyr2.x + 12;
			y = obj_plyr2.y - 40;
		}
        
    }
break;

case ballState.THROW://Throw State
    motion_set(chemball_dir,20*image_xscale);
    if image_xscale > 1
        image_xscale -= 0.05;
    if image_xscale < -1
        image_xscale += 0.05;
    scr_bullet_damage(bullet_dmg,bullet_type,true);
    scr_bullet_dmg_env(bullet_dmg,bullet_type,false);
    scr_bullet_dmg_env_solids(bullet_dmg,bullet_type,true);
    scr_bullet_dmg_env_platforms(bullet_dmg,bullet_type,false);
    scr_bullet_destroy();
    image_angle += 25;
	
	if chemball_collision_with_wall_frames > 0
		chemball_collision_with_wall_frames--;
	
	if place_meeting(x,y,parSolid) && chemball_collision_with_wall_frames <=0
		instance_destroy();
break;

case ballState.RETURN://Return State
	image_yscale -= 0.2;
	if (image_yscale <= 0)
    {
        //recollect elements
        instance_destroy();
    }
break;

}

