/// @description liquid_apply_force_x(id, x, force)
/// @param id
/// @param  x
/// @param  force
function liquid_apply_force_x(argument0, argument1, argument2) {
	/*
	    Applies a force, distributed between 2 nodes
    
	    ARGUMENTS
	        id - real - the liquid id
	        x - real - the x in the room (not relative) to apply the effect
	        force - real - the force in pixels to shift the node
	*/
    
	    //find the nearest node to the x
	    var node1, node2, sx;
    
	    //get relative node x
	    sx = clamp((argument1-argument0.x)/argument0.liq_nodeWidth, 0 , argument0.liq_nodes-1);
    
	    //find surrounding nodes
	    node1 = floor(sx);
	    node2 = ceil(sx);

	    //apply the shared force to the nodes
	    argument0.liquidarray[node1, 1] = argument2*(1-frac(sx));
	    argument0.liquidarray[node2, 1] = argument2*frac(sx);


}
