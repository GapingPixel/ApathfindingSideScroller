/// @description Throw Grenade
if enemy_state = enemyState.NORMAL
{
enemy_behavior = enemy_ATTACK_1;
scr_skeleton_animation_setAnim("6_throw");
dt = 0;
action_timeline_set(enemyTL_robot_soldier_grenade_throw,0,0,0);
}
