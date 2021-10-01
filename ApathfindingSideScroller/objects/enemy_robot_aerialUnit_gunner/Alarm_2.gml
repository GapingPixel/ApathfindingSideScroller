/// @description Aim Alarm Tick
var plyr = instance_nearest(x,y,parPlyr);
var angle_offset = 30;//offset to expand spread
var anim = skeleton_animation_get();
if instance_exists(plyr)
if anim != "1_turn" && enemy_behavior = enemy_AIM && enemy_state = enemyState.NORMAL
{
	var check_aim = point_direction(x,y,plyr.x,plyr.y)
	
	if check_aim < (190) && check_aim > -10// Fwrd
	{
		if facing = 1
		enemy_var_aim_angle = 0;
		else
		enemy_var_aim_angle = 180;
		
		if anim != "2_shoot_fwrd" && anim !="2_aim_fwrd"
		scr_skeleton_animation_setAnim("2_aim_fwrd")
	}
	
	if (check_aim > 270 - angle_offset) && (check_aim < 270 + angle_offset)//Down
	{
		enemy_var_aim_angle = 270;
		
		if anim != "2_shoot_down" && anim !="2_aim_down"
		scr_skeleton_animation_setAnim("2_aim_down")
	}
	if (check_aim > 270 + angle_offset)//Right Down
	{
		enemy_var_aim_angle = 315;
		
		if anim != "2_aim_diagdown" && anim !="2_shoot_diagdown"
		scr_skeleton_animation_setAnim("2_aim_diagdown")
	}
	if check_aim > (190) && (check_aim < (270 - angle_offset))//Left down
	{
		enemy_var_aim_angle = 225;
		
		if anim != "2_aim_diagdown" && anim !="2_shoot_diagdown"
		scr_skeleton_animation_setAnim("2_aim_diagdown")
	}
	
}

alarm[2] = 5;