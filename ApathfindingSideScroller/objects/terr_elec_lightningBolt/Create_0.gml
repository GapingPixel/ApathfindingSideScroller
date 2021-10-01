/// @description Insert description here
// You can write your code in this editor
event_inherited();
uc_flash();
uc_bounce(10);
scr_play_sound(snd_common_electric_explosion_1,0,1,1.5);
scr_play_sound(snd_common_electric_loop_hard,0,1,1.05);

image_angle = 180;
image_yscale = 8;
alarm[3] = 180;