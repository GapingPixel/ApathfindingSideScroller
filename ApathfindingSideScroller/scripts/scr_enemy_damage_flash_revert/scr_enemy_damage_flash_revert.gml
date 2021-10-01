function scr_enemy_damage_flash_revert() {
	//reverts color blend to normal after being hit and revery hitstun if set to it
	enemy_hit_flash = false;
	image_blend = c_white;

	switch(enemy_state)
	{
		case enemyState.HITSTUN:
		enemy_state = enemyState.NORMAL;
		image_speed = enemy_current_image_speed;
		vx = enemy_current_vx;
		vy = enemy_current_vy;
		break;
	}


	if timeline_index != 0
	{
		if timeline_running == false
		timeline_running = true;
	}


}
