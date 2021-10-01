/// @description Reassign Angle for fire
var plyr = instance_nearest(x,y,parPlyr);
var angle_offset = 15;//offset to expand spread
var angle_offset_2 = 30//secondary offset
var anim = skeleton_animation_get();
if instance_exists(plyr) && enemy_behavior = enemy_AIM && enemy_state = enemyState.NORMAL
{
	var check_aim = point_direction(x,y,plyr.x,plyr.y)
	
	if check_aim < 45 - angle_offset_2 || (check_aim > 315 - angle_offset_2 && check_aim < 360) && enemy_var_aim_angle != 0
	{
		enemy_var_aim_angle = 0;
		
		if anim != "0_idle_aim_fire_fwrd"
		scr_skeleton_animation_setAnim("0_idle_aim_fwrd")
	}

	/*if (check_aim > 90 - angle_offset) && (check_aim < 90 + angle_offset) && enemy_var_aim_angle != 90//Up
	{
		enemy_var_aim_angle = 90;
		
		if anim != "0_idle_aim_fire_up"
		scr_skeleton_animation_setAnim("0_idle_aim_up")
	}*/
	
	
	
	if check_aim >= 45 - angle_offset_2 && (check_aim < 90 - angle_offset - angle_offset_2) && enemy_var_aim_angle != 45//Right Up
	{
		enemy_var_aim_angle = 45;
		
		if anim != "0_idle_aim_fire_diagup"
		scr_skeleton_animation_setAnim("0_idle_aim_diagup")
	}
	
	if check_aim <= 135 + angle_offset_2 && (check_aim > 90 + angle_offset + angle_offset_2) && enemy_var_aim_angle != 135//Left Up
	{
		enemy_var_aim_angle = 135;
		
		if anim != "0_idle_aim_fire_diagup"
		scr_skeleton_animation_setAnim("0_idle_aim_diagup")
	}
	
	if check_aim <= 315 + angle_offset_2 && (check_aim > 270 + angle_offset) && enemy_var_aim_angle != 315//Right Down
	{
		enemy_var_aim_angle = 315;
		
		if anim != "0_idle_aim_fire_diagdown"
		scr_skeleton_animation_setAnim("0_idle_aim_diagdown")
	}
	
	if check_aim >= 225 - angle_offset_2 && (check_aim < 270 - angle_offset) && enemy_var_aim_angle != 225 //Left Down
	{
		enemy_var_aim_angle = 225;
		
		if anim != "0_idle_aim_fire_diagdown"
		scr_skeleton_animation_setAnim("0_idle_aim_diagdown")
	}
	
}

alarm[2] = 10;