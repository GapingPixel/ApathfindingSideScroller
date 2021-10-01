event_inherited();
plyr_state = playerState.autoRun;
//sprite_index = p1_f_idle;
image_speed = 1;
image_xscale = 0.6;
image_yscale = 0.6;
//Physic variables
groundAccel = 6.00;
groundFric  = 6.00;
airAccel    = 6;
airFric     = 6;
vxMax       = 10;
vyMax       = 10;
jumpHeight  = 15;
gravNorm    = 0;

//Start Pos
x = xstart - 128;
y = ystart;

switch(global.character[char_id])
{
	case 0: sprite_index = p1_f_idle; break;	
	case 1: sprite_index = p2_f_idle; break;
}