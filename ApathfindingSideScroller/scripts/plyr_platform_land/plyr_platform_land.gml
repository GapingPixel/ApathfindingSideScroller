/// @description Script for Effects and Animation when player lands on platforms
function plyr_platform_land(argument0) {

	    plyr_anim_halt(argument0);
    
		if lqd = 0 && slqd = 0
		{
	    audio_sound_pitch(snd_plyr_land,random_range(1,1.5));
	    audio_play_sound(snd_plyr_land,0,0);
		part_type_direction(part_var_plyr_smoke_poof,0,0,0,0);
		part_type_gravity(part_var_plyr_smoke_poof,0.1,90);
		part_type_life(part_var_plyr_smoke_poof,10,30);
	    part_particles_create(global.parsys,x,y+sprite_height/3,part_var_plyr_smoke_poof,5);
		part_type_direction(part_var_plyr_smoke_poof,180,180,0,0);
		part_type_gravity(part_var_plyr_smoke_poof,0.1,90);
		part_type_life(part_var_plyr_smoke_poof,10,30);
	    part_particles_create(global.parsys,x,y+sprite_height/3,part_var_plyr_smoke_poof,5);
		part_type_color1(part_var_plyr_smoke_ring,c_white);
	    part_particles_create(global.parsys,x,y+sprite_height/3,part_var_plyr_smoke_ring,1);
		}
		else
		{
		part_type_direction(part_var_plyr_land_bubbles,0,0,0,0);
			repeat(5)
			{
			part_type_gravity(part_var_plyr_land_bubbles,random_range(0.1,0.25),90);
		    part_particles_create(global.parsys,x,y+sprite_height/3,part_var_plyr_land_bubbles,1);
			}
		part_type_direction(part_var_plyr_land_bubbles,180,180,0,0);
			repeat(5)
			{
			part_type_gravity(part_var_plyr_land_bubbles,random_range(0.1,0.25),90);
		    part_particles_create(global.parsys,x,y+sprite_height/3,part_var_plyr_land_bubbles,1);
			}
		}
	
		//Stretch
		stretch_x = 1.5;
		stretch_y = 1;
	
		//Cancel Parry Buffer and reset coyote jump frame
		var_parry_buffer = 0;



}
