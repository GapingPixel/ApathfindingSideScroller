/// @description Spawn Point parent for enemy hordes to come from the edge of screen
//visible = false;//for Debug purposes



edge_spawn_type = enemyEdgeSpawner_horizontal;//Spawn type based on macro

edge_spawn_offset = 64;//Offset for enemy to be created from edge
edge_spawn_enemy_object = enemy_robot_minion;//Value for enemy instance to spawn
edge_spawn_frequency = 180;//Value for alarm to tick
edge_spawn_vertical_trigger = false;//Bool for edge_spawn top and bottom to determine collision point to be horitzontal for vertical

//Position randomizer for spawn point
edge_spawn_x_randomizer = 0;
edge_spawn_y_randomizer = 0;

//Spawn weights
edge_spawn_weight[0] = 0.5;//Weight to spawn enemy from left / top side
edge_spawn_weight[1] = 0.5;//Weight to spawn enemy from right / bottom side

//activation and deactivation
edge_spawn_active = false;

//Activation Point
/*
0 Left
1 Right
2 Top
3 Bottom
*/

edge_spawn_activation_distance[0] = 960
edge_spawn_activation_distance[1] = 960
edge_spawn_activation_distance[2] = 540
edge_spawn_activation_distance[3] = 540

edge_spawn_deactivation_point[0] = xstart - edge_spawn_activation_distance[0];
edge_spawn_deactivation_point[1] = xstart + edge_spawn_activation_distance[1];
edge_spawn_deactivation_point[2] = ystart - edge_spawn_activation_distance[2];
edge_spawn_deactivation_point[3] = ystart + edge_spawn_activation_distance[3];


alarm[0] = edge_spawn_frequency;