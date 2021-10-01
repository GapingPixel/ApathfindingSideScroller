/// @description
var anim = skeleton_animation_get();


switch(enemy_state)
{
	case enemyState.NORMAL:
	
	
	switch(enemy_behavior)
	{
		default:
		//Empty
		break;
		
	}
	break;
	
	case enemyState.FROZEN:
	scr_enemy_freeze_check();
	break;
	
	case enemyState.SHOCKED:
	if anim != "98_stun"
		scr_skeleton_animation_setAnim("98_stun");
	particle_scr_enemy_statusCreate_shock_bang(1);
	break;
	
}

///Death
if enemy_hp <= 0
{
    if alarm_get(11) < 0
    {
        alarm[11] = 10;
        scr_skeleton_animation_setAnim("98_stun");
		particle_scr_eff_boom(0.9)
        audio_play_sound(snd_common_explosion_popcorn_1,0,0);
    }
}

