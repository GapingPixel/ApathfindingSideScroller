/// @description State Management

var room_state = global.game_room_state;

var plyr = chemball_player_parent;

if !instance_exists(plyr)
{
    instance_destroy();
}

///State Case
switch(cb_state)
{
case ballState.HELD://Holding state
    if instance_exists(plyr)
    {
        image_xscale = plyr.image_xscale;
		if image_yscale < plyr.image_yscale
		image_yscale += 0.1;
	   
		if room_state != roomState.Flight
		{
			if !(plyr.up_inp || plyr.down_inp)
				chemball_dir = 0;
			if plyr.up_inp and !(plyr.left_inp && plyr.right_inp)
				chemball_dir = 90 * image_xscale;  
			if plyr.up_inp and (plyr.left_inp || plyr.right_inp)
				chemball_dir = 45 * image_xscale;
			if plyr.down_inp and !(plyr.left_inp && plyr.right_inp)
				chemball_dir = -90 * image_xscale;
			if plyr.down_inp and (plyr.left_inp || plyr.right_inp)
				chemball_dir = -45 * image_xscale;
			
			
			
			x = plyr.x;
	        if (plyr.var_running = 0 && plyr.var_jumping = 0)
	        y = plyr.y-50;
	        else
	        y = plyr.y-70;
		}
		else
		{
			x = plyr.x + 12;
			y = plyr.y - 40;
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