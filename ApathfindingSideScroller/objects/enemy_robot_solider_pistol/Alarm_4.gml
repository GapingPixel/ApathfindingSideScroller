/// @description Shoot Alarm
if enemy_behavior != enemy_KO and enemy_state = enemyState.NORMAL
{
	scr_skeleton_animation_setAnim("5_shoot_fire")
	var face = facing;

	var bullet = instance_create_depth(x+60*face,y-9,depth-1,enemy_bullet_robot)

	with(bullet)
	{
		motion_set(0,12*face);
	}
}