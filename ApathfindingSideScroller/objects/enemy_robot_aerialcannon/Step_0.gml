/// @description Insert description here
// You can write your code in this editor
var anim = skeleton_animation_get();
var plyr = instance_nearest(x,y,parPlyr);

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
		
		if enemy_var_aerialCannon_stretch > 1
		enemy_var_aerialCannon_stretch -= 0.1;
		
		switch(enemy_behavior)
		{
			default:
				vx = 0;
				
				if instance_exists(plyr)
					enemy_var_aerialCannon_angle = point_direction(x,y,plyr.x,plyr.y);
			break;
			
			case enemy_FLY:
				vx = vxMax * image_xscale;
				
				if instance_exists(plyr)
					enemy_var_aerialCannon_angle = point_direction(x,y,plyr.x,plyr.y);
			break;
			
			case enemy_LEAVE:
				vx = vxMax * image_xscale;
				
				if image_xscale < 1 && x < global.cam_x-100
					instance_destroy();
			break;
		}
		
	break;
	
	
	case enemyState.FROZEN:
		vx = 0;
		scr_enemy_freeze_check();
	break;
	
	case enemyState.SHOCKED:
		vx = 0;
		if anim != "98_stun"
		{
			skeleton_animation_set("98_stun")	
		}
		particle_scr_enemy_statusCreate_shock_bang(1)
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
	case "0_halt":
	scr_skeleton_animation_setAnim("0_idle");
	break;
}

}
#endregion

#region Death
if enemy_hp <= 0
{
    particle_scr_eff_boom(1.2);
	uc_shake(5);
	repeat(5)
	{
		var d = instance_create_depth(x,y,depth+1,obj_effect_explosion_debris)
		with(d)
		{
			effect_var_explosion_debris_size = random_range(0.1,0.5);
			motion_set(random(9)*20,random_range(10,15));	
		}
	}
	
    
    scr_play_sound(snd_common_explosion_popcorn_2,0,0.5,0.6);
    instance_destroy();
}
#endregion