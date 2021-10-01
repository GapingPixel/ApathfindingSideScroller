/// @description liquid_buildNodes()
function liquid_build_nodes() {

	        //create each node
	        for (var i = 0; i <= liq_nodes; i += 1)
	        {
	            liquidarray[i, 0] = y;
	            liquidarray[i, 1] = 0;
	            liquidarray[i, 2] = (liquidarray[i, 1])/(room_speed/liq_friction);
	            liquidarray[i, 3] = 0;
	            liquidarray[i, 4] = random(360);
	        }


}
