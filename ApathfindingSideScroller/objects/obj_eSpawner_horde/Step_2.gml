/// @description Behavior and Position of edge based on edge type

#region Activation and Disabling
var camObj = instance_nearest(x,y,parPlyr);

if instance_exists(camObj)
{
	//Detection Line
	var detect_line;
	switch(edge_spawn_type)
	{
	//case edge_spawn_left:
	//case edge_spawn_right:
	case enemyEdgeSpawner_horizontal:
		detect_line = collision_line(x,y-540,x,y+540,camObj,false,true);
	break;
	
	//case edge_spawn_top:
	//case edge_spawn_bottom:
	case enemyEdgeSpawner_vertical:
		if (edge_spawn_vertical_trigger == true)
		detect_line = collision_line(x-960,y,x+960,y,camObj,false,true);//For vertical scrolling
		else
		detect_line = collision_line(x,y-540,x,y+540,camObj,false,true)	;//For horizontal, but want vertical spawning
	break;
	}
	
	if detect_line && edge_spawn_active == false
	{
		alarm[0] = round(edge_spawn_frequency/10);
		edge_spawn_active = true;
	}
}

//Deactivate Spawn and return to starting point
var deactivate_spawn = (x < edge_spawn_deactivation_point[0]) ||
(x > edge_spawn_deactivation_point[1]) ||
(y < edge_spawn_deactivation_point[2]) ||
(y > edge_spawn_deactivation_point[3])

if deactivate_spawn && edge_spawn_active == true
{
	x = xstart;
	y = ystart;
	edge_spawn_active = false;
}

#endregion



#region Update Spawner Position

//Spawner positiion updated to middle points
var midpoint_hori = global.cam_x + (global.cam_width/2);
var midpoint_vert = global.cam_y + (global.cam_height/2);

if edge_spawn_active
{
	x = midpoint_hori;
	y = midpoint_vert;
}

#endregion

