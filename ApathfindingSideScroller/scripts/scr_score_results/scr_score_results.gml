/// @description Take results to get rank
function scr_score_results() {

	///Render results from play

#region///Point rally total

	global.scoring_points_total = 0;

	var TimeBonus = (180 - global.scoring_time); //Time Bonus
	//Tolly Time Bonus when under 3 minutes
	if global.scoring_time <= 180
	{
	global.scoring_points_total += 2500;//Time Bonus
	global.scoring_points_total += TimeBonus * 5;//Aditional Points
	}

	//Tolly Elements Extracted
	if global.scoring_e_extracts > 5
		global.scoring_e_extracts = 5;
	
	global.scoring_points_total += global.scoring_e_extracts * 1000;

	//Tolly Special Chemical Blasts
	if global.scoring_c_blasts > 25
		global.scoring_c_blasts = 25;
	
	global.scoring_points_total += round(global.scoring_c_blasts * 100);

	//Tolly Hits Taken
	if global.scoring_hits > 20
		global.scoring_hits = 20

	global.scoring_points_total -= global.scoring_hits * 500;

	//Difficulty Bonus
	//if hard mode give 10 points extra

#endregion

	show_debug_message("time = " + string(global.scoring_time));
	global.stage_time[global.curr_world,global.curr_level] = global.scoring_time;
	show_debug_message("total points = " + string(global.scoring_points_total));

	/*
	If ever a player scores lower than 30 for odd reasons, 
	perminately set point total to 1 for the sake of completion and credit for event flags to trigger
	*/

	if global.scoring_points_total < 1
		global.scoring_points_total = 1;


	global.stage_points[global.curr_world,global.curr_level] = global.scoring_points_total;

#region//Grade Rank
	//Threshold
	/*
	S = 11000>
	A+ = x >= 10000
	A = 8000<x<9999
	A- = 7500<x<8999
	B+ = 6500<x<7499
	B = 5500<x<6499
	B- = 5000<x<5499
	C+ = 3500<x<4999
	C = 3000<x<3499
	C- = 2500<x<2999
	D+ = 2000<x<2499
	D = 1500<x<1999
	D- = x <= 1499
	*/
	//
	var S_thres, Aplus_thres, A_thres, Aminus_thres, Bplus_thres, B_thres, Bminus_thres,
	Cplus_thres, C_thres, Cminus_thres, Dplus_thres, D_thres, Dminus_thres;
	var stageScore = global.stage_points[global.curr_world,global.curr_level]

	S_thres = stageScore >= 11000;
	Aplus_thres = stageScore >= 10000 && stageScore < 11000;
	A_thres = stageScore >= 8000 && stageScore < 10000;
	Aminus_thres = stageScore >= 7500 && stageScore < 8000;
	Bplus_thres = stageScore >= 6500 && stageScore < 7500;
	B_thres = stageScore >= 5500 && stageScore < 6500;
	Bminus_thres = stageScore >= 5000 && stageScore < 5500;
	Cplus_thres = stageScore >= 3500 && stageScore < 5000;
	C_thres = stageScore >= 3000 && stageScore < 3500;
	Cminus_thres = stageScore >= 2500 && stageScore < 3000;
	Dplus_thres = stageScore >= 2000 && stageScore < 2500;
	D_thres = stageScore >= 1500 && stageScore < 2000;
	Dminus_thres = stageScore <= 1500;

	var stageRank = global.stage_rank[global.curr_world,global.curr_level]

		if S_thres
			stageRank = "S";
		else if Aplus_thres
			stageRank = "A+";
		else if A_thres
			stageRank = "A";
		else if Aminus_thres
			stageRank = "A-";
		else if Bplus_thres
			stageRank = "B+";
		else if B_thres
			stageRank = "B";
		else if Bminus_thres
			stageRank = "B-";
		else if Cplus_thres
			stageRank = "C+";
		else if C_thres
			stageRank = "C";
		else if Cminus_thres
			stageRank = "C-";
		else if Dplus_thres
			stageRank = "D+";
		else if D_thres
			stageRank = "D";
		else if Dminus_thres
			stageRank = "D-";

	show_debug_message(stageRank);
#endregion

	//Save Records
	if global.scoring_points_total > global.stage_points[global.curr_world,global.curr_level]
	global.stage_points[global.curr_world,global.curr_level] = global.scoring_points_total;

	if global.stage_time[global.curr_world,global.curr_level] <= global.scoring_time
	global.stage_time[global.curr_world,global.curr_level] = global.scoring_time;

	global.stage_rank[global.curr_world,global.curr_level] = stageRank;

	//Pacifist Rank, for Stages Only
	if global.scoring_no_kill
	{
	    stageRank = "P";
		show_debug_message("pacifist");
	}

	
	//Extra Coin for good ranks
	switch(stageRank)
	{
		case "A-":
		case "A":
		case "A+":
		case "P":
		case "S":
		
		//Add to total count
		global.game_total_nano_mods += 1;
		
		//Add to player count
		for(var b = 0; b <= 1; b++)
			global.nano_mods[b] += 1;
		
		global.stage_nanoMod_collected[global.curr_world][global.curr_level][3] = true;
		break;
	
	}
	
	///Achievement Checking Here


}
