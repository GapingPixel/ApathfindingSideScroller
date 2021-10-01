
DrawShadow(0,0,abs(image_xscale),1);

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
draw_self();
pal_swap_reset();