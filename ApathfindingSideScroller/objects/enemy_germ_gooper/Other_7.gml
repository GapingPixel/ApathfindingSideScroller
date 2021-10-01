/// @description Animation End
var anim = skeleton_animation_get();
switch(anim)
{
	case "0_spawn":
		scr_skeleton_animation_setAnim("1_run");
		scr_play_sound(snd_enemy_slime_cry_2,50,1.4,1.5);
		enemy_behavior = enemy_RUN;
	break;
	
}

