/// @description Patrol Alarm
if enemy_var_patrol && !enemy_var_skate
{
    switch(enemy_behavior)
    {
        case enemy_PATROL:
            skeleton_animation_set("0_idle");
            alarm[1] = choose(180,300);
			image_speed = 0.5;
			enemy_behavior = enemy_IDLE;
        break;
        
        
        case enemy_IDLE:
            skeleton_animation_set("1_walk");
            alarm[1] = choose(180,300);
			image_speed = 1;
            enemy_behavior = enemy_PATROL;
        break;
    }
}

