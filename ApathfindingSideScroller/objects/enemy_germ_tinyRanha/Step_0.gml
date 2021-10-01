/// @description Movement
var anim = skeleton_animation_get();
var plyr = parPlyr;

switch(enemy_state)
{
	case enemyState.NORMAL:
	
	switch(enemy_behavior)
	{
		
	case enemy_SPAWN:

	if abs(image_xscale) > 1
		image_xscale -= 0.25 * sign(image_xscale);
	
	if image_yscale > 1
		image_yscale -= 0.25;

	if abs(image_xscale) <= 1 and image_yscale <= 1
	{
		facing = image_xscale;
		depth = 0;
		enemy_behavior = enemy_FLY;
		dmg = 1;
	}
	break;
	
	case enemy_FLY:
	
	#region Animation
	if ((vx < -0.1) && facing = 1) || ((vx > .1) && facing = -1)
		if anim != "1_turn"
		{
			skeleton_animation_set("1_turn")
			facing *= -1;
		}
	#endregion
	
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
		
	break;
	
	}
	break;

case enemyState.FROZEN:
//vx = 0;
//vy = 0;
scr_enemy_freeze_check();
break;

case enemyState.SHOCKED:
if anim != "98_stun"
	{
		skeleton_animation_set("98_stun")
	}
	
particle_scr_enemy_statusCreate_shock_bang(0.1)
break;
	
}
///Death
if enemy_hp <= 0
{
	vx = 0;
	vy = 0;
	scr_play_sound(snd_enemy_monster_kill_1,0,0.9,1.1)
	scr_play_sound(snd_common_explosion_popcorn_2,20,0.9,1.1);
	particle_scr_eff_boom(0.5)
	instance_destroy();
}
