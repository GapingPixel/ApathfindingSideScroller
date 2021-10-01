/// @description Insert description here
// You can write your code in this editor
/// @description Movement
var anim = skeleton_animation_get();
var plyr = parPlyr;

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	image_xscale = facing;
	
	#region//Animation
	if ((vx < -0.1) && facing = 1) || ((vx > .1) && facing = -1)
		if anim != "1_turn"
		{
			scr_skeleton_animation_setAnim("1_turn")
			facing *= -1;
		}
	#endregion
	
	#region//AI
	switch(enemy_behavior)
	{
		
	case enemy_IDLE:
		vx = 0;
		vy = 0;
	break;
	
	case enemy_FLY:
	
		image_xscale = facing;
		//Detect player
		if instance_exists(plyr)
		{
			//Pursue
			var x_sign = sign(plyr.x - x);
			var y_sign = sign(plyr.y - y);
		
			if x_sign > 0
				{if(vx < vxMax)	vx += vyMax;}
			else
				if(vx > -vxMax)	vx += -vyMax;
			
			if y_sign > 0
				{if(vy < vxMax)	vy += vyMax;}
			else
				if(vy > -vxMax)	vy += -vyMax;
			
		}
		else
		{
			enemy_behavior = enemy_IDLE;	
		}
		
	break;
	
	}
	#endregion
	break;

	case enemyState.FROZEN:
	vx = 0;
	vy = 0;
	scr_enemy_freeze_check();
	break;
	
	case enemyState.HITSTUN:
	vx = 0;
	vy = 0;
	break;
	
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

switch(anim)
{
	case "1_turn":
	scr_skeleton_animation_setAnim("0_idle");
	break;
	
}

}
#endregion

#region Death
if enemy_hp <= 0
{
    particle_scr_eff_boom(0.75);
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    
    instance_destroy();
}
#endregion
