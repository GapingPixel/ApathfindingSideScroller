/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

switch(enemy_state)
{
	case enemyState.NORMAL:	
		switch(enemy_behavior)
		{
			
			case enemy_FLY:
				vx = -vxMax * image_xscale;
				
				var right_side = global.cam_x + global.cam_width + 80
				if x > right_side && image_xscale = -1
					instance_destroy();
					
				var shift = enemy_var_robodiamond_wavemo_amp * sin(x/enemy_var_robodiamond_wavemo_freq) + enemy_var_robodiamond_wavemo_sY;

				y = shift;
			break;
		}
		
	break;
	
	
	case enemyState.FROZEN:
		vx = 0;
		scr_enemy_freeze_check();
	break;
	
	case enemyState.HITSTUN:
		vx = 0;
		vy = 0;
	break;
}

	///Death
if enemy_hp <= 0
{
    particle_scr_eff_boom(0.8);
    
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    instance_destroy();
}