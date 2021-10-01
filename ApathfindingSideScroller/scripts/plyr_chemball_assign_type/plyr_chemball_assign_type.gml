/// @description Script handles assigning of chemical ball's typing
function plyr_chemball_assign_type(player_id) {
	/*
	source
	arg0 comp[arg0]
	chemball_type
	0 Explosive
	1 Flame
	2 Cyro
	3 Salt
	4 Corrosive
	5 Extractor (ignore)
	6 NonSpecial
	7 Metal
	8 Electric (ignore)
	9 Water
	*/
	var mix_id = global.player_active_mixture[player_id]
	var slot1 = global.player_weapon_slot[player_id][mix_id][0];
	var slot2 = global.player_weapon_slot[player_id][mix_id][1];
	var comp = global.player_weapon_slot[player_id][mix_id][2];
	switch(comp)//Take compound variable
	{
	    case "null":
	    bullet_type = 6;
		#region//Assign Single Hold variable as object as long as there is an empty slot
		if slot2 = "null"
		{
	        switch(slot1)
	        {
	            case "h":
	            chemball_single_hold = atom_h;
	            break;
            
	            case "na":
	            chemball_single_hold = atom_na;
	            break;
            
	            case "k":
	            chemball_single_hold = atom_k;
	            break;
            
	            case "cs":
	            chemball_single_hold = atom_cs;
	            break;
				
				case "ba":
	            chemball_single_hold = atom_ba;
	            break;
            
	            case "ho":
	            chemball_single_hold = atom_ho;
	            break;
            
	            case "c":
	            chemball_single_hold = atom_c;
	            break;
            
	            case "n":
	            chemball_single_hold = atom_n;
	            break;
            
	            case "o":
	            chemball_single_hold = atom_o;
	            break;
            
	            case "f":
	            chemball_single_hold = atom_f;
	            break;
            
	            case "cl":
	            chemball_single_hold = atom_cl;
	            break;
            
	            case "br":
	            chemball_single_hold = atom_br;
	            break;
            
	            case "i":
	            chemball_single_hold = atom_i;
	            break;
            
	            default:
	            //empty to prevent error
				break;
	        }
		}
	#endregion
	    break;
    
		//Assign Damage Type depending on Compound form
		default:
			bullet_type = global.player_weapon_slot[player_id][mix_id][3];
		break;
	
    
	}




}
