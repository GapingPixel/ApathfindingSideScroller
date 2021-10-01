function plyr_atom_collect(plyr_id, elem_string, plyr_obj) {

	///Element collection script
	/*
	arg0 = elem_slot1
	arg1 = elem_slot2
	arg2 = active_elem_slot and mixture
	arg3 = elem string to be stored
	arg4 = obj_plyrx
	arg5 = comp and elem switch (to handle case when player has other slot active)
	*/

	audio_play_sound(snd_common_collectable_atom,0,false);

	
	
	var mixture = global.player_active_mixture[plyr_id];
	
	var slot1 = global.player_weapon_slot[plyr_id][mixture][0];
	var slot2 = global.player_weapon_slot[plyr_id][mixture][1];
	

	var mixture = global.player_active_mixture[plyr_id];
	

	if slot1 = "null" //slot 1
	    {
	    global.player_weapon_slot[plyr_id][mixture][0] = elem_string;
	    global.player_active_weapon_slot[plyr_id] = 0;
		
		plyr_obj.cool_down_shoot = 0;
		
	    }
	else if slot2 = "null" //slot 2
	    {
	    global.player_weapon_slot[plyr_id][mixture][1] = elem_string;
	    global.player_active_weapon_slot[plyr_id] = 1;
		
		plyr_obj.cool_down_shoot = 0;
	
		//Form compound if we can
	    plyr_compound_formation( 
		plyr_id, 
		plyr_obj);
	    }
	

	//Replenish ammo when we have a chemical
	var MaxAmmo = global.player_weapon_slot[plyr_id][mixture][5];
		if (global.player_weapon_slot[plyr_id][mixture][2] != "null")
		{
		if global.player_weapon_slot[plyr_id][mixture][4] < MaxAmmo
		global.player_weapon_slot[plyr_id][mixture][4] += ceil(global.stat_energy_extract[plyr_id] * MaxAmmo);
		}

 
	//For scoring 
	///global.scoring_e_extracts += 1; 
   
	  //particles
	part_particles_create(global.parsys,plyr_obj.x,plyr_obj.y,part_var_collectables_atom_collect,30);
    
		//destroy the Atom
	instance_destroy();





}
