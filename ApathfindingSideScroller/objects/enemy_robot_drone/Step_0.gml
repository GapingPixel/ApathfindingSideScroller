/// @description Movement

switch(enemy_state)
{
    case enemyState.NORMAL:
	Gravity();
    switch(enemy_behavior)
	{
		case enemy_PATROL:
		#region AI
	    if enemy_var_drone_alert
	    {
	        vxMax = 6;
			
			var redeyes = part_type_create();
			part_type_sprite(redeyes,spr_effect_shape_octagon,0,0,0);
			part_type_size(redeyes,0.10,0.10,0,0.05);
			part_type_color3(redeyes,8421631,255,128);
			part_type_alpha2(redeyes,1,0);
			part_type_gravity(redeyes,0,270);
			part_type_orientation(redeyes,0,0,0,0,1);
			part_type_blend(redeyes,1);
			part_type_life(redeyes,20,0);
			
	        part_particles_create(global.parsys,x-22,y-1,redeyes,5);
	        part_particles_create(global.parsys,x+22,y-1,redeyes,5);
			image_speed = 0.6;
	    }
	    else
		{
	        vxMax = 2;
			image_speed = 0.2;
		}
        
	    vx = vxMax * dir;
    
	    //Self Turn
	    if onGround
	    {
			var detect_edge = !position_meeting(x+(sprite_get_width(sprite_index)/3)*dir, y+(sprite_height/2)+10, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*dir, y+(sprite_height/3)+8, parJumpThru)
			
	        if detect_edge
	        {
	            dir *= -1;
	        }
	    }
    
		if (place_meeting(x+dir*16,y,solid_block))
			dir *= -1;
		
	    //Speed Up
		var plyr = parPlyr
		var detection = collision_rectangle(x-700,y-60,x+700,y+60,plyr,false,true)
	    if instance_exists(plyr)//Alarm
	        if detection
	        {
	            enemy_var_drone_alert = true;
	        }
	        else
	        {
	            enemy_var_drone_alert = false;
	        }
			break;
	}
	#endregion
	
	#region Animation
	var anim = skeleton_animation_get();

	switch(dir)
	{
		case 1:
			if anim != "0_patrol_R"
				skeleton_animation_set("0_patrol_R");
		break;
		
		case -1:
			if anim != "0_patrol_L"
				skeleton_animation_set("0_patrol_L");
		break;
	}
	
	#endregion
	break;
	
	case enemyState.FROZEN:
	scr_enemy_freeze_check();
	vx = 0;
	vy = 0;
	break;
	
	case enemyState.SHOCKED:
	vx = 0;
	vy = 0;
	break;
	
	case enemyState.HITSTUN:
		vx = 0
		vy = 0;
		image_speed = 0;
	break;
}

///Death
if enemy_hp <= 0
{
    particle_scr_eff_boom(0.75);
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    instance_destroy();
}

