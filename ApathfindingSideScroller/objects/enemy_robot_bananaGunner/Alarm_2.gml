/// @description Start up Firing; Starts Firing at the end of anim
if enemy_hp > 0
{
scr_skeleton_animation_setAnim("6_shoot_firing");
image_speed = 1;
enemy_behavior = enemy_IDLE;
}

