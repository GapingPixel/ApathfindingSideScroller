// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_UI_set_key_prompt(control){

//Returns the string for keyboard controls
var str;

switch(control)
{

default:
str = "";
break

case vk_space: str = scr_get_string(84); break;
case vk_tab: str = scr_get_string(93); break;
case vk_lshift: str = scr_get_string(87); break;
case vk_rshift: str = scr_get_string(88); break;
case vk_shift: str = scr_get_string(94); break;
case vk_lalt: str = scr_get_string(89); break;
case vk_ralt: str = scr_get_string(90);	break;
case vk_lcontrol: str = scr_get_string(91); break;
case vk_rcontrol: str = scr_get_string(92);	break;
case vk_up: str = scr_get_string(80); break;
case vk_down: str = scr_get_string(81); break;
case vk_left: str = scr_get_string(82); break;
case vk_right: str = scr_get_string(83); break;
case vk_enter: str = scr_get_string(86); break;
case vk_subtract: str = "-"; break;
case vk_add: str = "+"; break;
case vk_backspace: str = scr_get_string(85); break;

case ord("A"): str = "A"		break;
case ord("B"): str = "B"		break;
case ord("C"): str = "C"		break;
case ord("D"): str = "D"		break;
case ord("E"): str = "E"		break;
case ord("F"): str = "F"		break;
case ord("G"): str = "G"		break;
case ord("H"): str = "H"		break;
case ord("I"): str = "I"		break;
case ord("J"): str = "J"		break;
case ord("K"): str = "K"		break;
case ord("L"): str = "L"		break;
case ord("M"): str = "M"		break;
case ord("N"): str = "N"		break;
case ord("O"): str = "O"		break;
case ord("P"): str = "P"		break;
case ord("Q"): str = "Q"		break;
case ord("R"): str = "R"		break;
case ord("S"): str = "S"		break;
case ord("T"): str = "T"		break;
case ord("U"): str = "U"		break;
case ord("V"): str = "V"		break;
case ord("W"): str = "W"		break;
case ord("X"): str = "X"		break;
case ord("Y"): str = "Y"		break;
case ord("Z"): str = "Z"		break;

case ord("0"): str = "0"		break;
case ord("1"): str = "1"		break;
case ord("2"): str = "2"		break;
case ord("3"): str = "3"		break;
case ord("4"): str = "4"		break;
case ord("5"): str = "5"		break;
case ord("6"): str = "6"		break;
case ord("7"): str = "7"		break;
case ord("8"): str = "8"		break;
case ord("9"): str = "9"		break;

}


return str;
}