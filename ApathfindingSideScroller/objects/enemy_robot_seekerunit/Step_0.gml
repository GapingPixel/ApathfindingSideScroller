/// @description Behavior
var plyr = instance_nearest(x,y,parPlyr);
var anim = skeleton_animation_get();
switch(enemy_state)
{
	case enemyState.NORMAL:
		switch(enemy_behavior)
		{
			case enemy_IDLE:
				if anim != "0_idle"
					scr_skeleton_animation_setAnim("0_idle");
			break;
			
			case enemy_PURSUE:
			
			if anim != "0_pursuit"
			{
				scr_skeleton_animation_setAnim("0_pursuit");
			}
			
			if instance_exists(plyr)
			{
				if enemy_var_count > 0
					image_angle = point_direction(x,y,plyr.x,plyr.y)
					
				motion_set(image_angle,5);
			}
			break;
		}
	
	break;
	
	case enemyState.FROZEN:
		scr_enemy_freeze_check()
	break;
}

///Death
if enemy_hp <= 0
{
    particle_scr_eff_boom(0.75);
    
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    instance_destroy();
}



