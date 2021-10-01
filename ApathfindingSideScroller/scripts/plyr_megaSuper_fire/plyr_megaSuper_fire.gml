// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plyr_megaSuper_fire(player_id){
//Creates super

	var inst; //for the instance
	
	var dpth = depth-1;
	var mixture = global.player_active_mixture[player_id];
	var typing = global.player_weapon_slot[player_id][mixture][3]
	
	audio_sound_pitch(snd_plyr_chem_blast,random_range(1,1.3));

	switch(global.player_chem_blast[player_id][1])
	{

		#region Bunsen Geyser
			case 1:
			scr_play_sound(snd_common_boss_defeat,0,2,2);
			inst = instance_create_depth(x + 90*image_xscale,
			y+50,dpth,plyr_megaSuper_1);
			
			inst.image_xscale = image_xscale;
			
			global.player_chem_blast[player_id][2] = 0;
			
			inst.bullet_parent = id;
			
			break;
		#endregion
		
		#region Barrier
			case 2:
			
			inst = instance_create_depth(x,
			y,dpth,plyr_megaSuper_2);
			
			inst.bullet_parent = id;
			break;
		#endregion
	
		

	}

	with(inst)
	{
	bullet_id = player_id;
	bullet_type = typing;
	}

}