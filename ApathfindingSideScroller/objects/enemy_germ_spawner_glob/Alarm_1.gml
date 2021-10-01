/// @description Shoot Alarm

//Check List

if spawn_count < spawn_limit
{

scr_play_sound(snd_common_organic_blob_shoot_2,0,0.8,1.2)
image_speed = 0.5;
scr_skeleton_animation_setAnim("blob_shoot")
alarm[2] = 30;//Actual shot
spawn_count++;
}
else
    spawn_count = 0;


