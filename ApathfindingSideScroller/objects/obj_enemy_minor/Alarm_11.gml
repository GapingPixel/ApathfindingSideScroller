/// @description WallJump
// You can write your code in this editor
switch walljump_state {
	
	case 0:
	if facing == 1 {
		facing = -1;
	} else {
		facing = 1;
	}
	walljump_state = 1;
	alarm_set(11,1);
	break;

	case 1:
	vy -= jumpHeight;
	//scr_play_sound(snd_common_cartoony_boingy_jump,0,1.2,1.3);
	walljump_state = 0;
	break;

}
