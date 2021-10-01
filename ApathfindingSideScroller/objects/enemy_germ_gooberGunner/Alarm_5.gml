/// @description Run or Stop Alarm
/// @description Patrol Alarm

switch(enemy_behavior)
{
    case enemy_RUN:
        scr_skeleton_animation_setAnim("4_land");
		enemy_behavior = enemy_IDLE;
    break;
        
        
    case enemy_IDLE:
        scr_skeleton_animation_setAnim("1_run");
        enemy_behavior = enemy_RUN;
    break;
}
