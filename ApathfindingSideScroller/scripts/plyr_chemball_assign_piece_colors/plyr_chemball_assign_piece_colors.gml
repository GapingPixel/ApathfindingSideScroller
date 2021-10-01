/// @description Script handles assigning of chemical ball piece color
function plyr_chemball_assign_piece_colors(player_id) {
	/*
	source
	@param plyr

	*/
	chemball_col1 = 0;//color of piece 1
	chemball_col2 = 0;//piece 2
	chemball_alph1 = 1;//alpha of piece 1
	chemball_alph2 = 1;//piece 2
	
	var mix = global.player_active_mixture[player_id]
	
	var slot1 = global.player_weapon_slot[player_id][mix][0];
	var slot2 = global.player_weapon_slot[player_id][mix][1];

#region//Piece 1 based on Slot 1
	switch(slot1)
	{
	case "null":
	    chemball_col1 = c_dkgray;
	    chemball_alph1 = 0.5;
	break;

	case "h":
	    chemball_col1 = c_orange;
	break;

	case "na":
	    chemball_col1 = c_white;
	break;

	case "k":
	    chemball_col1 = make_color_rgb(255,255,0);
	break;

	case "cs":
	case "ba":
	    chemball_col1 = make_color_rgb(180,180,0);
	break;

	case "ho":
	    chemball_col1 = make_color_rgb(0,180,0);
	break;

	case "c":
	    chemball_col1 = make_color_rgb(255,175,175);
	break;

	case "n":
	    chemball_col1 = make_color_rgb(100,100,255);
	break;

	case "o":
	    chemball_col1 = make_color_rgb(0,255,255);
	break;

	case "f":
	    chemball_col1 = make_color_rgb(255,0,0);
	break;

	case "cl":
	    chemball_col1 = make_color_rgb(0,255,0);
	break;

	case "br":
	    chemball_col1 = make_color_rgb(128,0,0);
	break;

	case "i":
	    chemball_col1 = make_color_rgb(200,128,200);
	break;

	}
#endregion


#region//Piece 2 based on Slot 2
	switch(slot2)
	{
	case "null":
	    chemball_col2 = c_dkgray;
	    chemball_alph2 = 0.5;
	break;

	case "h":
	    chemball_col2 = c_orange;
	break;

	case "na":
	    chemball_col2 = c_white;
	break;

	case "k":
	    chemball_col2 = make_color_rgb(255,255,0);
	break;

	case "cs":
	case "ba":
	    chemball_col2 = make_color_rgb(180,180,0);
	break;

	case "ho":
	    chemball_col2 = make_color_rgb(0,180,0);
	break;

	case "c":
	    chemball_col2 = make_color_rgb(255,175,175);
	break;

	case "n":
	    chemball_col2 = make_color_rgb(100,100,255);
	break;

	case "o":
	    chemball_col2 = make_color_rgb(0,255,255);
	break;

	case "f":
	    chemball_col2 = make_color_rgb(255,0,0);
	break;

	case "cl":
	    chemball_col2 = make_color_rgb(0,255,0);
	break;

	case "br":
	    chemball_col2 = make_color_rgb(128,0,0);
	break;

	case "i":
	    chemball_col2 = make_color_rgb(200,128,200);
	break;

	}
#endregion



}
