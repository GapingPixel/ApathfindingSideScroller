/// @description Patrol Alarm
if enemy_var_patrol
{
    switch(enemy_behavior)
    {
        case enemy_PATROL:
            scr_skeleton_animation_setAnim("0_idle");
            alarm[1] = choose(100,160);
			enemy_behavior = enemy_IDLE;
        break;
        
        
        case enemy_IDLE:
            scr_skeleton_animation_setAnim("1_move");
			image_speed = 0.5;
            alarm[1] = choose(80,160);
            enemy_behavior = enemy_PATROL;
        break;
    }
}

