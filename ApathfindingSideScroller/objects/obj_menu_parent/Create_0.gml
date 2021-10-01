/// @description Menu Parent Man
image_blend = c_white;

menu_spacing = 64;//Spacing b/w menu options
menu_move = 0; //variable for cursor "moving" to an option, NOTE; may need two variants of theses depending on the menu used
menu_push = 0; //variable for "pushing" an option
menu_backout = 0; //variable for backing out of an option
menu_pos = 0; //Cursor Position on menu
menu_offset = 0;//Offset of Menu List


//For Analog Stick Tapped
menu_stick_left_held[0] = 0;
menu_stick_right_held[0]  = 0;
menu_stick_up_held[0] = 0;
menu_stick_down_held[0] = 0;

menu_stick_left_held[1] = 0;
menu_stick_right_held[1]  = 0;
menu_stick_up_held[1] = 0;
menu_stick_down_held[1] = 0;



//menu_main_selection = false; 
//Boolean to determine we can quick escape the menu to instantly to back to the game



menu_enable = false; //enable after time passes
alarm[0] = 5; //enable alarm

image_speed = 0.25;

menu[0] = "0";




//arrayLength = array_length_1d(menu);//calling array_length function to save on time building for-loops
