event_inherited();
image_blend = make_color_rgb(115,255,255);
bullet_data[0] = 15;

audio_sound_pitch(snd_plyr_extract_shoot,random_range(0.9,1.1));
audio_play_sound(snd_plyr_extract_shoot,0,false);


particle_scr_bullet_extract(c_blue,c_aqua,c_white);

