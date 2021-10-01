/// @description Insert description here
// You can write your code in this editor
/// @description Movement
//var anim = skeleton_animation_get();
//Pathfinding
if(unit_state == UNIT_STATE.GATHER and alarm[3] < 0) {
		
	alarm[3] = room_speed*0.65;
}

var plyr = parPlyr;

switch(enemy_state)
{
	case enemyState.NORMAL:
	image_xscale = facing;

	if collision_line(x,y,plyr.x,plyr.y,parCollision,false,true) != noone and place_meeting(x,y,obj_path_trigger) {
		start_path();
	}
	
	if !place_meeting(x,y,obj_path_trigger)  {
		if path_exists(p) {
			path_end();
		}
		
		if collision_line(x,y,plyr.x,plyr.y,parCollision,false,true) == noone {
			enemy_behavior  = enemy_FLY;
		}
	}
	
	#region//AI
	switch(enemy_behavior)
	{
		
	case enemy_IDLE:
		vx = 0;
		vy = 0;
	break;
	
	case enemy_FLY:
		image_xscale = facing;
		//Detect player
		
		//Starts 315 ends on 359
		if instance_exists(plyr)
		{
			switch flee_away_direction {
			
				case 1:
				//Pursue
				x += lengthdir_x(3,angle);
				y += lengthdir_y(6,angle);
				clamp(angle,315,359);
				angle+= 0.2; 
				clamp(angle,315,359);
				flee_away_direction = 1;	
				if angle >= 359 {
					alarm[2] = 45;
					enemy_behavior  = enemy_ZIGZAG;
				}
				break;
				
				case -1:
				//Pursue
				x += lengthdir_x(3,angle);
				y += lengthdir_y(6,angle);
				clamp(angle,180,225);
				angle-= 0.2; 
				clamp(angle,180,225);
				flee_away_direction = -1;
				
				if angle <= 180 {
					alarm[2] = 45;
					enemy_behavior  = enemy_ZIGZAG;
				}
				break;
		}
			
				
			if y >= plyr.y {
				alarm[2] = 45;
				enemy_behavior  = enemy_ZIGZAG;
			
			}//then enemy_behavior = enemy_IDLE;	
	}
	break;
	
	case enemy_ZIGZAG:
	motion_set(point_direction(x,y,plyr.x,plyr.y) + zigzag,2);
	
	if place_meeting(x, y, parPlyr) {
		enemy_behavior = enemy_FLEE_AWAY;
		motion_set(0,0);
		switch (flee_away_direction)  {
			case 1:
			angle = 1;
			break;
			
			case -1:
			angle = 180;
			break;
		}
	}/* else if place_meeting(x, y, parSolid) {
			x = xprevious;
			y = yprevious;
			enemy_behavior = enemy_IDLE;
	} */
	break;
	
	case enemy_FLEE_AWAY:
		
	if instance_exists(plyr)
	{
		switch (flee_away_direction)  {
			
			case 1:
			//Pursue
			x += lengthdir_x(3,angle);
			y += lengthdir_y(6,angle);
			clamp(angle,1,45);
			angle+= 0.2; 
			clamp(angle,1,45);
					
			case -1:
			//Pursue
			x += lengthdir_x(3,angle);
			y += lengthdir_y(6,angle);
			clamp(angle,180,135);
			angle-= 0.2; 
			clamp(angle,180,135);
			break;
		}
		
		if y <= ystart then enemy_behavior = enemy_IDLE;
	}
	break;
	
	}
	#endregion
	break;

	case enemyState.FROZEN:
	vx = 0;
	vy = 0;
	scr_enemy_freeze_check();
	break;
	
	case enemyState.HITSTUN:
	vx = 0;
	vy = 0;
	break;
	
}



/*var x_sign = sign(plyr.x - x);
			var y_sign = sign(plyr.y - y);
		
			if x_sign > 0
				{if(vx < vxMax)	vx += vyMax;}
			else
				if(vx > -vxMax)	vx += -vyMax;
			
			if y_sign > 0
				{if(vy < vxMax)	vy += vyMax;}
			else
				if(vy > -vxMax)	vy += -vyMax;*/