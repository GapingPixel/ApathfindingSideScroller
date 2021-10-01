/// @description Runs through player variables to see if player has required assets for chemical
function plyr_compound_check(plyr_id) {

	var error_check;
	error_check = false;//variable thrown when required materials aren't available

	var di_bonder = global.stat_bond_di[plyr_id];
	var tri_bonder = global.stat_bond_tri[plyr_id];
	var tetra_bonder = global.stat_bond_tet[plyr_id];
	var alloy_bonder = global.stat_bond_all[plyr_id];
	var mixture = global.player_active_mixture[plyr_id];
	
	switch(global.player_weapon_slot[plyr_id][mixture][2])
	{
	    //Di
		case "H2":
	    case "Na2":
	    case "K2":
	    case "Cs2":
		case "Ba2":
		case "Ho2":
		case "C2":
		case "N2":
	    case "O2":
		case "F2":
	    case "Cl2":
	    case "Br2":
	    case "I2":
		case "H2O":
		case "C2N2":
		case "C2Ho2":
		case "CBa2":
		case "CO2":
		case "Na2O":
		case "K2O":
		case "Cs2O":
		case "F2O":
	    case "Cl2O":
	    case "Br2O":
	    case "I2O":
			if di_bonder = 0
				error_check = true;
	    break;
	
		//Alloy and Di
		case "Na2Ba":
	    case "K2Ba":
			if alloy_bonder = 0 && di_bonder = 0
				error_check = true;
	    break;
	
		//Alloy
		case "NaK":
	    case "NaCs":
		case "KCs":
			if alloy_bonder = 0
				error_check = true;
	    break;
	
		//Tri
		case "H3N":
		case "HoH3":
		case "Na3N":
		case "K3N":
		case "Cs3N":
		case "HoF3":
	    case "HoCl3":
	    case "HoBr3":
	    case "HoI3":
		case "F3N":
	    case "Cl3N":
	    case "Br3N":
	    case "I3N":
			if tri_bonder = 0
				error_check = true;
	    break;
	
		//Alloy and Tri
		case "HoNa3":
		case "HoK3":
		case "HoCs3":
			if alloy_bonder = 0 && tri_bonder = 0
				error_check = true;
	    break;
	
		//Tri and Di
		case "N2O3":
		case "Ho2O3":
			if di_bonder = 0 && tri_bonder = 0
				error_check = true;
	    break;
		
		//Alloy Tri and Di
		case "Ho2Ba3":
			if di_bonder = 0 && tri_bonder = 0 && alloy_bonder = 0
				error_check = true;
	    break;
	
		//Tetra
		case "CH4":
		case "CNa4":
		case "CK4":
		case "CCs4":
		case "CF4":
	    case "CCl4":
	    case "CBr4":
	    case "CI4":
			if tetra_bonder = 0
				error_check = true;
	    break;

	}

	//Error taken
	if (error_check)
	{
	    global.player_weapon_slot[plyr_id][mixture][2] = "null";
	}




}
