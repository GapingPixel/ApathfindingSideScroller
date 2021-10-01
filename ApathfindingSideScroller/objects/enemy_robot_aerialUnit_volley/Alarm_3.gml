/// @description Shoot
var anim = skeleton_animation_get();

if anim != "1_turn" && enemy_behavior = enemy_IDLE && enemy_state = enemyState.NORMAL
{
	image_speed = 0.75;
	action_timeline_set(enemyTL_robot_aerialUnit_volley,0,0,0)
	switch(irandom(1))
	{
		case 0://Single
		scr_skeleton_animation_setAnim("2_shoot_volley_single");
		break;
		
		case 1://Double
		scr_skeleton_animation_setAnim("2_shoot_volley_double");
		break;
	}
}