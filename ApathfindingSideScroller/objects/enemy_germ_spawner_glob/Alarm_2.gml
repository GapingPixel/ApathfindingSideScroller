/// @description Actual shot
if enemy_state = enemyState.NORMAL
{
var inst = instance_create_depth(x,y-60,depth-1,enemy_germ_spawner_droplet)
inst.facing = dir;

with(inst)
{
	motion_set(90 + (irandom_range(10,20)*facing),16);	
}

}
