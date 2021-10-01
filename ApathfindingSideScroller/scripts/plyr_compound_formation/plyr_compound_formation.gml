/// @description Compound Developer Script
function plyr_compound_formation(plyr_id, plyr_obj) {
	
	#region Damage Type
	var type_Explosive = 0;
	var type_Fire = 1;
	var type_Ice = 2;
	var type_Salt = 3;
	var type_Corrosive = 4;
	// 5 and 6 are extractor and regular element damage
	var type_Metal = 7;
	//8 is Electric
	var type_Water = 9;
	#endregion

	var mix_id = global.player_active_mixture[plyr_id]
	var slot_1 = global.player_weapon_slot[plyr_id][mix_id][0];
	var slot_2 = global.player_weapon_slot[plyr_id][mix_id][1];
	var compName;
	
	///Set string value of "global.comp" 
	switch(slot_1)//Takes first element then second element
	{
    #region//Hydrogen
	    case "h":
	        switch(slot_2)//Second element
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "H2";break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "HNa"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "HK";  break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "H2Ba"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "HoH3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CH4"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "H3N"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "H2O"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "HF"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "HCl"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "HBr"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "HI"; break;
	        }
	    break;//End of Hydrogen
	#endregion
    
    #region//Sodium
	    case "na":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "HNa"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "Na2"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "NaK"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "Na2Ba"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "HoNa3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CNa4"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "Na3N"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "Na2O"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "NaF"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "NaCl"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "NaBr"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "NaI"; break;
	        }
	    break;//End of Sodium
	#endregion
    
    #region//Potassium
	    case "k":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "HK"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "NaK"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "K2"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "K2Ba"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "HoK3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CK4"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "K3N"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "K2O"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "KF"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "KCl"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "KBr"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "KI"; break;
	        }
	    break;//End of Potassium
    #endregion
	
	 #region//Barium
	    case "ba":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "H2Ba"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "Na2Ba"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "K2Ba"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "Ba2"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "Ho2Ba3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CBa2"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "Ba3N2"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "BaO"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "BaF2"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "BaCl2"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "BaBr2"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "BaI2"; break;
	        }
	    break;//End of Barium
	#endregion
    
    #region//Holmium
	    case "ho":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "HoH3"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "HoNa3"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "HoK3"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "Ho2Ba3"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "Ho2"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "C2Ho2"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "HoN"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "Ho2O3"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "HoF3"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "HoCl3"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "HoBr3"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "HoI3"; break;
	        }
	    break;//End of Holmium
	#endregion
    
    #region//Carbon
	    case "c":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "CH4"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "CNa4"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "CK4"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "CBa2"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "C2Ho2"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "C2"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "C2N2"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "CO2"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "CF4"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "CCl4"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "CBr4"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "CI4"; break;
	        }
	    break;//End of Carbon
	#endregion
    
    #region//Nitrogen
	    case "n":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "H3N"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "Na3N"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "K3N"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "Ba3N2"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "HoN"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "C2N2"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "N2"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "N2O3"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "F3N"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "Cl3N"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "Br3N"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "I3N"; break;
	        }
	    break;//End of Nitrogen
	#endregion
    
    #region//Oxygen
	    case "o":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "H2O"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "Na2O"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "K2O"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "BaO"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "Ho2O3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CO2"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "N2O3"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "O2"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "F2O"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "Cl2O"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "Br2O"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "I2O"; break;
	        }
	    break;//End of Oxygen
	#endregion
    
    #region//Fluorine
	    case "f":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "HF"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "NaF"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "KF"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "BaF2"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "HoF3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CF4"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "F3N"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "F2O"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "F2"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "FCl"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "FBr"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "FI"; break;
	        }
	    break;//End of Fluorine
	#endregion
    
    #region//Chlorine
	    case "cl":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "HCl"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "NaCl"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "KCl"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "BaCl2"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "HoCl3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CCl4"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "Cl3N"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "Cl2O"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "FCl"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "Cl2"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "ClBr"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "ClI"; break;
	        }
	    break;//End of Chlorine
	#endregion

    #region//Bromine
	    case "br":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "HBr"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "NaBr"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "KBr"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "BaBr2"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "HoBr3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CBr4"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "Br3N"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "Br2O"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "FBr"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "ClBr"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "Br2"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "BrI"; break;
	        }
	    break;//End of Bromine
	#endregion
    
    #region//Iodine
	    case "i":
	        switch(slot_2)
	        {
	            case "h": global.player_weapon_slot[plyr_id][mix_id][2] = "HI"; break;
	            case "na": global.player_weapon_slot[plyr_id][mix_id][2] = "NaI"; break;
	            case "k": global.player_weapon_slot[plyr_id][mix_id][2] = "KI"; break;
	            case "ba": global.player_weapon_slot[plyr_id][mix_id][2] = "BaI2"; break;
	            case "ho": global.player_weapon_slot[plyr_id][mix_id][2] = "HoI3"; break;
	            case "c": global.player_weapon_slot[plyr_id][mix_id][2] = "CI4"; break;
	            case "n": global.player_weapon_slot[plyr_id][mix_id][2] = "I3N"; break;
	            case "o": global.player_weapon_slot[plyr_id][mix_id][2] = "I2O"; break;
	            case "f": global.player_weapon_slot[plyr_id][mix_id][2] = "FI"; break;
	            case "cl": global.player_weapon_slot[plyr_id][mix_id][2] = "ClI"; break;
	            case "br": global.player_weapon_slot[plyr_id][mix_id][2] = "BrI"; break;
	            case "i": global.player_weapon_slot[plyr_id][mix_id][2] = "I2"; break;
	        }
	    break;//End of Iodine
	#endregion
	}



	//Set compound damage type(3) and max ammo (5)
	
	switch(global.player_weapon_slot[plyr_id][mix_id][2])
	{
	
	#region//Hydrogen Combos
		case "H2":
		default:
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 100;
		compName = 201;
		break;
	
		case "HNa":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 213;
		break;
	
		case "HK":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 150;
		compName = 214;
		break;
	
		case "H2Ba":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 215;
		break;
	
		case "HoH3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 60;
		compName = 216;
		break;
	
		case "CH4":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 217;
		break;
	
		case "H3N":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 100;
		compName = 218;
		break;
	
		case "H2O":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Water;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 219;
		break;
	
		case "HF":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 220;
		break;
	
		case "HCl":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 221
		break;
	
		case "HBr":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 222;
		break;
	
		case "HI":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 223;
		break;
	#endregion
	
	#region//Sodium Combos
		case "Na2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 25;
		compName = 202;
		break;
	
		case "NaK":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 80;
		compName = 224;
		break;
	
		case "Na2Ba":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 225;
		break;
	
		case "HoNa3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 226;
		break;
	
		case "CNa4":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 25;
		compName = 227;
		break;
	
		case "Na3N":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 25;
		compName = 228;
		break;
	
		case "Na2O":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 229;
		break;
	
		case "NaF":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 230;
		break;
	
		case "NaCl":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 231
		break;
	
		case "NaBr":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 232;
		break;
	
		case "NaI":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 233;
		break;
	#endregion
	
	#region//Potassium Combos
		case "K2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 200;
		compName = 203;
		break;
	
		case "K2Ba":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 150;
		compName = 234;
		break;
	
		case "HoK3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 200;
		compName = 235;
		break;
	
		case "CK4":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 236;
		break;
	
		case "K3N":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 80;
		compName = 237;
		break;
	
		case "K2O":
		global.player_weapon_slot[plyr_id][mix_id][6] = 3;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 3;
		compName = 238;
		break;
	
		case "KF":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 80;
		compName = 239;
		break;
	
		case "KCl":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 80;
		compName = 240;
		break;
	
		case "KBr":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 90;
		compName = 241;
		break;
	
		case "KI":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 200;
		compName = 242;
		break;
	#endregion
	
	#region//Barium Combos
		case "Ba2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 204;
		break;
	
		case "Ho2Ba3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 243;
		break;
	
		case "CBa2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 244;
		break;
	
		case "Ba3N2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 245;
		break;
	
		case "BaO":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		  
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 246;
		break;
	
		case "BaF2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 247;
		break;
	
		case "BaCl2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 248;
		break;
	
		case "BaBr2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 249;
		break;
	
		case "BaI2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 250;
		break;
	#endregion
	
	#region//Holmium Combos
		case "Ho2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 205;
		break;
	
		case "C2Ho2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Metal;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 251;
		break;
	
		case "HoN":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 252;
		break;
	
		case "Ho2O3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 253;
		break;
	
		case "HoF3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 3;
		compName = 254;
		break;
	
		case "HoCl3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 255;
		break;
	
		case "HoBr3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 60;
		compName = 256;
		break;
	
		case "HoI3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Salt;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 257;
		break;
	#endregion
	
	#region//Carbon Combos
		case "C2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 25;
		compName = 206;
		break;
	
		case "C2N2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 258;
		break;
	
		case "CO2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 259;
		break;
	
		case "CF4":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 100;
		compName = 260;
		break;
	
		case "CCl4":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 6;
		compName = 261;
		break;
	
		case "CBr4":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive
		global.player_weapon_slot[plyr_id][ mix_id][5] = 5;
		compName = 262;
		break;
	
		case "CI4":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 100;
		compName = 263;
		break;
	#endregion
	
	#region//Nitrogen Combos
		case "N2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 500;
		compName = 207;
		break;
	
		case "N2O3":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 264;
		break;
	
		case "F3N":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive; 
		global.player_weapon_slot[plyr_id][ mix_id][5] = 500;
		compName = 265;
		break;
	
		case "Cl3N":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 300;
		compName = 266;
		break;
	
		case "Br3N":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 3;
		compName = 267;
		break;
	
		case "I3N":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 2;
		compName = 268;
		break;
	#endregion
	
	#region//Oxygen Combos
		case "O2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Ice;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 208;
		break;
	
		case "F2O":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 269;
		break;
	
		case "Cl2O":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 270;
		break;
	
		case "Br2O":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 271;
		break;
	
		case "I2O":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 20;
		compName = 272;
		break;
	#endregion
	
	#region//Fluorine Combos
		case "F2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Explosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 209;
		break;
	
		case "FCl":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 273;
		break;
	
		case "FBr":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 274;
		break;
	
		case "FI":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Fire;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 275;
		break;
	#endregion
	
	#region//Chlorine Combos
		case "Cl2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 210;
		break;
	
		case "ClBr":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 276;
		break;
	
		case "ClI":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 40;
		compName = 277
		break;
	#endregion
	
	#region//Bromine Combos
		case "Br2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 60;
		compName = 211;
		break;
	
		case "BrI":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 30;
		compName = 278;
		break;
	#endregion
	
	#region//Iodine Combos
		case "I2":
		global.player_weapon_slot[plyr_id][ mix_id][3] = type_Corrosive;
		global.player_weapon_slot[plyr_id][ mix_id][5] = 50;
		compName = 212;
		break;
	#endregion
	}


	///Run Error Script to handle Requirements
	//plyr_compound_check(plyr_id);

	if (global.player_weapon_slot[plyr_id][mix_id][2] != "null")//Runthrough is complete
	{
		audio_play_sound(snd_UI_HUD_compound_get,0,false);

		with(plyr_obj)//Draw Effect
		{
		    chem_alpha = 1;
		    chem_grow = 0.8;
			cool_down_shoot = 0;
		}
		
		var compInst = instance_create_depth(plyr_obj.x,plyr_obj.y,plyr_obj.depth - 1,obj_effect_compoundString)
		with(compInst)
		{
			effect_comp_string = compName;
			effect_parent = plyr_obj;
		}
		
		//Set Ammo to Max
		global.player_weapon_slot[plyr_id][ mix_id][4] = global.player_weapon_slot[plyr_id][ mix_id][5];
		
		global.player_active_weapon_slot[plyr_id] = 2;
		
	}
	else
	{
	//play fail sound here
	}



}
