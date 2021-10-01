/// @description liquid_update()
function liquid_update() {


	    //cycle wave wobble
	    liq_waveAngle += liq_waveSpd;
    
	    var lLdelt, lRdelt, ldiff, exec, i;
    
	    //loop through to manipulate each node
	    for (i = 0; i < liq_nodes; i += 1)
	    {
	        //get y differences between surrounding nodes, checking for edge nodes
	        if (liq_sides) //edge movement is on
	        {
	            if ((i-1 <= -1)) //for node at leftmost edge
	            {
	                //only use values from right side for movement
	                lLdelt = (y-liquidarray[i, 0]);
	                lRdelt = (liquidarray[i+1, 0]-liquidarray[i, 0]);
	                ldiff = (0+liquidarray[i+1, 1]);
	            }
	            else if (i+1 >= liq_nodes) //for node at rightmost edge
	            {
	                //only use values from left side for movement
	                lLdelt = (liquidarray[i-1, 0]-y);
	                lRdelt = (liquidarray[i+1, 0]-liquidarray[i, 0]);
	                ldiff = (liquidarray[i-1, 1]+0);
	            }
	            else // for node at the middle
	            {
	                //use values from both sides for movement
	                lLdelt = (liquidarray[i-1, 0]-liquidarray[i, 0]);
	                lRdelt = (liquidarray[i+1, 0]-liquidarray[i, 0]);
	                ldiff = (liquidarray[i-1, 1]+liquidarray[i+1, 1]);
	            }
	            exec = 1;
	        }
	        else //edge movement is off
	        {
	            //get y differences between surrounding nodes
	            lLdelt = (liquidarray[i-1, 0]-liquidarray[i, 0]);
	            lRdelt = (liquidarray[i+1, 0]-liquidarray[i, 0]);
	            ldiff = (liquidarray[i-1, 1]+liquidarray[i+1, 1]);
            
	            //if current node is an edge node, dont execue movement, else do
	            exec = ((i-1 > -1) && (i+1 < liq_nodes));
	        }
        
	        //actually move nodes, if node is in middle (or at edge and edge movement is set)
	        if (exec)
	        {
	            //move node based on other nodes (transfer waves energy to self)
	            liquidarray[i, 1] += (lLdelt+lRdelt+ldiff)/(liq_factor*liq_spring);
            
	            //move based on y position
	            liquidarray[i, 1] += ((y) - (liquidarray[i, 0]))/(liq_factor*liq_spring)
	            liquidarray[i, 2] = (liquidarray[i, 1])/(liq_factor/liq_friction);
	            liquidarray[i, 1] -= liquidarray[i, 2];
	            liquidarray[i, 3] = (dsin(liq_waveAngle+liquidarray[i, 4])*liq_waveAmount)*liquid_is_even(i);

	            //move the node
	            liquidarray[i, 0] += liquidarray[i, 1] + moveSpd;
            
	            //
	            //
	            // The following code snippet is unrelated to the water manipulation //////////////////
            
	            // Update floater
	            /*with (ParFloater) {
	                node = ((x + sprite_width * 0.5) - x) / 16;
                
	                if (pool.id == other.id && abs(node - i) < 1) {
	                    pyp            = phy_position_y;
	                    phy_position_y = ystart + (other.ystart - other.liquidarray[i, 0]); //other.liquidarray[i, 0])  - (sprite_height * 0.5)
	                }
	            }*/
            
	            ///////////////////////////////////////////////////////////////////////////////////////
	            //
	            // End floater code
	        }
	    }


}
