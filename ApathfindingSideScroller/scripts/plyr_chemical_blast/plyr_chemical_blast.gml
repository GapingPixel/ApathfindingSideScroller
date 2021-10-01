function plyr_chemical_blast(player_id,player_obj) {
	//Chemical Blast script key
	/*
	*/

	var inst; //for single
	var inst_spr; //for spread
	var dpth = -1;
	var i;//for loop
	var c_pink = make_color_rgb(255,255,128);//PINK for Carbon
	var mixture = global.player_active_mixture[player_id];
	var typing = global.player_weapon_slot[player_id][mixture][3]
	

	audio_sound_pitch(snd_plyr_chem_blast,random_range(1,1.3));

	switch(global.player_chem_blast[player_id][0])
	{

		#region Mega Blast
			default:
			player_obj.var_chem_blast = 1;
			image_alpha = 0;
			audio_play_sound(snd_plyr_chem_blast,0,false);
			particle_scr_plyr_chemblast_heavy_colors(c_pink,c_orange);
			particle_scr_plyr_chemblast_heavy_create();
			inst = instance_create_depth(x + lengthdir_x(1*image_xscale,image_angle),
			y + lengthdir_y(1*image_xscale,image_angle),dpth,plyr_chemBlast_megaBlast);
			with(inst)
			{
			    plyr_chem_source_originator(player_id);
				particle_scr_bullet_chemical_ini();
			}
			player_obj.cool_down_chem_blast = 15;
			break;
		#endregion
		
		#region Plum
			case 1:
			player_obj.var_chem_blast = 1;
			image_alpha = 0;
			audio_play_sound(snd_plyr_chem_blast,0,false);
			particle_scr_plyr_chemblast_heavy_colors(c_pink,c_orange);
			particle_scr_plyr_chemblast_heavy_create();
			inst = instance_create_depth(x + lengthdir_x(1*image_xscale,image_angle),
			y + lengthdir_y(1*image_xscale,image_angle),dpth,plyr_chemBlast_plum);
			with(inst)
			{
			    plyr_chem_source_originator(player_id);
				particle_scr_bullet_chemical_ini();
			}
			player_obj.cool_down_chem_blast = 15;
			break;
		#endregion
	
		#region Octet Blast
			case 2:
			player_obj.var_chem_blast = 1;
			image_alpha = 0;
			audio_play_sound(snd_plyr_chem_blast,0,false);
			particle_scr_plyr_chemblast_heavy_colors(c_pink,c_orange);

			part_particles_create(global.parsys,
			x,
			y,
			e_burst_in,100);

			part_particles_create(global.parsys,
			x,
			y,
			e_burst_out,100);

			for(i = 0; i <= 360; i += 45)
			{
			inst_spr = instance_create_depth(x,
			y,
			dpth,plyr_chemBlast_octetBlast);   
	
			inst_spr.image_angle = i;
			
			with(inst_spr)
			{
				bullet_id = player_id;
				bullet_type = typing;
				particle_scr_bullet_chemical_ini();
			}
			
			}
			player_obj.cool_down_chem_blast = 15;
			break;
		#endregion

	}

	//Remove compound and elements when energy is zero
	global.player_chem_blast[player_id][2] -= 25;
	
	/*
	if global.player_chem_blast[player_id][2] <= 0
	{
	    plyr_flush_elements(argument0)
	}
	*/




}
