// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_weightted_spawner_chance(){


var sum = edge_spawn_weight[0] + edge_spawn_weight[1];
sum=random(sum); 

for(var i = 0;sum>edge_spawn_weight[i];i++)
	sum -= edge_spawn_weight[i];

return i;
}