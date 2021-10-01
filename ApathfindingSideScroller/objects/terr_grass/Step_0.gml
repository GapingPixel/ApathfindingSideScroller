event_inherited();
var skew_scale = (16 / (image_yscale * 4));
//wave grass when near entities
if (instance_place(x, y, objEntity)) { 
    with (instance_place(x, y, objEntity)) {
        // Move
        if (abs(vx) <= 1 && abs(vy) <= 1) {
            // Nothing
        } else if (abs(vx) <= 1)
            other.skew = round(random_range(-skew_scale, skew_scale)) * choose(-1, 1);
        else
            other.skew = round(random_range(-skew_scale,skew_scale)) * sign(vx);
            
        // Target
        if (abs(vx) > 1 || abs(vy) > 1)
            other.set  = other.skew;
    }
}


//Destroy grass when objects below is destroyed
/*if !onGround
{
	instance_destroy()
}
