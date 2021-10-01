/// @description Shoot Vertical
if enemy_hp > 0 && enemy_behavior = enemy_IDLE
{
    scr_skeleton_animation_setAnim("5_shoot_down");
    ///Shoot Timeline
	action_timeline_set(enemyTL_slime_tube_shoot_vertical,0,0,0);
	enemy_behavior = enemy_ATTACK_2;
}

