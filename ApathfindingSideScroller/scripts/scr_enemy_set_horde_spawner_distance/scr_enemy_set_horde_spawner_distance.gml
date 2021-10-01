///@description scr_set_edge_spawner_distance(Left,Right,Top,Bottom)
///@param Left
///@param Right
///@param Top
///@param Bottom
///@param Vertical_Trigger
function scr_enemy_set_horde_spawner_distance(leftDistance, rightDistance, topDistance, bottomDistance, vert_trigger,leftSide_weight,rightSide_weight) {
	//Set up Distance in pixels for activation / deactivation of edge spawner
	//Place in Creation Code of Spawner

	edge_spawn_activation_distance[0] = leftDistance;
	edge_spawn_activation_distance[1] = rightDistance;
	edge_spawn_activation_distance[2] = topDistance;
	edge_spawn_activation_distance[3] = bottomDistance;


	edge_spawn_vertical_trigger = vert_trigger;	

	edge_spawn_deactivation_point[0] = xstart - edge_spawn_activation_distance[0];
	edge_spawn_deactivation_point[1] = xstart + edge_spawn_activation_distance[1];
	edge_spawn_deactivation_point[2] = ystart - edge_spawn_activation_distance[2];
	edge_spawn_deactivation_point[3] = ystart + edge_spawn_activation_distance[3];
	
	//Set Weights
	edge_spawn_weight[0] = leftSide_weight;
	edge_spawn_weight[1] = rightSide_weight;


}
