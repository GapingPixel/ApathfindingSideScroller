/// @description Extension of EntityEndStep
jumped = false;
landed = false;

//Check Platforms
if (vy < 1 && vy > -1)
    PlatformCheck();
else
    repeat(abs(vy)) {
        if (!PlatformCheck())
            y += sign(vy);
        else
            break;
    }

if (platformTarget) {
    if (!onGround)
        landed = true;
    
    if (landed)
        with (platformTarget) other.vy = 0;
    else
        with (platformTarget) other.vy = 0;
}

repeat(abs(vx)) {
	
	if (place_meeting(x + sign(vx), y, parJumpThru) && !place_meeting(x + sign(vx), y - 1, parJumpThru))
		y -= 1;
         
	if (place_meeting(x + sign(vx), y + 2, parJumpThru) && !place_meeting(x + sign(vx), y + 1, parJumpThru))
		y += 1;   	
		
	if (place_meeting(x + sign(vx), y, parSolid) && !place_meeting(x + sign(vx), y - 1, parSolid))
        y -= 1;
         
    if (place_meeting(x + sign(vx), y + 2, parSolid) && !place_meeting(x + sign(vx), y + 1, parSolid))
        y += 1;         
          
    if (!place_meeting(x + sign(vx), y, parSolid) && !place_meeting(x + sign(vx), y, solid_inv_wall))
        x += sign(vx);
    else
        vx = 0;
}

//To prevent collision clipping with falling environment objects
var solid_bonk = instance_place(x,y-1,obj_env_solids)
if solid_bonk != noone && onGround
{
    x += 16*image_xscale
}

