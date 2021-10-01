/// @description Behavior
var plyr = parPlyr;
var detect_below = collision_line(x,y,x,y+10000,plyr,false,true)

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
		switch(enemy_behavior)
		{
			case enemy_RISE:
				y -= vyMax;
			break;
			
			case enemy_FLY:
				 x += vxMax * image_xscale;
    
				//Drop
				if instance_exists(plyr)//Drop on Player
				    if detect_below
				    {
				        scr_skeleton_animation_setAnim("2_tip") //Tip over animation
				        instance_create_depth(x,y,0,obj_effect_enemy_robot_dropper_copter);
				        scr_play_sound(snd_common_machine_socket_pop,0,0.9,1.1)
				        scr_play_sound(snd_common_attack_missile_whistle_short,0,1.1,1.2)
				        gravity = 0.3;//begin falling
						enemy_behavior = enemy_FALL;
				    }
			break;
			
			case enemy_FALL:
				scr_bullet_destroy();
			break;
		}
	
	break;
	
	case enemyState.HITSTUN:
		gravity = 0;	
	break;
	
	case enemyState.FROZEN:
		scr_enemy_freeze_check()
	break;
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

switch(anim)
{
	case "0_spawn":
        scr_skeleton_animation_setAnim("1_fly");
        image_speed = 0.5
    break;

	case "2_tip":
        scr_skeleton_animation_setAnim("3_fall");
		image_speed = 1;
    break;
}

}
#endregion

///Death
if enemy_hp <= 0
{
    particle_scr_eff_boom(0.75);
    scr_play_sound(snd_common_explosion_popcorn_1,0,0.9,1.1)
    instance_destroy();
}



