/// @description liquid_apply_force_node(id, node, force)
/// @param id
/// @param  node
/// @param  force
function liquid_apply_force_node(argument0, argument1, argument2) {
	/*
	    Applies a force at a specific node
    
	    ARGUMENTS
	        id - real - the liquid id
	        node - real - the column of the water to manipulate
	        force - real - the force in pixels to shift the node
	*/
    
	    //apply the force to the node
	    argument0.liquidarray[argument1, 1] = argument2;


}
