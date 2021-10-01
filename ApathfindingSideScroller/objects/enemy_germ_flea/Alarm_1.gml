/// @description Hop alarm
if enemy_state = enemyState.NORMAL
{
skeleton_animation_set("1_jump");
image_speed = 1.5;
y -= 2
vy -= jumpHeight;
scr_play_sound(snd_common_cartoony_boingy_jump,0,1.3,1.7);
}


