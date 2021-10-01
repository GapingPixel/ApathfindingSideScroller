/// @description Insert description here
// You can write your code in this editor
/// @description Movement
var anim = skeleton_animation_get();
var plyr = instance_nearest(x,y,parPlyr);
switch(enemy_state)
{
	case enemyState.NORMAL:
	image_xscale = facing;
	
	#region//Animation
	
	//Jet Exhausts Effect
	part_particles_create(global.parsys_below,
	enemy_var_jet_exhaust_L[0],
	enemy_var_jet_exhaust_L[1],
	part_var_enemy_robot_jetPack,3);
	part_particles_create(global.parsys_below,
	enemy_var_jet_exhaust_R[0],
	enemy_var_jet_exhaust_R[1],
	part_var_enemy_robot_jetPack,3);
	
	
	if instance_exists(plyr)
	if (plyr.x < x && facing = 1) || (plyr.x > x && facing = -1)
		if anim != "1_turn"
		{
			scr_skeleton_animation_setAnim("1_turn")
			facing *= -1;
		}
	#endregion
	
	#region//AI
	switch(enemy_behavior)
	{
		
	default:
		vx = 0;
		vy = 0;
	break;
	
	case enemy_FLY:
		//Detect player
		if instance_exists(plyr)
		{
			//Pursue
			var x_sign = sign(plyr.x - x - (120 * facing));
		
			if x != plyr.x
				if x_sign > 0
					{if(vx < vxMax)	vx += vyMax;}
				else
					if(vx > -vxMax)	vx += -vyMax;
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
	
	case enemyState.SHOCKED:
	vx = 0;
	vy = 0;
	if anim != "98_stun"
		scr_skeleton_animation_setAnim("98_stun");
	particle_scr_enemy_statusCreate_shock_bang(1);
	break;
	
	case enemyState.HITSTUN:
	vx = 0;
	vy = 0;
	break;
	
}

#region Animation End
if (image_index > image_number - 1)
{
	switch(anim)
	{
	case "1_turn":
		scr_skeleton_animation_setAnim("0_idle");
		
		//reset shoot count
		if enemy_behavior = enemy_IDLE
			alarm[3] = 70;
	break;
	
	case "2_shoot_volley_double":
	case "2_shoot_volley_single":
		scr_skeleton_animation_setAnim("0_idle");
		image_speed = 1;
		if enemy_var_shots > 1
		{
		enemy_var_shots--;
		alarm[3] = 60;
		}
		else
		{
		alarm[1] = 110;
		enemy_var_shots = 1
		}
	break;
	}
}
#endregion

///Death
if enemy_hp <= 0
{
    particle_scr_eff_boom(0.75);
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
	var inst = instance_create_depth(x,y-25,depth-4,obj_effect_enemy_robot_head)
    inst.image_xscale = image_xscale;
	inst.image_index = 2;
    instance_destroy();
}