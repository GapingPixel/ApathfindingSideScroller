/// @description End gatling gun firing
if enemy_hp > 0
{
scr_skeleton_animation_setAnim("0_idle");
image_speed = 0.75;
enemy_behavior = enemy_IDLE;
alarm[1] = 60;
}


