/// @description Passive Buff Tick
if var_super = 0
{
	if global.player_chem_blast[char_id][2] < 100
	{
	global.player_chem_blast[char_id][2] += 0.1;
	}
}

alarm[11] = 30;