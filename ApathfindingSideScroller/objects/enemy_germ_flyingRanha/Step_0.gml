/// @description Movement
var anim = skeleton_animation_get();
var plyr = instance_nearest(x,y,parPlyr);
var shot_range = 400;
image_xscale = facing;

#region AI
switch(enemy_state)
{
case enemyState.NORMAL:

//Handle cool down periods b/w shots
if enemy_var_fire_cooldown > 0
	enemy_var_fire_cooldown--;

switch(enemy_behavior)
{
case enemy_FLY:
	//Detect player and shoot
	if instance_exists(plyr)
	{
		if collision_rectangle(x,y-shot_range/1.5,x+shot_range*facing,y+shot_range/1.5,plyr,false,true)
		{
			if alarm_get(1) < 0 and enemy_var_fire_cooldown <= 0
				alarm[1] = 30;
		}
	}
	
	//Movment
	vx = vxMax * facing;

	if place_meeting(x + vxMax * facing,y,parSolid)
	{
		if anim != "1_turn"
			scr_skeleton_animation_setAnim("1_turn")
			facing *= -1
	}
break;

case enemy_ATTACK_1:
	vx = 0;
	vy = 0;
break;
}

break;

case enemyState.FROZEN:
vx = 0;
vy = 0;
scr_enemy_freeze_check();
break;

case enemyState.SHOCKED:
vx = 0;
vy = 0;

if anim != "98_stun"
	{
		scr_skeleton_animation_setAnim("98_stun")
	}
	
particle_scr_enemy_statusCreate_shock_bang(0.5);

break;
	
}
#endregion


#region Animation End
if (image_index > image_number - 1)
{
	switch(anim)
	{
	case "1_turn":
    scr_skeleton_animation_setAnim("0_move");
	break;

//Shooting spread; return to idling and set fire cooldown
	case "2_shoot":
		scr_skeleton_animation_setAnim("0_move");
		enemy_var_fire_cooldown = enemy_var_fire_cooldown_max;
		enemy_behavior= enemy_FLY;
	break;
	
	
	}
	
}
#endregion

///Death
if enemy_hp <= 0
{
	vx = 0
	vy = 0;
    if alarm_get(11) < 0
    {
        alarm[11] = 20;
        scr_skeleton_animation_setAnim("98_stun");
        
        scr_play_sound(snd_enemy_monster_kill_3,0,0.9,1.1);
		scr_play_sound(snd_common_explosion_popcorn_2,20,1.1,1.2);
    }
}
