//Clear
 
var cent_x = global.cam_x + (global.cam_width/2);
var cent_y = global.cam_y + (global.cam_height/2);

x = cent_x;
y = cent_y;

alarm[0] = 90;


/*fade_music = 0.1 * master_vol_music;

master_vol_music = clamp(master_vol_music - fade_music,0,master_vol_music);*/
audio_group_stop_all(audiogroup_default);
//audio_play_sound(msc_boss_clear,0,0);
