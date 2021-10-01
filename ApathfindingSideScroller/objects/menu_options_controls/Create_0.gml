/// @description Control Binding
event_inherited();

player_id = 0;

for(var i = 0; i < 15; i++)//Row
	for(var j = 0; j < 2; j++)//Column
		menu[i,j] = "";

///Menus
#region first row
menu[0,0] = scr_get_string(74);//Done
#endregion

#region second row

//Player Controls
if player_id = 0
menu[1,0] = scr_get_string(75)
else
menu[1,0] = scr_get_string(76)

menu[1,1] = scr_get_string(56);//Vibration

menu[1,2] = scr_get_string(53);//Restore Default

#endregion


#region Set Control areas

/*
Blank
menu[2,1] = Movement
menu[2,2] = Movement
*/

//Game Pad
menu[3,1] = "Left"
menu[4,1] = "Right"
menu[5,1] = "Up"
menu[6,1] = "Down"
menu[7,1] = "Jump"
menu[8,1] = "Shoot"
menu[9,1] = "ChemBlast"
menu[10,1] = "Dash"
menu[11,1] = "Switch"
menu[12,1] = "Aim"
menu[13,1] = "ChemBall"
menu[14,1] = "SwitchMix"

//Keyboard
menu[3,2] = "Left_K"
menu[4,2] = "Right_k"
menu[5,2] = "Up_K"
menu[6,2] = "Down_K"
menu[7,2] = "Jump_K"
menu[8,2] = "Shoot_k"
menu[9,2] = "ChemBlast_K"
menu[10,2] = "Dash_K"
menu[11,2] = "Switch_K"
menu[12,2] = "Aim_k"
menu[13,2] = "ChemBall_K"
menu[14,2] = "SwitchMix_K"

#endregion







menu_pos[0] = 0;
menu_pos[1] = 0;
//menu_move_hori = 0;
//menu_move_vert = 0;


menu_spacing = 64;




/* */
/*  */
