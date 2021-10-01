// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_env_material_drawOre(){

//Draw script primarily for Ore objects

var col;
//scr_env_goodies_set(0);
switch(env_goodies)
{
	default://Nothing
		col = 5;
	break
	
	case 5://Na
	case 17:
		col = 2;
	break;
	
	case 6://K
	case 18:
		col = 1;
	break;
	
	case 7://Cs
		col = 4;
	break;
	
	case 8://Ho
		col = 3;
	break;
	
	case 1:
	case 2:
	case 3:
		col = 0;
	break;
	
}

pal_swap_set(spr_env_ore_pallete, col, false);
var shake = 0;

if alarm_get(0) > 0
{
	if env_dur > 0
	{
		if env_dur > 1
		shake = 1;
		else
		shake = 5;
	}
}
else
shake = 0;

draw_sprite_shake(shake);
pal_swap_reset();
}