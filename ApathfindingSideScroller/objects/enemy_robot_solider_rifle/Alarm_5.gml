/// @description Run or Stop Alarm
/// @description Patrol Alarm

switch(enemy_behavior)
{
    case enemy_RUN:
        skeleton_animation_set("4_land");
		enemy_behavior = enemy_IDLE;
    break;
        
        
    case enemy_IDLE:
        skeleton_animation_set("1_run");
        enemy_behavior = enemy_RUN;
    break;
}
