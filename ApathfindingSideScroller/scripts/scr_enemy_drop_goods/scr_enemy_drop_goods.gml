// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_drop_goods(quantity){
var dpth = -2;
var inst;
var i;
var rs = global.game_room_state;

if variable_instance_exists(id,"enemy_goodies")

if(enemy_goodies != 0)
{
	if quantity <= 1
	inst = instance_create_depth(x,y,dpth,enemy_goodies)
	else
	{
		for(i = 1; i < quantity; i++)
		{
			inst = instance_create_depth(x,y,dpth,enemy_goodies)
		}
	}
	
	switch(rs)
	{
		default:
			with(inst)
			{
			vy -= 20 + random(5);
			gravity_active = true;
			}
		break;
		
		case roomState.Flight:
		//Nothing
		break;
	}
	
}



}