/// @description Shoot Alarm
if enemy_behavior != enemy_KO and enemy_state = enemyState.NORMAL
{
	
	//var face = facing;
	/*for(var i = 0; i < 8; i++)
	{
	part_type_direction(part_var_enemy_robot_shoot_bullet_outer,i*45,0,0,0);
	part_particles_create(global.parsys,
	enemy_var_gun_point_x,
	enemy_var_gun_point_y,
	part_var_enemy_robot_shoot_bullet_outer,1);
	}*/
	
	/*part_particles_create(global.parsys,
	enemy_var_gun_point_x,
	enemy_var_gun_point_y,
	part_var_enemy_robot_shoot_burst_inner,3);*/
	
	var bullet = instance_create_depth(enemy_var_gun_point_x,enemy_var_gun_point_y,depth-1,enemy_bullet_germ_aerial_volley)
	var angle = enemy_var_aim_angle
	//Animation
	switch(angle)
	{
		case 0:
		case 180:
			scr_skeleton_animation_setAnim("0_idle_aim_fwrd_fire");
		break;
		
		case 45:
		case 135:
			scr_skeleton_animation_setAnim("0_idle_aim_diagup_fire");
		break;
		
		case 225:
		case 315:
			scr_skeleton_animation_setAnim("0_idle_aim_diagdown_fire");
		break;
		
	}
	with(bullet)
	{
		motion_set(angle,12);
	}
}
alarm[4] = 60;