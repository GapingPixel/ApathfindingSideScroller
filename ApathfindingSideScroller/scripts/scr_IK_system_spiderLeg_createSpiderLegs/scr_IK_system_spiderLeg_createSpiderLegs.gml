// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_IK_system_spiderLeg_createSpiderLegs(LegToCreate,legCount,distance){

//Script creates legs for the spider
for (var i = 0; i < legCount; i++)
{
	var ang = 360/legCount;
	var leg = instance_create_depth(x + lengthdir_x(distance,i*ang),y + lengthdir_y(distance,i*ang),depth+1,LegToCreate)	
	with(leg)
	{
		spider_leg_parent = id;
		spider_leg_direction = i*ang;
	}
}

}