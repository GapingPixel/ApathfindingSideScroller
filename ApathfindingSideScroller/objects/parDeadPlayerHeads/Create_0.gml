/// @description Initialize
image_speed = 0;
image_yscale = 3

///For Controller Vibration and player indication; 0 for player 1 and 1 for player 2
DeadPlayerHeads_var_pCon = 0;
DeadPlayerHeads_var_plyr_id = 0; //Determines character head and alt color
//For spinning animation
DeadPlayerHeads_var_img_ang = 0;
alarm[1] = 5;

global.counter_death += 1; //increment death counter
global.raw_death_count++;
if global.player_count > 0 
    global.player_count -=1;



particle_scr_plyr_dmg();
particle_scr_plyr_death();
part_particles_create(global.parsys,x,y,part_var_plyr_dmgburst,100);
part_particles_create(global.parsys,x,y,part_var_plyr_death_smoke_big,20);
part_particles_create(global.parsys,x,y,part_var_plyr_death_smoke_small,40);
part_particles_create(global.parsys,x,y,part_var_plyr_death_bolts,15);
part_particles_create(global.parsys,x,y,part_var_plyr_death_boom_sphere,1);
part_particles_create(global.parsys,x,y,part_var_plyr_death_boom_spikes,16);
part_particles_create(global.parsys,x,y,part_var_plyr_death_boom_strips,8);
part_particles_create(global.parsys,x,y,part_var_plyr_death_stars,15);

   
if image_xscale = 1
motion_set(45,random_range(6,7));
else
motion_set(135,random_range(6,7));

alarm[0] = 35;

with(Camera)
    uc_shake(10);

audio_sound_pitch(snd_plyr_death,choose(0.8,0.9,1,1.1,1.2));
audio_play_sound(snd_plyr_death,0,0);

audio_play_sound(snd_plyr_death_flair,0,0);

//Check if no players are active to initiate game over
scr_death_check();