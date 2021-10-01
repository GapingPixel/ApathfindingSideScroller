///scr_place_meeting_exception(x, y, obj_parent, object_to_ignore);
function CollisionPlaceMeetingException(argument0, argument1, argument2, argument3) {

	var exception = argument3;

	with (argument2) 
	    {
	    var this = id;
    
	    if (id == exception)
	        then
	        {
	        continue;               //check the next
	        }
	    else
	        {
	        with (other)
	            {
	            if (place_meeting(argument0, argument1, this))
	                then
	                {
	                return true;
	                }
	            }
	        }
	    }

	// Collision with a different object
	return false;


}
