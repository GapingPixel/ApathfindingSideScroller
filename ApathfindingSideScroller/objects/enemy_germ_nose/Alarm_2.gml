/// @description Shoot Alarm
if enemy_hp > 0
{
image_speed = 1;
enemy_behavior = enemy_ATTACK_1;
scr_skeleton_animation_setAnim("3_shoot");
action_timeline_set(enemyTL_slime_nose_shoot,0,0,0)
}

