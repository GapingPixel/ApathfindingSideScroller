/// @description Drawing
var mds = 20
var camX = global.cam_x;
var camY = global.cam_y;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_set_font(fnt_basic);


#region Draw Boxes and Mouse Input places
var buttonScale_y_FR = 0.45
var buttonScale_x_FR = 1.5
//Main Back Drop
draw_sprite_ext(spr_UI_menu_background_2,0,x,y,1,1,0,c_white,1)

draw_sprite_ext(spr_UI_menu_button,0,camX + 120,camY + 30,1.5,buttonScale_y_FR,0,c_white,1);//Done
var button_done = point_in_rectangle(mouse_x,mouse_y,
camX + 120 - mds, 
camY + 30 - mds,
camX + 120 + mds, 
camY + 30 + mds);

if button_done
{
	menu_pos[0] = 0; menu_pos[1] = 0;	
}

draw_sprite_ext(spr_UI_menu_button,0,camX + 120,camY + 60,1.5,buttonScale_y_FR,0,c_white,1);//Player Choice
var button_plyr = point_in_rectangle(mouse_x,mouse_y,
camX + 120 - mds, 
camY + 60 - mds,
camX + 120 + mds, 
camY + 60 + mds);

if button_plyr
{
	menu_pos[0] = 1; menu_pos[1] = 0;	
}

draw_sprite_ext(spr_UI_menu_button,0,camX + 384,camY + 60,1.75,buttonScale_y_FR,0,c_white,1);//Vibration
var button_vib = point_in_rectangle(mouse_x,mouse_y,
camX + 384 - mds, 
camY + 60 - mds,
camX + 384 + mds, 
camY + 60 + mds);

if button_vib
{
	menu_pos[0] = 1; menu_pos[1] = 1;	
}

draw_sprite_ext(spr_UI_menu_button,0,camX + 774,camY + 60,1.75,buttonScale_y_FR,0,c_white,1)//Restore Default
var button_res = point_in_rectangle(mouse_x, mouse_y,
camX + 774 - mds, 
camY + 60 - mds,
camX + 774 + mds, 
camY + 60 + mds);

if button_res
{
	menu_pos[0] = 1; menu_pos[1] = 2;	
}

for(var a = 0; a < 2; a++) 
for(var b = 0; b <= 12; b++)
{
	
	if b = 0
	draw_sprite_ext(spr_UI_menu_button,0,camX +384+(a*390),camY + 132+(b*30),1.9,buttonScale_y_FR,0,c_dkgrey,1);
	else
	draw_sprite_ext(spr_UI_menu_button,0,camX +384+(a*390),camY + 132+(b*30),1.9,buttonScale_y_FR,0,c_gray,1);
}

for(var j = 0; j < 2; j++) 
for(var k = 0; k < 13; k++)
{
	var button_binds = point_in_rectangle(mouse_x,mouse_y,
	camX + (384+(j*390)) - mds*1.5, 
	camY + (132+(k*30)) - mds,
	camX + (384+(j*390)) + mds*1.5, 
	camY + (132+(k*30)) + mds);
	
	
	if button_binds
	{
		menu_pos[0] = k+2; menu_pos[1] = j+1;	
	}
}
#endregion

#region Draw Cursor
var xx;
var yy;
var xScale;

switch(menu_pos[1])
{
	case 0:
		xx = camX + 120;
	break;
	
	case 1:
		xx = camX + 384;
	break;
	
	case 2:
		xx = camX + 774;
	break;
}

switch(menu_pos[0])
{
	case 0: yy = camY + 30; xScale = buttonScale_x_FR; break;
	case 1: yy = camY + 60; 
	
	if menu_pos[1] = 0
	xScale = buttonScale_x_FR;
	else
	xScale = 1.75;
	
	break;
	
	default:
	yy = camY + 72 + 30 * menu_pos[0];  xScale = 1.9;
	break;
}

draw_sprite_ext(spr_UI_menu_button,0,xx,yy,xScale,0.45,0,c_yellow,1)
#endregion

#region Draw Base Text
draw_text_shadow(camX + 120,camY + 30,menu[0,0],c_white,c_black,1);//Done

//Player X - Vibration - Restore Default

var toggle = global.config_vibration[player_id];
var onoffStr;

if toggle == true
onoffStr = scr_get_string(5)
else
onoffStr = scr_get_string(6)


draw_text_shadow(camX +120,camY + 60,menu[1,0],c_white,c_black,1); draw_text_shadow(camX + 384,camY + 60,menu[1,1] + ": " + onoffStr,c_white,c_black,1); draw_text_shadow(camX + 772,camY + 60,menu[1,2],c_white,c_black,1);

//Action - Controller - Keyboard
draw_text_shadow(camX + 128,camY + 90,scr_get_string(57),c_white,c_black,1); draw_text_shadow(camX + 384,camY + 90,scr_get_string(55),c_white,c_black,1); draw_text_shadow(camX + 772,camY + 90,scr_get_string(54),c_white,c_black,1);

//Action List
for(var c = 0; c <= 12; c++)
{
	draw_text_shadow(camX + 128,132+(c*30),scr_get_string(40+c),c_white,c_black,1);
}



#endregion

#region Draw Buttons and Keys
var spr = spr_UI_gamepad_input_xbox;

if gamepad_is_connected(4)
spr = spr_UI_gamepad_input_ps4;

var col_buttons = camX + 384;
var col_keys = camX + 774;
var button_scl = 0.55;

draw_sprite_ext(spr,8,col_buttons,camY + 132,button_scl,button_scl,0,c_white,1)
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_left[player_id]),col_buttons,camY + 162,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_right[player_id]),col_buttons,camY + 192,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_up[player_id]),col_buttons,camY + 222,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_down[player_id]),col_buttons,camY + 252,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_jump[player_id]),col_buttons,camY + 282,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_shoot[player_id]),col_buttons,camY + 312,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_chem_blast[player_id]),col_buttons,camY + 342,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_dash[player_id]),col_buttons,camY + 372,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_switch[player_id]),col_buttons,camY + 402,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_aim[player_id]),col_buttons,camY + 432,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_chem_ball[player_id]),col_buttons,camY + 462,button_scl,button_scl,0,c_white,1);
draw_sprite_ext(spr,scr_UI_set_gp_button_prompt(global.config_mix_switch[player_id]),col_buttons,camY + 482,button_scl,button_scl,0,c_white,1);

draw_text_shadow(col_keys,camY + 162,scr_UI_set_key_prompt(global.config_left_k[player_id]),c_white,c_black,1)
draw_text_shadow(col_keys,camY + 192,scr_UI_set_key_prompt(global.config_right_k[player_id]),c_white,c_black,1)
draw_text_shadow(col_keys,camY + 222,scr_UI_set_key_prompt(global.config_up_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 252,scr_UI_set_key_prompt(global.config_down_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 282,scr_UI_set_key_prompt(global.config_jump_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 312,scr_UI_set_key_prompt(global.config_shoot_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 342,scr_UI_set_key_prompt(global.config_chem_blast_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 372,scr_UI_set_key_prompt(global.config_dash_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 402,scr_UI_set_key_prompt(global.config_switch_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 432,scr_UI_set_key_prompt(global.config_aim_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 462,scr_UI_set_key_prompt(global.config_chem_ball_k[player_id]),c_white,c_black,1);
draw_text_shadow(col_keys,camY + 482,scr_UI_set_key_prompt(global.config_mix_switch_k[player_id]),c_white,c_black,1);

#endregion


if instance_exists(menu_options_rebind_controls)
{
	var count = ceil(menu_options_rebind_controls.alarm[0]/60)
	var txt = scr_get_string(58);

	draw_sprite_stretched_ext(spr_trans_black,0,0,0,1280,720,c_black,0.5)
	
	draw_sprite_ext(spr_UI_menu_background,0,x,y,1,1,0,c_white,1);
	draw_text(x,y-64,string_hash_to_newline(txt));
	draw_set_font(fnt_HUD);
	draw_text_transformed(x,y,string(count),2,2,0)
	
}
