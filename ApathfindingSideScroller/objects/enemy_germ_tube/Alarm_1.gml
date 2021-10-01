/// @description Shoot
if enemy_hp > 0 && enemy_behavior = enemy_IDLE
{
    scr_skeleton_animation_setAnim("4_shoot");
    ///Shoot Timeline
	action_timeline_set(enemyTL_slime_tube_shoot,0,0,0);
	enemy_behavior = enemy_ATTACK_1;
}

