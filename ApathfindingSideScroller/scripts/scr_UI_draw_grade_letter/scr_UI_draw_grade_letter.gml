// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_UI_draw_grade_letter(letter,xx,yy,scale){

var s;
var col;
switch(letter)
{
	default:
		s = 14
		col = c_white;
	break;
	
	case "D-":
		s = 0;
		col = make_color_rgb(104,128,128);
	break;
	
	case "D":
		s = 1;
		col = make_color_rgb(104,128,128);
	break;
	
	case "D+":
		s = 2;
		col = make_color_rgb(104,128,128);
	break;
	
	case "C-":
		s = 3;
		col = make_color_rgb(205,127,50);
	break;
	
	case "C":
		s = 4;
		col = make_color_rgb(205,127,50);
	break;
	
	case "C+":
		s = 5;
		col = make_color_rgb(205,127,50);
	break;
	
	case "B-":
		s = 6;
		col = c_silver;
	break;
	
	case "B":
		s = 7;
		col = c_silver;
	break;
	
	case "B+":
		s = 8;
		col = c_silver;
	break;
	
	case "A-":
		s = 9;
		col = c_yellow;
	break;
	
	case "A":
		s = 10;
		col = c_yellow;
	break;
	
	case "A+":
		s = 11;
		col = make_color_rgb(250,250,210)
	break;
	
	case "S":
		s = 12;
		col = make_color_rgb(250,250,210)
	break;
	
	case "P":
		s = 13;
		col = make_color_rgb(250,128,250)
	break;
}

draw_sprite_ext(spr_UI_results_rank,s,xx,yy,scale,scale,0,col,1)

}