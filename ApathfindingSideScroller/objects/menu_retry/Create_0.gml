//Our menu options
event_inherited();
menu[0] = scr_get_string(24);
menu[1] = scr_get_string(23);
menu_spacing = 64;

//fade_snd = master_vol_sfx * 0.1;

//master_vol_sfx = clamp(master_vol_sfx - fade_snd,0,master_vol_sfx);

menu_enable = false; //enable after time passes
alarm[0] = 30;



//Fade SFX
/*
audio_group_set_gain(audiogroup_sfx_player,master_vol_sfx/6,800);//Player

audio_group_set_gain(audiogroup_sfx_enemy,master_vol_sfx/6,800);//Enemies

audio_group_set_gain(audiogroup_sfx_boss,master_vol_sfx/6,800);//Bosses

audio_group_set_gain(audiogroup_sfx_bullets,master_vol_sfx/6,800);//Bullets

audio_group_set_gain(audiogroup_sfx_world,master_vol_sfx/6,800);//Environment

audio_group_set_gain(audiogroup_sfx_collect,master_vol_sfx/6,800);//Collects and Triggers

audio_group_set_gain(audiogroup_default,master_vol_sfx/6,800);//Default
*/



