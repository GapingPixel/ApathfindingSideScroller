/// @description Chem Ball State 
/*
string
held
throw
return
*/

event_inherited();

audio_play_sound(snd_plyr_chemball_create,0,false);
plyr_chemball_assign_type(0);
plyr_chemball_assign_piece_colors(0);

bullet_id = 0;

//Particles

particle_scr_plyr_chemball_pieces();


part_particles_create(global.parsys,x,y-20,part_var_chemball_impact_1,30);
part_particles_create(global.parsys,x,y-20,part_var_chemball_impact_2,30);
/* */
/*  */
