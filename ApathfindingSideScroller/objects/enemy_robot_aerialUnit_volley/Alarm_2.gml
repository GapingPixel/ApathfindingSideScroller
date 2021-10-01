/// @description Aim Alarm Tick
/*var plyr = instance_nearest(x,y,parPlyr);
var angle_offset = 30;//offset to expand spread
var anim = skeleton_animation_get();
if instance_exists(plyr)
if anim != "1_turn" && enemy_behavior = enemy_aerialUnit_aim && enemy_state = enemyState.NORMAL
{
	var check_aim = point_direction(x,y,plyr.x,plyr.y)
	
	if check_aim < (190) && check_aim > -10// Fwrd
	{
		if facing = 1
		aerialUnit_aim_angle = 0;
		else
		aerialUnit_aim_angle = 180;
		
		if anim != "2_shoot_fwrd" && anim !="2_aim_fwrd"
		skeleton_animation_set("2_aim_fwrd")
	}
	
	if (check_aim > 270 - angle_offset) && (check_aim < 270 + angle_offset)//Down
	{
		aerialUnit_aim_angle = 270;
		
		if anim != "2_shoot_down" && anim !="2_aim_down"
		skeleton_animation_set("2_aim_down")
	}
	if (check_aim > 270 + angle_offset)//Right Down
	{
		aerialUnit_aim_angle = 315;
		
		if anim != "2_aim_diagdown" && anim !="2_shoot_diagdown"
		skeleton_animation_set("2_aim_diagdown")
	}
	if check_aim > (190) && (check_aim < (270 - angle_offset))//Left down
	{
		aerialUnit_aim_angle = 225;
		
		if anim != "2_aim_diagdown" && anim !="2_shoot_diagdown"
		skeleton_animation_set("2_aim_diagdown")
	}
	
}

alarm[2] = 5;