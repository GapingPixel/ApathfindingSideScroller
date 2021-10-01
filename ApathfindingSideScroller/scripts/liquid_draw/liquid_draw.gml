/// @description liquid_draw(col1, col2, alpha1, alpha2, depthInclusion)
/// @param  colTop
/// @param  colBottom
/// @param  alphaTop
/// @param  alphaBottom
/// @param	depthInclusion
function liquid_draw(argument0, argument1, argument2, argument3, argument4) {

	var i, nx, ny, botY;
	var depth_inclusion = argument4
	//calculate bottom of liquid
	botY = y + liq_height;

	//setting blend
	gpu_set_blendmode(bm_normal);

	//find nodes
	var pos1, pos2;
	pos1 = clamp(floor((global.cam_x - x) / liq_nodeWidth), 0, liq_nodes - 1);
	pos2 = clamp(pos1+ceil((global.cam_width-(global.cam_x - x))/liq_nodeWidth)+2 ,0, liq_nodes-1);

	//ensure it is on-screen
	    //if !((pos1 >= (liq_nodes-1)) || (pos2 <= 0) || (y > (cam_y+cam_height)) || (botY < cam_y))
     
		 //draw the liquid BEHIND
		 if depth_inclusion
		 {
	        draw_primitive_begin(pr_trianglestrip);
    
	        for(i = pos1; i <= pos2; i += 1) 
	        {
	            //calculate where the points to draw at are
	            nx = x+i*liq_nodeWidth;
	            ny = liquidarray[i, 0]+liquidarray[i, 3];
            
	            //draw points
	            draw_vertex_color(nx, ny - 12, argument0, argument2);
	            draw_vertex_color(nx, botY - 12, argument1, argument3);
	        }
        
	        draw_primitive_end();
		 }
	
	
		{
	        //draw the liquid FRONT
	        draw_primitive_begin(pr_trianglestrip);
    
	        for(i = pos1; i <= pos2; i += 1) 
	        {
	            //calculate where the points to draw at are
	            nx = x+i*liq_nodeWidth;
	            ny = liquidarray[i, 0]+liquidarray[i, 3];
            
	            //draw points
	            draw_vertex_color(nx, ny, argument0, argument2);
	            draw_vertex_color(nx, botY, argument1, argument3);
	        }
        
	        draw_primitive_end();
	    }

	//reset blend
	gpu_set_blendmode(bm_normal);

	//Debug line draw
	/*for (var i = 0; i < liq_nodes; ++i)
	    draw_line(x + (16 * i), liquidarray[i, 0], x + (16 * i), liquidarray[i, 0] - 8);*/


}
