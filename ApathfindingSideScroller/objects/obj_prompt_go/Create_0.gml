/// @description Creation state

//randomly choose phrase from index
var img = irandom_range(0,1);
image_index = img;
image_speed = 0;

prompt_var_go_grow = false;

image_xscale = 0.5
image_yscale = 0.5
image_alpha = 1;
alarm[0] = 80;//grow

with(obj_game_state_controller)
{
alarm[1] = room_speed;
}

with(parPlyr)
{
    plyr_state = playerState.enable;
}

