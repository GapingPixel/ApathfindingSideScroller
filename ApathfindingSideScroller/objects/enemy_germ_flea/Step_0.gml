/// @description Movement
image_xscale = facing;
var anim = skeleton_animation_get();

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	Gravity();
		switch(enemy_behavior)
		{
		case enemy_PURSUE:
		
			
		if !onGround//Move while hoping
		{
        vx = (vxMax * facing)
		}
		else
		{
        vx = 0;
		
		//Landing; Return to idle state
			if anim != "3_land"
			{
				scr_skeleton_animation_setAnim("3_land");	
			}
		
		}
        
        
		if onGround && alarm_get(1) < 0
			alarm[1] = choose(30,60)
		

		if place_meeting(x+4*facing,y,parSolid) and !onGround
		{
		    facing *= -1;
			vx -= facing*6
			vy -= 2;

		    
		    scr_play_sound(snd_common_cartoony_boingy_jump,0,1.3,1.7);
		}
		break;
		
		case enemy_IDLE:
		
		break;
		
		}
	break;
	
	case enemyState.FROZEN:
	image_speed = 0;
	vx = 0;
	vy = 0;
	break;
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{

switch(anim)
{
	case "3_land":
		scr_skeleton_animation_setAnim("0_idle");
		image_speed = 0.5;
	break;
	
	case "1_jump":
		scr_skeleton_animation_setAnim("2_fall");
		image_speed = 1;
	break;
	
}


}
#endregion

#region Death
if enemy_hp <= 0
{
	particle_scr_eff_boom(0.85);
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1)
    instance_destroy();
}
#endregion

