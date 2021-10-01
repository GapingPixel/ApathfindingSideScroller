/// @description liquid_draw(sprite_index, image_index, col1, col2, alpha1, alpha2, x, y)
/// @param  spr
/// @param  img
/// @param  colTop
/// @param  colBottom
/// @param  alphaTop
/// @param  alphaBottom
/// @param  offset_x
/// @param	offset_y
function liquid_draw_texture(argument0, argument1, argument2, argument3, argument4, argument5) {

	gpu_set_texrepeat(true);

	var i, nx, ny, botY, xt, sprScale, lhScale;

	//calculate bottom of liquid
	botY = y + liq_height;

	//setting blend
	gpu_set_blendmode(bm_normal);

	//scale the tex
	sprScale = liq_height/sprite_get_height(argument0);
	lhScale = liq_width/(sprite_get_width(argument0)) / 2//*sprscale);

	//find nodes
	var pos1, pos2
	pos1 = clamp(floor((global.cam_x - x) / liq_nodeWidth), 0, liq_nodes - 1);
	pos2 =  clamp(pos1+ceil((global.cam_width-(global.cam_x - x))/liq_nodeWidth)+2 ,0, liq_nodes-1);

	//ensure it is on-screen
	    if !((pos1 >= (liq_nodes-1)) || (pos2 <= 0) || (y > (global.cam_y+global.cam_height)) || (botY < global.cam_y))
	    {
	        //draw the liquid
	        draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument0, argument1));
    
	        for(i = pos1; i <= pos2; i += 1) 
	        {
	            //calculate where the points to draw at are
	            nx = x+i*liq_nodeWidth;
	            ny = liquidarray[i, 0]+liquidarray[i, 3];
            
	            //draw points
	            xt = ((i/(liq_nodes+1))*lhScale);
	            draw_vertex_texture_colour(nx, ny, xt, 0, argument2, argument4);
	            draw_vertex_texture_colour(nx, botY, xt, 1, argument3, argument5);
	        }
        
	        draw_primitive_end();
	    }

	//reset blend
	gpu_set_blendmode(bm_normal);


}
