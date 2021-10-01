// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_level_add_nanoMods(){

/*
Script which adds Nano Mods to player's count when we complete a level
*/

for(var c = 0; c < 3; c++)
{
	if global.temp_nanoMod_get[c] == true
	{
		//Add to total count
		global.game_total_nano_mods += 1;
		
		//Add to player count
		for(var b = 0; b <= 1; b++)
			global.nano_mods[b] += 1;
		
		//Set collected flag to true
		global.stage_nanoMod_collected[global.curr_world][global.curr_level][c] = true;
	}
	
	
}

}