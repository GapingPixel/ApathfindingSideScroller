// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//Functions 

function setFacing(){
	image_xscale = facing;
}


function Run() {
	vx = Approach(vx,vxMax*facing,tempAccel);
}

function Turn(distance) {
	
	if distance == undefined {
		distance = 300;
	}
	
	if instance_exists(parPlyr) {
		var _plyr = instance_nearest(x,y,parPlyr);
		
		if distance_to_object(_plyr) > distance  {
			if _plyr.x < x {
				facing = -1;
			} else {
				facing = 1;
			}
		}
	}
}

function TurnAtWall(){
	
	if (place_meeting(x+facing,y,solid_block))
		{
		       if onGround
		        {
					
		        }
				facing *= -1;
		}
}

function JumpOver() {
	if onGround  {
		if (place_meeting(x+(32*facing),y,parSolid)) and (!place_meeting(x+(32*facing),y-(jumpHeight*4),parSolid))   {
					vy -= jumpHeight;
					//scr_play_sound(snd_common_cartoony_boingy_jump,0,1.2,1.3);
					//vx -= (8*facing);
		}
	}
}

function TurnAtEdge() {
	if onGround {
		if !position_meeting( x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+4, parSolid )
		&& !position_meeting( x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+4, parJumpThru )
		{
			if facing == 1 {
				facing = -1;
				
			} else {
				facing = 1;
			}
		}
	}
}

function JumpAtEdge() {
	if onGround {
		if !position_meeting(x+(abs(sprite_width)/4)*1, y+(sprite_height/2)+10, parSolid)
			&& !position_meeting(x+(abs(sprite_width)/4)*-1, y+(sprite_height/2)+10, parSolid)
			&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+4, parJumpThru)
		{
			vy -= jumpHeight;
			//scr_play_sound(snd_common_cartoony_boingy_jump,0,1.2,1.3);
		}
	}
}

function AboutFace() {
	if instance_exists(parPlyr) {
		var _plyr = instance_nearest(x,y,parPlyr);
		
		if _plyr.x < x {
			facing = -1;
		} else {
			facing = 1;
		}
	}
}

function WallBounce() {
	
		if onGround  {
			if (place_meeting(x+((sprite_get_width(sprite_index)/2)*facing),y,parSolid)) and (place_meeting(x+((sprite_get_width(sprite_index)/2)*facing),y-(jumpHeight*4),parSolid))   {
						vy -= jumpHeight;
						//scr_play_sound(snd_common_cartoony_boingy_jump,0,1.2,1.3);
						alarm_set(11,14);
			}
		} 
}