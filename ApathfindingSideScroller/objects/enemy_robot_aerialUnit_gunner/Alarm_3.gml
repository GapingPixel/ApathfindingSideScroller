/// @description Shoot
var anim = skeleton_animation_get();

if anim != "1_turn" && enemy_behavior = enemy_AIM && enemy_state = enemyState.NORMAL
{
	
	var bullet = instance_create_depth(enemy_var_gun_x,enemy_var_gun_y,depth-1,enemy_bullet_robot)
	var angle = enemy_var_aim_angle
	//Animation
	switch(angle)
	{
		default:
			scr_skeleton_animation_setAnim("2_shoot_fwrd");
		break;
		

		case 225:
		case 315:
			scr_skeleton_animation_setAnim("2_shoot_diagdown");
		break;
		
		case 270:
			scr_skeleton_animation_setAnim("2_shoot_down");
		break;
		
	}
	with(bullet)
	{
		motion_set(angle,12);
	}
}

if enemy_var_shots > 1
{
enemy_var_shots--;
alarm[3] = 20;
}
else
{
alarm[3] = 90;
enemy_var_shots = 3
}