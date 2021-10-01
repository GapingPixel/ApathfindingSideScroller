// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_moving_platform_update(){

//check if we actually set up the values
var ini_setUp = variable_instance_exists(id,"x_speed") && variable_instance_exists(id,"y_speed")

if ini_setUp
{

// Handle sub-pixel movement
y_speed_excess += y_speed;
y_speed_final = round(y_speed_excess);
y_speed_excess -= y_speed_final;



//var x_speed_final;

// Handle sub-pixel movement
x_speed_excess += x_speed;
x_speed_final = round(x_speed_excess);
x_speed_excess -= x_speed_final;

var x_s = x_speed_final;
var y_s = y_speed_final;
with(objEntity)
	if (place_meeting(x, y + 1, other.id) || place_meeting(x, y - 1,other.id))
    {
        if !CollisionPlaceMeetingException(x, y + y_s, parCollision, other.id)
                    then
                    {
                    x += x_s;
					y += y_s;
                    }
    }
	
y += y_speed_final;
x += x_speed_final;

}

}