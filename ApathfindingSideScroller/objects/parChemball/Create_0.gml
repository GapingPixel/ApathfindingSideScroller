/// @description Insert description here
// You can write your code in this editor
event_inherited();
cb_state = ballState.HELD;
//direction variable depending on playre inputs to be thrown
chemball_dir = 0;
bullet_dmg = 8;
bullet_type = 6;
object_state = objectState.normal;
bullet_Super = true;
chemball_single_hold = 0;
chemball_collision_with_wall_frames = 10;//Frames that Chemical Ball will not be affected by Solids
chemball_player_parent = obj_plyr1;
image_yscale = 0;
//image_alpha = 0;
image_speed = 0.25;


///Chemical Ball color and alpha drawing values
chemball_col1 = 0;//color of piece 1
chemball_col2 = 0;//piece 2
chemball_alph1 = 1;//alpha of piece 1
chemball_alph2 = 1;//piece 2