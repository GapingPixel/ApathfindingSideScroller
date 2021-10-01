event_inherited();
if debugger_on == true
{

draw_text(0,160+96,string_hash_to_newline("Player (1) Values and Scoring"));
draw_text(0,160+112,string_hash_to_newline("Total Player Count = " + string(global.total_players)));
draw_text(0,160+128,string_hash_to_newline("Player Count Raw = " + string(global.player_count)));
draw_text(0,160+144,string_hash_to_newline("Player HP = " + string(global.hp[0])));

/*
draw_text(0,160+160,string_hash_to_newline("Player Element Mix 1 = " + string(global.elem_slot[0,0]) + " " + string(global.elem_slot[0,1])));
draw_text(0,160+176,string_hash_to_newline("Player Element Mix 2 = " + string(global.elem_slot[1,0]) + " " + string(global.elem_slot[1,1])));
draw_text(0,160+192,string_hash_to_newline("Player Element Mix 3 = " + string(global.elem_slot[2,0]) + " " + string(global.elem_slot[2,1])));
draw_text(0,160+208,string_hash_to_newline("Player Element Mix 4 = " + string(global.elem_slot[3,0]) + " " + string(global.elem_slot[3,1])));

draw_text(0,160+224,string_hash_to_newline("Player Chemical 1 = " + string(global.comp[0,0])
+ ": Attack Type = " + string(global.heavy_comp[0,0])
+ ": Energy = " + string(global.chem_energy[0,0]) 
+ "/" + string(global.chem_energy_max[0,0])));

draw_text(0,160+240,string_hash_to_newline("Player Chemical 2 = " + string(global.comp[0,1])
+ ": Attack Type = " + string(global.heavy_comp[0,1])
+ ": Energy = " + string(global.chem_energy[0,1]) 
+ "/" + string(global.chem_energy_max[0,1])));

draw_text(0,160+256,string_hash_to_newline("Player Chemical 3 = " + string(global.comp[0,2])
+ ": Attack Type = " + string(global.heavy_comp[0,2])
+ ": Energy = " + string(global.chem_energy[0,2]) 
+ "/" + string(global.chem_energy_max[0,2])));

draw_text(0,160+272,string_hash_to_newline("Player Chemical 4 = " + string(global.comp[0,3])
+ ": Attack Type = " + string(global.heavy_comp[0,3])
+ ": Energy = " + string(global.chem_energy[0,3]) 
+ "/" + string(global.chem_energy_max[0,3])));
*/


draw_text(0,160+288,string_hash_to_newline(" = " + ""));
draw_text(0,160+304,string_hash_to_newline(" = " + ""));

draw_text(0,160+304,string_hash_to_newline("Element Extractions = " + string(global.scoring_e_extracts)));
draw_text(0,160+320,string_hash_to_newline("Hits = " + string(global.scoring_hits)));
draw_text(0,160+336,string_hash_to_newline("Special Chemicals Blasted = " + string(global.scoring_c_blasts)));
draw_text(0,160+352,string_hash_to_newline("Time = " + string(global.scoring_time)));
draw_text(0,160+368,string_hash_to_newline("Pacifist = " + string(global.scoring_no_kill)));
draw_text(0,160+384,string_hash_to_newline("Extract Only = " + string(global.scoring_extract_only)));

}




