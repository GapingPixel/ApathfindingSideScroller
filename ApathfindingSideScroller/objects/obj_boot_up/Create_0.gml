///@description Initialize the Global Variables
scr_game_config();//get game configuration variabls
scr_camera_vars();//generate global camera vars
scr_game_progress();//generate default progress variables
scr_camera_vars();//generate global camera vars
scr_player_variables();//generate player stats
scr_game_group_load();//Get the audio group and set particle system depth
//scr_game_score_vars();
pal_swap_init_system(true,false,false);
alarm[0] = 1;