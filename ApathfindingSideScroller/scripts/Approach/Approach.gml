/// @description  Approach(current, target, amount);
/// @param current
/// @param  target
/// @param  amount
function Approach(argument0, argument1, argument2) {

	var current = argument0;
	var target = argument1;
	var amount = argument2;

	if (current < target)
	    then
	    {
	    current = min(current + amount, target); 
	    }
	else
	    {
	    current = max( current - amount, target);
	    }
    
	return current;


}
