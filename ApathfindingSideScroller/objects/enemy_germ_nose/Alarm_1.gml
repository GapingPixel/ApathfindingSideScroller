/// @description Patrol Alarm
if enemy_var_patrol == true
{
    switch(enemy_behavior)
    {
        case enemy_PATROL:
            skeleton_animation_set("0_idle");
            alarm[1] = choose(240,300);
			enemy_behavior = enemy_IDLE;
        break;
        
        
        case enemy_IDLE:
            skeleton_animation_set("1_walk");
			image_speed = 0.5;
            alarm[1] = choose(160,240);
            enemy_behavior = enemy_PATROL;
        break;
    }
}

