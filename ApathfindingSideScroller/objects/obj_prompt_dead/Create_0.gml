/// @description Initiate bool for creating prompt

//Global Variables
global.game_state = GameState.dead;

with(parHUD)
{
	HUD_pan_in = false;
}

uc_set_mode(CMODE.STATIC)
//image_xscale = 0.1;
//image_yscale = 0.1;

prompt_var_retry_enable = false;
alarm[0] = room_speed*1.5;//alarm for retry prompt
//alpha = 0; //for minor fade-in and logic for retry action enabled

