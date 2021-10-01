/// @description Bite Alarm

if enemy_behavior = enemy_IDLE
{
    scr_skeleton_animation_setAnim("2_bite");
	enemy_behavior = enemy_ATTACK_1;
    audio_play_sound(snd_enemy_slime_attack_bite,0,0);
    image_speed = 0.8
}

