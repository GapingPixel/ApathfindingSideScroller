/// @description Animation Effects
CastShadow();

image_xscale = facing;
switch(enemy_state)
{
	case enemyState.NORMAL:
		Gravity();
		
		switch(enemy_behavior)
		{
			case enemy_RUN:
			
			vx = vxMax * facing;
			
			if onGround
			{
			 if (place_meeting(x+facing,y,solid_block))
		        {
				  facing *= -1;
		        }
			}
			
			break;
			
		}
	
	break;
	
	
	case enemyState.FROZEN:
	vx = 0
	vy = 0
	scr_enemy_freeze_check();
	break;
	
	case enemyState.HITSTUN:
	vx = 0
	vy = 0
	break;
	
}


///Death
if enemy_hp <= 0
{
    scr_play_sound(snd_enemy_slime_sneeze_choo,40,1.6,1.8);
	particle_scr_eff_boom(0.5);
	instance_destroy();
}

