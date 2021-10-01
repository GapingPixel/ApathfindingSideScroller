/// @description Shoot

if enemy_state = enemyState.NORMAL
{

switch(enemy_behavior)
{
	case enemy_BLOCK:
	{
	    skeleton_animation_set("1_open");
	    audio_play_sound(snd_common_machine_turret_open,0,0);
	    enemy_behavior = enemy_IDLE;
		enemy_def_elem = 0.5;
		enemy_def_flam = 1.5;
		enemy_def_salt = 0.75;
		enemy_def_cyro = 0.95;
	    alarm[2] = 60; //Shooting alarm
	}
	break;
	
	case enemy_IDLE://Closing
	{
	    skeleton_animation_set("1_close");
	    audio_play_sound(snd_common_machine_turret_close,0,0);
	    enemy_behavior = enemy_BLOCK;
		enemy_def_elem = 0;
		enemy_def_flam = 0.5;
		enemy_def_salt = 0;
		enemy_def_cyro = 0;
	    alarm[1] = choose(90,150);
	}
	break;

}
    
}



